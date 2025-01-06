/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module Window_LR_Check(
    clk, 
    rst, 
    clken,
    img_width, 
    range,
    sel_col,
    check_th,
    valid_final_L,
    valid_final_R, 
    disp_L, 
    disp_R, 
    disp_lrc, 
    valid_final_lrc 
);
    parameter WIDTH = 16; //Data width
    parameter NUM_LINE = 4; //Number of used linebuffers
	parameter AWIDTH = 11; //Address width
    parameter DISP_R_WIDTH = WIDTH*(NUM_LINE+1); //Concatenated data width
    
    input clk;
    input rst;
    input clken;
    input [10:0] img_width;
    input [8:0] range;
    input [17:0] check_th; // threshold value: 10bit integers + 8bit decimals
    input valid_final_L;
    input valid_final_R;
    input sel_col;
    input [WIDTH-1:0] disp_L;
    input [WIDTH-1:0] disp_R;
    output [WIDTH+1:0] disp_lrc; // 2 MSBs: occlusion and mismatch
    output valid_final_lrc;

    wire [DISP_R_WIDTH-1:0] col_disp_r;
    wire [DISP_R_WIDTH-1:0] col_disp_r_buf;
    wire [WIDTH-1:0] disp_l_buf;
    wire [WIDTH-1:0] disp_l_align;
    wire [AWIDTH-3:0] rd_addr_align; // Need to adjust when align buffer change
    wire [AWIDTH-3:0] rd_addr_to_colbuf; 
    wire rd_en_align;
    wire buffer_r_valid, buffer_l_valid;
    
    // Right Disp Buffer with 1x5 column data output
    Disp_R_Buffer#(WIDTH, NUM_LINE, AWIDTH) disp_r_buffer_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken && valid_final_R),
        .img_width(img_width),
        .data_in(disp_R),
        .data_out(col_disp_r),
        .valid(buffer_r_valid)
    ); 

    // Buffer 1x5 column data
    Column_Buffer#(DISP_R_WIDTH, 9, 270) column_buffer_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken && buffer_r_valid),
        .rd_addr(rd_addr_to_colbuf),
        .data_in(col_disp_r),
        .data_out(col_disp_r_buf)
    );

    // Left Disp Buffer with 1 buffed data output
    Disp_L_Buffer#(WIDTH, 2, 11) disp_l_buffer_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken && valid_final_L),
        .img_width(img_width),
        .data_in(disp_L),
        .data_out(disp_l_buf),
        .valid(buffer_l_valid)
    );

    //Align disp_L with column data
    Align_Buffer#(WIDTH, 9, 270) align_buffer_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken && buffer_l_valid),
        .range(range),
        .data_in(disp_l_buf),
        .data_out(disp_l_align),
        .rd_addr(rd_addr_align),
        .rd_en(rd_en_align)
    );

    // LR_Check_Engine 
    LR_Check_Engine#(WIDTH, DISP_R_WIDTH, 9, 270) lr_check_engine_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken),
        .img_width(img_width),
        .range(range),
        // From Align_Buffer
        .data_in_align(disp_l_align), 
        .rd_addr_align(rd_addr_align), 
        .rd_en_align(rd_en_align), 
        // To Column_Buffer
        .rd_addr_to_colbuf(rd_addr_to_colbuf), 
        // From Column_Buffer
        .data_in_col(col_disp_r_buf),
        // select column shape
        .sel_col(sel_col),
        .check_th(check_th),
        // Final Output
        .data_out(disp_lrc),
        .valid(valid_final_lrc)
    );
    
endmodule