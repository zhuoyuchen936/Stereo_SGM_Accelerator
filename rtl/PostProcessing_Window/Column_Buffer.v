/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module Column_Buffer(
    clk,
    rst,
    clken,
    rd_addr,
    data_in,
    data_out
);
    parameter WIDTH = 80; //Data width
    parameter AWIDTH = 9; //Address width
    parameter DEPTH = 512;
    input clk;
    input rst;
    input clken;
    input [AWIDTH-1:0] rd_addr;
    input [WIDTH-1:0] data_in;
    output reg [WIDTH-1:0] data_out;

    wire [WIDTH-1:0] dout;
    wire wr_en = clken?1'd0:1'd1;
    reg [AWIDTH-1:0] wr_addr;
    // Control write address
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            wr_addr <= 0;
        end else if (clken) begin
            if (!wr_en) begin 
                if (wr_addr == DEPTH - 1) wr_addr <= 0;
                else wr_addr <= wr_addr + 1;
            end
        end
        else begin
            wr_addr <= wr_addr;
        end
    end
    //double disp range in case of read & write conflicts
    sram_270x80_dp column_buffer_512x80_inst (
        .clk_a(clk),
        .addr_a(wr_addr),
        .din_a(data_in),
        .ce_a(1'b0),
        .wr_en_a(wr_en),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr),
        .din_b(80'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .dout_b(dout)
    );
    //add a pipeline stage at the output
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            data_out <= 0;
        end
        else if(clken)begin
            data_out <= dout;
        end
        else begin
            data_out <= data_out;
        end
    end
endmodule