/*
 * @Author: PingChengDong 
 * @Date: 2022-08-08 14:14:14 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 14:34:42
 */
module hamdist(
//data_a
	input data_a0,
	input data_a1,
	input data_a2,

	input data_a3,
	//center
	input data_a5,


	input data_a6,
	input data_a7,
	input data_a8,


//data_b
	input data_b0,
	input data_b1,
	input data_b2,

	input data_b3,
	//center
	input data_b5,

	input data_b6,
	input data_b7,
	input data_b8,

	output reg[3:0] Hamming
);


wire result [7:0];
assign result[0] = data_a0 == data_b0 ? 1'b0 : 1'b1;
assign result[1] = data_a1 == data_b1 ? 1'b0 : 1'b1;
assign result[2] = data_a2 == data_b2 ? 1'b0 : 1'b1;

assign result[3] = data_a3 == data_b3 ? 1'b0 : 1'b1;
//center
assign result[4] = data_a5 == data_b5 ? 1'b0 : 1'b1;

assign result[5] = data_a6 == data_b6 ? 1'b0 : 1'b1;
assign result[6] = data_a7 == data_b7 ? 1'b0 : 1'b1;
assign result[7] = data_a8 == data_b8 ? 1'b0 : 1'b1;



always@(*)begin
	Hamming = result[0]+result[1]+result[2]+result[3]+result[4]
			  +result[5]+result[6]+result[7];
end
endmodule








