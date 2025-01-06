/*
 * @Author: xxx
 * @Date: xxx 
 * @Last Modified by:   KeLi 
 * @Last Modified time: 2022-08-17 15:47:29 
 */
module MedianFilter(
	input  clk,
	input  rst,
	input  clken,
	input  enable,
    input  [10:0] width,
    input  valid_final_hole,
    input  [8:0] disp_hole,
    input  [89:0] Q_MedianFilterRam_2,
    output [89:0] D_MedianFilterRam_1,
    output wr_en_Med_inst1,
    output rd_en_Med_inst1,
    output [89:0] BWEB_Med_inst1,
    output [10:0] wr_addr_Med_inst1,
    output [10:0] rd_addr_Med_inst1,
    output [8:0] disp,
	output valid_final,
    output flag
);


	wire   clken0 = enable | clken;
    result_test result_test_inst(
        .clk(clk),
        .reset(rst),
        .start(enable),
        .result(disp[6:0]),
        .flag(flag)
    );
    
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
    wire valid_Med1_inst1;
    wire valid_Med2_inst1;
    wire valid_Med3_inst1;
    wire valid_Med4_inst1;
    wire valid_Med5_inst1;
    wire valid_Med6_inst1;
    wire valid_Med7_inst1;
    wire valid_Med8_inst1;
    wire valid_Med9_inst1;
    wire valid_Med10_inst1;

   

    wire [8:0] BWEB_Med_inst1_1;
    wire [8:0] BWEB_Med_inst1_2;
    wire [8:0] BWEB_Med_inst1_3;
    wire [8:0] BWEB_Med_inst1_4;
    wire [8:0] BWEB_Med_inst1_5;
    wire [8:0] BWEB_Med_inst1_6;
    wire [8:0] BWEB_Med_inst1_7;
    wire [8:0] BWEB_Med_inst1_8;
    wire [8:0] BWEB_Med_inst1_9;
    wire [8:0] BWEB_Med_inst1_10;


    assign wr_en_Med_inst1= wr_en_Med1_inst1;

    assign BWEB_Med_inst1_1  = wr_en_Med1_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_2  = wr_en_Med2_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_3  = wr_en_Med3_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_4  = wr_en_Med4_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_5  = wr_en_Med5_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_6  = wr_en_Med6_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_7  = wr_en_Med7_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_8  = wr_en_Med8_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_9  = wr_en_Med9_inst1 ?9'b111111111:9'd0;
    assign BWEB_Med_inst1_10 = wr_en_Med10_inst1?9'b111111111:9'd0;
    
    assign BWEB_Med_inst1={BWEB_Med_inst1_1,BWEB_Med_inst1_2,BWEB_Med_inst1_3,BWEB_Med_inst1_4,BWEB_Med_inst1_5,BWEB_Med_inst1_6,BWEB_Med_inst1_7,BWEB_Med_inst1_8,BWEB_Med_inst1_9,BWEB_Med_inst1_10};
    
   
    wire [8:0] D_med_80_72 = valid_Med1_inst1 ? Q_MedianFilterRam_2[89:81]:9'd0;
    wire [8:0] D_med_71_63 = valid_Med2_inst1 ? Q_MedianFilterRam_2[80:72]:9'd0;
    wire [8:0] D_med_62_54 = valid_Med3_inst1 ? Q_MedianFilterRam_2[71:63]:9'd0;
    wire [8:0] D_med_53_45 = valid_Med4_inst1 ? Q_MedianFilterRam_2[62:54]:9'd0;
    wire [8:0] D_med_44_36 = valid_Med5_inst1 ? Q_MedianFilterRam_2[53:45]:9'd0;
    wire [8:0] D_med_35_27 = valid_Med6_inst1 ? Q_MedianFilterRam_2[44:36]:9'd0;
    wire [8:0] D_med_26_18 = valid_Med7_inst1 ? Q_MedianFilterRam_2[35:27]:9'd0;
    wire [8:0] D_med_17_9  = valid_Med8_inst1 ? Q_MedianFilterRam_2[26:18]:9'd0;
    wire [8:0] D_med_8_0   = valid_Med9_inst1 ? Q_MedianFilterRam_2[17:9] :9'd0;
    
    assign D_MedianFilterRam_1={disp_hole,D_med_80_72,D_med_71_63,D_med_62_54,D_med_53_45,D_med_44_36,
    D_med_35_27,D_med_26_18,D_med_17_9 ,D_med_8_0};

    SRAM_control_MedianFilter#(90,11) Medcontrol_inst1(
        .clk(clk),
        .rst(rst),
        .clken(clken0 & valid_final_hole),
        .width(width),

        .en2(clken0 & valid_Med1_inst1),
        .en3(clken0 & valid_Med2_inst1),
        .en4(clken0 & valid_Med3_inst1),
        .en5(clken0 & valid_Med4_inst1),
        .en6(clken0 & valid_Med5_inst1),
        .en7(clken0 & valid_Med6_inst1),
        .en8(clken0 & valid_Med7_inst1),
        .en9(clken0 & valid_Med8_inst1),
        .en10(clken0 & valid_Med9_inst1),
 
 
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
 
        .valid_1(valid_Med1_inst1),
        .valid_2(valid_Med2_inst1),
        .valid_3(valid_Med3_inst1),
        .valid_4(valid_Med4_inst1),
        .valid_5(valid_Med5_inst1),
        .valid_6(valid_Med6_inst1),
        .valid_7(valid_Med7_inst1),
        .valid_8(valid_Med8_inst1),
        .valid_9(valid_Med9_inst1),
        .valid_10(valid_Med10_inst1)
   ); 

 	wire [8:0] pixel0;
   	wire [8:0] pixel1;
   	wire [8:0] pixel2;
   	wire [8:0] pixel3;
   	wire [8:0] pixel4;
   	wire [8:0] pixel5;
   	wire [8:0] pixel6;
   	wire [8:0] pixel7;
   	wire [8:0] pixel8;
   	wire [8:0] pixel9;
   	wire [8:0] pixel10;

    //@dpc
   	assign pixel0 =disp_hole;
	assign pixel1 =valid_Med1_inst1 ?Q_MedianFilterRam_2[89:81]:9'd0;
   	assign pixel2 =valid_Med2_inst1 ?Q_MedianFilterRam_2[80:72]:9'd0;
   	assign pixel3 =valid_Med3_inst1 ?Q_MedianFilterRam_2[71:63]:9'd0;
   	assign pixel4 =valid_Med4_inst1 ?Q_MedianFilterRam_2[62:54]:9'd0;
   	assign pixel5 =valid_Med5_inst1 ?Q_MedianFilterRam_2[53:45]:9'd0;
   	assign pixel6 =valid_Med6_inst1 ?Q_MedianFilterRam_2[44:36]:9'd0;
   	assign pixel7 =valid_Med7_inst1 ?Q_MedianFilterRam_2[35:27]:9'd0;
   	assign pixel8 =valid_Med8_inst1 ?Q_MedianFilterRam_2[26:18]:9'd0;
   	assign pixel9 =valid_Med9_inst1 ?Q_MedianFilterRam_2[17:9] :9'd0;
   	assign pixel10=valid_Med10_inst1?Q_MedianFilterRam_2[8:0]  :9'd0;

median_filter  u_median_filter (
    .clk(clk),
    .rst(rst),
    .clken(valid_Med5_inst1 & clken0),
    //SRAM of median filter
    .pixel0(pixel0),
    .pixel1(pixel1),
    .pixel2(pixel2),
    .pixel3(pixel3),
    .pixel4(pixel4),
    .pixel5(pixel5),
    .pixel6(pixel6),
    .pixel7(pixel7),
    .pixel8(pixel8),
    .pixel9(pixel9),
    .pixel10(pixel10),
    //
    .median_data(disp),
    .valid(valid_final)
);

endmodule
