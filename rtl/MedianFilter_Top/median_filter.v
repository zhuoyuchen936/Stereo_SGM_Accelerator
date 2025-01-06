/*
 * @Author: xxx
 * @Date: xxx
 * @Last Modified by: like
 * @Last Modified time: 2022-08-29 14:42:53
 */
 
module median_filter(
	input clk,   
	input rst,
	input clken,
	input [8:0] pixel0,    	
	input [8:0] pixel1,    
	input [8:0] pixel2,    
	input [8:0] pixel3,    
	input [8:0] pixel4,    
	input [8:0] pixel5,    
	input [8:0] pixel6,    
	input [8:0] pixel7,    
	input [8:0] pixel8,    
	input [8:0] pixel9,    
	input [8:0] pixel10,    
	output reg [8:0] median_data,    
	output reg valid
);

wire [109:0] 	pixel_line_0;
wire [109:0] 	pixel_line_1;
wire [109:0] 	pixel_line_2;
wire [109:0] 	pixel_line_3;
wire [109:0] 	pixel_line_4;
wire [109:0] 	pixel_line_5;
wire [109:0] 	pixel_line_6;
wire [109:0] 	pixel_line_7;
wire [109:0] 	pixel_line_8;
wire [109:0] 	pixel_line_9;
wire [109:0] 	pixel_line_10;

wire valid1;

window_buffer u_window_buffer(
	//input
	.clk         		( clk ),
	.rst         		( rst ),
	.clken			    ( clken),
	.pixel0      		( pixel0 ),
	.pixel1      		( pixel1 ),
	.pixel2      		( pixel2 ),
	.pixel3      		( pixel3 ),
	.pixel4      		( pixel4 ),
	.pixel5      		( pixel5 ),
	.pixel6      		( pixel6 ),
	.pixel7      		( pixel7 ),
	.pixel8      		( pixel8 ),
	.pixel9      		( pixel9 ),
	.pixel10     		( pixel10),

	.pixel_out_0(pixel_line_0),
	.pixel_out_1(pixel_line_1),
	.pixel_out_2(pixel_line_2),
	.pixel_out_3(pixel_line_3),
	.pixel_out_4(pixel_line_4),
	.pixel_out_5(pixel_line_5),
	.pixel_out_6(pixel_line_6),
	.pixel_out_7(pixel_line_7),
	.pixel_out_8(pixel_line_8),
	.pixel_out_9(pixel_line_9),
	.pixel_out_10(pixel_line_10),

	//output
	.valid(valid1)
	//inout
);

//位数由8变位9 多加一个BOU
wire [109:0]o1_pixel_0_add1;
wire [109:0]o1_pixel_1_add1;
wire [109:0]o1_pixel_2_add1;
wire [109:0]o1_pixel_3_add1;
wire [109:0]o1_pixel_4_add1;
wire [109:0]o1_pixel_5_add1;
wire [109:0]o1_pixel_6_add1;
wire [109:0]o1_pixel_7_add1;
wire [109:0]o1_pixel_8_add1;
wire [109:0]o1_pixel_9_add1;
wire [109:0]o1_pixel_10_add1;
wire [6:0] 	o1_pre_sum_add1;
wire valid1_add1;
BOU #(
	.bitlv  		( 8  		),
	.Midele 		( 61 		))
u_BOU_add1(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid1	),
	.i_pixel_0   		( pixel_line_0   		),
	.i_pixel_1   		( pixel_line_1   		),
	.i_pixel_2   		( pixel_line_2   		),
	.i_pixel_3   		( pixel_line_3   		),
	.i_pixel_4   		( pixel_line_4   		),
	.i_pixel_5   		( pixel_line_5   		),
	.i_pixel_6   		( pixel_line_6   		),
	.i_pixel_7   		( pixel_line_7   		),
	.i_pixel_8   		( pixel_line_8   		),
	.i_pixel_9   		( pixel_line_9   		),
	.i_pixel_10  		( pixel_line_10  		),
	
	.pre_sum       		( 7'd0       		),

	//output
	.o_pixel_0   		( o1_pixel_0_add1   		),
	.o_pixel_1   		( o1_pixel_1_add1   		),
	.o_pixel_2   		( o1_pixel_2_add1   		),
	.o_pixel_3   		( o1_pixel_3_add1   		),
	.o_pixel_4   		( o1_pixel_4_add1   		),
	.o_pixel_5   		( o1_pixel_5_add1   		),
	.o_pixel_6   		( o1_pixel_6_add1   		),
	.o_pixel_7   		( o1_pixel_7_add1   		),
	.o_pixel_8   		( o1_pixel_8_add1   		),
	.o_pixel_9   		( o1_pixel_9_add1   		),
	.o_pixel_10  		( o1_pixel_10_add1  		),
	
	.post_sum      		( o1_pre_sum_add1      		),
	.valid(valid1_add1)
	//inout
);


///////////////////////////////////computing the highest bit(the eighth bit)////////////////////////////////////////////////////////////////////////////////
wire [109:0]o1_pixel_0;
wire [109:0]o1_pixel_1;
wire [109:0]o1_pixel_2;
wire [109:0]o1_pixel_3;
wire [109:0]o1_pixel_4;
wire [109:0]o1_pixel_5;
wire [109:0]o1_pixel_6;
wire [109:0]o1_pixel_7;
wire [109:0]o1_pixel_8;
wire [109:0]o1_pixel_9;
wire [109:0]o1_pixel_10;
wire [6:0] 	o1_pre_sum;
wire valid2;
BOU #(
	.bitlv  		( 7  		),
	.Midele 		( 61 		))
u_BOU_0(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid1_add1	),
	.i_pixel_0   		( o1_pixel_0_add1   		),
	.i_pixel_1   		( o1_pixel_1_add1   		),
	.i_pixel_2   		( o1_pixel_2_add1   		),
	.i_pixel_3   		( o1_pixel_3_add1   		),
	.i_pixel_4   		( o1_pixel_4_add1   		),
	.i_pixel_5   		( o1_pixel_5_add1   		),
	.i_pixel_6   		( o1_pixel_6_add1   		),
	.i_pixel_7   		( o1_pixel_7_add1   		),
	.i_pixel_8   		( o1_pixel_8_add1   		),
	.i_pixel_9   		( o1_pixel_9_add1   		),
	.i_pixel_10  		( o1_pixel_10_add1  		),
	
	.pre_sum       		( o1_pre_sum_add1       		),

	//output
	.o_pixel_0   		( o1_pixel_0   		),
	.o_pixel_1   		( o1_pixel_1   		),
	.o_pixel_2   		( o1_pixel_2   		),
	.o_pixel_3   		( o1_pixel_3   		),
	.o_pixel_4   		( o1_pixel_4   		),
	.o_pixel_5   		( o1_pixel_5   		),
	.o_pixel_6   		( o1_pixel_6   		),
	.o_pixel_7   		( o1_pixel_7   		),
	.o_pixel_8   		( o1_pixel_8   		),
	.o_pixel_9   		( o1_pixel_9   		),
	.o_pixel_10  		( o1_pixel_10  		),
	
	.post_sum      		( o1_pre_sum      		),
	.valid(valid2)
	//inout
);


