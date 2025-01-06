module PostProcessing_Top(
    clk, 
    rst, 
    clken,
    width, 
    enable, 
    valid_final_L,
    valid_final_R, 
    disp_L, 
    disp_R, 
    disp_hole, 
    valid_final_hole, 
    range
);
    parameter DWIDTH = 9; 
    parameter AWIDTH = 11;
    
    
    input  clk;
    input  rst;
    input  clken;
    input  [10:0] width;
    input  enable;
    input  [8:0] range;
   
    input  valid_final_L;
    input  valid_final_R;
    input  [DWIDTH-1:0] disp_L;
    input  [DWIDTH-1:0] disp_R;
    output [DWIDTH-1:0] disp_hole;
    output valid_final_hole;
/******************************************************************/
/************************Left-Right Check**************************/
/******************************************************************/
	wire [10:0] wr_addr_lrc_R;
	wire [10:0] wr_addr_lrc_L;
	wire [10:0] rd_addr_lrc_R;
	wire [10:0] rd_addr_lrc_L;
	wire wr_en_lrc;
	wire rd_en_lrc;
    wire [DWIDTH:0] q_L_temp;
    wire [DWIDTH:0] q_R_temp;
    wire [DWIDTH-1:0] q_L = q_L_temp[DWIDTH-1:0];
	wire [DWIDTH-1:0] q_R = q_R_temp[DWIDTH-1:0]; 
 //   sliced_sram#(10,512,9,1,10) SRAM_lrc_R(
 //       .AA(wr_addr_lrc_R),
 //       .DA({1'd0,disp_R}),
 //       .BWEBA({{1'b1,1'b1},{DWIDTH{wr_en_lrc}}}),
 //       .WEBA(wr_en_lrc),
 //       .CLK(clk),
 //       .RST(rst),
 //       .AB(rd_addr_lrc_R),
 //       .WEBB(1'b1),
 //       .QB(q_R_temp)
 //   );
    
    sram_512x10_dp_bit_en LRC_R_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_lrc_R[8:0]),
        .din_a({1'b0,disp_R}),
        .ce_a(1'b0),
        .wr_en_a(wr_en_lrc),
        .bit_en_a({10{wr_en_lrc}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_lrc_R[8:0]),
        .din_b(10'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(10'd0),
        .dout_b(q_R_temp)
    );

    // UHDDP_512x10 SRAM_lrc_R(
    //     .RTSEL(2'b00),
    //     .WTSEL(2'b00),
    //     .PTSEL(2'b00),
    //     .AA(wr_addr_lrc_R),
    //     .DA({2'd0,disp_R}),
    //     .BWEBA({{1'b1,1'b1},{DWIDTH{wr_en_lrc}}}),
    //     .WEBA(wr_en_lrc),
    //     .CEBA(1'b0),
    //     .CLK(clk),
    //     .AB(rd_addr_lrc_R),
    //     .DB(10'b0),
    //     .BWEBB(10'd1023),
    //     .WEBB(1'b1),
    //     .CEBB(1'b0),
    //     .QA(),
    //     .QB(q_R_temp)
    // );  
//    sliced_sram#(10,512,9,1,10) SRAM_lrc_L(
//        .AA(wr_addr_lrc_L),
//        .DA({1'd0,disp_L}),
//        .BWEBA({{1'b1,1'b1},{DWIDTH{wr_en_lrc}}}),
//        .WEBA(wr_en_lrc),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_lrc_L),
//        .WEBB(1'b1),
//        .QB(q_L_temp)
//    );
     sram_512x10_dp_bit_en LRC_L_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_lrc_L[8:0]),
        .din_a({1'b0,disp_L}),
        .ce_a(1'b0),
        .wr_en_a(wr_en_lrc),
        .bit_en_a({10{wr_en_lrc}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_lrc_L[8:0]),
        .din_b(10'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(10'd0),
        .dout_b(q_L_temp)
    );


    // UHDDP_512x10 SRAM_lrc_L(
    //     .RTSEL(2'b00),
    //     .WTSEL(2'b00),
    //     .PTSEL(2'b00),
    //     .AA(wr_addr_lrc_L),
    //     .DA({2'd0,disp_L}),
    //     .BWEBA({{1'b1,1'b1},{DWIDTH{wr_en_lrc}}}),
    //     .WEBA(wr_en_lrc),
    //     .CEBA(1'b0),
    //     .CLK(clk),
    //     .AB(rd_addr_lrc_L),
    //     .DB(10'b0),
    //     .BWEBB(10'd1023),
    //     .WEBB(1'b1),
    //     .CEBB(1'b0),
    //     .QA(),
    //     .QB(q_L_temp)
    // );  


/******************************************************************/
/**************************Hole Filling****************************/
/******************************************************************/
	wire [10:0] wr_addr_hole_L;
	wire [10:0] rd_addr_hole_L;
	wire wr_en_hole_L;
	wire rd_en_hole_L;
	wire [10:0] wr_addr_hole_R;
	wire [10:0] rd_addr_hole_R;
	wire wr_en_hole_R;
	wire rd_en_hole_R;
	wire [DWIDTH-1:0] valid2_dout;


/******************************************************************/
/**************************PostProcessing****************************/
/******************************************************************/
PostProcessing#(DWIDTH,AWIDTH) PostProcessing_inst(
    .clk(clk),
    .rst(rst),
    .clken(clken),
    .width(width),
    .enable(enable),
    .valid_final_L(valid_final_L),
    .valid_final_R(valid_final_R),
	.range(range),
	.q_L(q_L),
	.q_R(q_R), 
  //left right check
	.wr_addr_lrc_R(wr_addr_lrc_R),
	.wr_addr_lrc_L(wr_addr_lrc_L),
	.rd_addr_lrc_R(rd_addr_lrc_R),
	.rd_addr_lrc_L(rd_addr_lrc_L),
	.wr_en_lrc(wr_en_lrc),
	.rd_en_lrc(rd_en_lrc),
	
	//hole filling
	.wr_en_hole_L(wr_en_hole_L),
	.rd_en_hole_L(rd_en_hole_L),
	.wr_addr_hole_L(wr_addr_hole_L),
	.rd_addr_hole_L(rd_addr_hole_L), 
	.wr_en_hole_R(wr_en_hole_R),
	.rd_en_hole_R(rd_en_hole_R),
	.wr_addr_hole_R(wr_addr_hole_R),
	.rd_addr_hole_R(rd_addr_hole_R), 
	.valid_hole(disp_hole),
  .valid_final_hole(valid_final_hole)
);

endmodule
