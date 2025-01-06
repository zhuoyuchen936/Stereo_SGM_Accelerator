/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module Disp_R_Buffer(
    clk,
    rst,
    clken,
    img_width,
    data_in,
    data_out,
    valid
);
    parameter WIDTH=16; //Data width
    parameter NUM_LINE=4; //Number of used linebuffers (even only)
	parameter AWIDTH = 11; //Address width
    parameter CWIDTH = WIDTH*NUM_LINE; //Concatenated data width

    input clk;
    input rst;
    input clken;
    input [10:0] img_width;
    input [WIDTH-1:0] data_in;
    output reg [CWIDTH+WIDTH-1:0] data_out;
    output reg valid;

    wire [AWIDTH-1:0] wr_addr, rd_addr;
    wire [NUM_LINE-1:0] wr_en, valid_sram;
    wire [CWIDTH-1:0] bweb, din, dout;

    genvar i;
    generate
        for (i = 0; i < NUM_LINE; i = i + 1) begin : bit_en_loop
            assign bweb[(i+1)*WIDTH-1:i*WIDTH] = wr_en[i] ? {WIDTH{1'b1}} : {WIDTH{1'b0}};
        end
    endgenerate

    assign din[CWIDTH-1:CWIDTH-WIDTH] = data_in; // First linebuffer input
    generate
        for (i = 0; i < NUM_LINE-1; i = i + 1) begin : din_loop
            assign din[(i+1)*WIDTH-1:i*WIDTH] = valid_sram[i+1] ?
                                                dout[(i+2)*WIDTH-1:(i+1)*WIDTH] : {WIDTH{1'b0}};
        end
    endgenerate

    // right disp buffer controller
    SRAM_Controller#(CWIDTH, AWIDTH, NUM_LINE) disp_r_buffer_controller_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken),
        .width(img_width),
        .en({NUM_LINE{clken}} & valid_sram),
        .wr_en(wr_en),
        .wr_addr(wr_addr),
        .rd_addr(rd_addr),
        .valid(valid_sram)
    );

    // right disp buffer (1920x80bit dp sram)
    sram_1920x64_dp_bit_en disp_r_buffer_1920x80_inst   (
        .clk_a(clk),
        .addr_a(wr_addr),
        .din_a(din),
        .ce_a(1'b0),
        .wr_en_a(wr_en[NUM_LINE-1]),
        .bit_en_a(bweb),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr),
        .din_b({CWIDTH{1'b0}}),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b({CWIDTH{1'b0}}),
        .dout_b(dout)
    );

    // adding a pipeline stage
    wire [CWIDTH+WIDTH-1:0] data_out_5lines = {data_in, dout};
    wire [CWIDTH+WIDTH-1:0] data_out_3lines = {data_in, dout[CWIDTH-1:CWIDTH-WIDTH*2], {WIDTH*2{1'b0}}};
    wire [CWIDTH+WIDTH-1:0] data_out_temp = valid_sram[0]? data_out_5lines : data_out_3lines;

    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            data_out<='d0;
            valid<=1'd0;
        end
        else if(clken)begin
            data_out<=data_out_temp;
            valid<=valid_sram[NUM_LINE/2];
        end
        else begin
            data_out<=data_out;
            valid<=valid;
        end
    end

endmodule
