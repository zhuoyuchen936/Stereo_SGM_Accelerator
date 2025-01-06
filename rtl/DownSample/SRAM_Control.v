//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Guan Xinyu
// 
// Create Date: 2023/08/10 02:18:25
// Design Name: 
// Module Name: SRAM_Control
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////


module SRAM_Control
#(parameter AWIDTH=11)
(
    clk,
    rst,
    clken,
    width,
    valid_in,

    rd_en,
    wr_en,
    wr_addr,
    rd_addr

    );
    input clk,rst,clken,valid_in;
    input [AWIDTH-1:0] width;

    input rd_en, wr_en;
    output reg [AWIDTH-1:0] rd_addr, wr_addr;
//////////// SRAM Control signal /////////



always @(posedge clk or negedge rst) begin
    if(!rst)begin
        wr_addr <= 0;
    end

    else if(clken&valid_in)begin
        if(wr_en)begin
            if(wr_addr == width - 1) wr_addr <= 0;
            else wr_addr <= wr_addr + 11'b1;
        end

        else begin
            wr_addr <= wr_addr;
        end
    end
    else begin
            wr_addr <= wr_addr;
    end
end
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        rd_addr <= 0;  
    end

    else if(clken)begin
        if(rd_en)begin
            if(rd_addr == width - 1) rd_addr <= 0;
            else rd_addr <= rd_addr + 11'b1;
        end
        else begin
            rd_addr <= rd_addr;
        end
    end

    else begin
            rd_addr <= rd_addr;
    end
end

endmodule

