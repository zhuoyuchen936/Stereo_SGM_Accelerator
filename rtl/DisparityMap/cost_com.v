/*
 * @Author: DongPingCheng 
 * @Date: 2022-08-08 11:49:07 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 17:30:28
 */
 module cost_com(
	input sys_clk,
	input sys_rst,
	input clken,
	
	input [7:0] taps0x_L,
	input [7:0] taps1x_L,
	input [7:0] taps2x_L,
    input [7:0] taps3x_L,
    input [7:0] taps4x_L,

    input [10:0] width,

	input [7:0] taps0x_R,
	input [7:0] taps1x_R,
	input [7:0] taps2x_R,
    input [7:0] taps3x_R,
    input [7:0] taps4x_R,


	output [7:0] lb0_pixel6_L,
	output [7:0] lb1_pixel6_L,
    output [7:0] lb2_pixel6_L,
    output [7:0] lb3_pixel6_L,



	output [1023:0] Hamming_R,
	output [1023:0] Hamming_L,
    output [3071:0] cost_grad_R,
    output [3071:0] cost_grad_L,

	output reg valid
);


		
wire en_L;
wire [2039:0] lb0_pixel_L;
wire [2039:0] lb1_pixel_L;
wire [2039:0] lb2_pixel_L;
wire [2039:0] lb3_pixel_L;


assign lb0_pixel6_L = lb0_pixel_L[7:0];
assign lb1_pixel6_L = lb1_pixel_L[7:0];
assign lb2_pixel6_L = lb2_pixel_L[7:0];
assign lb3_pixel6_L = lb3_pixel_L[7:0];

wire [2837:0]lb0_Ix_R,lb1_Ix_R,lb2_Ix_R;
wire [2837:0]lb0_Iy_R,lb1_Iy_R,lb2_Iy_R;
wire [2837:0]lb0_Ig_R,lb1_Ig_R,lb2_Ig_R;

wire [2837:0]lb0_Ix_L,lb1_Ix_L,lb2_Ix_L;
wire [2837:0]lb0_Iy_L,lb1_Iy_L,lb2_Iy_L;
wire [2837:0]lb0_Ig_L,lb1_Ig_L,lb2_Ig_L;

wire [23:0]lb0_pixel_s_R,lb1_pixel_s_R,lb2_pixel_s_R,lb3_pixel_s_R,lb4_pixel_s_R;
wire [23:0]lb0_pixel_s_L,lb1_pixel_s_L,lb2_pixel_s_L,lb3_pixel_s_L,lb4_pixel_s_L;

