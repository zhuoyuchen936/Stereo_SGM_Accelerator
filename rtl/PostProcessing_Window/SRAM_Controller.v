/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module SRAM_Controller(
	clk,
 	rst,
	clken,
	width,
    en,
	wr_en,
	wr_addr,
	rd_addr,
 	valid
);
	parameter DWIDTH = 70;
	parameter AWIDTH = 11;
	parameter NUM_LINE = 5;

	input  clk, rst, clken;
	input  [10:0] width;
	input [NUM_LINE-1:0] en;
	output [NUM_LINE-1:0] wr_en;
    output reg  [AWIDTH-1:0] wr_addr, rd_addr;
	output reg [NUM_LINE-1:0] valid;

	reg [AWIDTH-1:0] rd_flag[NUM_LINE-1:0];
    wire [NUM_LINE-1:0] rd_en;  
    
    assign wr_en[NUM_LINE-1] = clken? 1'd0 : 1'd1;
    assign rd_en[NUM_LINE-1] = (clken && (rd_flag[NUM_LINE-1] == width-1))?1'd0:1'd1;
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            wr_addr <= 0;
            rd_addr <= 0;
            rd_flag[NUM_LINE-1] <= 0;
            valid[NUM_LINE-1] <= 0;
        end else if (clken) begin
            if (!wr_en[NUM_LINE-1]) begin 
                if (wr_addr == width - 1) wr_addr <= 0;
                else wr_addr <= wr_addr + 1;
                if (rd_flag[NUM_LINE-1] == width - 1) rd_flag[NUM_LINE-1] <= width - 1;
                else rd_flag[NUM_LINE-1] <= rd_flag[NUM_LINE-1] + 1;
            end
            if (!rd_en[NUM_LINE-1]) begin  
                valid[NUM_LINE-1] <= 1;
                if (rd_addr == width - 1) rd_addr <= 0;
                else rd_addr <= rd_addr + 1;
            end
        end
        else begin
            wr_addr <= wr_addr;
            rd_addr <= rd_addr;
            rd_flag[NUM_LINE-1] <= rd_flag[NUM_LINE-1];
            valid[NUM_LINE-1] <= valid[NUM_LINE-1];
        end
    end

    genvar i;
    generate
        for (i = 0; i < NUM_LINE-1; i = i + 1) begin : multi_line
            assign wr_en[i] = en[i+1] ? 1'd0 : 1'd1;
            assign rd_en[i] = (en[i+1] && (rd_flag[i] == width - 1)) ? 1'd0 : 1'd1;
            always @(posedge clk or negedge rst) begin
                if (!rst) begin
                    rd_flag[i] <= 0;
                    valid[i] <= 0;
                end else if (clken) begin
                    if (!wr_en[i]) begin
                        if (rd_flag[i] == width - 1) begin
                            rd_flag[i] <= width - 1;
                        end else begin
                            rd_flag[i] <= rd_flag[i] + 1;
                        end
                    end
                    if (!rd_en[i]) begin
                        valid[i] <= 1;
                    end
                end
                else begin
                    rd_flag[i] <= rd_flag[i];
                    valid[i] <= valid[i];
                end
            end
        end
    endgenerate
	
    endmodule
