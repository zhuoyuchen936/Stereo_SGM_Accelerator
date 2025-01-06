module MedianDisp(
	clk,
	rst,
	clken,
	valid_in,
    width,

    disp_L,
    disp_R,

    Q_MedianFilterRam_2,
    D_MedianFilterRam_1,
    wr_en_Med_inst1,
    rd_en_Med_inst1,
    BWEB_Med_inst1,
    wr_addr_Med_inst1,
    rd_addr_Med_inst1,

    disp_L_out,
    disp_R_out,
	valid_out
);

    parameter WIDTH=16;
    input  clk;
	input  rst;
	input  clken;
	input  valid_in;
    input  [10:0] width;

    input  [(WIDTH-1):0] disp_L;
    input  [(WIDTH-1):0] disp_R;

    input  [(WIDTH*4-1):0] Q_MedianFilterRam_2;
    output [(WIDTH*4-1):0] D_MedianFilterRam_1;
    output wr_en_Med_inst1;
    output rd_en_Med_inst1;
    output [(WIDTH*4-1):0] BWEB_Med_inst1;
    output [10:0] wr_addr_Med_inst1;
    output [10:0] rd_addr_Med_inst1;

    output [(WIDTH-1):0] disp_L_out;
    output [(WIDTH-1):0] disp_R_out;
	output reg valid_out;

//wr_en
wire wr_en_Med1_inst1;
wire wr_en_Med2_inst1;

//valid
wire [1:0]valid_Med_inst1;

wire [WIDTH*2-1:0]BWEB_Med_inst1_1;
wire [WIDTH*2-1:0]BWEB_Med_inst1_2;

assign wr_en_Med_inst1 = wr_en_Med1_inst1;

assign BWEB_Med_inst1_1  = wr_en_Med1_inst1 ?{WIDTH*2{1'b1}}:{WIDTH*2{1'b0}};
assign BWEB_Med_inst1_2  = wr_en_Med2_inst1 ?{WIDTH*2{1'b1}}:{WIDTH*2{1'b0}};

assign BWEB_Med_inst1={BWEB_Med_inst1_1,BWEB_Med_inst1_2};
wire [WIDTH*2-1:0] D_Med;

assign D_Med = valid_Med_inst1[0] ? Q_MedianFilterRam_2[63:32]: {WIDTH*2{1'b0}};
assign D_MedianFilterRam_1={disp_L,disp_R,D_Med};

 SRAM_control_MedianDisp#((WIDTH*4),11) Medcontrol_inst1(
        .clk(clk),
        .rst(rst),
        .clken(clken & valid_in),
        .width(width),

        .en2(clken & valid_Med_inst1[0]),
 
        .wr_en_1(wr_en_Med1_inst1),
        .wr_en_2(wr_en_Med2_inst1),
 
        .rd_en(rd_en_Med_inst1),
        .wr_addr(wr_addr_Med_inst1),
        .rd_addr(rd_addr_Med_inst1),
 
        .valid_1(valid_Med_inst1[0]),
        .valid_2(valid_Med_inst1[1])
   ); 

    wire [(WIDTH*2-1):0] pixel[2:0];
    assign pixel[0]={disp_L,disp_R};
    assign pixel[1]=valid_Med_inst1[0]? Q_MedianFilterRam_2[31:0] : {WIDTH*2{1'b0}};
    assign pixel[2]=valid_Med_inst1[1]? Q_MedianFilterRam_2[63:32] : {WIDTH*2{1'b0}};

    reg [(WIDTH*2-1):0]pixel0_reg1,pixel0_reg2;
    reg [(WIDTH*2-1):0]pixel1_reg1,pixel1_reg2;
    reg [(WIDTH*2-1):0]pixel2_reg1,pixel2_reg2;

    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            pixel0_reg1<={WIDTH*2{1'b0}};
            pixel0_reg2<={WIDTH*2{1'b0}};
            pixel1_reg1<={WIDTH*2{1'b0}};
            pixel1_reg2<={WIDTH*2{1'b0}};
            pixel2_reg1<={WIDTH*2{1'b0}};
            pixel2_reg2<={WIDTH*2{1'b0}};
        end
        else if(clken)begin
            pixel0_reg1<=pixel[0];
            pixel0_reg2<=pixel0_reg1;
            pixel1_reg1<=pixel[1];
            pixel1_reg2<=pixel1_reg1;
            pixel2_reg1<=pixel[2];
            pixel2_reg2<=pixel2_reg1;
        end
    end

    MedianDisp3x3 median_dispL(
        .din_1(pixel[0][WIDTH*2-1:WIDTH]),
        .din_2(pixel0_reg1[WIDTH*2-1:WIDTH]),
        .din_3(pixel0_reg2[WIDTH*2-1:WIDTH]),
        .din_4(pixel[1][WIDTH*2-1:WIDTH]),
        .din_5(pixel1_reg1[WIDTH*2-1:WIDTH]),
        .din_6(pixel1_reg2[WIDTH*2-1:WIDTH]),
        .din_7(pixel[2][WIDTH*2-1:WIDTH]),
        .din_8(pixel2_reg1[WIDTH*2-1:WIDTH]),
        .din_9(pixel2_reg2[WIDTH*2-1:WIDTH]),

        .dout(disp_L_out)
    );

 MedianDisp3x3 median_dispR(
        .din_1(pixel[0][WIDTH-1:0]),
        .din_2(pixel0_reg1[WIDTH-1:0]),
        .din_3(pixel0_reg2[WIDTH-1:0]),
        .din_4(pixel[1][WIDTH-1:0]),
        .din_5(pixel1_reg1[WIDTH-1:0]),
        .din_6(pixel1_reg2[WIDTH-1:0]),
        .din_7(pixel[2][WIDTH-1:0]),
        .din_8(pixel2_reg1[WIDTH-1:0]),
        .din_9(pixel2_reg2[WIDTH-1:0]),

        .dout(disp_R_out)
    );

always@(posedge clk or negedge rst)begin
        if(!rst)begin
            valid_out<=1'b0;
        end
        else if(clken)begin
            valid_out<=valid_Med_inst1[1];
        end
    end


    endmodule
