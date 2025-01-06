//////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2014 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TO PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
//////////////////////////////////////////////////////////////////////////////
//
// Library:
// Filename:ipsxe_floating_point_div_inv_v1_0.v
// Function: p=a/b
//           zsize:2-240(singed)/239(unsigned)
//           psize:24,48,96,144,192,240,288
//////////////////////////////////////////////////////////////////////////////
// `timescale 1ns/1ns

module ipsxe_floating_point_div_inv_v1_0 #(
    parameter DIVIDEND_WIDTH_FLOATING_SRT = 7'd64,
    parameter DIVISOR_WIDTH_FLOATING_SRT = 7'd64,
    parameter QUOTIENT_WIDTH_FLOATING_SRT = 7'd64,
    parameter EXPONENT_WIDTH_FLOATING_SRT = 4'd11,
    parameter FRACTION_WIDTH_FLOATING_SRT = 6'd52,
    parameter LATENCY_CONFIG = 28
)(
    input i_clk,
    input i_aclken,
    input i_areset_n,
    input [DIVIDEND_WIDTH_FLOATING_SRT-1'b1:0] i_opa_in, //opa:denumerator
    input [DIVISOR_WIDTH_FLOATING_SRT-1'b1:0] i_opb_in, //opb:nominator, opa/opb
    input i_a_tvalid,
    output [QUOTIENT_WIDTH_FLOATING_SRT-1'b1:0] o_resul,
    output o_overflow, //high active
    output o_underflow, //high active
    output o_divide_by_zero,
    output o_invalid_op,
    output o_q_valid
);

localparam PIPE_STAGE_NUM_MAX = FRACTION_WIDTH_FLOATING_SRT + 3 ; // the last pipeline stage of the ipsxe_floating_point_div_inv_v1_0 module

localparam FRACTION_WIDTH_FLOATING_SRT_ODD=(FRACTION_WIDTH_FLOATING_SRT % 2 != 0)?(FRACTION_WIDTH_FLOATING_SRT+2):(FRACTION_WIDTH_FLOATING_SRT);

//localparam LATENCY_CONFIG = (LATENCY_CONFIG_NEW >= (FRACTION_WIDTH_FLOATING_SRT_ODD+3)/2 )? ((FRACTION_WIDTH_FLOATING_SRT_ODD+3)/2+1) :LATENCY_CONFIG_NEW;

reg [QUOTIENT_WIDTH_FLOATING_SRT-1'b1:0] resul_r;  



wire a_is_denorm, b_is_denorm;
wire [DIVIDEND_WIDTH_FLOATING_SRT-1'b1:0] opa,opb;
// if the exponent is zero and the mantissa is not zero, then this is a denormalized floating-point number
assign a_is_denorm = (i_opa_in[DIVIDEND_WIDTH_FLOATING_SRT -2:DIVIDEND_WIDTH_FLOATING_SRT -EXPONENT_WIDTH_FLOATING_SRT-1]==0) & (i_opa_in[FRACTION_WIDTH_FLOATING_SRT-1:0]!=0);
assign b_is_denorm = (i_opb_in[DIVIDEND_WIDTH_FLOATING_SRT -2:DIVIDEND_WIDTH_FLOATING_SRT -EXPONENT_WIDTH_FLOATING_SRT-1]==0) & (i_opb_in[FRACTION_WIDTH_FLOATING_SRT-1:0]!=0);

// set denormalized numbers to zeros
assign opa = a_is_denorm ? 0 : i_opa_in;
assign opb = b_is_denorm ? 0 : i_opb_in;


/////////////////////////////////////////////////////////////////////
//  set part every section from operand,
//  signed: 1bit , exponents:8bits ,, fraction:23bits 
wire sign_a;
assign sign_a = opa[DIVIDEND_WIDTH_FLOATING_SRT-1'b1];
wire sign_b;
assign sign_b = opb[DIVISOR_WIDTH_FLOATING_SRT-1'b1];
wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0]  exp_a;
assign exp_a = opa[DIVIDEND_WIDTH_FLOATING_SRT-2'd2:FRACTION_WIDTH_FLOATING_SRT];
wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0]  exp_b;
assign exp_b = opb[DIVISOR_WIDTH_FLOATING_SRT-2'd2:FRACTION_WIDTH_FLOATING_SRT];
wire [FRACTION_WIDTH_FLOATING_SRT-1'b1:0] frac_a = opa[FRACTION_WIDTH_FLOATING_SRT-1'b1:0];
wire [FRACTION_WIDTH_FLOATING_SRT-1'b1:0] frac_b = opb[FRACTION_WIDTH_FLOATING_SRT-1'b1:0];

////////////////////////////////////////////////////////////////////
//  determine the mantissa
wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0] exp_a_dly;
wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0] exp_b_dly;
wire [FRACTION_WIDTH_FLOATING_SRT-1'b1:0] frac_a_dly;
wire [FRACTION_WIDTH_FLOATING_SRT-1'b1:0] frac_b_dly;

wire [FRACTION_WIDTH_FLOATING_SRT:0] mant_a;
assign mant_a =  {1'b1,opa[FRACTION_WIDTH_FLOATING_SRT-1'b1:0]};
wire [FRACTION_WIDTH_FLOATING_SRT:0] mant_b;
assign mant_b =  {1'b1,opb[FRACTION_WIDTH_FLOATING_SRT-1'b1:0]};


wire [FRACTION_WIDTH_FLOATING_SRT:0] mant_a_dly;
wire [FRACTION_WIDTH_FLOATING_SRT:0] mant_b_dly;

/////////////////////////////////////////////////////////////////////
//   compute exponent
wire [EXPONENT_WIDTH_FLOATING_SRT:0] exp_temp0;      //m=2exp(e-127)*m=a/b=2exp(e_a-e_b)*m_a/m_b
assign exp_temp0 = exp_a + {(EXPONENT_WIDTH_FLOATING_SRT-1'b1){1'b1}}; 
wire [EXPONENT_WIDTH_FLOATING_SRT:0] exp_temp1;      //e=e_a-e_b+127 ,,  m=m_a/m_b
assign exp_temp1 = exp_temp0 - exp_b;  
/////   exponent normalization

wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0] exp_resul;
wire [EXPONENT_WIDTH_FLOATING_SRT:0] exp_temp1_dly;
assign exp_resul = (mant_a_dly>=mant_b_dly)?(exp_temp1_dly):(exp_temp1_dly -1'b1);

//////////////////////////////////////////////////////////////////////
//   determine the signed of result
wire sign_resul;
assign sign_resul=sign_a ^sign_b;
//xor (sign_resul,sign_a,sign_b);

/////////////////////////////////////////////////////////////////////
//   divide , compute mantissa , 
wire [FRACTION_WIDTH_FLOATING_SRT+2'd2:0] quo;                     //quotient

wire [EXPONENT_WIDTH_FLOATING_SRT-1'b1:0] exp_resul_r;
wire sign_resul_r;


wire exp_a_all_1;
wire exp_b_all_1;
wire exp_a_all_0;
wire exp_b_all_0;
wire frac_a_all_0;
wire frac_b_all_0;
wire frac_a_notall_0;
wire frac_b_notall_0;

assign exp_a_all_1= &exp_a_dly;
assign frac_a_notall_0= frac_a_dly != {(FRACTION_WIDTH_FLOATING_SRT){1'd0}};
assign exp_b_all_1= &exp_b_dly;
assign frac_b_notall_0= frac_b_dly != {(FRACTION_WIDTH_FLOATING_SRT){1'd0}};
assign exp_a_all_0= !(|exp_a_dly);
assign frac_a_all_0= frac_a_dly == {(FRACTION_WIDTH_FLOATING_SRT){1'd0}};
assign exp_b_all_0= !(|exp_b_dly);
assign frac_b_all_0= frac_b_dly == {(FRACTION_WIDTH_FLOATING_SRT){1'd0}};

wire opa_is_zero;
//assign opa_is_zero=(exp_a_all_0)&& (frac_a_all_0);
assign opa_is_zero=(exp_a_all_0); 
 
wire opa_is_inf;
assign opa_is_inf=(exp_a_all_1) && (frac_a_all_0);
wire opb_is_inf;
assign opb_is_inf=(exp_b_all_1) && (frac_b_all_0);

wire nan_tag;
assign nan_tag=((exp_a_all_1) && (frac_a_notall_0))  //NAN
                || ((exp_b_all_1) && (frac_b_notall_0))  //NAN
              //  || ((exp_a_all_0) && (frac_a_all_0) && ((exp_b_all_0) && (frac_b_all_0)))  // 0/0
                || (opa_is_inf && opb_is_inf)// inf/inf
                || ((exp_b_all_0));// /0



wire [FRACTION_WIDTH_FLOATING_SRT+2'd2:0] q ;
wire [FRACTION_WIDTH_FLOATING_SRT+2'd1:0] q_loop;

assign o_overflow = (!o_underflow) && (exp_temp1[EXPONENT_WIDTH_FLOATING_SRT] == 1'b1) ;
assign o_underflow = (exp_temp1 < 1'b1) || (exp_temp0 < {1'b0,exp_b});

wire opa_is_zero_r;
wire opa_is_inf_r;
wire opb_is_inf_r;
wire overflow_r;
wire underflow_r;
wire nan_r;
wire valid_r;

wire [FRACTION_WIDTH_FLOATING_SRT+2:0] x1 [FRACTION_WIDTH_FLOATING_SRT+2'd2:0];
wire [FRACTION_WIDTH_FLOATING_SRT:0] d [FRACTION_WIDTH_FLOATING_SRT+2'd3:0];
wire [FRACTION_WIDTH_FLOATING_SRT+2:0] x_r [FRACTION_WIDTH_FLOATING_SRT+2'd2:0];
wire valid[LATENCY_CONFIG-1:0];

wire overflow_1;
wire underflow_1;
wire sign_resul_1;

generate 
if(LATENCY_CONFIG > FRACTION_WIDTH_FLOATING_SRT+4)
begin
ipm_distributed_shiftregister_wrapper_v1_3 #(1,EXPONENT_WIDTH_FLOATING_SRT*2+FRACTION_WIDTH_FLOATING_SRT*2+EXPONENT_WIDTH_FLOATING_SRT+1+3) u_reg(
                .din({exp_a,exp_b,frac_a,frac_b,exp_temp1,sign_resul,o_overflow,o_underflow}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({exp_a_dly,exp_b_dly,frac_a_dly,frac_b_dly,exp_temp1_dly,sign_resul_1,overflow_1,underflow_1}));

end
    else
        assign {exp_a_dly,exp_b_dly,frac_a_dly,frac_b_dly,exp_temp1_dly,overflow_1,underflow_1} = {exp_a,exp_b,frac_a,frac_b,exp_temp1,sign_resul,o_overflow,o_underflow};
endgenerate

generate 
if(LATENCY_CONFIG > FRACTION_WIDTH_FLOATING_SRT+3)
begin
ipm_distributed_shiftregister_wrapper_v1_3 #(1,FRACTION_WIDTH_FLOATING_SRT+1+FRACTION_WIDTH_FLOATING_SRT+1) u_reg(
                .din({mant_a,mant_b}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({mant_a_dly,mant_b_dly}));

end
    else
        assign {mant_a_dly,mant_b_dly} = {mant_a,mant_b};
endgenerate

generate
genvar k;
for (k = 0; k <= FRACTION_WIDTH_FLOATING_SRT+2'd1; k = 1 + k) begin: loop2
ipm_distributed_shiftregister_wrapper_v1_3 #(FRACTION_WIDTH_FLOATING_SRT+2'd2-k,1) u_shift_register_n(
                .din({q[k]}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({q_loop[FRACTION_WIDTH_FLOATING_SRT+2'd1-k]}));
end
endgenerate

generate
genvar i,j;
for (i = 0; i <= FRACTION_WIDTH_FLOATING_SRT+2'd2; i = 1 + i) begin: loop
if (i == 0) begin
      assign x1[i]=mant_a_dly-mant_b_dly;
    // if ((i+1) % 2 != 0) // (i+1) = 1, already satisfied
    if (LATENCY_CONFIG >= PIPE_STAGE_NUM_MAX     - ((i+1) / 2))
    // pipeline stage 1
begin
 ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  +1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,mant_b_dly,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({x_r[i],d[i+1],q[i]}));
end
    else
        assign {x_r[i],d[i+1],q[i]} = {x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,mant_b_dly,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
end else begin
     assign x1[i]=q[i-1]? x_r[i-1]-d[i] : x_r[i-1]+d[i];
 if ((i+1) % 2 != 0)
        if (LATENCY_CONFIG >= PIPE_STAGE_NUM_MAX - ((i+1) / 2))
begin
             ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  + 1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({ d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1],x_r[i],q[i]}));
end
        else
            assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
 
    else if ((i+1) % 4 != 0)
        if (LATENCY_CONFIG >= (PIPE_STAGE_NUM_MAX/2) - ((i+1) / 4))
         begin
  ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  +1) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({ d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1],x_r[i],q[i]}));
end
        else
           assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
   else if ((i+1) % 8 != 0)
        if (LATENCY_CONFIG >= (PIPE_STAGE_NUM_MAX/8) - ((i+1) / 8))
   ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  + 1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({ d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1],x_r[i],q[i]}));
        else
           assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
    else if ((i+1) % 16 != 0)
        if (LATENCY_CONFIG >= (PIPE_STAGE_NUM_MAX/8) - ((i+1) / 16))
begin
          ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  +1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({ d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1], x_r[i],q[i]}));
end
        else
           assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
         else if ((i+1) % 32 != 0)
        if (LATENCY_CONFIG >= (PIPE_STAGE_NUM_MAX/16) - ((i+1) / 32))
 begin              
       ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  + 1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({ d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1], x_r[i],q[i]}));
end
        else
           assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
    else // if ((i+1) % 64 != 0)
        if (LATENCY_CONFIG >= (PIPE_STAGE_NUM_MAX/32) - ((i+1) / 64))
begin
        ipsxe_floating_point_register_v1_0 #(FRACTION_WIDTH_FLOATING_SRT+1+ FRACTION_WIDTH_FLOATING_SRT+3  +1) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({d[i],x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]}),
                .o_q({d[i+1],x_r[i],q[i]}));
end
        else
           assign {x_r[i],d[i+1],q[i]} = { x1[i][FRACTION_WIDTH_FLOATING_SRT+1:0],1'b0,d[i],!x1[i][FRACTION_WIDTH_FLOATING_SRT+2]};
end
end
endgenerate
assign quo = {q_loop,q[FRACTION_WIDTH_FLOATING_SRT+2]};

ipm_distributed_shiftregister_wrapper_v1_3 #(FRACTION_WIDTH_FLOATING_SRT+3-((FRACTION_WIDTH_FLOATING_SRT+5)-LATENCY_CONFIG), EXPONENT_WIDTH_FLOATING_SRT+7) u_shift_register(
                .din({exp_resul,sign_resul_1,opa_is_zero,opa_is_inf,opb_is_inf,overflow_1,underflow_1,nan_tag}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({exp_resul_r,sign_resul_r,opa_is_zero_r,opa_is_inf_r,opb_is_inf_r,overflow_r,underflow_r,nan_r}));

/*ipm_distributed_shiftregister_wrapper_v1_3 #(FRACTION_WIDTH_FLOATING_SRT+3-((FRACTION_WIDTH_FLOATING_SRT+5)-LATENCY_CONFIG)+1, 1) u_shift_register2(
                .din({i_a_tvalid}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({valid_r}));*/

 generate
genvar m;
for (m = 0; m <= LATENCY_CONFIG-2; m = 1 + m) begin: loop3
    if(m==0)begin
 ipsxe_floating_point_register_v1_0 #(1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({i_a_tvalid}),
                .o_q({valid[m]}));
        end else begin
ipsxe_floating_point_register_v1_0 #(1 ) u_register(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d({valid[m-1]}),
                .o_q({valid[m]}));
        end
    end
    endgenerate


////loop0
//assign {rem0,den0} = den << first_one_temp;
//assign q0 = !(rem0 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp0 = rem0 - nom1;
////loop1
//assign {rem1,den1} = q0?({div_temp0,den0}<<1):({rem0,den0}<<1);
//assign q1 = !(rem1 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp1 = rem1 - nom1;
////loop2
//assign {rem2,den2} = q1?({div_temp1,den1}<<1):({rem1,den1}<<1);
//assign q2 = !(rem2 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp2 = rem2 - nom1;
////loop3
//assign {rem3,den3} = q2?({div_temp2,den2}<<1):({rem2,den2}<<1);
//assign q3 = !(rem3 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp3 = rem3 - nom1;
////loop4
//assign {rem4,den4} = q3?({div_temp3,den3}<<1):({rem3,den3}<<1);
//assign q4 = !(rem4 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp4 = rem4 - nom1;
////loop5
//assign {rem5,den5} = q4?({div_temp4,den4}<<1):({rem4,den4}<<1);
//assign q5 = !(rem5 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp5 = rem5 - nom1;
////loop6
//assign {rem6,den6} = q5?({div_temp5,den5}<<1):({rem5,den5}<<1);
//assign q6 = !(rem6 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp6 = rem6 - nom1;
////loop7
//assign {rem7,den7} = q6?({div_temp6,den6}<<1):({rem6,den6}<<1);
//assign q7 = !(rem7 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp7 = rem7 - nom1;
////loop8
//assign {rem8,den8} = q7?({div_temp7,den7}<<1):({rem7,den7}<<1);
//assign q8 = !(rem8 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp8 = rem8 - nom1;
////loop9
//assign {rem9,den9} = q8?({div_temp8,den8}<<1):({rem8,den8}<<1);
//assign q9 = !(rem9 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp9 = rem9 - nom1;
////loop10
//assign {rem10,den10} = q9?({div_temp9,den9}<<1):({rem9,den9}<<1);
//assign q10 = !(rem10 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp10 = rem10 - nom1;
////loop11
//assign {rem11,den11} = q10?({div_temp10,den10}<<1):({rem10,den10}<<1);
//assign q11 = !(rem11 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp11 = rem11 - nom1;
////loop12
//assign {rem12,den12} = q11?({div_temp11,den11}<<1):({rem11,den11}<<1);
//assign q12 = !(rem12 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp12 = rem12 - nom1;
////loop13
//assign {rem13,den13} = q12?({div_temp12,den12}<<1):({rem12,den12}<<1);
//assign q13 = !(rem13 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp13 = rem13 - nom1;
////loop14
//assign {rem14,den14} = q13?({div_temp13,den13}<<1):({rem13,den13}<<1);
//assign q14 = !(rem14 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp14 = rem14 - nom1;
////loop14
//assign {rem15,den15} = q14?({div_temp14,den14}<<1):({rem14,den14}<<1);
//assign q15 = !(rem15 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp15 = rem15 - nom1;
////loop16
//assign {rem16,den16} = q15?({div_temp15,den15}<<1):({rem15,den15}<<1);
//assign q16 = !(rem16 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp16 = rem16 - nom1;
////loop17
//assign {rem17,den17} = q16?({div_temp16,den16}<<1):({rem16,den16}<<1);
//assign q17 = !(rem17 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp17 = rem17 - nom1;
////loop18
//assign {rem18,den18} = q17?({div_temp17,den17}<<1):({rem17,den17}<<1);
//assign q18 = !(rem18 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp18 = rem18 - nom1;
////loop19
//assign {rem19,den19} = q18?({div_temp18,den18}<<1):({rem18,den18}<<1);
//assign q19 = !(rem19 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp19 = rem19 - nom1;
////loop20
//assign {rem20,den20} = q19?({div_temp19,den19}<<1):({rem19,den19}<<1);
//assign q20 = !(rem20 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp20 = rem20 - nom1;
////loop21
//assign {rem21,den21} = q20?({div_temp20,den20}<<1):({rem20,den20}<<1);
//assign q21 = !(rem21 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp21 = rem21 - nom1;
////loop22
//assign {rem22,den22} = q21?({div_temp21,den21}<<1):({rem21,den21}<<1);
//assign q22 = !(rem22 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp22 = rem22 - nom1;
////loop23
//assign {rem23,den23} = q22?({div_temp22,den22}<<1):({rem22,den22}<<1);
//assign q23 = !(rem23 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp23 = rem23 - nom1;
////loop24
//assign {rem24,den24} = q23?({div_temp23,den23}<<1):({rem23,den23}<<1);
//assign q24 = !(rem24 < nom1);
//wire [FRACTION_WIDTH_FLOATING_SRT+1'd1:0] div_temp24 = rem24 - nom1;
////loop24
//assign {rem25,den25} = q24?({div_temp24,den24}<<1):({rem24,den24}<<1);
//assign q25 = !(rem25 < nom1);


//assign quo = {q0,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,
//            q11,q12,q13,q14,q15,q16,q17,q18,
//            q19,q20,q21,q22,q23,q24,q25}; 

////////////////////////////////////////////////////////////////////
//   Floating Point Post Normalization

/////   fraction normalization
wire q_delay_wire3_q0;
assign q_delay_wire3_q0 = quo[FRACTION_WIDTH_FLOATING_SRT+2'd2];

wire [FRACTION_WIDTH_FLOATING_SRT:0] mant_resul;  
assign mant_resul = q_delay_wire3_q0?({1'b0,quo[FRACTION_WIDTH_FLOATING_SRT+2'd2:1]}):(quo);
wire [FRACTION_WIDTH_FLOATING_SRT -1'b1:0] frac_resul2; 
assign frac_resul2 = mant_resul[FRACTION_WIDTH_FLOATING_SRT:1]; 
wire [FRACTION_WIDTH_FLOATING_SRT -1'b1:0] frac_resul;
assign frac_resul = mant_resul[0]?(frac_resul2+1'b1):(frac_resul2);
wire [FRACTION_WIDTH_FLOATING_SRT -1'b1:0] frac_resul_r;


//generate 
/*if(LATENCY_CONFIG > FRACTION_WIDTH_FLOATING_SRT+4)
begin
ipm_distributed_shiftregister_wrapper_v1_3 #(1,FRACTION_WIDTH_FLOATING_SRT) u_reg2(
                .din({frac_resul}),
                .clk(i_clk),
                .i_aclken(i_aclken),
                .rst(~i_areset_n),
                .dout({frac_resul_r}));

end
    else*/
        assign {frac_resul_r} = {frac_resul};
//endgenerate


////////////////////////////////////////////////////////////////////
//   output 
/*always @(posedge clk)
#1 resul <= {sign_resul,exp_resul,frac_resul};      
*/
reg q_valid_r;

wire denom_down;
assign denom_down=(exp_resul_r == 0);
/*wire valid_r2;
ipsxe_floating_point_register_v1_0 #(1) u_register3(
                .i_clk(i_clk),
                .i_aclken(i_aclken),
                .i_rst_n(i_areset_n),
                .i_d(valid_r),
                .o_q(valid_r2));*/

always @(*) begin:spacial_cases
         if(nan_r)begin
            resul_r = {1'b0,{(EXPONENT_WIDTH_FLOATING_SRT){1'd1}},1'b1,{(FRACTION_WIDTH_FLOATING_SRT-1'b1){1'b0}}};
        end else if (opa_is_zero_r) begin
            resul_r = 0;
        end else if(underflow_r) begin // set it to 0
            resul_r = 0;
        end else if(overflow_r) begin// set it to +inf or -inf, according to the sign of a * b
            resul_r = {sign_resul_r, {(EXPONENT_WIDTH_FLOATING_SRT){1'b1}}, {FRACTION_WIDTH_FLOATING_SRT{1'b0}}};
        end else if(opb_is_inf_r) begin
            resul_r = 0;
        end else if(opa_is_inf_r) begin
            resul_r = {sign_resul_r, {(EXPONENT_WIDTH_FLOATING_SRT){1'b1}}, {FRACTION_WIDTH_FLOATING_SRT{1'b0}}};
        end else if(denom_down) begin
            resul_r = {sign_resul_r, {(EXPONENT_WIDTH_FLOATING_SRT){1'b0}}, {FRACTION_WIDTH_FLOATING_SRT{1'b0}}};
        end else begin
            resul_r = {sign_resul_r,exp_resul_r,frac_resul_r};
        end
        q_valid_r = valid[LATENCY_CONFIG-2];
  end
assign o_divide_by_zero = (exp_b == {(DIVISOR_WIDTH_FLOATING_SRT-1'd1){1'd0}})? 1'b1:1'b0;
assign o_invalid_op = ((opa[DIVIDEND_WIDTH_FLOATING_SRT-2'd2:0] == {(DIVIDEND_WIDTH_FLOATING_SRT-1'd1){1'd0}}) || (opb[DIVIDEND_WIDTH_FLOATING_SRT-2'd2:0] == {(DIVIDEND_WIDTH_FLOATING_SRT-1'd1){1'd0}}) ||
(opa[DIVIDEND_WIDTH_FLOATING_SRT-2'd2:FRACTION_WIDTH_FLOATING_SRT] == {(EXPONENT_WIDTH_FLOATING_SRT){1'd1}}) ||(opb[DIVIDEND_WIDTH_FLOATING_SRT-2'd2:FRACTION_WIDTH_FLOATING_SRT] == {(EXPONENT_WIDTH_FLOATING_SRT){1'd1}}))? 1'b1:1'b0;

generate
if (LATENCY_CONFIG <= ((FRACTION_WIDTH_FLOATING_SRT+3)+1)) begin
//assign {o_resul, o_q_valid} = {no_outreg_o_resul, no_outreg_o_q_valid};
assign {o_resul, o_q_valid} = {resul_r, q_valid_r};

end
else begin // if (LATENCY_CONFIG > FRACTION_WIDTH_FLOATING_SRT+6)
wire [(QUOTIENT_WIDTH_FLOATING_SRT + 1)-1:0] out_delay;
ipm_distributed_shiftregister_wrapper_v1_3 #((LATENCY_CONFIG -((FRACTION_WIDTH_FLOATING_SRT+3)+1)),(QUOTIENT_WIDTH_FLOATING_SRT + 1)) u_shift_reg_stage9(
            .din({resul_r, q_valid_r}),
            .clk(i_clk),
            .i_aclken(i_aclken),
            .rst(~i_areset_n),
            .dout(out_delay)
);
assign {o_resul, o_q_valid} = out_delay;
end
endgenerate


endmodule