///////////////////////////////////the seventh bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o2_pixel_0;
wire [109:0]o2_pixel_1;
wire [109:0]o2_pixel_2;
wire [109:0]o2_pixel_3;
wire [109:0]o2_pixel_4;
wire [109:0]o2_pixel_5;
wire [109:0]o2_pixel_6;
wire [109:0]o2_pixel_7;
wire [109:0]o2_pixel_8;
wire [109:0]o2_pixel_9;
wire [109:0]o2_pixel_10;
wire [6:0] 	o2_pre_sum;

wire valid3;

BOU #(
	.bitlv  		( 6  		),
	.Midele 		( 61 		))
u_BOU_1(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid2	),
	.i_pixel_0   		( o1_pixel_0   		),
	.i_pixel_1   		( o1_pixel_1   		),
	.i_pixel_2   		( o1_pixel_2   		),
	.i_pixel_3   		( o1_pixel_3   		),
	.i_pixel_4   		( o1_pixel_4   		),
	.i_pixel_5   		( o1_pixel_5   		),
	.i_pixel_6   		( o1_pixel_6   		),
	.i_pixel_7   		( o1_pixel_7   		),
	.i_pixel_8   		( o1_pixel_8   		),
	.i_pixel_9   		( o1_pixel_9   		),
	.i_pixel_10  		( o1_pixel_10  		),
	
	.pre_sum       		( o1_pre_sum        		),

	//output
	.o_pixel_0   		( o2_pixel_0   		),
	.o_pixel_1   		( o2_pixel_1   		),
	.o_pixel_2   		( o2_pixel_2   		),
	.o_pixel_3   		( o2_pixel_3   		),
	.o_pixel_4   		( o2_pixel_4   		),
	.o_pixel_5   		( o2_pixel_5   		),
	.o_pixel_6   		( o2_pixel_6   		),
	.o_pixel_7   		( o2_pixel_7   		),
	.o_pixel_8   		( o2_pixel_8   		),
	.o_pixel_9   		( o2_pixel_9   		),
	.o_pixel_10  		( o2_pixel_10  		),

	.post_sum      		( o2_pre_sum      		),
	.valid(valid3)
	//inout
);

///////////////////////////////////the sixth bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o3_pixel_0;
wire [109:0]o3_pixel_1;
wire [109:0]o3_pixel_2;
wire [109:0]o3_pixel_3;
wire [109:0]o3_pixel_4;
wire [109:0]o3_pixel_5;
wire [109:0]o3_pixel_6;
wire [109:0]o3_pixel_7;
wire [109:0]o3_pixel_8;
wire [109:0]o3_pixel_9;
wire [109:0]o3_pixel_10;
wire [6:0] 	o3_pre_sum;
wire valid4;

BOU #(
	.bitlv  		( 5  		),
	.Midele 		( 61 		))
u_BOU_2(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid3	),
	.i_pixel_0   		( o2_pixel_0   		),
	.i_pixel_1   		( o2_pixel_1   		),
	.i_pixel_2   		( o2_pixel_2   		),
	.i_pixel_3   		( o2_pixel_3   		),
	.i_pixel_4   		( o2_pixel_4   		),
	.i_pixel_5   		( o2_pixel_5   		),
	.i_pixel_6   		( o2_pixel_6   		),
	.i_pixel_7   		( o2_pixel_7   		),
	.i_pixel_8   		( o2_pixel_8   		),
	.i_pixel_9   		( o2_pixel_9   		),
	.i_pixel_10  		( o2_pixel_10  		),

	.pre_sum       		( o2_pre_sum        		),

	//output
	.o_pixel_0   		( o3_pixel_0   		),
	.o_pixel_1   		( o3_pixel_1   		),
	.o_pixel_2   		( o3_pixel_2   		),
	.o_pixel_3   		( o3_pixel_3   		),
	.o_pixel_4   		( o3_pixel_4   		),
	.o_pixel_5   		( o3_pixel_5   		),
	.o_pixel_6   		( o3_pixel_6   		),
	.o_pixel_7   		( o3_pixel_7   		),
	.o_pixel_8   		( o3_pixel_8   		),
	.o_pixel_9   		( o3_pixel_9   		),
	.o_pixel_10  		( o3_pixel_10  		),

	.post_sum      		( o3_pre_sum      		),
	.valid(valid4)	//inout
);

///////////////////////////////////the fifth bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o4_pixel_0;
wire [109:0]o4_pixel_1;
wire [109:0]o4_pixel_2;
wire [109:0]o4_pixel_3;
wire [109:0]o4_pixel_4;
wire [109:0]o4_pixel_5;
wire [109:0]o4_pixel_6;
wire [109:0]o4_pixel_7;
wire [109:0]o4_pixel_8;
wire [109:0]o4_pixel_9;
wire [109:0]o4_pixel_10;
wire [6:0] o4_pre_sum;
wire valid5;

BOU #(
	.bitlv  		( 4  		),
	.Midele 		( 61 		))
u_BOU_3(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid4	),
	.i_pixel_0   		( o3_pixel_0   		),
	.i_pixel_1   		( o3_pixel_1   		),
	.i_pixel_2   		( o3_pixel_2   		),
	.i_pixel_3   		( o3_pixel_3   		),
	.i_pixel_4   		( o3_pixel_4   		),
	.i_pixel_5   		( o3_pixel_5   		),
	.i_pixel_6   		( o3_pixel_6   		),
	.i_pixel_7   		( o3_pixel_7   		),
	.i_pixel_8   		( o3_pixel_8   		),
	.i_pixel_9   		( o3_pixel_9   		),
	.i_pixel_10  		( o3_pixel_10  		),

	.pre_sum       		( o3_pre_sum        		),

	//output
	.o_pixel_0   		( o4_pixel_0   		),
	.o_pixel_1   		( o4_pixel_1   		),
	.o_pixel_2   		( o4_pixel_2   		),
	.o_pixel_3   		( o4_pixel_3   		),
	.o_pixel_4   		( o4_pixel_4   		),
	.o_pixel_5   		( o4_pixel_5   		),
	.o_pixel_6   		( o4_pixel_6   		),
	.o_pixel_7   		( o4_pixel_7   		),
	.o_pixel_8   		( o4_pixel_8   		),
	.o_pixel_9   		( o4_pixel_9   		),
	.o_pixel_10  		( o4_pixel_10  		),

	.post_sum      		( o4_pre_sum      		),
	.valid(valid5)	//inout
);

///////////////////////////////////the fourth bit////////////////////////////////////////////////////////////////////////////////

