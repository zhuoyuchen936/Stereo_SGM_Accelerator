module integrated_window_filter(
	clk,
	rst,
	clken,
	width,
	enable,
	din,
	//SRAM of stack_L
	wr_en_L,
	rd_en_L,
	wr_addr_L,
	rd_addr_L, 
	//SRAM of stack_R
	wr_en_R,
	rd_en_R,
	wr_addr_R,
	rd_addr_R,
	
	dout,
	valid
);

	parameter WIDTH = 16;
	parameter AWIDTH = 11;
	input clk, rst, clken, enable;
	input [10:0] width;
	input [WIDTH+1:0] din;
	//SRAM of stack_L
	output [AWIDTH-1:0] wr_addr_L,rd_addr_L;
	output wr_en_L,rd_en_L;
	//SRAM of stack_R
	output [AWIDTH-1:0] wr_addr_R,rd_addr_R;
	output wr_en_R,rd_en_R;

 	output  [WIDTH-1:0] dout;//have a tag for white pixel
	output  valid;

	
	reg [WIDTH+1:0] reg1_1, reg1_2, reg1_3, reg1_4;//filling
	reg [WIDTH+1:0] reg2_1, reg2_2, reg2_3, reg2_4,reg2_5;//filling+median
	reg [WIDTH+1:0] reg3_1, reg3_2, reg3_3, reg3_4,reg3_5_p,reg3_5_l;;//filing+median
	wire [2*WIDTH+3:0] reg3_5;
	 reg [2*WIDTH+3:0] reg4_1, reg4_2, reg4_3, reg4_4,reg4_5;	//median
    wire [WIDTH+1:0] reg4_1_p, reg4_2_p, reg4_3_p, reg4_4_p,reg4_5_p;	//median
    wire [WIDTH+1:0] reg4_1_l, reg4_2_l, reg4_3_l, reg4_4_l,reg4_5_l;	//median

	wire [WIDTH+1:0] filling1_out, median_out;//00 for valid, 01 for mis, 10 for occ, 11 for nofilling
	reg [WIDTH+1:0] filling2_out;
	reg filling_valid, median_valid;
	wire valid_FIFO2,valid_FIFO4,valid_FIFO3;
    reg en_read_filling,en_read_median, cnt_time;

	reg [12:0] cnt;

assign reg3_5 = {reg3_5_p,reg3_5_l};
assign reg4_2_p = reg4_2[2*WIDTH+3:WIDTH+2];
assign reg4_2_l = reg4_2[WIDTH+1:0];
assign reg4_3_p = reg4_3[2*WIDTH+3:WIDTH+2];
assign reg4_3_l = reg4_3[WIDTH+1:0];
assign reg4_4_p = reg4_4[2*WIDTH+3:WIDTH+2];
assign reg4_4_l = reg4_4[WIDTH+1:0];
assign reg4_5_p = reg4_5[2*WIDTH+3:WIDTH+2];
assign reg4_5_l = reg4_5[WIDTH+1:0];

reg valid_FIFO2_reg1,valid_FIFO2_reg2,valid_FIFO2_reg3,valid_FIFO2_reg4,valid_FIFO2_reg5;
reg valid_FIFO3_reg1,valid_FIFO3_reg2,valid_FIFO3_reg3,valid_FIFO3_reg4,valid_FIFO3_reg5;
reg valid_FIFO4_reg1,valid_FIFO4_reg2,valid_FIFO4_reg3,valid_FIFO4_reg4,valid_FIFO4_reg5;
reg enable_reg1,enable_reg2,enable_reg3,enable_reg4;

