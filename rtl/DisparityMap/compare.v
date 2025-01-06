/*
 * @Author: like 
 * @Date: 2022-08-08 11:48:13 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 15:01:45
 */
 module compare(
	input [10:0] pixel_0,
	input [10:0] pixel_1,
	input [10:0] pixel_2,
	
	input [10:0] pixel_3,
	input [10:0] pixel_4_center,
	input [10:0] pixel_5,

	input [10:0] pixel_6,
	input [10:0] pixel_7,
	input [10:0] pixel_8,
	

	input en,
	input rst,

	output  result_0,
	output  result_1,
	output  result_2,

	output  result_3,
	//center
	output  result_5,

	output  result_6,
	output  result_7,
	output  result_8
);	
	wire temp_0;
	wire temp_1;
	wire temp_2;

	wire temp_3;
	//center
	wire temp_5;

	wire temp_6;
	wire temp_7;
	wire temp_8;


	
	assign temp_0=(pixel_0>pixel_4_center)? 0:1;
	assign temp_1=(pixel_1>pixel_4_center)? 0:1;
	assign temp_2=(pixel_2>pixel_4_center)? 0:1;

	assign temp_3=(pixel_3>pixel_4_center)? 0:1;
	//center
	assign temp_5=(pixel_5>pixel_4_center)? 0:1;

	assign temp_6=(pixel_6>pixel_4_center)? 0:1;
	assign temp_7=(pixel_7>pixel_4_center)? 0:1;
	assign temp_8=(pixel_8>pixel_4_center)? 0:1;
 

    assign result_0=temp_0;
    assign result_1=temp_1;
    assign result_2=temp_2;
    assign result_3=temp_3;
    assign result_5=temp_5;
    assign result_6=temp_6;
    assign result_7=temp_7;
    assign result_8=temp_8;



endmodule 
