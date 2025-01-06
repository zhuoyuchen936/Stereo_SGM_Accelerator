module census5x5_sram(
    clk,
    rst,
    clken,
    width,
    avgdata_R,
    avgdata_L,
    avg_final_valid_R,
    avg_final_valid_L,

    lb0_pixel,
    lb1_pixel,
    lb2_pixel,
    lb3_pixel,

    taps0x_L,
    taps1x_L,
    taps2x_L,
    taps3x_L,
    taps4x_L,

    taps0x_R,
    taps1x_R,
    taps2x_R,
    taps3x_R,
    taps4x_R
);
    input  clk, rst, clken;
    input  [10:0] width;
    input  [7:0]  avgdata_R, avgdata_L;
    input  avg_final_valid_R, avg_final_valid_L;
    input  [7:0] lb0_pixel;
    input  [7:0] lb1_pixel;
    input  [7:0] lb2_pixel;
    input  [7:0] lb3_pixel;

    output reg [7:0] taps0x_L;
    output reg [7:0] taps1x_L;
    output reg [7:0] taps2x_L;
    output reg [7:0] taps3x_L;
    output reg [7:0] taps4x_L;

    output [7:0] taps0x_R;
    output [7:0] taps1x_R;
    output [7:0] taps2x_R;
    output [7:0] taps3x_R;
    output [7:0] taps4x_R;

    //control module of census's memory
	wire valid_R1;
	wire valid_R2;
	wire valid_R3;
    wire valid_R4;
    wire valid_R5;

    wire    wr_en_Census_R_inst1_1;
    wire    wr_en_Census_R_inst1_2;
    wire    wr_en_Census_R_inst1_3;
    wire    wr_en_Census_R_inst1_4;
    wire    wr_en_Census_R_inst1_5;

    wire    valid_Census_R_inst1_1;
    wire    valid_Census_R_inst1_2;
    wire    valid_Census_R_inst1_3;
    wire    valid_Census_R_inst1_4;
    wire    valid_Census_R_inst1_5;
    
    wire    [7:0] BWEB_Census_R_inst1_1;
    wire    [7:0] BWEB_Census_R_inst1_2;
    wire    [7:0] BWEB_Census_R_inst1_3;
    wire    [7:0] BWEB_Census_R_inst1_4;
    wire    [7:0] BWEB_Census_R_inst1_5;

    wire    wr_en_Census_R_inst1;
    wire    rd_en_Census_R_inst1;
    wire    [39:0] BWEB_Census_R_inst1;
    wire    [10:0]  wr_addr_Census_R_inst1;
    wire    [10:0]  rd_addr_Census_R_inst1;

	wire    [39:0] Q_Census_R_Ram_2;

    assign  wr_en_Census_R_inst1 = wr_en_Census_R_inst1_1;

    assign  BWEB_Census_R_inst1_1 = wr_en_Census_R_inst1_1?8'hff:8'h00;
    assign  BWEB_Census_R_inst1_2 = wr_en_Census_R_inst1_2?8'hff:8'h00;
    assign  BWEB_Census_R_inst1_3 = wr_en_Census_R_inst1_3?8'hff:8'h00;
    assign  BWEB_Census_R_inst1_4 = wr_en_Census_R_inst1_4?8'hff:8'h00;
    assign  BWEB_Census_R_inst1_5 = wr_en_Census_R_inst1_5?8'hff:8'h00;

    assign  BWEB_Census_R_inst1 = {BWEB_Census_R_inst1_1, BWEB_Census_R_inst1_2, BWEB_Census_R_inst1_3,BWEB_Census_R_inst1_4,BWEB_Census_R_inst1_5}; 
    
    wire [7:0] D_Census_R_31_24  = valid_Census_R_inst1_1?Q_Census_R_Ram_2[39:32]:8'd0;
    wire [7:0] D_Census_R_23_16  = valid_Census_R_inst1_2?Q_Census_R_Ram_2[31:24]:8'd0;
    wire [7:0] D_Census_R_15_8  = valid_Census_R_inst1_3?Q_Census_R_Ram_2[23:16]:8'd0;
    wire [7:0] D_Census_R_7_0   = valid_Census_R_inst1_4?Q_Census_R_Ram_2[15:8]:8'd0;
    
       
    
	wire [39:0] D_Census_R_Ram_1 = {avgdata_R, D_Census_R_31_24, D_Census_R_23_16, D_Census_R_15_8, D_Census_R_7_0};


    assign taps0x_R = valid_Census_R_inst1_1?Q_Census_R_Ram_2[39:32]:8'd0;
    assign taps1x_R = valid_Census_R_inst1_2?Q_Census_R_Ram_2[31:24]:8'd0;
    assign taps2x_R = valid_Census_R_inst1_3?Q_Census_R_Ram_2[23:16]:8'd0;
    assign taps3x_R = valid_Census_R_inst1_4?Q_Census_R_Ram_2[15:8]:8'd0;
    assign taps4x_R = valid_Census_R_inst1_5?Q_Census_R_Ram_2[7:0]:8'd0;

    SRAM_control_Census_5x5#(8,11)  SRAM_control_Census_R_inst1(
    	.clk(clk),
    	.rst(rst),
    	.clken(clken & avg_final_valid_R),
        .width(width),
        .en2(clken & valid_Census_R_inst1_1),
        .en3(clken & valid_Census_R_inst1_2),
        .en4(clken & valid_Census_R_inst1_3),
        .en5(clken & valid_Census_R_inst1_4),
    	.wr_en_1(wr_en_Census_R_inst1_1),
    	.wr_en_2(wr_en_Census_R_inst1_2),
    	.wr_en_3(wr_en_Census_R_inst1_3),
        .wr_en_4(wr_en_Census_R_inst1_4),
        .wr_en_5(wr_en_Census_R_inst1_5),
    	.rd_en(rd_en_Census_R_inst1),
    	.wr_addr(wr_addr_Census_R_inst1),
    	.rd_addr(rd_addr_Census_R_inst1),
    	.valid_1(valid_Census_R_inst1_1),
    	.valid_2(valid_Census_R_inst1_2),
    	.valid_3(valid_Census_R_inst1_3),
        .valid_4(valid_Census_R_inst1_4),
        .valid_5(valid_Census_R_inst1_5)
    );

