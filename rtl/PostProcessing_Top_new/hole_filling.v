module hole_filling(
	clk,
	rst,
	clken, 
	width,
	enable,
	din, //2+8=10 bit 2 note 8 integer

	//SRAM of stack_L
	wr_en_L,
	rd_en_L,
	wr_addr_L,
	rd_addr_L, 

	wr_en_R,
	rd_en_R,
	wr_addr_R,
	rd_addr_R,

    valid,
 	disp
	
);
    parameter DWIDTH = 16; 
    
    input clk;
	input rst;
	input clken; 
	input [10:0] width;
	input enable;
	input [DWIDTH+1:0] din; //2+8=10 bit 2 note 8 integer

	//SRAM of stack_L
	output wr_en_L;
	output rd_en_L;
	output [10:0] wr_addr_L;
	output [10:0] rd_addr_L; 

	output wr_en_R;
	output rd_en_R;
	output [10:0]wr_addr_R;
	output [10:0]rd_addr_R;
	output valid;
 	output [DWIDTH-1:0] disp;

	//din[8]=occlusion 0-255 1-0	
	//din[9]=dismatch 0-255 1-0
	//parameter width = 1920;

	//PATH 1----------------------------begin-----------------------------------
	
	//wire [8:0] dout_LIFO1,dout_180,dout_din_original;
	wire [DWIDTH+1:0] dout_LIFO1, dout_180, dout_din_original;
	wire valid_LIFO1,valid_180,valid_buffer,valid_LIFO2,valid_0;
	wire [2*DWIDTH+3:0] dout_0_180,dout_LIFO2,dout_buffer;



	// wire [10:0] width = 1920;
	stack#(DWIDTH+2,11) stack_1(
		.clk(clk),
		.rst(rst),
		.clken(clken&&enable),
		.enable(enable),
		// .width(width),
		//SRAM
		.din(din),

		.wr_en(wr_en_R),
		.rd_en(rd_en_R),
		.wr_addr(wr_addr_R),
		.rd_addr(rd_addr_R),
		.valid(valid_LIFO1),
		.dout(dout_LIFO1)
	);
	find_valid_180#(DWIDTH) inst1(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_LIFO1),
		.din(dout_LIFO1),

		.dout1(dout_180),
		.dout2(dout_din_original),
		.valid(valid_180)
	);

	buffer#(DWIDTH) buffer_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_180),
		.din1(dout_180),//9bit
		.din2(dout_din_original),//9bit

		.valid(valid_buffer),
		.dout(dout_buffer)//18bit
		);

	stack_2#(2*DWIDTH+4,11) stack_2(
		.clk(clk),
		.rst(rst),
		.clken(clken&&valid_buffer),
		.enable(valid_buffer),
		// .width(width),
		//SRAM
		.din(dout_buffer),//18bit

		.wr_en(wr_en_L),
		.rd_en(rd_en_L),
		.wr_addr(wr_addr_L),
		.rd_addr(rd_addr_L),
		.valid(valid_LIFO2),
		.dout(dout_LIFO2)//18bit
	);
	find_valid_0#(DWIDTH) inst2(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_LIFO2),
		.din(dout_LIFO2),//18bit
		.dout(dout_0_180),//17-9 bit :0 ;;8-0 bit :180 
		.valid(valid_0)
	);
//PATH 1----------------------------end-----------------------------------
	wire [DWIDTH+1:0] dout_FIFO1;
	wire [DWIDTH+1:0] dout_reg1_135,dout_reg1_90,dout_reg1_45;
	wire [DWIDTH+1:0] dout_reg2_135,dout_reg2_90,dout_reg2_45;
	wire [DWIDTH+1:0] dout_reg3_135,dout_reg3_90,dout_reg3_45;
	wire [DWIDTH+1:0] dout_reg4_45;
	wire valid_FIFO1,valid_FIFO2,valid_reg1,valid_reg2,valid_reg3,valid_reg4;
	wire [3*DWIDTH+5:0] dout_reg2_overall,dout_FIFO2 ;
//PATH 2----------------------------begin---------------------------------
	FIFO#(DWIDTH+2,11) FIFO1(
		.clk(clk),
		.rst(rst),
		.clken(clken&&enable),
		.width(width),
		.enable(enable),
		.din(din),
		.dout(dout_FIFO1),
		.valid(valid_FIFO1)
	);
	reg1#(DWIDTH) reg1_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_FIFO1),
		//to check if there is invalid disparity
		.din(dout_FIFO1),
		//90 degree
		.din_reg3(dout_reg3_90),
		//45 degree
		.din_reg4(dout_reg4_45),


		.dout_reg1_45(dout_reg1_45),
		.dout_reg1_90(dout_reg1_90),
		.dout_reg1_135(dout_reg1_135),
		
		.valid(valid_reg1)
	);
	reg2#(DWIDTH) reg2_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_reg1),
		.din_45(dout_reg1_45),
		.din_90(dout_reg1_90),
		.din_135(dout_reg1_135),
		//135 degree
		.din_reg3(dout_reg3_135),
		.dout_reg2_overall(dout_reg2_overall),
		.valid(valid_reg2)
	);
	FIFO_2#(3*DWIDTH+6,11) FIFO2(
		.clk(clk),
		.rst(rst),
		.clken(clken&&valid_reg2),
		.width(width),
		.enable(valid_reg2),
		.din(dout_reg2_overall),
		.dout(dout_FIFO2),
		.valid(valid_FIFO2)
	);
	reg3#(DWIDTH) reg3_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_FIFO2),
		.din(dout_FIFO2),

		.dout_reg3_45(dout_reg3_45),
		.dout_reg3_90(dout_reg3_90),
		.dout_reg3_135(dout_reg3_135),
		.valid(valid_reg3)
	);
