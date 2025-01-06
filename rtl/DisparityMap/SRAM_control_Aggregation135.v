
module SRAM_control_Aggregation135(
	clk,
 	rst,
	clken,
	width,
	//SRAM
	wr_en,
	//rd_en,
	wr_addr,
	rd_addr,
	cost_valid,
	BWEB_s,
 	valid
);

	parameter DWIDTH = 320;
	parameter AWIDTH = 11;
	parameter num=0;
	//parameter width = 1916;
	input  clk, rst, clken;
	input  [10:0] width;
	input  [63:0] cost_valid;
	output reg  valid;
	output reg  [AWIDTH-1:0] wr_addr, rd_addr;
	output wr_en;
	output [127:0] BWEB_s;

	reg  [AWIDTH-1:0]cnt;
	reg  [AWIDTH-1:0]rd_flag;
	wire rd_en;
	assign wr_en = clken?1'd0:1'd1;
	assign rd_en = (clken && (rd_flag == width - 1))?1'd0:1'd1;
	//BWEB
	wire [319:0] cost135_valid_B;
	genvar t;
	generate for(t=0;t<64;t=t+1) begin: inloop
            assign cost135_valid_B[(t+1)*5-1:t*5] = {5{~cost_valid[t]}};
		end
	endgenerate
	wire [639:0] BWEB0;
	assign BWEB0={cost135_valid_B,cost135_valid_B};
	assign BWEB_s=wr_en?BWEB0[639-128*num:512-128*num]:128'd0;
	//Controlling write and read signals
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_addr<=0;
			rd_addr<=0;
			rd_flag<=0;
			valid<=1'd0;
		end
		else if(clken)begin
			if(!wr_en)begin
				if(wr_addr == width - 1)wr_addr <= 0;
				else wr_addr <= wr_addr + 1;
				if(rd_flag == width - 1)begin
					rd_flag <= width - 1;
				end
				else rd_flag <= rd_flag + 1;
			end
			if(!rd_en)begin
				valid<=1;
				if(rd_addr == width - 1)rd_addr <= 0;
				else rd_addr <= rd_addr + 1;
			end
		end
		else begin
			wr_addr<=wr_addr;
			rd_addr<=rd_addr;
			rd_flag<=rd_flag;
			valid<=valid;
		end
	end

endmodule