//    sliced_sram#(40,1920,11,5,8) Census_R_RAM1(
//        .AA(wr_addr_Census_R_inst1),
//        .DA(D_Census_R_Ram_1),
//        .BWEBA(BWEB_Census_R_inst1),
//        .WEBA(wr_en_Census_R_inst1),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_Census_R_inst1),
//        .WEBB(1'b1),
//        .QB(Q_Census_R_Ram_2)
//    );
  
    sram_1920x40_dp_bit_en Census_R_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_Census_R_inst1),
        .din_a(D_Census_R_Ram_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Census_R_inst1),
        .bit_en_a(BWEB_Census_R_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Census_R_inst1),
        .din_b(40'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(40'd0),
        .dout_b(Q_Census_R_Ram_2)
    );

	reg  valid_L1;
	reg  valid_L2;
    reg  valid_L3;
    reg  valid_L4;
    

	reg [10:0] cnt_L1;
	reg [10:0] cnt_L2;
    reg [10:0] cnt_L3;
    reg [10:0] cnt_L4;
    
    
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		cnt_L1 <= 11'd0;
		valid_L1 <= 0;
	end
	else if(clken & avg_final_valid_L)begin
		if(cnt_L1 == width - 1)begin
			cnt_L1 <= 11'd0;
			valid_L1 <= 1;
		end
		else begin
			cnt_L1 <= cnt_L1 + 11'd1;
		end
	end
	else begin
		cnt_L1 <= cnt_L1;
		valid_L1 <= valid_L1;
	end