// finish comparing in reg4 
	reg4#(DWIDTH) reg4_inst(
		.clk(clk),
		.rst(rst),
		.clken(clken),
		.enable(valid_reg3),
		//9 bit	
		.din_45(dout_reg3_45),
		.din_90(dout_reg3_90),
		.din_135(dout_reg3_135),
		//18 bit
		.din_0_180(dout_0_180),


		.dout_reg4_45(dout_reg4_45),
		.disp(disp),
		.valid(valid)
	);
//PATH 2----------------------------end-----------------------------------
	
endmodule 

module buffer(clk, rst, clken, enable, din1, din2, dout, valid);
	parameter DWIDTH = 8'd16;
	input clk, rst, clken, enable;
	input [DWIDTH+1:0] din1;
	input [DWIDTH+1:0] din2;
	output reg [2*DWIDTH+3:0] dout;
	output reg valid;

	reg temp_valid;
always@(posedge clk or negedge rst)begin
		if(!rst)begin
			dout<=0;
			temp_valid<=0;
			valid<=0;
		end
		else begin
			if(clken && enable)begin
				temp_valid<=enable;
				valid<=temp_valid;
				dout[2*DWIDTH+3:DWIDTH+2]<=din2;
				dout[DWIDTH+1:0]<=din1;
			end
			else begin
				temp_valid<=temp_valid;
				valid<=valid;
				dout<=dout;
			end
		end
	end
	
endmodule

module find_valid_0(clk, rst, clken, enable, din, dout, valid);
    parameter DWIDTH = 16;
	input clk, rst, clken, enable;
	input [2*DWIDTH+3:0]din;
	//18 bit input 
	//0-8 bit : module 180 output data
	//9-17 bit : original data
	output reg [2*DWIDTH+3:0] dout;
	output reg valid;
	
	wire [DWIDTH+1:0] din_0;
	assign din_0 = din[2*DWIDTH+3:DWIDTH+2];
	reg [DWIDTH+1:0] valid_reg, temp;
	reg temp_valid;
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			valid_reg<=0;
			temp<=0;
		end
		else begin
			if(clken && enable)begin
				//valid
				if((!din_0[DWIDTH+1])&&(!din_0[DWIDTH]))begin
								temp<=din_0;
								valid_reg<=din_0;
								end							      
				
				//invalid
				else begin
					temp<={din_0[DWIDTH+1:DWIDTH],valid_reg[DWIDTH-1:0]};
					
				end
			end
			else begin
				temp<=temp;
				valid_reg<=valid_reg;
			end
		end
	end
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			dout<=0;
			temp_valid<=0;
			valid<=0;
		end
		else begin
			if(clken && enable)begin
				temp_valid<=enable;
				valid<=temp_valid;
				dout[2*DWIDTH+3:DWIDTH+2]<=temp;
				dout[DWIDTH+1:0]<=din[DWIDTH+1:0];
			end
			else begin
				temp_valid<=temp_valid;
				valid<=valid;
				dout<=dout;
			end
		end
	end
endmodule 

module find_valid_180(clk, rst, clken, enable, din, dout1,dout2, valid);
	parameter DWIDTH= 8'd16;
	input clk, rst, clken, enable;
	input [DWIDTH+1:0]din;
	output reg [DWIDTH+1:0] dout1;
	output reg [DWIDTH+1:0] dout2;
	output reg valid;

	reg [DWIDTH+1:0] valid_reg, temp;
	reg temp_valid;
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			valid_reg<=0;
			temp<=0;
		end
		else begin
			if(clken && enable)begin
				if((!din[DWIDTH+1])&&(!din[DWIDTH]))begin//valid
					temp<=din;
					valid_reg<=din;
				end
				else begin//invalid
					temp<={din[DWIDTH+1:DWIDTH],valid_reg[DWIDTH-1:0]};
				end
			end
			else begin
				temp<=temp;
				valid_reg<=valid_reg;
			end
		end
	end
	always@(posedge clk or negedge rst)begin
		if(!rst)begin
			dout1<=0;
			dout2<=0;
			temp_valid<=1'd0;
			valid<=1'd0;
		end
		else begin
			if(clken && enable)begin
				temp_valid<=enable;
				valid<=temp_valid;
				dout1<=temp;
				dout2<=din;
			end
			else begin
				temp_valid<=temp_valid;
				valid<=valid;
				dout1<=dout1;
				dout2<=dout2;
			end
		end
	end
endmodule 
