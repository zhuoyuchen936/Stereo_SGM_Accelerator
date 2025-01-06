module SRAM_256x16(
    clk,
    rst,
    wr_en,
    rd_en,
    wr_addr,
    rd_addr,
    d,
    q
);
parameter DWIDTH = 7, AWIDTH = 8, WORDS = 256;
input clk,rst;
input wr_en,rd_en;
input [AWIDTH-1:0] wr_addr,rd_addr;
input [DWIDTH-1:0] d;
output reg [DWIDTH-1:0] q;
reg [DWIDTH-1:0] mem [WORDS-1:0];
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        q <= 0;        
    end    
    else begin
        if(wr_en)begin
            mem[wr_addr] <= d;
        end
	if(rd_en)begin
	    q <= mem[rd_addr];
	end 
    end
end
endmodule