end	

always@(posedge clk or negedge rst)begin
	if(!rst)begin
		cnt_L2 <= 11'd0;
		valid_L2 <= 0;
	end
	else if(clken & valid_L1)begin
		if(cnt_L2 == width - 1)begin
			cnt_L2 <= 11'd0;
			valid_L2 <= 1;
		end
		else begin
			cnt_L2 <= cnt_L2 + 11'd1;
		end
	end
	else begin
		cnt_L2 <= cnt_L2;
		valid_L2 <= valid_L2;
	end
end	

always@(posedge clk or negedge rst)begin
	if(!rst)begin
		cnt_L3 <= 11'd0;
		valid_L3 <= 0;
	end
	else if(clken & valid_L2)begin
		if(cnt_L3 == width - 1)begin
			cnt_L3 <= 11'd0;
			valid_L3 <= 1;
		end
		else begin
			cnt_L3 <= cnt_L3 + 11'd1;
		end
	end
	else begin
		cnt_L3 <= cnt_L3;
		valid_L3 <= valid_L3;
	end
end

always@(posedge clk or negedge rst)begin
	if(!rst)begin
		cnt_L4 <= 11'd0;
		valid_L4 <= 0;
	end
	else if(clken & valid_L3)begin
		if(cnt_L4 == width - 1)begin
			cnt_L4 <= 11'd0;
			valid_L4 <= 1;
		end
		else begin
			cnt_L4 <= cnt_L4 + 11'd1;
		end
	end
	else begin
		cnt_L4 <= cnt_L4;
		valid_L4 <= valid_L4;
	end