always @(posedge clk or negedge rst)begin
	if(!rst)begin
        enable_reg1<=1'b0;
        enable_reg2<=1'b0;
        enable_reg3<=1'b0;
        enable_reg4<=1'b0;
        
        valid_FIFO2_reg1<=1'b0;
        valid_FIFO2_reg2<=1'b0;
        valid_FIFO2_reg3<=1'b0;
        valid_FIFO2_reg4<=1'b0;
        valid_FIFO2_reg5<=1'b0;

        valid_FIFO3_reg1<=1'b0;
        valid_FIFO3_reg2<=1'b0;
        valid_FIFO3_reg3<=1'b0;
        valid_FIFO3_reg4<=1'b0;
        valid_FIFO3_reg5<=1'b0;

        valid_FIFO4_reg1<=1'b0;
        valid_FIFO4_reg2<=1'b0;
        valid_FIFO4_reg3<=1'b0;
        valid_FIFO4_reg4<=1'b0;
        valid_FIFO4_reg5<=1'b0;
   end
    else if(clken)begin

        enable_reg1<=enable;
        enable_reg2<=enable_reg1;
        enable_reg3<=enable_reg2;
        enable_reg4<=enable_reg3;

        valid_FIFO2_reg1<=valid_FIFO2;
        valid_FIFO2_reg2<=valid_FIFO2_reg1;
        valid_FIFO2_reg3<=valid_FIFO2_reg2;
        valid_FIFO2_reg4<=valid_FIFO2_reg3;
        valid_FIFO2_reg5<=valid_FIFO2_reg4;

        valid_FIFO3_reg1<=valid_FIFO3;
        valid_FIFO3_reg2<=valid_FIFO3_reg1;
        valid_FIFO3_reg3<=valid_FIFO3_reg2;
        valid_FIFO3_reg4<=valid_FIFO3_reg3;
        valid_FIFO3_reg5<=valid_FIFO3_reg4;

        valid_FIFO4_reg1<=valid_FIFO4;
        valid_FIFO4_reg2<=valid_FIFO4_reg1;
        valid_FIFO4_reg3<=valid_FIFO4_reg2;
        valid_FIFO4_reg4<=valid_FIFO4_reg3;
        valid_FIFO4_reg5<=valid_FIFO4_reg4;
    end
end


always @(posedge clk or negedge rst)begin
	if(!rst)begin
	    median_valid<=1'b0;
        filling_valid<=1'b0;
	end
	else if(clken)begin
	    median_valid<=valid_FIFO4_reg5;
        filling_valid<=valid_FIFO2_reg3;
	end
end

	
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		reg1_1<=0;
		reg1_2<=0;
		reg1_3<=0;
		reg1_4<=0;

	end
	else if (clken&&enable) begin
		reg1_1<=din;
		reg1_2<=reg1_1;
		reg1_3<=reg1_2;
		reg1_4<=reg1_3;	
		
	end
	else begin 
		reg1_1<=reg1_1;
		reg1_2<=reg1_2;
		reg1_3<=reg1_3;
		reg1_4<=reg1_4;
	end
end

	wire [WIDTH+1:0]  dout_FIFO2;

    wire [2*WIDTH+3:0]  dout_FIFO4;

	FIFO_width1#(1920,WIDTH+2,AWIDTH) FIFO_inst2(
		.clk(clk),
		.rst(rst),
		.clken(clken&enable_reg4),
		.enable(enable_reg4),
        .width(width),
		.din(reg1_4),
		.dout(dout_FIFO2),
		.valid(valid_FIFO2)
	);
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		reg2_1<=0;
		reg2_2<=0;
		reg2_3<=0;   
		reg2_4<=0;
        reg2_5<=0;
	end
	else if (clken) begin
		reg2_1<=dout_FIFO2;	
        reg2_2<=reg2_1;
        if ((!reg2_2[WIDTH+1])&&(!reg2_2[WIDTH])) begin reg2_3<=reg2_2; end
        else if (filling_valid) begin reg2_3<=filling1_out; end//have pixels in FIFO, replace
        else  reg2_3<=reg2_2; //no pixels in FIFO, directly pass
        reg2_4<=reg2_3;
        reg2_5<=reg2_4;
	end
	else begin 
		reg2_1<=reg2_1;
		reg2_2<=reg2_2;
		reg2_3<=reg2_3;
		reg2_4<=reg2_4;
        reg2_5<=reg2_5;
	end
