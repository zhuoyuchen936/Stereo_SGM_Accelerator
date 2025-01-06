module SRT4divider(
		rst,
		clk,
		clken,
		validin,
		x, 
	    	d,
		f,
   		q,
        valid
	  	     );

			  
input clk,rst,clken;
input   [10:0] x;//0bit fraction,dividend//[16:0]->[10:0]
input  [10:0] d;//0bit fraction.divisor
input  validin;
input  f;
output [16:0] q;//8bit fraction
output valid;
wire [16:0] rem [16:0];
wire [16:0] den [16:0];
wire q_1 [16:0];
wire [16:0] div_temp [16:0];


wire [4:0] first_one_x,first_one_d;
wire [4:0] first_one_x_r,first_one_d_r;
wire [20:0] find_one_r;
assign find_one_r={21'b0};
find_one find_one1({find_one_r,x},first_one_x_r);
find_one find_one2({find_one_r,d},first_one_d_r);
assign first_one_x=4'd11-first_one_x_r;
assign first_one_d=4'd11-first_one_d_r;

wire [5:0]  first_one_temp = 4'd11- first_one_x + first_one_d;
wire [10:0] den0;               //denumerator
assign den0 = {x};    
wire [10:0] nom;                  //nominator
assign nom = {d};  

wire [16:0] quo;

wire [5:0] first_one_temp_r[16:0];
wire [16:0] rem_r [16:0];
wire [16:0] den_r [16:0];
wire[16:0] q_r [16:0];
wire [16:0] div_temp_r [16:0];
wire [10:0] nom_r [17:0];
wire valid_r [16:0];
wire f_r[16:0];
generate
genvar i,j;
    for (i = 0; i <=16; i = 1 + i) begin: loop
        if (i == 0) begin
            assign {rem[0],den[0]}=den0 << first_one_temp;
            assign q_1[0]= !(rem[0]<nom);
            assign div_temp[0]=rem[0]-nom;
            ipsxe_floating_point_register_v1_0 #(i+1 +17 + 17 + 17 + 11 + 1+6+1) u_register(
                .i_clk(clk),
                .i_aclken(clken),
                .i_rst_n(rst),
                .i_d({q_1[i], rem[i], den[i], div_temp[i], nom,validin,first_one_temp,f}),
                .o_q({q_r[i][16-:(i+1)], rem_r[i], den_r[i], div_temp_r[i], nom_r[i+1], valid_r[i],first_one_temp_r[i],f_r[i]}));
        end 
        else begin
            assign {rem[i],den[i]}=q_r[i-1][16-i+1]?({div_temp_r[i-1],den_r[i-1]}<<1):({rem_r[i-1],den_r[i-1]}<<1);
            assign q_1[i]= !(rem[i]<nom_r[i]);
            assign div_temp[i]=rem[i]-nom_r[i];
            ipsxe_floating_point_register_v1_0 #(i+1 +17 + 17 + 17 + 11 + 1+6+1) u_register(
                .i_clk(clk),
                .i_aclken(clken),
                .i_rst_n(rst),
                .i_d({q_r[i-1][16-:i], q_1[i], rem[i], den[i], div_temp[i], nom_r[i],valid_r[i-1],first_one_temp_r[i-1],f_r[i-1]}),
                .o_q({q_r[i][16-:(i+1)], rem_r[i], den_r[i], div_temp_r[i], nom_r[i+1], valid_r[i],first_one_temp_r[i],f_r[i]}));
        end
    end
    assign quo=q_r[16];
endgenerate



wire [15:0] quo_8fraction;
assign quo_8fraction=quo >> first_one_temp_r[16]-4'd9;
assign valid = valid_r[16];
assign q={f_r[16],quo_8fraction};
endmodule
	
	
	
	