wire [109:0]o5_pixel_0;
wire [109:0]o5_pixel_1;
wire [109:0]o5_pixel_2;
wire [109:0]o5_pixel_3;
wire [109:0]o5_pixel_4;
wire [109:0]o5_pixel_5;
wire [109:0]o5_pixel_6;
wire [109:0]o5_pixel_7;
wire [109:0]o5_pixel_8;
wire [109:0]o5_pixel_9;
wire [109:0]o5_pixel_10;
wire [6:0] o5_pre_sum;
wire valid6;

BOU #(
	.bitlv  		( 3  		),
	.Midele 		( 61 		))
u_BOU_4(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid5	),
	.i_pixel_0   		( o4_pixel_0   		),
	.i_pixel_1   		( o4_pixel_1   		),
	.i_pixel_2   		( o4_pixel_2   		),
	.i_pixel_3   		( o4_pixel_3   		),
	.i_pixel_4   		( o4_pixel_4   		),
	.i_pixel_5   		( o4_pixel_5   		),
	.i_pixel_6   		( o4_pixel_6   		),
	.i_pixel_7   		( o4_pixel_7   		),
	.i_pixel_8   		( o4_pixel_8   		),
	.i_pixel_9   		( o4_pixel_9   		),
	.i_pixel_10  		( o4_pixel_10  		),

	.pre_sum       		( o4_pre_sum        		),

	//output
	.o_pixel_0   		( o5_pixel_0   		),
	.o_pixel_1   		( o5_pixel_1   		),
	.o_pixel_2   		( o5_pixel_2   		),
	.o_pixel_3   		( o5_pixel_3   		),
	.o_pixel_4   		( o5_pixel_4   		),
	.o_pixel_5   		( o5_pixel_5   		),
	.o_pixel_6   		( o5_pixel_6   		),
	.o_pixel_7   		( o5_pixel_7   		),
	.o_pixel_8   		( o5_pixel_8   		),
	.o_pixel_9   		( o5_pixel_9   		),
	.o_pixel_10  		( o5_pixel_10  		),

	.post_sum      		( o5_pre_sum      		),
	.valid(valid6)	//inout
);


///////////////////////////////////the third bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o6_pixel_0;
wire [109:0]o6_pixel_1;
wire [109:0]o6_pixel_2;
wire [109:0]o6_pixel_3;
wire [109:0]o6_pixel_4;
wire [109:0]o6_pixel_5;
wire [109:0]o6_pixel_6;
wire [109:0]o6_pixel_7;
wire [109:0]o6_pixel_8;
wire [109:0]o6_pixel_9;
wire [109:0]o6_pixel_10;
wire [6:0] o6_pre_sum;
wire valid7;

BOU #(
	.bitlv  		( 2 		),
	.Midele 		( 61 		))
u_BOU_5(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid6	),
	.i_pixel_0   		( o5_pixel_0   		),
	.i_pixel_1   		( o5_pixel_1   		),
	.i_pixel_2   		( o5_pixel_2   		),
	.i_pixel_3   		( o5_pixel_3   		),
	.i_pixel_4   		( o5_pixel_4   		),
	.i_pixel_5   		( o5_pixel_5   		),
	.i_pixel_6   		( o5_pixel_6   		),
	.i_pixel_7   		( o5_pixel_7   		),
	.i_pixel_8   		( o5_pixel_8   		),
	.i_pixel_9   		( o5_pixel_9   		),
	.i_pixel_10  		( o5_pixel_10  		),

	.pre_sum       		( o5_pre_sum        		),

	//output
	.o_pixel_0   		( o6_pixel_0   		),
	.o_pixel_1   		( o6_pixel_1   		),
	.o_pixel_2   		( o6_pixel_2   		),
	.o_pixel_3   		( o6_pixel_3   		),
	.o_pixel_4   		( o6_pixel_4   		),
	.o_pixel_5   		( o6_pixel_5   		),
	.o_pixel_6   		( o6_pixel_6   		),
	.o_pixel_7   		( o6_pixel_7   		),
	.o_pixel_8   		( o6_pixel_8   		),
	.o_pixel_9   		( o6_pixel_9   		),
	.o_pixel_10  		( o6_pixel_10  		),

	.post_sum      		( o6_pre_sum      		),
	.valid(valid7)	//inout
);

///////////////////////////////////the second bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o7_pixel_0;
wire [109:0]o7_pixel_1;
wire [109:0]o7_pixel_2;
wire [109:0]o7_pixel_3;
wire [109:0]o7_pixel_4;
wire [109:0]o7_pixel_5;
wire [109:0]o7_pixel_6;
wire [109:0]o7_pixel_7;
wire [109:0]o7_pixel_8;
wire [109:0]o7_pixel_9;
wire [109:0]o7_pixel_10;
wire [6:0] o7_pre_sum;
wire valid8;

BOU #(
	.bitlv  		( 1 		),
	.Midele 		( 61 		))
u_BOU_6(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid7	),
	.i_pixel_0   		( o6_pixel_0   		),
	.i_pixel_1   		( o6_pixel_1   		),
	.i_pixel_2   		( o6_pixel_2   		),
	.i_pixel_3   		( o6_pixel_3   		),
	.i_pixel_4   		( o6_pixel_4   		),
	.i_pixel_5   		( o6_pixel_5   		),
	.i_pixel_6   		( o6_pixel_6   		),
	.i_pixel_7   		( o6_pixel_7   		),
	.i_pixel_8   		( o6_pixel_8   		),
	.i_pixel_9   		( o6_pixel_9   		),
	.i_pixel_10  		( o6_pixel_10  		),

	.pre_sum       		( o6_pre_sum        ),

	//output
	.o_pixel_0   		( o7_pixel_0   		),
	.o_pixel_1   		( o7_pixel_1   		),
	.o_pixel_2   		( o7_pixel_2   		),
	.o_pixel_3   		( o7_pixel_3   		),
	.o_pixel_4   		( o7_pixel_4   		),
	.o_pixel_5   		( o7_pixel_5   		),
	.o_pixel_6   		( o7_pixel_6   		),
	.o_pixel_7   		( o7_pixel_7   		),
	.o_pixel_8   		( o7_pixel_8   		),
	.o_pixel_9   		( o7_pixel_9   		),
	.o_pixel_10  		( o7_pixel_10  		),

	.post_sum      		( o7_pre_sum        ),
	.valid(valid8)	//inout
);


///////////////////////////////////the first bit////////////////////////////////////////////////////////////////////////////////
wire [109:0]o8_pixel_0;
wire [109:0]o8_pixel_1;
wire [109:0]o8_pixel_2;
wire [109:0]o8_pixel_3;
wire [109:0]o8_pixel_4;
wire [109:0]o8_pixel_5;
wire [109:0]o8_pixel_6;
wire [109:0]o8_pixel_7;
wire [109:0]o8_pixel_8;
wire [109:0]o8_pixel_9;
wire [109:0]o8_pixel_10;
wire [6:0] o8_pre_sum;
wire valid9;

BOU #(
	.bitlv  		( 0 		),
	.Midele 		( 61 		))
