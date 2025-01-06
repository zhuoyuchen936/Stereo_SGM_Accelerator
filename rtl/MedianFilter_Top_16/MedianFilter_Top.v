module MedianFilter_Top(
     clk,
     rst,
     clken,
     width, 
     enable,
     disp_hole,
     valid_final_hole,
     window_size,
     disp,
     valid_final,
     flag
);

    parameter WIDTH=9;

    input  clk;
    input  rst;
    input  clken;
    input  [10:0] width;
    input  enable;
    input  [(WIDTH-1):0] disp_hole;
    input  valid_final_hole;
    input  [1:0] window_size;
    output [(WIDTH-1):0] disp;
    output valid_final;
    output flag;
/******************************************************************/
/**************************Meidan Filter***************************/
/******************************************************************/
    wire wr_en_Med_inst1;
    wire rd_en_Med_inst1;
    wire [(WIDTH*10-1):0] BWEB_Med_inst1;
    wire [10:0]  wr_addr_Med_inst1;
    wire [10:0]  rd_addr_Med_inst1;

	wire [(WIDTH*10-1):0] Q_MedianFilterRam_2;
	wire [(WIDTH*10-1):0] D_MedianFilterRam_1;
       
//    sliced_sram#((WIDTH*10),1920,11,1,(WIDTH*10)) MedFilterRam(
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

    sram_1920x160_dp_bit_en RAM1920x160_Median(
        .clk_a(clk),
        .addr_a(wr_addr_Med_inst1),
        .din_a(D_MedianFilterRam_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Med_inst1),
        .bit_en_a(BWEB_Med_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Med_inst1),
        .din_b(160'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(160'd0),
        .dout_b(Q_MedianFilterRam_2)
    );
 


   MedianFilter#(WIDTH) MedianFilter_inst(
	.clk(clk),
	.rst(rst),
	.clken(clken),
	.enable(enable),
    .width(width),
    //median filter
	//int
    .valid_final_hole(valid_final_hole),
    .window_size(window_size),
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
