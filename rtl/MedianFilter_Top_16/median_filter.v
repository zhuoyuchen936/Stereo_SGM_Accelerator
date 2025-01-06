/*
 * @Author: xxx
 * @Date: xxx
 * @Last Modified by: like
 * @Last Modified time: 2022-08-29 14:42:53
 */
 
module median_filter(
	clk,   
	rst,
	clken,
    window_size,
	pixel0,    	
	pixel1,    
	pixel2,    
	pixel3,    
	pixel4,    
	pixel5,    
	pixel6,    
	pixel7,    
	pixel8,    
	pixel9,    
	pixel10,    
	median_data,    
	valid
);

parameter WIDTH=9;

	input clk;  
	input rst;
	input clken;
    input [1:0] window_size;
	input [(WIDTH-1):0] pixel0;    	
	input [(WIDTH-1):0] pixel1;    
	input [(WIDTH-1):0] pixel2;    
	input [(WIDTH-1):0] pixel3;    
	input [(WIDTH-1):0] pixel4;    
	input [(WIDTH-1):0] pixel5;    
	input [(WIDTH-1):0] pixel6;    
	input [(WIDTH-1):0] pixel7;    
	input [(WIDTH-1):0] pixel8;    
	input [(WIDTH-1):0] pixel9;    
	input [(WIDTH-1):0] pixel10;    
	output reg [(WIDTH-1):0] median_data;    
	output reg valid;

wire [(WIDTH*11+10):0] 	pixel_line_0;
wire [(WIDTH*11+10):0] 	pixel_line_1;
wire [(WIDTH*11+10):0] 	pixel_line_2;
wire [(WIDTH*11+10):0] 	pixel_line_3;
wire [(WIDTH*11+10):0] 	pixel_line_4;
wire [(WIDTH*11+10):0] 	pixel_line_5;
wire [(WIDTH*11+10):0] 	pixel_line_6;
wire [(WIDTH*11+10):0] 	pixel_line_7;
wire [(WIDTH*11+10):0] 	pixel_line_8;
wire [(WIDTH*11+10):0] 	pixel_line_9;
wire [(WIDTH*11+10):0] 	pixel_line_10;

wire valid1;

