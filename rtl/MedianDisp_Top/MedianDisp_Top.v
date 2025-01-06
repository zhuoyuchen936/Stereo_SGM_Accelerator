module MedianDisp_Top(
     clk,
     rst,
     clken,
     width, 
     valid_in,
     disp_L,
     disp_R,

     valid_out,
     disp_L_out,
     disp_R_out
);

    parameter WIDTH=16;

    input  clk;
    input  rst;
    input  clken;
    input  [10:0] width;
    input  valid_in;

    input  [(WIDTH-1):0] disp_L;
    input  [(WIDTH-1):0] disp_R;

    output [(WIDTH-1):0] disp_L_out;
    output [(WIDTH-1):0] disp_R_out;
    output valid_out;

    wire wr_en_Med_inst1;
    wire rd_en_Med_inst1;
    wire [63:0] BWEB_Med_inst1;
    wire [10:0]  wr_addr_Med_inst1;
    wire [10:0]  rd_addr_Med_inst1;

	wire [63:0] Q_MedianFilterRam_2;
	wire [63:0] D_MedianFilterRam_1;

 sram_1920x64_dp_bit_en RAM1920x64_Median(
        .clk_a(clk),
        .addr_a(wr_addr_Med_inst1),
        .din_a(D_MedianFilterRam_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Med_inst1),
        .bit_en_a(BWEB_Med_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Med_inst1),
        .din_b(64'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .bit_en_b(64'd0),
        .dout_b(Q_MedianFilterRam_2)
    );
 
 MedianDisp#(WIDTH) MedianDisp_inst(
	.clk(clk),
	.rst(rst),
	.clken(clken),
    .width(width),
    .disp_L(disp_L),
    .disp_R(disp_R),
    .valid_in(valid_in),

    .wr_en_Med_inst1(wr_en_Med_inst1),
    .rd_en_Med_inst1(rd_en_Med_inst1),
    .BWEB_Med_inst1(BWEB_Med_inst1),
    .wr_addr_Med_inst1(wr_addr_Med_inst1),
    .rd_addr_Med_inst1(rd_addr_Med_inst1),
    //data
    .Q_MedianFilterRam_2(Q_MedianFilterRam_2),
    .D_MedianFilterRam_1(D_MedianFilterRam_1),
    //final output
	.disp_L_out(disp_L_out),
	.disp_R_out(disp_R_out),
	.valid_out(valid_out)
);



    endmodule
