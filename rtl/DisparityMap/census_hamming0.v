/*
 * @Author: ZhuoyuChen 
 * @Date: 2021-03-17 20:14:47 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 19:34:36
 */


module census_hamming0(
	input [10:0] data_1,
	input [10:0] data_2,
	input [10:0] data_3,

	input [10:0] data_4,
	input [10:0] data_5,
	input [10:0] data_6,

	input [10:0] data_7,
	input [10:0] data_8,
	input [10:0] data_9,
	

	input [2837:0] data_compared_0,
	input [2837:0] data_compared_1,
	input [2837:0] data_compared_2,

	input en,
	input rst,
	output [1023:0] Hamming_data                   //hamming 4bit 


);

wire result_single0;
wire result_single1;
wire result_single2;

wire result_single3;
//center
wire result_single5;

wire result_single6;
wire result_single7;
wire result_single8;

//256个 window
wire [255:0]result_0;
wire [255:0]result_1;
wire [255:0]result_2;

wire [255:0]result_3;
//center
wire [255:0]result_5;

wire [255:0]result_6;
wire [255:0]result_7;
wire [255:0]result_8;


compare single_window(
	.pixel_0(data_3),
	.pixel_1(data_2),
	.pixel_2(data_1),

	.pixel_3(data_6),
	.pixel_4_center(data_5),
	.pixel_5(data_4),

	.pixel_6(data_9),
	.pixel_7(data_8),
	.pixel_8(data_7),

	.en(en),
	.rst(rst),

	//output
	.result_0(result_single0),
	.result_1(result_single1),
	.result_2(result_single2),

	.result_3(result_single3),
	//center
	.result_5(result_single5),

	.result_6(result_single6),
	.result_7(result_single7),
	.result_8(result_single8)

);

genvar i;
generate for(i=0;i<256;i=i+1)
begin :compare
compare compare_inst(
	//input
	.pixel_0(data_compared_0[i*11+10:i*11+0]),
	.pixel_1(data_compared_0[i*11+21:i*11+11]),
	.pixel_2(data_compared_0[i*11+32:i*11+22]),

	.pixel_3(data_compared_1[i*11+10:i*11+0]),
	.pixel_4_center(data_compared_1[i*11+21:i*11+11]),
	.pixel_5(data_compared_1[i*11+32:i*11+22]),


	.pixel_6(data_compared_2[i*11+10:i*11+0]),
	.pixel_7(data_compared_2[i*11+21:i*11+11]),
	.pixel_8(data_compared_2[i*11+32:i*11+22]),

	.en(en),
	.rst(rst),
	//output
	.result_0(result_0[i]),
	.result_1(result_1[i]),
	.result_2(result_2[i]),

	.result_3(result_3[i]),
	//center
	.result_5(result_5[i]),

	.result_6(result_6[i]),
	.result_7(result_7[i]),
	.result_8(result_8[i])
	
	);
end
endgenerate

genvar j;
generate for(j=0;j<256;j=j+1)
begin :hamdist
hamdist hamdist_inst(
	.data_a0(result_single0),.data_a1(result_single1),.data_a2(result_single2),
	.data_a3(result_single3),
	//center
	.data_a5(result_single5),
	.data_a6(result_single6),.data_a7(result_single7),.data_a8(result_single8),

//data_b
	.data_b0(result_0[j]),.data_b1(result_1[j]),.data_b2(result_2[j]),
	.data_b3(result_3[j]),
	//center
	.data_b5(result_5[j]),
	.data_b6(result_6[j]),.data_b7(result_7[j]),.data_b8(result_8[j]),
	
//out
	.Hamming(Hamming_data[j*4+3:j*4+0])
	

);

end
endgenerate

endmodule