u_BOU_7(
	//input
	.clk           		( clk           	),
	.rst           		( rst           	),
	.clken			    ( clken	&& valid8	),
	.i_pixel_0   		( o7_pixel_0   		),
	.i_pixel_1   		( o7_pixel_1   		),
	.i_pixel_2   		( o7_pixel_2   		),
	.i_pixel_3   		( o7_pixel_3   		),
	.i_pixel_4   		( o7_pixel_4   		),
	.i_pixel_5   		( o7_pixel_5   		),
	.i_pixel_6   		( o7_pixel_6   		),
	.i_pixel_7   		( o7_pixel_7   		),
	.i_pixel_8   		( o7_pixel_8   		),
	.i_pixel_9   		( o7_pixel_9   		),
	.i_pixel_10  		( o7_pixel_10  		),

	.pre_sum       		( o7_pre_sum        ),

	//output
	.o_pixel_0   		( o8_pixel_0   		),
	.o_pixel_1   		( o8_pixel_1   		),
	.o_pixel_2   		( o8_pixel_2   		),
	.o_pixel_3   		( o8_pixel_3   		),
	.o_pixel_4   		( o8_pixel_4   		),
	.o_pixel_5   		( o8_pixel_5   		),
	.o_pixel_6   		( o8_pixel_6   		),
	.o_pixel_7   		( o8_pixel_7   		),
	.o_pixel_8   		( o8_pixel_8   		),
	.o_pixel_9   		( o8_pixel_9   		),
	.o_pixel_10  		( o8_pixel_10  		),

	.post_sum      		( o8_pre_sum      		),
	.valid(valid9)	//inout
);

wire [9:0] o8_pixel_0_0,o8_pixel_0_1,o8_pixel_0_2,o8_pixel_0_3,o8_pixel_0_4,o8_pixel_0_5,o8_pixel_0_6,o8_pixel_0_7,o8_pixel_0_8,o8_pixel_0_9,o8_pixel_0_10;
wire [9:0] o8_pixel_1_0,o8_pixel_1_1,o8_pixel_1_2,o8_pixel_1_3,o8_pixel_1_4,o8_pixel_1_5,o8_pixel_1_6,o8_pixel_1_7,o8_pixel_1_8,o8_pixel_1_9,o8_pixel_1_10;
wire [9:0] o8_pixel_2_0,o8_pixel_2_1,o8_pixel_2_2,o8_pixel_2_3,o8_pixel_2_4,o8_pixel_2_5,o8_pixel_2_6,o8_pixel_2_7,o8_pixel_2_8,o8_pixel_2_9,o8_pixel_2_10;
wire [9:0] o8_pixel_3_0,o8_pixel_3_1,o8_pixel_3_2,o8_pixel_3_3,o8_pixel_3_4,o8_pixel_3_5,o8_pixel_3_6,o8_pixel_3_7,o8_pixel_3_8,o8_pixel_3_9,o8_pixel_3_10;
wire [9:0] o8_pixel_4_0,o8_pixel_4_1,o8_pixel_4_2,o8_pixel_4_3,o8_pixel_4_4,o8_pixel_4_5,o8_pixel_4_6,o8_pixel_4_7,o8_pixel_4_8,o8_pixel_4_9,o8_pixel_4_10;
wire [9:0] o8_pixel_5_0,o8_pixel_5_1,o8_pixel_5_2,o8_pixel_5_3,o8_pixel_5_4,o8_pixel_5_5,o8_pixel_5_6,o8_pixel_5_7,o8_pixel_5_8,o8_pixel_5_9,o8_pixel_5_10;
wire [9:0] o8_pixel_6_0,o8_pixel_6_1,o8_pixel_6_2,o8_pixel_6_3,o8_pixel_6_4,o8_pixel_6_5,o8_pixel_6_6,o8_pixel_6_7,o8_pixel_6_8,o8_pixel_6_9,o8_pixel_6_10;
wire [9:0] o8_pixel_7_0,o8_pixel_7_1,o8_pixel_7_2,o8_pixel_7_3,o8_pixel_7_4,o8_pixel_7_5,o8_pixel_7_6,o8_pixel_7_7,o8_pixel_7_8,o8_pixel_7_9,o8_pixel_7_10;
wire [9:0] o8_pixel_8_0,o8_pixel_8_1,o8_pixel_8_2,o8_pixel_8_3,o8_pixel_8_4,o8_pixel_8_5,o8_pixel_8_6,o8_pixel_8_7,o8_pixel_8_8,o8_pixel_8_9,o8_pixel_8_10;
wire [9:0] o8_pixel_9_0,o8_pixel_9_1,o8_pixel_9_2,o8_pixel_9_3,o8_pixel_9_4,o8_pixel_9_5,o8_pixel_9_6,o8_pixel_9_7,o8_pixel_9_8,o8_pixel_9_9,o8_pixel_9_10;
wire [9:0] o8_pixel_10_0,o8_pixel_10_1,o8_pixel_10_2,o8_pixel_10_3,o8_pixel_10_4,o8_pixel_10_5,o8_pixel_10_6,o8_pixel_10_7,o8_pixel_10_8,o8_pixel_10_9,o8_pixel_10_10;


assign o8_pixel_0_0=o8_pixel_0[9:0];
assign o8_pixel_0_1=o8_pixel_0[19:10];
assign o8_pixel_0_2=o8_pixel_0[29:20];
assign o8_pixel_0_3=o8_pixel_0[39:30];
assign o8_pixel_0_4=o8_pixel_0[49:40];
assign o8_pixel_0_5=o8_pixel_0[59:50];
assign o8_pixel_0_6=o8_pixel_0[69:60];
assign o8_pixel_0_7=o8_pixel_0[79:70];
assign o8_pixel_0_8=o8_pixel_0[89:80];
assign o8_pixel_0_9=o8_pixel_0[99:90];
assign o8_pixel_0_10=o8_pixel_0[109:100];

assign o8_pixel_1_0=o8_pixel_1[9:0];  
assign o8_pixel_1_1=o8_pixel_1[19:10];
assign o8_pixel_1_2=o8_pixel_1[29:20];
assign o8_pixel_1_3=o8_pixel_1[39:30];
assign o8_pixel_1_4=o8_pixel_1[49:40];
assign o8_pixel_1_5=o8_pixel_1[59:50];
assign o8_pixel_1_6=o8_pixel_1[69:60];
assign o8_pixel_1_7=o8_pixel_1[79:70];
assign o8_pixel_1_8=o8_pixel_1[89:80];
assign o8_pixel_1_9=o8_pixel_1[99:90];
assign o8_pixel_1_10=o8_pixel_1[109:100];

assign o8_pixel_2_0=o8_pixel_2[9:0];  
assign o8_pixel_2_1=o8_pixel_2[19:10];
assign o8_pixel_2_2=o8_pixel_2[29:20];
assign o8_pixel_2_3=o8_pixel_2[39:30];
assign o8_pixel_2_4=o8_pixel_2[49:40];
assign o8_pixel_2_5=o8_pixel_2[59:50];
assign o8_pixel_2_6=o8_pixel_2[69:60];
assign o8_pixel_2_7=o8_pixel_2[79:70];
assign o8_pixel_2_8=o8_pixel_2[89:80];
assign o8_pixel_2_9=o8_pixel_2[99:90];
assign o8_pixel_2_10=o8_pixel_2[109:100];