wire [10:0]lb0_Ix_pixel_R,lb1_Ix_pixel_R,lb2_Ix_pixel_R;
wire [10:0]lb0_Iy_pixel_R,lb1_Iy_pixel_R,lb2_Iy_pixel_R;
wire [10:0]lb0_Ig_pixel_R,lb1_Ig_pixel_R,lb2_Ig_pixel_R;
wire [10:0]lb0_Ix_pixel_L,lb1_Ix_pixel_L,lb2_Ix_pixel_L;
wire [10:0]lb0_Iy_pixel_L,lb1_Iy_pixel_L,lb2_Iy_pixel_L;
wire [10:0]lb0_Ig_pixel_L,lb1_Ig_pixel_L,lb2_Ig_pixel_L;
//
wire en_grad;
window_5x3 u_window_5x3_R (
    .clock(sys_clk),
    .clken(clken),
    .rst(sys_rst),
    .width(width),
    .linebuffer0(taps0x_R),
    .linebuffer1(taps1x_R),
    .linebuffer2(taps2x_R),
    .linebuffer3(taps3x_R),
    .linebuffer4(taps4x_R),

    .lb0_pixel(lb0_pixel_s_R),
    .lb1_pixel(lb1_pixel_s_R),
    .lb2_pixel(lb2_pixel_s_R),
    .lb3_pixel(lb3_pixel_s_R),
    .lb4_pixel(lb4_pixel_s_R),

    .en(en_grad)
);
window_5x3 u_window_5x3_L (
    .clock(sys_clk),
    .clken(clken),
    .rst(sys_rst),
    .width(width),
    .linebuffer0(taps0x_L),
    .linebuffer1(taps1x_L),
    .linebuffer2(taps2x_L),
    .linebuffer3(taps3x_L),
    .linebuffer4(taps4x_L),

    .lb0_pixel(lb0_pixel_s_L),
    .lb1_pixel(lb1_pixel_s_L),
    .lb2_pixel(lb2_pixel_s_L),
    .lb3_pixel(lb3_pixel_s_L),
    .lb4_pixel(lb4_pixel_s_L),

    .en()
);
//
grad_com grad_com_R0 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb0_pixel_s_R),
	.line1(lb1_pixel_s_R),
	.line2(lb2_pixel_s_R),
    .Ix(lb0_Ix_pixel_R),
    .Iy(lb0_Iy_pixel_R),
    .Ig(lb0_Ig_pixel_R)
);
grad_com grad_com_R1 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb1_pixel_s_R),
	.line1(lb2_pixel_s_R),
	.line2(lb3_pixel_s_R),
    .Ix(lb1_Ix_pixel_R),
    .Iy(lb1_Iy_pixel_R),
    .Ig(lb1_Ig_pixel_R)
);
grad_com grad_com_R2 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb2_pixel_s_R),
	.line1(lb3_pixel_s_R),
	.line2(lb4_pixel_s_R),
    .Ix(lb2_Ix_pixel_R),
    .Iy(lb2_Iy_pixel_R),
    .Ig(lb2_Ig_pixel_R)
);
//
grad_com grad_com_L0 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb0_pixel_s_L),
	.line1(lb1_pixel_s_L),
	.line2(lb2_pixel_s_L),
    .Ix(lb0_Ix_pixel_L),
    .Iy(lb0_Iy_pixel_L),
    .Ig(lb0_Ig_pixel_L)
);
grad_com grad_com_L1 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb1_pixel_s_L),
	.line1(lb2_pixel_s_L),
	.line2(lb3_pixel_s_L),
    .Ix(lb1_Ix_pixel_L),
    .Iy(lb1_Iy_pixel_L),
    .Ig(lb1_Ig_pixel_L)
);
grad_com grad_com_L2 (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken&en_grad),
    .line0(lb2_pixel_s_L),
	.line1(lb3_pixel_s_L),
	.line2(lb4_pixel_s_L),
    .Ix(lb2_Ix_pixel_L),
    .Iy(lb2_Iy_pixel_L),
    .Ig(lb2_Ig_pixel_L)
);

//grad buffer

window_xy_R#(11) u_window_Ixy_R3(
	.clock(sys_clk),
	.clken(clken&en_grad),
	.rst(sys_rst),
	.linebuffer0(lb1_Ix_pixel_R),
	.linebuffer1(lb1_Iy_pixel_R),
	
	.lb0_pixel(lb1_Ix_R),
	.lb1_pixel(lb1_Iy_R)

);

window_grad_R#(11) u_window_Ig_R3(
	.clock(sys_clk),
	.clken(clken&en_grad),
	.rst(sys_rst),
	.linebuffer0(lb0_Ig_pixel_R),
	.linebuffer1(lb1_Ig_pixel_R),
	.linebuffer2(lb2_Ig_pixel_R),
	
	.lb0_pixel(lb0_Ig_R),
	.lb1_pixel(lb1_Ig_R),
	.lb2_pixel(lb2_Ig_R)

);
window_xy_L#(11) u_window_Ixy_L3(
	.clock(sys_clk),
	.clken(clken&en_grad),
	.rst(sys_rst),
	.linebuffer0(lb1_Ix_pixel_L),
	.linebuffer1(lb1_Iy_pixel_L),
	
	.lb0_pixel(lb1_Ix_L),
	.lb1_pixel(lb1_Iy_L)

);

window_grad_L#(11) u_window_Ig_L3(
	.clock(sys_clk),
	.clken(clken&en_grad),
	.rst(sys_rst),
	.linebuffer0(lb0_Ig_pixel_L),
	.linebuffer1(lb1_Ig_pixel_L),
	.linebuffer2(lb2_Ig_pixel_L),
	
	.lb0_pixel(lb0_Ig_L),
	.lb1_pixel(lb1_Ig_L),
	.lb2_pixel(lb2_Ig_L)

);
//放的是右数据
// window_R3#(8) u_window_R3(
// 	.clock(sys_clk),
// 	.clken(clken&en_grad),
// 	.rst(sys_rst),
//     .width(width),
// 	.linebuffer0(taps1x_L),
// 	.linebuffer1(taps2x_L),
// 	.linebuffer2(taps3x_L),
	
