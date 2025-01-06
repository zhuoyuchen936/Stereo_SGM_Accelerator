/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module Align_Buffer(
    clk,
    rst,
    clken,
    range,
    data_in,
    data_out,
    rd_addr,
    rd_en
);
    parameter WIDTH = 80; //Data width
    parameter AWIDTH = 9; //Address width
    parameter DEPTH = 512;
    input clk;
    input rst;
    input clken;
    input [8:0] range;
    input [WIDTH-1:0] data_in;
    output reg [WIDTH-1:0] data_out;
    output reg [AWIDTH-1:0] rd_addr;
    output reg rd_en;

    wire [WIDTH-1:0] dout;
    reg rd_flag;
    wire wr_en = clken?1'd0:1'd1;
    reg [AWIDTH-1:0] wr_addr, rd_addr_temp;
    // Control write & read address
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            wr_addr <= 0;
            rd_addr_temp <= 0;
            rd_flag <= 1;
        end else if (clken) begin
            if (!wr_en) begin 
                if (wr_addr == DEPTH - 1) wr_addr <= 0;
                else wr_addr <= wr_addr + 1;
            end
            if (!rd_flag) begin
                if (rd_addr_temp == DEPTH - 1) rd_addr_temp <= 0;
                else rd_addr_temp <= rd_addr_temp + 1;
            end
            // Finish buffering disp range disp_R
            if (wr_addr == range - 1) rd_flag <= 0;
            else rd_flag <= rd_flag;
        end
        else begin
            wr_addr <= wr_addr;
            rd_addr_temp <= rd_addr_temp;
            rd_flag <= rd_flag;
        end
    end
    //SRAM Depth > disp range (256) is
    //in case of read & write conflicts
    sram_270x16_dp column_buffer_270x80_inst (
        .clk_a(clk),
        .addr_a(wr_addr),
        .din_a(data_in),
        .ce_a(1'b0),
        .wr_en_a(wr_en),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_temp),
        .din_b(16'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .dout_b(dout)
    );
    //add a pipeline stage at the output
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            data_out <= 0;
            rd_en <= 1;
            rd_addr <= 0;
        end
        else if(clken)begin
            data_out <= dout;
            rd_en <= rd_flag;
            rd_addr <= rd_addr_temp;
        end
        else begin
            data_out <= data_out;
            rd_en <= rd_en;
            rd_addr <= rd_addr;
        end
    end
endmodule