assign o8_pixel_3_0=o8_pixel_3[9:0];  
assign o8_pixel_3_1=o8_pixel_3[19:10];
assign o8_pixel_3_2=o8_pixel_3[29:20];
assign o8_pixel_3_3=o8_pixel_3[39:30];
assign o8_pixel_3_4=o8_pixel_3[49:40];
assign o8_pixel_3_5=o8_pixel_3[59:50];
assign o8_pixel_3_6=o8_pixel_3[69:60];
assign o8_pixel_3_7=o8_pixel_3[79:70];
assign o8_pixel_3_8=o8_pixel_3[89:80];
assign o8_pixel_3_9=o8_pixel_3[99:90];
assign o8_pixel_3_10=o8_pixel_3[109:100];


assign o8_pixel_4_0=o8_pixel_4[9:0];  
assign o8_pixel_4_1=o8_pixel_4[19:10];
assign o8_pixel_4_2=o8_pixel_4[29:20];
assign o8_pixel_4_3=o8_pixel_4[39:30];
assign o8_pixel_4_4=o8_pixel_4[49:40];
assign o8_pixel_4_5=o8_pixel_4[59:50];
assign o8_pixel_4_6=o8_pixel_4[69:60];
assign o8_pixel_4_7=o8_pixel_4[79:70];
assign o8_pixel_4_8=o8_pixel_4[89:80];
assign o8_pixel_4_9=o8_pixel_4[99:90];
assign o8_pixel_4_10=o8_pixel_4[109:100];

assign o8_pixel_5_0=o8_pixel_5[9:0];  
assign o8_pixel_5_1=o8_pixel_5[19:10];
assign o8_pixel_5_2=o8_pixel_5[29:20];
assign o8_pixel_5_3=o8_pixel_5[39:30];
assign o8_pixel_5_4=o8_pixel_5[49:40];
assign o8_pixel_5_5=o8_pixel_5[59:50];
assign o8_pixel_5_6=o8_pixel_5[69:60];
assign o8_pixel_5_7=o8_pixel_5[79:70];
assign o8_pixel_5_8=o8_pixel_5[89:80];
assign o8_pixel_5_9=o8_pixel_5[99:90];
assign o8_pixel_5_10=o8_pixel_5[109:100];

assign o8_pixel_6_0=o8_pixel_6[9:0];  
assign o8_pixel_6_1=o8_pixel_6[19:10];
assign o8_pixel_6_2=o8_pixel_6[29:20];
assign o8_pixel_6_3=o8_pixel_6[39:30];
assign o8_pixel_6_4=o8_pixel_6[49:40];
assign o8_pixel_6_5=o8_pixel_6[59:50];
assign o8_pixel_6_6=o8_pixel_6[69:60];
assign o8_pixel_6_7=o8_pixel_6[79:70];
assign o8_pixel_6_8=o8_pixel_6[89:80];
assign o8_pixel_6_9=o8_pixel_6[99:90];
assign o8_pixel_6_10=o8_pixel_6[109:100];

assign o8_pixel_7_0=o8_pixel_7[9:0];  
assign o8_pixel_7_1=o8_pixel_7[19:10];
assign o8_pixel_7_2=o8_pixel_7[29:20];
assign o8_pixel_7_3=o8_pixel_7[39:30];
assign o8_pixel_7_4=o8_pixel_7[49:40];
assign o8_pixel_7_5=o8_pixel_7[59:50];
assign o8_pixel_7_6=o8_pixel_7[69:60];
assign o8_pixel_7_7=o8_pixel_7[79:70];
assign o8_pixel_7_8=o8_pixel_7[89:80];
assign o8_pixel_7_9=o8_pixel_7[99:90];
assign o8_pixel_7_10=o8_pixel_7[109:100];

assign o8_pixel_8_0=o8_pixel_8[9:0];  
assign o8_pixel_8_1=o8_pixel_8[19:10];
assign o8_pixel_8_2=o8_pixel_8[29:20];
assign o8_pixel_8_3=o8_pixel_8[39:30];
assign o8_pixel_8_4=o8_pixel_8[49:40];
assign o8_pixel_8_5=o8_pixel_8[59:50];
assign o8_pixel_8_6=o8_pixel_8[69:60];
assign o8_pixel_8_7=o8_pixel_8[79:70];
assign o8_pixel_8_8=o8_pixel_8[89:80];
assign o8_pixel_8_9=o8_pixel_8[99:90];
assign o8_pixel_8_10=o8_pixel_8[109:100];

assign o8_pixel_9_0=o8_pixel_9[9:0];  
assign o8_pixel_9_1=o8_pixel_9[19:10];
assign o8_pixel_9_2=o8_pixel_9[29:20];
assign o8_pixel_9_3=o8_pixel_9[39:30];
assign o8_pixel_9_4=o8_pixel_9[49:40];
assign o8_pixel_9_5=o8_pixel_9[59:50];
assign o8_pixel_9_6=o8_pixel_9[69:60];
assign o8_pixel_9_7=o8_pixel_9[79:70];
assign o8_pixel_9_8=o8_pixel_9[89:80];
assign o8_pixel_9_9=o8_pixel_9[99:90];
assign o8_pixel_9_10=o8_pixel_9[109:100];

assign o8_pixel_10_0=o8_pixel_10[9:0];  
assign o8_pixel_10_1=o8_pixel_10[19:10];
assign o8_pixel_10_2=o8_pixel_10[29:20];
assign o8_pixel_10_3=o8_pixel_10[39:30];
assign o8_pixel_10_4=o8_pixel_10[49:40];
assign o8_pixel_10_5=o8_pixel_10[59:50];
assign o8_pixel_10_6=o8_pixel_10[69:60];
assign o8_pixel_10_7=o8_pixel_10[79:70];
assign o8_pixel_10_8=o8_pixel_10[89:80];
assign o8_pixel_10_9=o8_pixel_10[99:90];
assign o8_pixel_10_10=o8_pixel_10[109:100];



wire [8:0] o8_pixel_0_0_w  = {o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9],o8_pixel_0_0[9]};
wire [8:0] o8_pixel_0_1_w  = {o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9],o8_pixel_0_1[9]};
wire [8:0] o8_pixel_0_2_w  = {o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9],o8_pixel_0_2[9]};
wire [8:0] o8_pixel_0_3_w  = {o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9],o8_pixel_0_3[9]};
wire [8:0] o8_pixel_0_4_w  = {o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9],o8_pixel_0_4[9]};
wire [8:0] o8_pixel_0_5_w  = {o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9],o8_pixel_0_5[9]};
wire [8:0] o8_pixel_0_6_w  = {o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9],o8_pixel_0_6[9]};
wire [8:0] o8_pixel_0_7_w  = {o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9],o8_pixel_0_7[9]};
wire [8:0] o8_pixel_0_8_w  = {o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9],o8_pixel_0_8[9]};
wire [8:0] o8_pixel_0_9_w  = {o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9],o8_pixel_0_9[9]};
wire [8:0] o8_pixel_0_10_w = {o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9],o8_pixel_0_10[9]};