end

	wire [WIDTH+1:0]  dout_FIFO3;

	FIFO_width1#(1920,WIDTH+2,AWIDTH) FIFO_inst3(
		.clk(clk),
		.rst(rst),
		.clken(clken&valid_FIFO2_reg5),
		.enable(valid_FIFO2_reg5),
        .width(width),
		.din(reg2_5),
		.dout(dout_FIFO3),
		.valid(valid_FIFO3)
	);
    
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		reg3_1<=0;
		reg3_2<=0;
		reg3_3<=0;
		reg3_4<=0;
        reg3_5_p<=0;
        reg3_5_l<=0;
	end
	else if (clken) begin
        reg3_1<=dout_FIFO3;
		reg3_2<=reg3_1;
        reg3_3<=reg3_2;
        reg3_4<=reg3_3;
        reg3_5_p<=reg3_4;
        if ((!reg3_4[WIDTH+1])&&(!reg3_4[WIDTH])) begin reg3_5_l<=reg3_4; end
        else if (!median_valid) begin reg3_5_l<=reg3_4;end
        else begin reg3_5_l<= median_out;end
        	
		
	end
	else begin 
		reg3_1<=reg3_1;
		reg3_2<=reg3_2;
		reg3_3<=reg3_3;
		reg3_4<=reg3_4;
        reg3_5_p<=reg3_5_p;
        reg3_5_l<=reg3_5_l;
	end
end

	

	FIFO_width2#(1920,2*WIDTH+4,AWIDTH) FIFO_inst4(
		.clk(clk),
		.rst(rst),
		.clken(clken&valid_FIFO3_reg5),
		.enable(valid_FIFO3_reg5),
        .width(width),
		.din(reg3_5),
		.dout(dout_FIFO4),
		.valid(valid_FIFO4)
	);
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		reg4_1<=0;
		reg4_2<=0;
		reg4_3<=0;
		reg4_4<=0;
		reg4_5<=0;

	end
	else if (clken) begin
        reg4_1<=dout_FIFO4;
		reg4_2<=reg4_1;
		reg4_3<=reg4_2;
		reg4_4<=reg4_3;	
		reg4_5<=reg4_4;	
	end
	
	else begin 
		reg4_1<=reg4_1;
		reg4_2<=reg4_2;
		reg4_3<=reg4_3;
		reg4_4<=reg4_4;
		reg4_5<=reg4_5;
	end
end

hole_filling_new#(1920, WIDTH, AWIDTH) filling_inst1(
	.din_1(reg1_1),
	.din_2(reg1_2),
	.din_3(reg1_3),
	.din_4(reg2_1),
	.din_5(reg2_2),

	.dout(filling1_out)
);

wire[WIDTH-1:0] dout_median_value;
median_filter3x3#(1920, WIDTH, AWIDTH) median_inst(
	.din_1(reg2_3),
	.din_2(reg2_4),
	.din_3(reg2_5),
	.din_4(reg3_3),
	.din_5(reg3_4),
	.din_6(reg3_5_p),
	.din_7(reg4_3_p),
	.din_8(reg4_4_p),
	.din_9(reg4_5_p),

	.dout(median_out)
	);
//left_right_filling#(depth,WIDTH,AWIDTH) lr_filling_inst(
//	.clk(clk),
//	.rst(rst),
//	.clken(clken&valid_FIFO4_reg4),
//	.enable(valid_FIFO4_reg4),
//	.din(reg4_4_l),
//    .width(width),
//
//	.wr_en_L(wr_en_L),
//	.rd_en_L(rd_en_L),
//	.wr_addr_L(wr_addr_L),
//	.rd_addr_L(rd_addr_L),
//	.wr_en_R(wr_en_R),
//	.rd_en_R(rd_en_R),
//	.wr_addr_R(wr_addr_R),
//	.rd_addr_R(rd_addr_R),
//
//	.valid(valid),
//	.disp(dout)	
//	);
//assign dout = reg2_3[WIDTH-1:0];
//assign valid=valid_FIFO2_reg3;

assign dout = reg4_4_l[WIDTH-1:0];
assign valid=valid_FIFO4_reg4;

endmodule

	
	

