
module PostProcessing(
    clk, 
    rst,
    clken, 
    width, 
    enable, 
    valid_final_L, 
    valid_final_R, 
    q_L, 
    q_R, 
    postprocessing_sel,
    lrc_param,

    wr_addr_lrc_R, 
    wr_addr_lrc_L, 
    rd_addr_lrc_R, 
    rd_addr_lrc_L, 
    wr_en_lrc, 
    rd_en_lrc, 
    wr_addr_hole_L,
    rd_addr_hole_L, 
    wr_addr_hole_R, 
    wr_en_hole_L, 
    rd_en_hole_L, 
    rd_addr_hole_R, 
    wr_en_hole_R, 
    rd_en_hole_R, 
    valid_hole, 
        
    disp_lrc,
    valid_final_lrc,
    
    valid_final_hole, 
    range 
);
    parameter DWIDTH = 16; 
    parameter AWIDTH = 11; 
    input  clk;
    input  rst;
    input  clken;
	input  [10:0] width;
    input  enable;
    input  valid_final_L;
    input  valid_final_R;
    input  [DWIDTH-1:0] q_L;
	input  [DWIDTH-1:0] q_R;
	input  [8:0] range;
    input postprocessing_sel;
    input [3:0]lrc_param;

    output [10:0] wr_addr_lrc_R;
	output [10:0] wr_addr_lrc_L;
	output [10:0] rd_addr_lrc_R;
	output [10:0] rd_addr_lrc_L;
	output wr_en_lrc;
	output rd_en_lrc;
	
	//hole filling
	output [10:0] wr_addr_hole_L;
	output [10:0] rd_addr_hole_L;
	output wr_en_hole_L;
	output rd_en_hole_L;
	//output [7:0] valid1_dout;
	//input  [7:0] stack_L_dout;
	
	output [10:0] wr_addr_hole_R;
	output [10:0] rd_addr_hole_R;
	output wr_en_hole_R;
	output rd_en_hole_R;
	output [DWIDTH-1:0] valid_hole;
    output valid_final_hole;

    output [DWIDTH-1:0]disp_lrc;
    output valid_final_lrc;

	wire   clken0 = enable | clken;
	

	
////////////////////////////////////Post Processing/////////////////////////////
    wire [DWIDTH+1:0] disp_lrc_temp;//2 bit signal + 8 bit disparity
    //wire valid_final_lrc;
    assign disp_lrc = disp_lrc_temp[DWIDTH-1:0];
    wire [8:0] range_half;
    assign range_half={1'b0,range[8:1]};
    LR_check#(DWIDTH,AWIDTH) LR_check_inst(
		.clk(clk),
		.clken(clken0),
		.rst(rst),
		.en(valid_final_L && valid_final_R),
		.valid(valid_final_lrc),
		.range(range),
        .lrc_param(lrc_param),
		//SRAM
    	.wr_en(wr_en_lrc),
    	.rd_en(rd_en_lrc),
   		.wr_addr_R(wr_addr_lrc_R),
    	.rd_addr_R(rd_addr_lrc_R),
    	.wr_addr_L(wr_addr_lrc_L),
    	.rd_addr_L(rd_addr_lrc_L),
    	.q_R(q_R),
    	.q_L(q_L),
		//disp output
		.disp(disp_lrc_temp)
	);


wire [DWIDTH-1:0]disp_1,disp_0;
wire valid_1,valid_0;
assign valid_hole = postprocessing_sel ? disp_1:disp_0;
assign valid_final_hole = postprocessing_sel ? valid_1:valid_0;

//traditional five direction filling
	hole_filling#(DWIDTH) hole_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken0),
		// .width(width),
		.enable(valid_final_lrc && clken),
		.din(disp_lrc_temp),
		
		//SRAM of stack_L
		.wr_en_L(wr_en_hole_L),
		.rd_en_L(rd_en_hole_L),
		.wr_addr_L(wr_addr_hole_L),
		.rd_addr_L(rd_addr_hole_L), 
		//.valid1_dout(valid1_dout),
		//.stack_L_dout(stack_L_dout),
		//SRAM of stack_R
		.wr_en_R(wr_en_hole_R),
		.rd_en_R(rd_en_hole_R),
		.wr_addr_R(wr_addr_hole_R),
		.rd_addr_R(rd_addr_hole_R), 

		.disp(disp_1),
		.valid(valid_1)
	);

//new filling
integrated_window_filter#(DWIDTH,AWIDTH) integrated_window_filter_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken0),
		.width(width),
		.enable(valid_final_lrc  && clken),
		.din(disp_lrc_temp),

		//SRAM of stack_L
		.wr_en_L(wr_en_hole_L),
		.rd_en_L(rd_en_hole_L),
		.wr_addr_L(wr_addr_hole_L),
		.rd_addr_L(rd_addr_hole_L), 
		 
		//SRAM of stack_R
		.wr_en_R(wr_en_hole_R),
		.rd_en_R(rd_en_hole_R),
		.wr_addr_R(wr_addr_hole_R),
		.rd_addr_R(rd_addr_hole_R), 
		.dout(disp_0),
		.valid(valid_0)
);

endmodule