wire [8:0] o8_pixel_1_0_w  = {o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9],o8_pixel_1_0[9]};
wire [8:0] o8_pixel_1_1_w  = {o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9],o8_pixel_1_1[9]};
wire [8:0] o8_pixel_1_2_w  = {o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9],o8_pixel_1_2[9]};
wire [8:0] o8_pixel_1_3_w  = {o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9],o8_pixel_1_3[9]};
wire [8:0] o8_pixel_1_4_w  = {o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9],o8_pixel_1_4[9]};
wire [8:0] o8_pixel_1_5_w  = {o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9],o8_pixel_1_5[9]};
wire [8:0] o8_pixel_1_6_w  = {o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9],o8_pixel_1_6[9]};
wire [8:0] o8_pixel_1_7_w  = {o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9],o8_pixel_1_7[9]};
wire [8:0] o8_pixel_1_8_w  = {o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9],o8_pixel_1_8[9]};
wire [8:0] o8_pixel_1_9_w  = {o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9],o8_pixel_1_9[9]};
wire [8:0] o8_pixel_1_10_w = {o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9],o8_pixel_1_10[9]};

wire [8:0] o8_pixel_2_0_w  = {o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9],o8_pixel_2_0[9]};
wire [8:0] o8_pixel_2_1_w  = {o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9],o8_pixel_2_1[9]};
wire [8:0] o8_pixel_2_2_w  = {o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9],o8_pixel_2_2[9]};
wire [8:0] o8_pixel_2_3_w  = {o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9],o8_pixel_2_3[9]};
wire [8:0] o8_pixel_2_4_w  = {o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9],o8_pixel_2_4[9]};
wire [8:0] o8_pixel_2_5_w  = {o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9],o8_pixel_2_5[9]};
wire [8:0] o8_pixel_2_6_w  = {o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9],o8_pixel_2_6[9]};
wire [8:0] o8_pixel_2_7_w  = {o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9],o8_pixel_2_7[9]};
wire [8:0] o8_pixel_2_8_w  = {o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9],o8_pixel_2_8[9]};
wire [8:0] o8_pixel_2_9_w  = {o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9],o8_pixel_2_9[9]};
wire [8:0] o8_pixel_2_10_w = {o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9],o8_pixel_2_10[9]};

wire [8:0] o8_pixel_3_0_w  = {o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9],o8_pixel_3_0[9]};
wire [8:0] o8_pixel_3_1_w  = {o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9],o8_pixel_3_1[9]};
wire [8:0] o8_pixel_3_2_w  = {o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9],o8_pixel_3_2[9]};
wire [8:0] o8_pixel_3_3_w  = {o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9],o8_pixel_3_3[9]};
wire [8:0] o8_pixel_3_4_w  = {o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9],o8_pixel_3_4[9]};
wire [8:0] o8_pixel_3_5_w  = {o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9],o8_pixel_3_5[9]};
wire [8:0] o8_pixel_3_6_w  = {o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9],o8_pixel_3_6[9]};
wire [8:0] o8_pixel_3_7_w  = {o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9],o8_pixel_3_7[9]};
wire [8:0] o8_pixel_3_8_w  = {o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9],o8_pixel_3_8[9]};
wire [8:0] o8_pixel_3_9_w  = {o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9],o8_pixel_3_9[9]};
wire [8:0] o8_pixel_3_10_w = {o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9],o8_pixel_3_10[9]};

wire [8:0] o8_pixel_4_0_w  = {o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9],o8_pixel_4_0[9]};
wire [8:0] o8_pixel_4_1_w  = {o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9],o8_pixel_4_1[9]};
wire [8:0] o8_pixel_4_2_w  = {o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9],o8_pixel_4_2[9]};
wire [8:0] o8_pixel_4_3_w  = {o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9],o8_pixel_4_3[9]};
wire [8:0] o8_pixel_4_4_w  = {o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9],o8_pixel_4_4[9]};
wire [8:0] o8_pixel_4_5_w  = {o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9],o8_pixel_4_5[9]};
wire [8:0] o8_pixel_4_6_w  = {o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9],o8_pixel_4_6[9]};
wire [8:0] o8_pixel_4_7_w  = {o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9],o8_pixel_4_7[9]};
wire [8:0] o8_pixel_4_8_w  = {o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9],o8_pixel_4_8[9]};
wire [8:0] o8_pixel_4_9_w  = {o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9],o8_pixel_4_9[9]};
wire [8:0] o8_pixel_4_10_w = {o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9],o8_pixel_4_10[9]};

wire [8:0] o8_pixel_5_0_w  = {o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9],o8_pixel_5_0[9]};
wire [8:0] o8_pixel_5_1_w  = {o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9],o8_pixel_5_1[9]};
wire [8:0] o8_pixel_5_2_w  = {o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9],o8_pixel_5_2[9]};
wire [8:0] o8_pixel_5_3_w  = {o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9],o8_pixel_5_3[9]};
wire [8:0] o8_pixel_5_4_w  = {o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9],o8_pixel_5_4[9]};
wire [8:0] o8_pixel_5_5_w  = {o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9],o8_pixel_5_5[9]};
wire [8:0] o8_pixel_5_6_w  = {o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9],o8_pixel_5_6[9]};
wire [8:0] o8_pixel_5_7_w  = {o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9],o8_pixel_5_7[9]};
wire [8:0] o8_pixel_5_8_w  = {o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9],o8_pixel_5_8[9]};
wire [8:0] o8_pixel_5_9_w  = {o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9],o8_pixel_5_9[9]};
wire [8:0] o8_pixel_5_10_w = {o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9],o8_pixel_5_10[9]};

wire [8:0] o8_pixel_6_0_w  = {o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9],o8_pixel_6_0[9]};
wire [8:0] o8_pixel_6_1_w  = {o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9],o8_pixel_6_1[9]};
wire [8:0] o8_pixel_6_2_w  = {o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9],o8_pixel_6_2[9]};
wire [8:0] o8_pixel_6_3_w  = {o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9],o8_pixel_6_3[9]};
wire [8:0] o8_pixel_6_4_w  = {o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9],o8_pixel_6_4[9]};
wire [8:0] o8_pixel_6_5_w  = {o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9],o8_pixel_6_5[9]};
wire [8:0] o8_pixel_6_6_w  = {o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9],o8_pixel_6_6[9]};
wire [8:0] o8_pixel_6_7_w  = {o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9],o8_pixel_6_7[9]};
wire [8:0] o8_pixel_6_8_w  = {o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9],o8_pixel_6_8[9]};
wire [8:0] o8_pixel_6_9_w  = {o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9],o8_pixel_6_9[9]};
wire [8:0] o8_pixel_6_10_w = {o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9],o8_pixel_6_10[9]};

