module FIFO_2(
	clk,
 	rst,
	clken,
	width,
	//SRAM
	enable,
	din,
	dout,
 	valid
);
	parameter DWIDTH = 54;
	parameter AWIDTH = 11;
	//parameter width = 1920;

	input  clk, rst, clken, enable;
	input  [10:0] width;
	input  [DWIDTH-1:0] din;
	output [DWIDTH-1:0] dout;
	output reg valid;
	reg  [AWIDTH-1:0] wr_addr, rd_addr;
	wire   rd_en;
    wire wr_en;
	reg  [AWIDTH-1:0]cnt;
	reg  [AWIDTH-1:0]rd_flag;
	assign wr_en = clken?1'd1:1'd0;
	assign rd_en = (clken && (rd_flag == width - 1))?1'd1:1'd0;
   //1936
//	sliced_sram#(DWIDTH,1936,11,1,DWIDTH) FIFO2(
//        .AA(wr_addr),
//        .DA(din),
//        .BWEBA({DWIDTH{!wr_en}}),
//        .WEBA(!wr_en),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr),
//        .WEBB(1'b1),
//        .QB(dout)
//    );

    sram_1936x54_dp_bit_en FIFO2(
        .clk_a(clk),
        .addr_a(wr_addr),
        .din_a(din),
        .ce_a(1'b0),
        .wr_en_a(!wr_en),
        .bit_en_a({DWIDTH{!wr_en}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr),
        .din_b(54'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b({DWIDTH{1'b0}}),
        .dout_b(dout)
    );

    //Controlling write and read signals
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_addr<=0;
			rd_addr<=0;
			rd_flag<=0;
			valid<=1'd0;
		end
		else if(clken)begin
			if(wr_en)begin
				if(wr_addr == width - 1)wr_addr <= 0;
				else wr_addr <= wr_addr + 1;
				if(rd_flag == width - 1)begin
					rd_flag <= width - 1;
				end
				else rd_flag <= rd_flag + 1;
			end
			if(rd_en)begin
				valid<=enable;
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

//    always@(posedge clk or negedge rst)begin
//		if(!rst)begin
//			rd_en<=1'd0;
//		end
//		else if(clken & enable)begin
//			if(rd_flag == width - 1)begin
//				rd_en <= 1'd1;
//			end
//		end
//		else begin
//			rd_en <= rd_en;
//		end
//	end

endmodule 
