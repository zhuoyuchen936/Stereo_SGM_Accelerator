module MedianFilter_Top(
     clk,
     rst,
     clken,
     width, 
     enable,
     disp_hole,
     valid_final_hole,
     disp,
     valid_final,
     flag
);

    parameter width_disp=9;

    input  clk;
    input  rst;
    input  clken;
    input  [10:0] width;
    input  enable;
    input  [8:0] disp_hole;
    input  valid_final_hole;
    output [8:0] disp;
    output valid_final;
    output flag;
/******************************************************************/
/**************************Meidan Filter***************************/
/******************************************************************/
    wire wr_en_Med_inst1;
    wire rd_en_Med_inst1;
    wire [89:0] BWEB_Med_inst1;
    wire [10:0]  wr_addr_Med_inst1;
    wire [10:0]  rd_addr_Med_inst1;

	wire [89:0] Q_MedianFilterRam_2;
	wire [89:0] D_MedianFilterRam_1;
       
//    sliced_sram#(90,1920,11,1,90) MedFilterRam(
//        .AA(wr_addr_Med_inst1),
//        .DA(D_MedianFilterRam_1),
//        .BWEBA(BWEB_Med_inst1),
//        .WEBA(wr_en_Med_inst1),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_Med_inst1),
//        .WEBB(1'b1),
//        .QB(Q_MedianFilterRam_2)
//    );
    sram_1920x90_dp_bit_en Median_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_Med_inst1),
        .din_a(D_MedianFilterRam_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Med_inst1),
        .bit_en_a(BWEB_Med_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Med_inst1),
        .din_b(90'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(90'd0),
        .dout_b(Q_MedianFilterRam_2)
    );


MedianFilter MedianFilter_inst(
	.clk(clk),
	.rst(rst),
	.clken(clken),
	.enable(enable),
    .width(width),
    //median filter
	//int
    .valid_final_hole(valid_final_hole),
    .disp_hole(disp_hole),
    .wr_en_Med_inst1(wr_en_Med_inst1),
    .rd_en_Med_inst1(rd_en_Med_inst1),
    .BWEB_Med_inst1(BWEB_Med_inst1),
    .wr_addr_Med_inst1(wr_addr_Med_inst1),
    .rd_addr_Med_inst1(rd_addr_Med_inst1),
    //data
    .Q_MedianFilterRam_2(Q_MedianFilterRam_2),
    .D_MedianFilterRam_1(D_MedianFilterRam_1),
    //final output
	.disp(disp),
	.valid_final(valid_final),
    .flag(flag)
);
endmodule