wire [8:0] o8_pixel_7_0_w  = {o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9],o8_pixel_7_0[9]};
wire [8:0] o8_pixel_7_1_w  = {o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9],o8_pixel_7_1[9]};
wire [8:0] o8_pixel_7_2_w  = {o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9],o8_pixel_7_2[9]};
wire [8:0] o8_pixel_7_3_w  = {o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9],o8_pixel_7_3[9]};
wire [8:0] o8_pixel_7_4_w  = {o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9],o8_pixel_7_4[9]};
wire [8:0] o8_pixel_7_5_w  = {o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9],o8_pixel_7_5[9]};
wire [8:0] o8_pixel_7_6_w  = {o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9],o8_pixel_7_6[9]};
wire [8:0] o8_pixel_7_7_w  = {o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9],o8_pixel_7_7[9]};
wire [8:0] o8_pixel_7_8_w  = {o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9],o8_pixel_7_8[9]};
wire [8:0] o8_pixel_7_9_w  = {o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9],o8_pixel_7_9[9]};
wire [8:0] o8_pixel_7_10_w = {o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9],o8_pixel_7_10[9]};

wire [8:0] o8_pixel_8_0_w  = {o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9],o8_pixel_8_0[9]};
wire [8:0] o8_pixel_8_1_w  = {o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9],o8_pixel_8_1[9]};
wire [8:0] o8_pixel_8_2_w  = {o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9],o8_pixel_8_2[9]};
wire [8:0] o8_pixel_8_3_w  = {o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9],o8_pixel_8_3[9]};
wire [8:0] o8_pixel_8_4_w  = {o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9],o8_pixel_8_4[9]};
wire [8:0] o8_pixel_8_5_w  = {o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9],o8_pixel_8_5[9]};
wire [8:0] o8_pixel_8_6_w  = {o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9],o8_pixel_8_6[9]};
wire [8:0] o8_pixel_8_7_w  = {o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9],o8_pixel_8_7[9]};
wire [8:0] o8_pixel_8_8_w  = {o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9],o8_pixel_8_8[9]};
wire [8:0] o8_pixel_8_9_w  = {o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9],o8_pixel_8_9[9]};
wire [8:0] o8_pixel_8_10_w = {o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9],o8_pixel_8_10[9]};

wire [8:0] o8_pixel_9_0_w  = {o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9],o8_pixel_9_0[9]};
wire [8:0] o8_pixel_9_1_w  = {o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9],o8_pixel_9_1[9]};
wire [8:0] o8_pixel_9_2_w  = {o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9],o8_pixel_9_2[9]};
wire [8:0] o8_pixel_9_3_w  = {o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9],o8_pixel_9_3[9]};
wire [8:0] o8_pixel_9_4_w  = {o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9],o8_pixel_9_4[9]};
wire [8:0] o8_pixel_9_5_w  = {o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9],o8_pixel_9_5[9]};
wire [8:0] o8_pixel_9_6_w  = {o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9],o8_pixel_9_6[9]};
wire [8:0] o8_pixel_9_7_w  = {o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9],o8_pixel_9_7[9]};
wire [8:0] o8_pixel_9_8_w  = {o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9],o8_pixel_9_8[9]};
wire [8:0] o8_pixel_9_9_w  = {o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9],o8_pixel_9_9[9]};
wire [8:0] o8_pixel_9_10_w = {o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9],o8_pixel_9_10[9]};

wire [8:0] o8_pixel_10_0_w  = {o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9],o8_pixel_10_0[9]};
wire [8:0] o8_pixel_10_1_w  = {o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9],o8_pixel_10_1[9]};
wire [8:0] o8_pixel_10_2_w  = {o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9],o8_pixel_10_2[9]};
wire [8:0] o8_pixel_10_3_w  = {o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9],o8_pixel_10_3[9]};
wire [8:0] o8_pixel_10_4_w  = {o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9],o8_pixel_10_4[9]};
wire [8:0] o8_pixel_10_5_w  = {o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9],o8_pixel_10_5[9]};
wire [8:0] o8_pixel_10_6_w  = {o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9],o8_pixel_10_6[9]};
wire [8:0] o8_pixel_10_7_w  = {o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9],o8_pixel_10_7[9]};
wire [8:0] o8_pixel_10_8_w  = {o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9],o8_pixel_10_8[9]};
wire [8:0] o8_pixel_10_9_w  = {o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9],o8_pixel_10_9[9]};
wire [8:0] o8_pixel_10_10_w = {o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9],o8_pixel_10_10[9]};



