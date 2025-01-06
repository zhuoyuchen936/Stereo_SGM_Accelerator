/*
 * @Author: xxx
 * @Date: xxx 
 * @Last Modified by:   KeLi 
 * @Last Modified time: 2022-08-17 15:47:29 
 */
module MedianFilter(
	clk,
	rst,
	clken,
	enable,
    width,
    valid_final_hole,
    window_size,
    disp_hole,
    Q_MedianFilterRam_2,
    D_MedianFilterRam_1,
    wr_en_Med_inst1,
    rd_en_Med_inst1,
    BWEB_Med_inst1,
    wr_addr_Med_inst1,
    rd_addr_Med_inst1,
    disp,
	valid_final,
    flag
);

    parameter WIDTH=9;

	input  clk;
	input  rst;
	input  clken;
	input  enable;
    input  [10:0] width;
    input  valid_final_hole;
    input  [1:0] window_size;
    input  [(WIDTH-1):0] disp_hole;
    input  [(WIDTH*10-1):0] Q_MedianFilterRam_2;
    output [(WIDTH*10-1):0] D_MedianFilterRam_1;
    output wr_en_Med_inst1;
    output rd_en_Med_inst1;
    output [(WIDTH*10-1):0] BWEB_Med_inst1;
    output [10:0] wr_addr_Med_inst1;
    output [10:0] rd_addr_Med_inst1;
    output [(WIDTH-1):0] disp;
	output valid_final;
    output flag;

	wire   clken0 = enable | clken;
       
//Control signals of median filter
//wr_en
    wire wr_en_Med1_inst1;
    wire wr_en_Med2_inst1;
    wire wr_en_Med3_inst1;
    wire wr_en_Med4_inst1;
    wire wr_en_Med5_inst1;

    wire wr_en_Med6_inst1;
    wire wr_en_Med7_inst1;
    wire wr_en_Med8_inst1;
    wire wr_en_Med9_inst1;
    wire wr_en_Med10_inst1;

       //valid
   

    wire [9:0] valid_Med_inst1;
   

    wire [WIDTH-1:0] BWEB_Med_inst1_1;
    wire [WIDTH-1:0] BWEB_Med_inst1_2;
    wire [WIDTH-1:0] BWEB_Med_inst1_3;
    wire [WIDTH-1:0] BWEB_Med_inst1_4;
    wire [WIDTH-1:0] BWEB_Med_inst1_5;
    wire [WIDTH-1:0] BWEB_Med_inst1_6;
    wire [WIDTH-1:0] BWEB_Med_inst1_7;
    wire [WIDTH-1:0] BWEB_Med_inst1_8;
    wire [WIDTH-1:0] BWEB_Med_inst1_9;
    wire [WIDTH-1:0] BWEB_Med_inst1_10;


    assign wr_en_Med_inst1= wr_en_Med1_inst1;


    assign BWEB_Med_inst1_1  = wr_en_Med1_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_2  = wr_en_Med2_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_3  = wr_en_Med3_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_4  = wr_en_Med4_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_5  = wr_en_Med5_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_6  = wr_en_Med6_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_7  = wr_en_Med7_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_8  = wr_en_Med8_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_9  = wr_en_Med9_inst1 ?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    assign BWEB_Med_inst1_10 = wr_en_Med10_inst1?{WIDTH{1'b1}}:{WIDTH{1'b0}};
    
    assign BWEB_Med_inst1={BWEB_Med_inst1_1,BWEB_Med_inst1_2,BWEB_Med_inst1_3,BWEB_Med_inst1_4,BWEB_Med_inst1_5,BWEB_Med_inst1_6,BWEB_Med_inst1_7,BWEB_Med_inst1_8,BWEB_Med_inst1_9,BWEB_Med_inst1_10};
    

   
    wire [(WIDTH-1):0] D_med[8:0];

    genvar i;
		generate for(i=1;i<10;i=i+1) begin: D_loop
				assign  D_med[i-1]=valid_Med_inst1[9-i]? Q_MedianFilterRam_2[(i*(WIDTH)+(WIDTH-1)):i*(WIDTH)]: {WIDTH{1'b0}};
			end
		endgenerate	


    
    assign D_MedianFilterRam_1={disp_hole,D_med[8],D_med[7],D_med[6],D_med[5],D_med[4],D_med[3],D_med[2],D_med[1],D_med[0]};

    SRAM_control_MedianFilter#((WIDTH*10),11) Medcontrol_inst1(
        .clk(clk),
        .rst(rst),
        .clken(clken0 & valid_final_hole),
        .width(width),

        .en2(clken0 & valid_Med_inst1[0]),
        .en3(clken0 & valid_Med_inst1[1]),
        .en4(clken0 & valid_Med_inst1[2]),
        .en5(clken0 & valid_Med_inst1[3]),
        .en6(clken0 & valid_Med_inst1[4]),
        .en7(clken0 & valid_Med_inst1[5]),
        .en8(clken0 & valid_Med_inst1[6]),
        .en9(clken0 & valid_Med_inst1[7]),
        .en10(clken0 & valid_Med_inst1[8]),
 
 
        .wr_en_1(wr_en_Med1_inst1),
        .wr_en_2(wr_en_Med2_inst1),
        .wr_en_3(wr_en_Med3_inst1),
        .wr_en_4(wr_en_Med4_inst1),
        .wr_en_5(wr_en_Med5_inst1),
        .wr_en_6(wr_en_Med6_inst1),
        .wr_en_7(wr_en_Med7_inst1),
        .wr_en_8(wr_en_Med8_inst1),
        .wr_en_9(wr_en_Med9_inst1),
        .wr_en_10(wr_en_Med10_inst1),
 
        .rd_en(rd_en_Med_inst1),
        .wr_addr(wr_addr_Med_inst1),
        .rd_addr(rd_addr_Med_inst1),
 
        .valid_1(valid_Med_inst1[0]),
        .valid_2(valid_Med_inst1[1]),
        .valid_3(valid_Med_inst1[2]),
        .valid_4(valid_Med_inst1[3]),
        .valid_5(valid_Med_inst1[4]),
        .valid_6(valid_Med_inst1[5]),
        .valid_7(valid_Med_inst1[6]),
        .valid_8(valid_Med_inst1[7]),
        .valid_9(valid_Med_inst1[8]),
        .valid_10(valid_Med_inst1[9])
   ); 


    
    wire [(WIDTH-1):0] pixel[10:0];
    //@dpc
 

    assign pixel[0]=disp_hole;
    genvar k;
		generate for(k=1;k<11;k=k+1) begin: pixel_loop
				assign  pixel[11-k]=valid_Med_inst1[10-k]? Q_MedianFilterRam_2[(k*WIDTH-1):(k-1)*WIDTH] : {WIDTH{1'b0}};
			end
		endgenerate	
median_filter#(WIDTH)  u_median_filter (
    .clk(clk),
    .rst(rst),
    .clken(valid_Med_inst1[4] & clken0),
    .window_size(window_size),
    //SRAM of median filter
    .pixel0(pixel[0]),
    .pixel1(pixel[1]),
    .pixel2(pixel[2]),
    .pixel3(pixel[3]),
    .pixel4(pixel[4]),
    .pixel5(pixel[5]),
    .pixel6(pixel[6]),
    .pixel7(pixel[7]),
    .pixel8(pixel[8]),
    .pixel9(pixel[9]),
    .pixel10(pixel[10]),
    //
    .median_data(disp),
    .valid(valid_final)
);

endmodule
