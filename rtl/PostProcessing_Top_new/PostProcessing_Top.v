module PostProcessing_Top(
    clk, 
    rst, 
    clken,
    width,
    range,
    enable, 
    lrc_param,
    valid_final_L,
    valid_final_R, 
    disp_L, 
    disp_R,
    postprocessing_sel, 
    
    valid_lrc,
    disp_lrc,
        
    disp_hole,
    valid_final_hole 
    
);
    parameter DWIDTH = 16; 
    parameter AWIDTH = 11; 
    
    
    input  clk;
    input  rst;
    input  clken;
    input  [10:0] width;
    input  enable;
    input  [8:0] range;
    input [3:0]lrc_param;
   
    input  valid_final_L;
    input  valid_final_R;
    input  [DWIDTH-1:0] disp_L;
    input  [DWIDTH-1:0] disp_R;
    input  postprocessing_sel;
    output [DWIDTH-1:0] disp_hole;
    output valid_final_hole;

    output [DWIDTH-1:0]disp_lrc;
    output valid_lrc;
/******************************************************************/
/************************Left-Right Check**************************/
/******************************************************************/
	wire [10:0] wr_addr_lrc_R;
	wire [10:0] wr_addr_lrc_L;
	wire [10:0] rd_addr_lrc_R;
	wire [10:0] rd_addr_lrc_L;
	wire wr_en_lrc;
	wire rd_en_lrc;
    wire [DWIDTH-1:0] q_L_temp;
    wire [DWIDTH-1:0] q_R_temp;
    wire [DWIDTH-1:0] q_L = q_L_temp[DWIDTH-1:0];
	wire [DWIDTH-1:0] q_R = q_R_temp[DWIDTH-1:0]; 
//    sliced_sram#(16,512,9,1,16) SRAM_lrc_R(
//        .AA(wr_addr_lrc_R),
//        .DA(disp_R),
//        .BWEBA({DWIDTH{wr_en_lrc}}),
//        .WEBA(wr_en_lrc),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_lrc_R),
//        .WEBB(1'b1),
//        .QB(q_R_temp)
//    );
    
    sram_512x16_dp_bit_en LRC_R_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_lrc_R[8:0]),
        .din_a({disp_R}),
        .ce_a(1'b0),
        .wr_en_a(wr_en_lrc),
        .bit_en_a({16{wr_en_lrc}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_lrc_R[8:0]),
        .din_b(16'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(16'd0),
        .dout_b(q_R_temp)
    );
//    sliced_sram#(16,512,9,1,16) SRAM_lrc_L(
//        .AA(wr_addr_lrc_L),
//        .DA({1'd0,disp_L}),
//        .BWEBA({DWIDTH{wr_en_lrc}}),
//        .WEBA(wr_en_lrc),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_lrc_L),
//        .WEBB(1'b1),
//        .QB(q_L_temp)
//    );
     sram_512x16_dp_bit_en LRC_L_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_lrc_L[8:0]),
        .din_a({disp_L}),
        .ce_a(1'b0),
        .wr_en_a(wr_en_lrc),
        .bit_en_a({16{wr_en_lrc}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_lrc_L[8:0]),
        .din_b(16'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(16'd0),
        .dout_b(q_L_temp)
    );

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
    .postprocessing_sel(postprocessing_sel),
    .lrc_param(lrc_param),
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

    .disp_lrc(disp_lrc),
    .valid_final_lrc(valid_lrc),

	.valid_hole(disp_hole),
    .valid_final_hole(valid_final_hole)
  
  
);

endmodule
