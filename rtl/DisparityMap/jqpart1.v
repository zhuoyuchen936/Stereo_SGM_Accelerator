
module jqpart1(
	input rst,
	input clk,
	input clken,
	input valid,	

	input wire [1279:0] cost_in,
	output [575:0] cost_out,              //64*(3+2+2)bit
	
	output reg en
	);

	genvar i;
	generate for(i=0;i<64;i=i+1)
	begin: compare_0123
	compare_0123 inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),

		.data_0(cost_in[i*20+4:i*20+0]),
		.data_1(cost_in[i*20+9:i*20+5]),
		.data_2(cost_in[i*20+14:i*20+10]),
		.data_3(cost_in[i*20+19:i*20+15]),

		.data_out(cost_out[i*9+8:i*9+0])

	);
	end
	endgenerate
	

	//use 64 always blocks to convert 128 to 64 and add suffixs
	always@(posedge clk or negedge rst)
		begin
		if(rst==0) 
			en<=0;
		else if(clken) 
			en <= valid;
		else 
			en <= en;
		end

endmodule 
