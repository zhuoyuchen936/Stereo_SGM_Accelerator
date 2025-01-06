module top_disp2depth(
    rstn,
    clk,
    clken,
    valid_in,
    depth_format,
    Tx,
    disp,

    depth,
    valid
);

input clk,rstn,clken;
input valid_in;
input depth_format;    //0-fixed 1-float
input [31:0]Tx;        //Half-precision floating point  (f*baseline/pixel_size)
input [15:0]disp;      //fixed-point 8bit+8bit

output [15:0]depth;    //fixed/float
output valid;

wire [31:0]disp_float_single;
wire valid_fix2float;

//fix2float
fix2float_88_to_single fix2float_inst(
    .aclk(clk),                                  // input wire aclk
    .rstn(rstn),
    .en(valid_in),
    .clken(clken),
    .valid(valid_fix2float),
    .s_axis_a_tdata(disp),                 // input wire [15 : 0] s_axis_a_tdata
    .m_axis_result_tdata(disp_float_single)            // output wire [15 : 0] m_axis_result_tdata
);

//floating div 
wire [31:0]depth_float_single;
wire valid_div;
wire divide_by_zero;
ipsxe_floating_point_div_inv_v1_0 #(32,32,32,8,23,28) div_inst(
   .i_clk(clk),
   .i_aclken(clken),
   .i_areset_n(rstn),
   .i_opa_in(Tx), //opa:denumerator
   .i_opb_in(disp_float_single), //opb:nominator, opa/opb
   .i_a_tvalid(valid_fix2float),
   .o_resul(depth_float_single),
   .o_overflow(), //high active
   .o_underflow(), //high active
   .o_divide_by_zero(divide_by_zero),
   .o_invalid_op(),
   .o_q_valid(valid_div)
);

//float2fix
wire [15:0]depth_float_half;
wire valid_float2float;
float2float_single_to_half float2float_inst(
    .aclk(clk),
    .s_axis_a_tdata(depth_float_single),
    .m_axis_result_tdata(depth_float_half),
    .rstn(rstn),
    .en(valid_div),
    .clken(clken),
    .valid(valid_float2float)
    );


//float2fix
wire [15:0]depth_fixed;
wire valid_float2fix;
float2fix_half_to_88 float2fix_inst(
    .aclk(clk),
    .s_axis_a_tdata(depth_float_half),
    .m_axis_result_tdata(depth_fixed),
    .rstn(rstn),
    .en(valid_float2float),
    .clken(clken),
    .valid(valid_float2fix)
    );

// reg [55:0] valid_delay_reg;

// always @(posedge clk or negedge rstn) begin
//     if (!rstn)
//         valid_delay_reg <= 56'b0;
//     else if (clken)
//         valid_delay_reg <= {valid_delay_reg[54:0], (depth_format ? valid_float2float : valid_float2fix)};
// end

// Assign the delayed 'valid' signal
assign valid = depth_format ? valid_float2float : valid_float2fix;
// assign valid = depth_format ? valid_float2float : valid_float2fix;
assign depth = depth_format ? depth_float_half : depth_fixed;
endmodule
