module Post_Window_Top(
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
    sel_col,
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
    input  enable;
    input  valid_final_L;
    input  valid_final_R;
    input  postprocessing_sel;
    input  sel_col; // 0: 1x3, 1: 1x5
    input  [10:0] width;
    input  [8:0] range;
    input  [17:0] lrc_param; // threshold value: 10bit integers + 8bit decimals
    input  [DWIDTH-1:0] disp_L;
    input  [DWIDTH-1:0] disp_R;
    output [DWIDTH-1:0] disp_hole;
    output [DWIDTH-1:0] disp_lrc;
    output valid_final_hole;
    output valid_lrc;

    wire [DWIDTH+1:0] disp_lrc_temp;//2 bit signal + 8 bit disparity
    wire [DWIDTH-1:0]disp_1,disp_0;
    wire valid_1,valid_0;
    assign disp_hole = postprocessing_sel ? disp_1:disp_0;
    assign valid_final_hole = postprocessing_sel ? valid_1:valid_0;
    assign disp_lrc = disp_lrc_temp[DWIDTH-1:0];

	Window_LR_Check#(DWIDTH, 4, AWIDTH) window_lrc_inst(
        .clk(clk), 
        .rst(rst), 
        .clken(clken),
        .img_width(width), 
        .range(range),
        .sel_col(sel_col),
        .check_th(lrc_param),
        .valid_final_L(valid_final_L),
        .valid_final_R(valid_final_R), 
        .disp_L(disp_L), 
        .disp_R(disp_R), 
        .disp_lrc(disp_lrc_temp), 
        .valid_final_lrc(valid_lrc) 
    );
  
    //traditional five direction filling
	hole_filling#(DWIDTH) hole_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.width(width),
		.enable(valid_lrc && clken),
		.din(disp_lrc_temp),
		//SRAM of stack_L
		.wr_en_L(),
		.rd_en_L(),
		.wr_addr_L(),
		.rd_addr_L(), 
		//SRAM of stack_R
		.wr_en_R(),
		.rd_en_R(),
		.rd_addr_R(), 
		.wr_addr_R(),
		.disp(disp_1),
		.valid(valid_1)
	);

    //new filling
    integrated_window_filter#(DWIDTH,AWIDTH) integrated_window_filter_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.width(width),
		.enable(valid_lrc && clken),
		.din(disp_lrc_temp),
		//SRAM of stack_L
		.wr_en_L(),
		.rd_en_L(),
		.wr_addr_L(),
		.rd_addr_L(), 
		//SRAM of stack_R
		.wr_en_R(),
		.rd_en_R(),
		.wr_addr_R(),
		.rd_addr_R(), 
		.dout(disp_0),
		.valid(valid_0)
    );

endmodule