wire [8:0] median_data_w= (o8_pixel_0_0_w & o8_pixel_0_0[8:0])|(o8_pixel_0_1_w & o8_pixel_0_1[8:0])|(o8_pixel_0_2_w & o8_pixel_0_2[8:0])|(o8_pixel_0_3_w & o8_pixel_0_3[8:0])|(o8_pixel_0_4_w & o8_pixel_0_4[8:0])|(o8_pixel_0_5_w & o8_pixel_0_5[8:0])|(o8_pixel_0_6_w & o8_pixel_0_6[8:0])|(o8_pixel_0_7_w & o8_pixel_0_7[8:0])|(o8_pixel_0_8_w & o8_pixel_0_8[8:0])|(o8_pixel_0_9_w & o8_pixel_0_9[8:0])|(o8_pixel_0_10_w & o8_pixel_0_10[8:0])|
						  (o8_pixel_1_0_w & o8_pixel_1_0[8:0])|(o8_pixel_1_1_w & o8_pixel_1_1[8:0])|(o8_pixel_1_2_w & o8_pixel_1_2[8:0])|(o8_pixel_1_3_w & o8_pixel_1_3[8:0])|(o8_pixel_1_4_w & o8_pixel_1_4[8:0])|(o8_pixel_1_5_w & o8_pixel_1_5[8:0])|(o8_pixel_1_6_w & o8_pixel_1_6[8:0])|(o8_pixel_1_7_w & o8_pixel_1_7[8:0])|(o8_pixel_1_8_w & o8_pixel_1_8[8:0])|(o8_pixel_1_9_w & o8_pixel_1_9[8:0])|(o8_pixel_1_10_w & o8_pixel_1_10[8:0])|
						  (o8_pixel_2_0_w & o8_pixel_2_0[8:0])|(o8_pixel_2_1_w & o8_pixel_2_1[8:0])|(o8_pixel_2_2_w & o8_pixel_2_2[8:0])|(o8_pixel_2_3_w & o8_pixel_2_3[8:0])|(o8_pixel_2_4_w & o8_pixel_2_4[8:0])|(o8_pixel_2_5_w & o8_pixel_2_5[8:0])|(o8_pixel_2_6_w & o8_pixel_2_6[8:0])|(o8_pixel_2_7_w & o8_pixel_2_7[8:0])|(o8_pixel_2_8_w & o8_pixel_2_8[8:0])|(o8_pixel_2_9_w & o8_pixel_2_9[8:0])|(o8_pixel_2_10_w & o8_pixel_2_10[8:0])|
						  (o8_pixel_3_0_w & o8_pixel_3_0[8:0])|(o8_pixel_3_1_w & o8_pixel_3_1[8:0])|(o8_pixel_3_2_w & o8_pixel_3_2[8:0])|(o8_pixel_3_3_w & o8_pixel_3_3[8:0])|(o8_pixel_3_4_w & o8_pixel_3_4[8:0])|(o8_pixel_3_5_w & o8_pixel_3_5[8:0])|(o8_pixel_3_6_w & o8_pixel_3_6[8:0])|(o8_pixel_3_7_w & o8_pixel_3_7[8:0])|(o8_pixel_3_8_w & o8_pixel_3_8[8:0])|(o8_pixel_3_9_w & o8_pixel_3_9[8:0])|(o8_pixel_3_10_w & o8_pixel_3_10[8:0])|
						  (o8_pixel_4_0_w & o8_pixel_4_0[8:0])|(o8_pixel_4_1_w & o8_pixel_4_1[8:0])|(o8_pixel_4_2_w & o8_pixel_4_2[8:0])|(o8_pixel_4_3_w & o8_pixel_4_3[8:0])|(o8_pixel_4_4_w & o8_pixel_4_4[8:0])|(o8_pixel_4_5_w & o8_pixel_4_5[8:0])|(o8_pixel_4_6_w & o8_pixel_4_6[8:0])|(o8_pixel_4_7_w & o8_pixel_4_7[8:0])|(o8_pixel_4_8_w & o8_pixel_4_8[8:0])|(o8_pixel_4_9_w & o8_pixel_4_9[8:0])|(o8_pixel_4_10_w & o8_pixel_4_10[8:0])|
						  (o8_pixel_5_0_w & o8_pixel_5_0[8:0])|(o8_pixel_5_1_w & o8_pixel_5_1[8:0])|(o8_pixel_5_2_w & o8_pixel_5_2[8:0])|(o8_pixel_5_3_w & o8_pixel_5_3[8:0])|(o8_pixel_5_4_w & o8_pixel_5_4[8:0])|(o8_pixel_5_5_w & o8_pixel_5_5[8:0])|(o8_pixel_5_6_w & o8_pixel_5_6[8:0])|(o8_pixel_5_7_w & o8_pixel_5_7[8:0])|(o8_pixel_5_8_w & o8_pixel_5_8[8:0])|(o8_pixel_5_9_w & o8_pixel_5_9[8:0])|(o8_pixel_5_10_w & o8_pixel_5_10[8:0])|
						  (o8_pixel_6_0_w & o8_pixel_6_0[8:0])|(o8_pixel_6_1_w & o8_pixel_6_1[8:0])|(o8_pixel_6_2_w & o8_pixel_6_2[8:0])|(o8_pixel_6_3_w & o8_pixel_6_3[8:0])|(o8_pixel_6_4_w & o8_pixel_6_4[8:0])|(o8_pixel_6_5_w & o8_pixel_6_5[8:0])|(o8_pixel_6_6_w & o8_pixel_6_6[8:0])|(o8_pixel_6_7_w & o8_pixel_6_7[8:0])|(o8_pixel_6_8_w & o8_pixel_6_8[8:0])|(o8_pixel_6_9_w & o8_pixel_6_9[8:0])|(o8_pixel_6_10_w & o8_pixel_6_10[8:0])|
						  (o8_pixel_7_0_w & o8_pixel_7_0[8:0])|(o8_pixel_7_1_w & o8_pixel_7_1[8:0])|(o8_pixel_7_2_w & o8_pixel_7_2[8:0])|(o8_pixel_7_3_w & o8_pixel_7_3[8:0])|(o8_pixel_7_4_w & o8_pixel_7_4[8:0])|(o8_pixel_7_5_w & o8_pixel_7_5[8:0])|(o8_pixel_7_6_w & o8_pixel_7_6[8:0])|(o8_pixel_7_7_w & o8_pixel_7_7[8:0])|(o8_pixel_7_8_w & o8_pixel_7_8[8:0])|(o8_pixel_7_9_w & o8_pixel_7_9[8:0])|(o8_pixel_7_10_w & o8_pixel_7_10[8:0])|
						  (o8_pixel_8_0_w & o8_pixel_8_0[8:0])|(o8_pixel_8_1_w & o8_pixel_8_1[8:0])|(o8_pixel_8_2_w & o8_pixel_8_2[8:0])|(o8_pixel_8_3_w & o8_pixel_8_3[8:0])|(o8_pixel_8_4_w & o8_pixel_8_4[8:0])|(o8_pixel_8_5_w & o8_pixel_8_5[8:0])|(o8_pixel_8_6_w & o8_pixel_8_6[8:0])|(o8_pixel_8_7_w & o8_pixel_8_7[8:0])|(o8_pixel_8_8_w & o8_pixel_8_8[8:0])|(o8_pixel_8_9_w & o8_pixel_8_9[8:0])|(o8_pixel_8_10_w & o8_pixel_8_10[8:0])|
						  (o8_pixel_9_0_w & o8_pixel_9_0[8:0])|(o8_pixel_9_1_w & o8_pixel_9_1[8:0])|(o8_pixel_9_2_w & o8_pixel_9_2[8:0])|(o8_pixel_9_3_w & o8_pixel_9_3[8:0])|(o8_pixel_9_4_w & o8_pixel_9_4[8:0])|(o8_pixel_9_5_w & o8_pixel_9_5[8:0])|(o8_pixel_9_6_w & o8_pixel_9_6[8:0])|(o8_pixel_9_7_w & o8_pixel_9_7[8:0])|(o8_pixel_9_8_w & o8_pixel_9_8[8:0])|(o8_pixel_9_9_w & o8_pixel_9_9[8:0])|(o8_pixel_9_10_w & o8_pixel_9_10[8:0])|
						  (o8_pixel_10_0_w & o8_pixel_10_0[8:0])|(o8_pixel_10_1_w & o8_pixel_10_1[8:0])|(o8_pixel_10_2_w & o8_pixel_10_2[8:0])|(o8_pixel_10_3_w & o8_pixel_10_3[8:0])|(o8_pixel_10_4_w & o8_pixel_10_4[8:0])|(o8_pixel_10_5_w & o8_pixel_10_5[8:0])|(o8_pixel_10_6_w & o8_pixel_10_6[8:0])|(o8_pixel_10_7_w & o8_pixel_10_7[8:0])|(o8_pixel_10_8_w & o8_pixel_10_8[8:0])|(o8_pixel_10_9_w & o8_pixel_10_9[8:0])|(o8_pixel_10_10_w & o8_pixel_10_10[8:0]);
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        median_data<=9'd0;
	valid <= 0;
    end
	else if (clken)begin
		median_data <= median_data_w;
		valid <= valid8;
	end
	else begin
		median_data <= median_data;
		valid <= valid;
	end
end

endmodule
