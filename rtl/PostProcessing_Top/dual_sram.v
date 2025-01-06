module sliced_sram(
    AA,
    DA,
    BWEBA,
    WEBA,
    CLK,
    RST,
    AB,
    WEBB,
    QB
);
    parameter  DWIDTH = 24;
    parameter  WORDS = 1920;
    parameter  AWIDTH = 11;
    parameter  slice = 3;
    parameter  sub_sram_DW = 8;

    input [AWIDTH-1:0] AA;
    input [DWIDTH-1:0] DA;
    input [DWIDTH-1:0] BWEBA;
    input WEBA;
    input CLK;
    input RST;
    input [AWIDTH-1:0] AB;
    input WEBB;

    output reg  [DWIDTH-1:0] QB;

    genvar i;
    generate 
        for (i = 0; i < slice; i = i + 1)
            begin: sub_sram
                wire wr_en = &BWEBA[((i+1)*sub_sram_DW-1):i*sub_sram_DW]; 
                SRAM#(sub_sram_DW, AWIDTH, WORDS) SRAM_inst (
                    .clk(CLK),
                    .rst(RST),
                    .wr_en(wr_en && WEBA),
                    .rd_en(~WEBB),
                    .wr_addr(AA),
                    .rd_addr(AB),
                    .d(DA[((i+1)*sub_sram_DW-1):i*sub_sram_DW]),
                    .q(QB[((i+1)*sub_sram_DW-1):i*sub_sram_DW])     
                );
            end
    endgenerate

endmodule

module SRAM(
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
integer i;
always @(posedge clk or negedge rst) begin
    if(!rst) begin
        q <= 0;        
    end    
    else begin
    if(!wr_en)begin
            mem[wr_addr] <= d;
        end
	if(!rd_en)begin
	    q <= mem[rd_addr]; 
	end
    end
    
end

endmodule