window_buffer#(WIDTH) u_window_buffer(
	//input
	.clk         		( clk ),
	.rst         		( rst ),
	.clken			    ( clken),
    .window_size        (window_size),
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
wire [5:0] mid_0;
wire [5:0] mid_1;
assign mid_1=window_size[1]? 6'd24:mid_0;
assign mid_0=window_size[0]? 6'd40:6'd61;
//位数由8变位9 多加一个BOU
wire [(WIDTH*11+10):0]o1_pixel_0_add1;
wire [(WIDTH*11+10):0]o1_pixel_1_add1;
wire [(WIDTH*11+10):0]o1_pixel_2_add1;
wire [(WIDTH*11+10):0]o1_pixel_3_add1;
wire [(WIDTH*11+10):0]o1_pixel_4_add1;
wire [(WIDTH*11+10):0]o1_pixel_5_add1;
wire [(WIDTH*11+10):0]o1_pixel_6_add1;
wire [(WIDTH*11+10):0]o1_pixel_7_add1;
wire [(WIDTH*11+10):0]o1_pixel_8_add1;
wire [(WIDTH*11+10):0]o1_pixel_9_add1;
wire [(WIDTH*11+10):0]o1_pixel_10_add1;
wire [6:0] 	o1_pre_sum_add1;
wire valid1_add1;
BOU #(
	.bitlv  		( (WIDTH-1)  		),
    .WIDTH          (WIDTH      ))
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
	
	.Midele 		    ( mid_1		),
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
wire [(WIDTH*11+10):0]o_pixel_0[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_1[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_2[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_3[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_4[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_5[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_6[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_7[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_8[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_9[(WIDTH-2):0];
wire [(WIDTH*11+10):0]o_pixel_10[(WIDTH-2):0];
wire [6:0] 	o_pre_sum[(WIDTH-2):0];
wire [(WIDTH-2):0]valid_m;
BOU #(
	.bitlv  		( (WIDTH-2)  		),
    .WIDTH          ( WIDTH      ))
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
	
	.Midele 		    ( mid_1		),
	.pre_sum       		( o1_pre_sum_add1       		),

	//output
	.o_pixel_0   		( o_pixel_0[0]   		),
	.o_pixel_1   		( o_pixel_1[0]   		),
	.o_pixel_2   		( o_pixel_2[0]   		),
	.o_pixel_3   		( o_pixel_3[0]   		),
	.o_pixel_4   		( o_pixel_4[0]   		),
	.o_pixel_5   		( o_pixel_5[0]   		),
	.o_pixel_6   		( o_pixel_6[0]   		),
	.o_pixel_7   		( o_pixel_7[0]   		),
	.o_pixel_8   		( o_pixel_8[0]   		),
	.o_pixel_9   		( o_pixel_9[0]   		),
	.o_pixel_10  		( o_pixel_10[0]  		),
	
	.post_sum      		( o_pre_sum[0]      		),
	.valid(valid_m[0])
	//inout
);

    genvar i;
		generate for(i=0;i<WIDTH-2;i=i+1) begin: BOU_loop
		BOU #(
	    .bitlv  		( (WIDTH-3-i)  		),
        .WIDTH          ( WIDTH      ))
        u_BOU_inst(
    	//input
    	.clk           		( clk           	),
    	.rst           		( rst           	),
    	.clken			    ( clken	&& valid_m[i]	),
    	.i_pixel_0   		( o_pixel_0[i]   		),
    	.i_pixel_1   		( o_pixel_1[i]   		),
    	.i_pixel_2   		( o_pixel_2[i]   		),
    	.i_pixel_3   		( o_pixel_3[i]   		),
    	.i_pixel_4   		( o_pixel_4[i]   		),
    	.i_pixel_5   		( o_pixel_5[i]   		),
    	.i_pixel_6   		( o_pixel_6[i]   		),
    	.i_pixel_7   		( o_pixel_7[i]   		),
    	.i_pixel_8   		( o_pixel_8[i]   		),
    	.i_pixel_9   		( o_pixel_9[i]   		),
    	.i_pixel_10  		( o_pixel_10[i]  		),
    	
	    .Midele 	    	( mid_1 		),
    	.pre_sum       		( o_pre_sum[i]        		),
    
    	//output
    	.o_pixel_0   		( o_pixel_0[i+1]   		),
    	.o_pixel_1   		( o_pixel_1[i+1]   		),
    	.o_pixel_2   		( o_pixel_2[i+1]   		),
    	.o_pixel_3   		( o_pixel_3[i+1]   		),
    	.o_pixel_4   		( o_pixel_4[i+1]   		),
    	.o_pixel_5   		( o_pixel_5[i+1]   		),
    	.o_pixel_6   		( o_pixel_6[i+1]   		),
    	.o_pixel_7   		( o_pixel_7[i+1]   		),
    	.o_pixel_8   		( o_pixel_8[i+1]   		),
    	.o_pixel_9   		( o_pixel_9[i+1]   		),
    	.o_pixel_10  		( o_pixel_10[i+1]  		),
    
    	.post_sum      		( o_pre_sum[i+1]      		),
    	.valid(valid_m[i+1])
	//inout
        );
			end
		endgenerate	
///////////////////////////////////the seventh bit////////////////////////////////////////////////////////////////////////////////

wire [WIDTH:0] of_pixel_0[10:0];
wire [WIDTH:0] of_pixel_1[10:0];
wire [WIDTH:0] of_pixel_2[10:0];
wire [WIDTH:0] of_pixel_3[10:0];
wire [WIDTH:0] of_pixel_4[10:0];
wire [WIDTH:0] of_pixel_5[10:0];
wire [WIDTH:0] of_pixel_6[10:0];
wire [WIDTH:0] of_pixel_7[10:0];
wire [WIDTH:0] of_pixel_8[10:0];
wire [WIDTH:0] of_pixel_9[10:0];
wire [WIDTH:0] of_pixel_10[10:0];

wire [WIDTH:0] of_pixel_0_w[10:0];
wire [WIDTH:0] of_pixel_1_w[10:0];
wire [WIDTH:0] of_pixel_2_w[10:0];
wire [WIDTH:0] of_pixel_3_w[10:0];
wire [WIDTH:0] of_pixel_4_w[10:0];
wire [WIDTH:0] of_pixel_5_w[10:0];
wire [WIDTH:0] of_pixel_6_w[10:0];
wire [WIDTH:0] of_pixel_7_w[10:0];
wire [WIDTH:0] of_pixel_8_w[10:0];
wire [WIDTH:0] of_pixel_9_w[10:0];
wire [WIDTH:0] of_pixel_10_w[10:0];
genvar k;
		generate for(k=0;k<11;k=k+1) begin: o_pixel_loop
				assign  of_pixel_0[k]=o_pixel_0[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_1[k]=o_pixel_1[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_2[k]=o_pixel_2[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_3[k]=o_pixel_3[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_4[k]=o_pixel_4[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_5[k]=o_pixel_5[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_6[k]=o_pixel_6[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_7[k]=o_pixel_7[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_8[k]=o_pixel_8[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_9[k]=o_pixel_9[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];
				assign  of_pixel_10[k]=o_pixel_10[WIDTH-2][(WIDTH+1)*k+WIDTH:(WIDTH+1)*k];

                assign of_pixel_0_w[k]={WIDTH{of_pixel_0[k][WIDTH]}};
                assign of_pixel_1_w[k]={WIDTH{of_pixel_1[k][WIDTH]}};
                assign of_pixel_2_w[k]={WIDTH{of_pixel_2[k][WIDTH]}};
                assign of_pixel_3_w[k]={WIDTH{of_pixel_3[k][WIDTH]}};
                assign of_pixel_4_w[k]={WIDTH{of_pixel_4[k][WIDTH]}};
                assign of_pixel_5_w[k]={WIDTH{of_pixel_5[k][WIDTH]}};
                assign of_pixel_6_w[k]={WIDTH{of_pixel_6[k][WIDTH]}};
                assign of_pixel_7_w[k]={WIDTH{of_pixel_7[k][WIDTH]}};
                assign of_pixel_8_w[k]={WIDTH{of_pixel_8[k][WIDTH]}};
                assign of_pixel_9_w[k]={WIDTH{of_pixel_9[k][WIDTH]}};
                assign of_pixel_10_w[k]={WIDTH{of_pixel_10[k][WIDTH]}};
			end
		endgenerate	





wire [(WIDTH-1):0] median_data_w= (of_pixel_0_w[0] & of_pixel_0[0][(WIDTH-1):0])|(of_pixel_0_w[1] & of_pixel_0[1][(WIDTH-1):0])|(of_pixel_0_w[2] & of_pixel_0[2][(WIDTH-1):0])|(of_pixel_0_w[3] & of_pixel_0[3][(WIDTH-1):0])|(of_pixel_0_w[4] & of_pixel_0[4][(WIDTH-1):0])|(of_pixel_0_w[5] & of_pixel_0[5][(WIDTH-1):0])|(of_pixel_0_w[6] & of_pixel_0[6][(WIDTH-1):0])|(of_pixel_0_w[7] & of_pixel_0[7][(WIDTH-1):0])|(of_pixel_0_w[8] & of_pixel_0[8][(WIDTH-1):0])|(of_pixel_0_w[9] & of_pixel_0[9][(WIDTH-1):0])|(of_pixel_0_w[10] & of_pixel_0[10][(WIDTH-1):0])|
						  (of_pixel_1_w[0] & of_pixel_1[0][(WIDTH-1):0])|(of_pixel_1_w[1] & of_pixel_1[1][(WIDTH-1):0])|(of_pixel_1_w[2] & of_pixel_1[2][(WIDTH-1):0])|(of_pixel_1_w[3] & of_pixel_1[3][(WIDTH-1):0])|(of_pixel_1_w[4] & of_pixel_1[4][(WIDTH-1):0])|(of_pixel_1_w[5] & of_pixel_1[5][(WIDTH-1):0])|(of_pixel_1_w[6] & of_pixel_1[6][(WIDTH-1):0])|(of_pixel_1_w[7] & of_pixel_1[7][(WIDTH-1):0])|(of_pixel_1_w[8] & of_pixel_1[8][(WIDTH-1):0])|(of_pixel_1_w[9] & of_pixel_1[9][(WIDTH-1):0])|(of_pixel_1_w[10] & of_pixel_1[10][(WIDTH-1):0])|
						  (of_pixel_2_w[0] & of_pixel_2[0][(WIDTH-1):0])|(of_pixel_2_w[1] & of_pixel_2[1][(WIDTH-1):0])|(of_pixel_2_w[2] & of_pixel_2[2][(WIDTH-1):0])|(of_pixel_2_w[3] & of_pixel_2[3][(WIDTH-1):0])|(of_pixel_2_w[4] & of_pixel_2[4][(WIDTH-1):0])|(of_pixel_2_w[5] & of_pixel_2[5][(WIDTH-1):0])|(of_pixel_2_w[6] & of_pixel_2[6][(WIDTH-1):0])|(of_pixel_2_w[7] & of_pixel_2[7][(WIDTH-1):0])|(of_pixel_2_w[8] & of_pixel_2[8][(WIDTH-1):0])|(of_pixel_2_w[9] & of_pixel_2[9][(WIDTH-1):0])|(of_pixel_2_w[10] & of_pixel_2[10][(WIDTH-1):0])|
						  (of_pixel_3_w[0] & of_pixel_3[0][(WIDTH-1):0])|(of_pixel_3_w[1] & of_pixel_3[1][(WIDTH-1):0])|(of_pixel_3_w[2] & of_pixel_3[2][(WIDTH-1):0])|(of_pixel_3_w[3] & of_pixel_3[3][(WIDTH-1):0])|(of_pixel_3_w[4] & of_pixel_3[4][(WIDTH-1):0])|(of_pixel_3_w[5] & of_pixel_3[5][(WIDTH-1):0])|(of_pixel_3_w[6] & of_pixel_3[6][(WIDTH-1):0])|(of_pixel_3_w[7] & of_pixel_3[7][(WIDTH-1):0])|(of_pixel_3_w[8] & of_pixel_3[8][(WIDTH-1):0])|(of_pixel_3_w[9] & of_pixel_3[9][(WIDTH-1):0])|(of_pixel_3_w[10] & of_pixel_3[10][(WIDTH-1):0])|
						  (of_pixel_4_w[0] & of_pixel_4[0][(WIDTH-1):0])|(of_pixel_4_w[1] & of_pixel_4[1][(WIDTH-1):0])|(of_pixel_4_w[2] & of_pixel_4[2][(WIDTH-1):0])|(of_pixel_4_w[3] & of_pixel_4[3][(WIDTH-1):0])|(of_pixel_4_w[4] & of_pixel_4[4][(WIDTH-1):0])|(of_pixel_4_w[5] & of_pixel_4[5][(WIDTH-1):0])|(of_pixel_4_w[6] & of_pixel_4[6][(WIDTH-1):0])|(of_pixel_4_w[7] & of_pixel_4[7][(WIDTH-1):0])|(of_pixel_4_w[8] & of_pixel_4[8][(WIDTH-1):0])|(of_pixel_4_w[9] & of_pixel_4[9][(WIDTH-1):0])|(of_pixel_4_w[10] & of_pixel_4[10][(WIDTH-1):0])|
						  (of_pixel_5_w[0] & of_pixel_5[0][(WIDTH-1):0])|(of_pixel_5_w[1] & of_pixel_5[1][(WIDTH-1):0])|(of_pixel_5_w[2] & of_pixel_5[2][(WIDTH-1):0])|(of_pixel_5_w[3] & of_pixel_5[3][(WIDTH-1):0])|(of_pixel_5_w[4] & of_pixel_5[4][(WIDTH-1):0])|(of_pixel_5_w[5] & of_pixel_5[5][(WIDTH-1):0])|(of_pixel_5_w[6] & of_pixel_5[6][(WIDTH-1):0])|(of_pixel_5_w[7] & of_pixel_5[7][(WIDTH-1):0])|(of_pixel_5_w[8] & of_pixel_5[8][(WIDTH-1):0])|(of_pixel_5_w[9] & of_pixel_5[9][(WIDTH-1):0])|(of_pixel_5_w[10] & of_pixel_5[10][(WIDTH-1):0])|
						  (of_pixel_6_w[0] & of_pixel_6[0][(WIDTH-1):0])|(of_pixel_6_w[1] & of_pixel_6[1][(WIDTH-1):0])|(of_pixel_6_w[2] & of_pixel_6[2][(WIDTH-1):0])|(of_pixel_6_w[3] & of_pixel_6[3][(WIDTH-1):0])|(of_pixel_6_w[4] & of_pixel_6[4][(WIDTH-1):0])|(of_pixel_6_w[5] & of_pixel_6[5][(WIDTH-1):0])|(of_pixel_6_w[6] & of_pixel_6[6][(WIDTH-1):0])|(of_pixel_6_w[7] & of_pixel_6[7][(WIDTH-1):0])|(of_pixel_6_w[8] & of_pixel_6[8][(WIDTH-1):0])|(of_pixel_6_w[9] & of_pixel_6[9][(WIDTH-1):0])|(of_pixel_6_w[10] & of_pixel_6[10][(WIDTH-1):0])|
						  (of_pixel_7_w[0] & of_pixel_7[0][(WIDTH-1):0])|(of_pixel_7_w[1] & of_pixel_7[1][(WIDTH-1):0])|(of_pixel_7_w[2] & of_pixel_7[2][(WIDTH-1):0])|(of_pixel_7_w[3] & of_pixel_7[3][(WIDTH-1):0])|(of_pixel_7_w[4] & of_pixel_7[4][(WIDTH-1):0])|(of_pixel_7_w[5] & of_pixel_7[5][(WIDTH-1):0])|(of_pixel_7_w[6] & of_pixel_7[6][(WIDTH-1):0])|(of_pixel_7_w[7] & of_pixel_7[7][(WIDTH-1):0])|(of_pixel_7_w[8] & of_pixel_7[8][(WIDTH-1):0])|(of_pixel_7_w[9] & of_pixel_7[9][(WIDTH-1):0])|(of_pixel_7_w[10] & of_pixel_7[10][(WIDTH-1):0])|
						  (of_pixel_8_w[0] & of_pixel_8[0][(WIDTH-1):0])|(of_pixel_8_w[1] & of_pixel_8[1][(WIDTH-1):0])|(of_pixel_8_w[2] & of_pixel_8[2][(WIDTH-1):0])|(of_pixel_8_w[3] & of_pixel_8[3][(WIDTH-1):0])|(of_pixel_8_w[4] & of_pixel_8[4][(WIDTH-1):0])|(of_pixel_8_w[5] & of_pixel_8[5][(WIDTH-1):0])|(of_pixel_8_w[6] & of_pixel_8[6][(WIDTH-1):0])|(of_pixel_8_w[7] & of_pixel_8[7][(WIDTH-1):0])|(of_pixel_8_w[8] & of_pixel_8[8][(WIDTH-1):0])|(of_pixel_8_w[9] & of_pixel_8[9][(WIDTH-1):0])|(of_pixel_8_w[10] & of_pixel_8[10][(WIDTH-1):0])|
						  (of_pixel_9_w[0] & of_pixel_9[0][(WIDTH-1):0])|(of_pixel_9_w[1] & of_pixel_9[1][(WIDTH-1):0])|(of_pixel_9_w[2] & of_pixel_9[2][(WIDTH-1):0])|(of_pixel_9_w[3] & of_pixel_9[3][(WIDTH-1):0])|(of_pixel_9_w[4] & of_pixel_9[4][(WIDTH-1):0])|(of_pixel_9_w[5] & of_pixel_9[5][(WIDTH-1):0])|(of_pixel_9_w[6] & of_pixel_9[6][(WIDTH-1):0])|(of_pixel_9_w[7] & of_pixel_9[7][(WIDTH-1):0])|(of_pixel_9_w[8] & of_pixel_9[8][(WIDTH-1):0])|(of_pixel_9_w[9] & of_pixel_9[9][(WIDTH-1):0])|(of_pixel_9_w[10] & of_pixel_9[10][(WIDTH-1):0])|
						  (of_pixel_10_w[0] & of_pixel_10[0][(WIDTH-1):0])|(of_pixel_10_w[1] & of_pixel_10[1][(WIDTH-1):0])|(of_pixel_10_w[2] & of_pixel_10[2][(WIDTH-1):0])|(of_pixel_10_w[3] & of_pixel_10[3][(WIDTH-1):0])|(of_pixel_10_w[4] & of_pixel_10[4][(WIDTH-1):0])|(of_pixel_10_w[5] & of_pixel_10[5][(WIDTH-1):0])|(of_pixel_10_w[6] & of_pixel_10[6][(WIDTH-1):0])|(of_pixel_10_w[7] & of_pixel_10[7][(WIDTH-1):0])|(of_pixel_10_w[8] & of_pixel_10[8][(WIDTH-1):0])|(of_pixel_10_w[9] & of_pixel_10[9][(WIDTH-1):0])|(of_pixel_10_w[10] & of_pixel_10[10][(WIDTH-1):0]);
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        median_data<={WIDTH{1'b0}};
	valid <= 0;
    end
	else if (clken)begin
		median_data <= median_data_w;
		valid <= valid_m[WIDTH-2];
	end
	else begin
		median_data <= median_data;
		valid <= valid;
	end
end

endmodule