// 	.lb0_pixel(lb0_pixel_R),
// 	.lb1_pixel(lb1_pixel_R),
// 	.lb2_pixel(lb2_pixel_R),

// 	.en(en)
// );
//放的是左数据
window_L5#(8) u_window_L5(
	.clock(sys_clk),
	.clken(clken),
	.rst(sys_rst),
    .width(width),
	.linebuffer0(taps0x_L),
	.linebuffer1(taps1x_L),
	.linebuffer2(taps2x_L),
    .linebuffer3(taps3x_L),
	
	.lb0_pixel(lb0_pixel_L),
	.lb1_pixel(lb1_pixel_L),
	.lb2_pixel(lb2_pixel_L),
    .lb3_pixel(lb3_pixel_L),

	.en(en_L)
);
//用于计数
reg [31:0] i;
reg en;
always @(posedge sys_clk or negedge sys_rst) begin
    if(!sys_rst)begin
        en<=1'd0;
        i<=0;
    end 
    else if(clken)begin
        if(i>=5*width+1)begin
            i<=5*width+1;
        end
        else begin
            i<=i+1;
        end
    if(i>=5*width+1)begin
            en<=1'b1;
        end
    end
end
//gradient cost com
cost_grad_com u_cost_grad_com_R (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken),
    .Ix_R(lb1_Ix_R[21:11]),
    .Iy_R(lb1_Iy_R[21:11]),
    .Ix_L(lb1_Ix_L[2826:11]),
    .Iy_L(lb1_Iy_L[2826:11]),
    .cost_grad(cost_grad_R)
);
cost_grad_com u_cost_grad_com_L (
    .clk(sys_clk),
    .rst(sys_rst),
    .clken(clken),
    .Ix_R(lb1_Ix_L[21:11]),
    .Iy_R(lb1_Iy_L[21:11]),
    .Ix_L(lb1_Ix_R[2826:11]),
    .Iy_L(lb1_Iy_R[2826:11]),
    .cost_grad(cost_grad_L)
);

//右边数据为基准 data_R 9个数据 ，data_L 256个窗口
census_hamming0 u_census_hamming_R(

.data_1(lb0_Ig_R[10:0]),
.data_2(lb0_Ig_R[21:11]),
.data_3(lb0_Ig_R[32:22]),


.data_4(lb1_Ig_R[10:0]),
.data_5(lb1_Ig_R[21:11]),
.data_6(lb1_Ig_R[32:22]),


.data_7(lb2_Ig_R[10:0]),
.data_8(lb2_Ig_R[21:11]),
.data_9(lb2_Ig_R[32:22]),


.data_compared_0(lb0_Ig_L),
.data_compared_1(lb1_Ig_L),
.data_compared_2(lb2_Ig_L),


.en(en&clken),
.rst(sys_rst),

.Hamming_data(Hamming_R)

	
);

//左边数据为基准 data_L 用window_R hamming比较数据用window_L
census_hamming0 u_census_hamming_L(

.data_1(lb0_Ig_L[10:0]),
.data_2(lb0_Ig_L[21:11]),
.data_3(lb0_Ig_L[32:22]),


.data_4(lb1_Ig_L[10:0]),
.data_5(lb1_Ig_L[21:11]),
.data_6(lb1_Ig_L[32:22]),


.data_7(lb2_Ig_L[10:0]),
.data_8(lb2_Ig_L[21:11]),
.data_9(lb2_Ig_L[32:22]),

.data_compared_0(lb0_Ig_R),
.data_compared_1(lb1_Ig_R),
.data_compared_2(lb2_Ig_R),

.en(en&clken),
.rst(sys_rst),
.Hamming_data(Hamming_L)

);

always@(*)begin
 if(en==1)begin
	valid=1;
 end
 else begin
	valid=0;
 end
 end
//reg[6:0]counter;
//always@(posedge sys_clk or negedge sys_rst)begin
//	if(!sys_rst)begin
//		Hamming<=4'd0;
//		counter<=7'd0;
//	end
//	else if(counter<=7'd95)begin
//		counter<=counter+1'b1;
//		Hamming<=hamming[counter];
//	end
//	else
//		counter<=7'd0;
//
//end
endmodule
