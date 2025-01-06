//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 2021/06/04 
// Design Name: DongPingcheng
// Module Name: stack
// Project Name: SGM
// 
//stack=LIFO
//////////////////////////////////////////////////////////////////////////////////	
module stack(
	clk,
 	rst,
	clken,
	width,
 	enable,
//SRAM
	wr_en,
	rd_en,
	wr_addr,
	rd_addr,
 	valid,
	din,
	dout
);
	//parameter width = 1920;
	parameter DWIDTH = 11;
	parameter AWIDTH = 11;
	input  clk, rst, clken, enable;
	input  [10:0] width;
	input  [DWIDTH-1:0] din;
	output [DWIDTH-1:0] dout;
	output reg valid;

	output reg [10:0] wr_addr, rd_addr;
	output rd_en;
	output wr_en;
    wire [DWIDTH-1:0] stack_1_dout_temp;
	reg rd_en_temp;		
//	sliced_sram#(DWIDTH,1936,11,1,DWIDTH) SRAM_stack_1(
//        .AA(wr_addr),
//        .DA(din),
//        .BWEBA({DWIDTH{wr_en}}),
//        .WEBA(wr_en),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr),
//        .WEBB(1'b1),
//        .QB(dout)
//    );
     sram_1936x11_dp_bit_en stack1(
        .clk_a(clk),
        .addr_a(wr_addr),
        .din_a(din),
        .ce_a(1'b0),
        .wr_en_a(wr_en),
        .bit_en_a({11{wr_en}}),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr),
        .din_b(11'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(11'd0),
        .dout_b(stack_1_dout_temp)
    );
assign dout = stack_1_dout_temp[DWIDTH-1:0];

    // UHDDP_1936x10 SRAM_stack_1(
    //     .RTSEL(2'b00),
    //     .WTSEL(2'b00),
    //     .PTSEL(2'b00),
    //     .AA(wr_addr),
    //     .DA(din),
    //     .BWEBA({(DWIDTH){wr_en}}),
    //     .WEBA(wr_en),
    //     .CEBA(1'b0),
    //     .CLK(clk),
    //     .AB(rd_addr),
    //     .DB(10'd0),
    //     .BWEBB(10'd1023),
    //     .WEBB(1'b1),
    //     .CEBB(1'b0),
    //     .QA(),
    //     .QB(dout)

    // );
	//Flag of write and read pointer,0->from bottom to top, 1->from top to bottom
	reg wr_flag, rd_flag;
	assign wr_en=(clken && enable)?1'd0:1'd1;
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_addr<=0;
			rd_addr<=width-1;
			wr_flag<=1'd0;
			rd_flag<=1'd1;
			valid<=1'd0;
		end
		else begin
			//Control the flag of write pointer
			if(wr_addr == width-1)begin
				wr_flag<=1'd1;
			end
			else if(wr_addr==1)begin
				wr_flag<=1'd0;
			end
			else begin
				wr_addr<=wr_addr;
			end
			//Control the write address
			if(!wr_en)begin
				if(wr_flag==1'd0)wr_addr<=wr_addr+1;
				else wr_addr<=wr_addr-1;
			end
			else begin
				wr_addr<=wr_addr;
			end
			//Control the flag of read pointer
			if(rd_addr==1 && rd_flag==1'd1)rd_flag<=1'd0;
			else if(rd_addr==width-1 && rd_flag==1'd0)rd_flag<=1'd1;
			else rd_flag<=rd_flag;
			//Control the read address
			if((!rd_en) && clken && enable)begin
				valid<=1'd1;
				if(rd_flag)rd_addr<=rd_addr-1;
				else rd_addr<=rd_addr+1;
			end
			else begin
				valid<=valid;
				rd_addr<=rd_addr;
			end
		end
	end
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			rd_en_temp<=1'd1;
		end
		else if(clken & enable)begin
			if(wr_addr == width - 1)begin
				rd_en_temp <= 1'd0;
			end
		end
		else begin
			rd_en_temp <= rd_en_temp;
		end
	end
	assign rd_en = rd_en_temp;
endmodule 