end



	wire    wr_en_Census_L_inst1;
    wire    rd_en_Census_L_inst1;

    wire    wr_en_Census_L_inst1_1;
    wire    wr_en_Census_L_inst1_2;
    wire    wr_en_Census_L_inst1_3;
    wire    wr_en_Census_L_inst1_4;
    wire    wr_en_Census_L_inst1_5;
    
    wire    valid_Census_L_inst1_1;
    wire    valid_Census_L_inst1_2;
    wire    valid_Census_L_inst1_3;
    wire    valid_Census_L_inst1_4;
    wire    valid_Census_L_inst1_5;
    
    wire    [39:0]  BWEB_Census_L_inst1;

    wire    [10:0]  wr_addr_Census_L_inst1;
    wire    [10:0]  rd_addr_Census_L_inst1;

    wire    [7:0]   BWEB_Census_L_inst1_1;
    wire    [7:0]   BWEB_Census_L_inst1_2;
    wire    [7:0]   BWEB_Census_L_inst1_3;
    wire    [7:0]   BWEB_Census_L_inst1_4;
    wire    [7:0]   BWEB_Census_L_inst1_5;

    assign  wr_en_Census_L_inst1 = wr_en_Census_L_inst1_1;

   
	wire    [39:0] D_Census_L_Ram_1;
	wire    [39:0] Q_Census_L_Ram_2;

    assign  BWEB_Census_L_inst1_1 = wr_en_Census_L_inst1_1?8'hff:8'h00;
    assign  BWEB_Census_L_inst1_2 = wr_en_Census_L_inst1_2?8'hff:8'h00;
    assign  BWEB_Census_L_inst1_3 = wr_en_Census_L_inst1_3?8'hff:8'h00;
    assign  BWEB_Census_L_inst1_4 = wr_en_Census_L_inst1_4?8'hff:8'h00;
    assign  BWEB_Census_L_inst1_5 = wr_en_Census_L_inst1_5?8'hff:8'h00;
    
    assign  BWEB_Census_L_inst1 = {BWEB_Census_L_inst1_1,BWEB_Census_L_inst1_2,BWEB_Census_L_inst1_3,BWEB_Census_L_inst1_4,BWEB_Census_L_inst1_5}; 
    
    wire    [7:0] D_Census_L_31_24  = valid_L1?lb0_pixel:8'd0;
    wire    [7:0] D_Census_L_23_16  = valid_L2?lb1_pixel:8'd0;
    wire    [7:0] D_Census_L_15_8  = valid_L3?lb2_pixel:8'd0;
    wire    [7:0] D_Census_L_7_0   = valid_L4?lb3_pixel:8'd0;
    
       
    assign  D_Census_L_Ram_1 = {avgdata_L, D_Census_L_31_24, D_Census_L_23_16, D_Census_L_15_8, D_Census_L_7_0};


    wire    [7:0] taps0x_L_1 = valid_Census_L_inst1_1?Q_Census_L_Ram_2[39:32]:8'd0;
    wire    [7:0] taps1x_L_1 = valid_Census_L_inst1_2?Q_Census_L_Ram_2[31:24]:8'd0;
    wire    [7:0] taps2x_L_1 = valid_Census_L_inst1_3?Q_Census_L_Ram_2[23:16]:8'd0;
    wire    [7:0] taps3x_L_1 = valid_Census_L_inst1_4?Q_Census_L_Ram_2[15:8]:8'd0;
    wire    [7:0] taps4x_L_1 = valid_Census_L_inst1_5?Q_Census_L_Ram_2[7:0]:8'd0;

    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            taps0x_L <= 8'd0; 
            taps1x_L <= 8'd0;
            taps2x_L <= 8'd0;
            taps3x_L <= 8'd0;
            taps4x_L <= 8'd0;
        end
        else if(clken)begin
            taps0x_L <= taps0x_L_1; 
            taps1x_L <= taps1x_L_1;
            taps2x_L <= taps2x_L_1; 
            taps3x_L <= taps3x_L_1; 
            taps4x_L <= taps4x_L_1; 
        end
    end

    SRAM_control_Census_5x5#(8,11)  SRAM_control_Census_L_inst1(
    	.clk(clk),
    	.rst(rst),
    	.clken(clken & avg_final_valid_L),
        .width(width-11'd256),
        .en2(clken & valid_Census_L_inst1_1),
        .en3(clken & valid_Census_L_inst1_2),
        .en4(clken & valid_Census_L_inst1_3),
        .en5(clken & valid_Census_L_inst1_4),
    	.wr_en_1(wr_en_Census_L_inst1_1),
    	.wr_en_2(wr_en_Census_L_inst1_2),
    	.wr_en_3(wr_en_Census_L_inst1_3),
        .wr_en_4(wr_en_Census_L_inst1_4),
        .wr_en_5(wr_en_Census_L_inst1_5),
    	.rd_en(rd_en_Census_L_inst1),
    	.wr_addr(wr_addr_Census_L_inst1),
    	.rd_addr(rd_addr_Census_L_inst1),
    	.valid_1(valid_Census_L_inst1_1),
    	.valid_2(valid_Census_L_inst1_2),
    	.valid_3(valid_Census_L_inst1_3),
        .valid_4(valid_Census_L_inst1_4),
        .valid_5(valid_Census_L_inst1_5)
    );
    
//    sliced_sram#(40,1920,11,5,8) Census_L_RAM1(
//        .AA(wr_addr_Census_L_inst1),
//        .DA(D_Census_L_Ram_1),
//        .BWEBA(BWEB_Census_L_inst1),
//        .WEBA(wr_en_Census_L_inst1),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_Census_L_inst1),
//        .WEBB(1'b1),
//        .QB(Q_Census_L_Ram_2)
//    );
    sram_1920x40_dp_bit_en Census_L_RAM1(
        .clk_a(clk),
        .addr_a(wr_addr_Census_L_inst1),
        .din_a(D_Census_L_Ram_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Census_L_inst1),
        .bit_en_a(BWEB_Census_L_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Census_L_inst1),
        .din_b(40'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(40'd0),
        .dout_b(Q_Census_L_Ram_2)
    );

 
endmodule
