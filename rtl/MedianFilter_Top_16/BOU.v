module BOU (
    clk,
    rst,
    clken,
    Midele,
    i_pixel_0,
    i_pixel_1,
    i_pixel_2,
    i_pixel_3,
    i_pixel_4,
    i_pixel_5,
    i_pixel_6,
    i_pixel_7,
    i_pixel_8,
    i_pixel_9,
    i_pixel_10,

    
    pre_sum,

     o_pixel_0,
     o_pixel_1,
     o_pixel_2,
     o_pixel_3,
     o_pixel_4,
     o_pixel_5,
     o_pixel_6,
     o_pixel_7,
     o_pixel_8,
     o_pixel_9,
     o_pixel_10,


     post_sum,
     valid
);

parameter bitlv = 7;
parameter WIDTH=9;
    input clk;
    input rst;
    input clken;
    input [5:0] Midele;

    input [(WIDTH*11+10):0]i_pixel_0;
    input [(WIDTH*11+10):0]i_pixel_1;
    input [(WIDTH*11+10):0]i_pixel_2;
    input [(WIDTH*11+10):0]i_pixel_3;
    input [(WIDTH*11+10):0]i_pixel_4;
    input [(WIDTH*11+10):0]i_pixel_5;
    input [(WIDTH*11+10):0]i_pixel_6;
    input [(WIDTH*11+10):0]i_pixel_7;
    input [(WIDTH*11+10):0]i_pixel_8;
    input [(WIDTH*11+10):0]i_pixel_9;
    input [(WIDTH*11+10):0]i_pixel_10;

    
    input [6:0] pre_sum;

    output [(WIDTH*11+10):0]o_pixel_0;
    output [(WIDTH*11+10):0]o_pixel_1;
    output [(WIDTH*11+10):0]o_pixel_2;
    output [(WIDTH*11+10):0]o_pixel_3;
    output [(WIDTH*11+10):0]o_pixel_4;
    output [(WIDTH*11+10):0]o_pixel_5;
    output [(WIDTH*11+10):0]o_pixel_6;
    output [(WIDTH*11+10):0]o_pixel_7;
    output [(WIDTH*11+10):0]o_pixel_8;
    output [(WIDTH*11+10):0]o_pixel_9;
    output [(WIDTH*11+10):0]o_pixel_10;


    output reg [6:0] post_sum;
    output reg valid;
wire [WIDTH:0] i_pixel_0_d[10:0];
wire [WIDTH:0] i_pixel_1_d[10:0];
wire [WIDTH:0] i_pixel_2_d[10:0];
wire [WIDTH:0] i_pixel_3_d[10:0];
wire [WIDTH:0] i_pixel_4_d[10:0];
wire [WIDTH:0] i_pixel_5_d[10:0];
wire [WIDTH:0] i_pixel_6_d[10:0];
wire [WIDTH:0] i_pixel_7_d[10:0];
wire [WIDTH:0] i_pixel_8_d[10:0];
wire [WIDTH:0] i_pixel_9_d[10:0];
wire [WIDTH:0] i_pixel_10_d[10:0];

genvar i;
		generate for(i=0;i<11;i=i+1) begin: i_pixel_loop
				assign  i_pixel_0_d[i]=i_pixel_0[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_1_d[i]=i_pixel_1[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_2_d[i]=i_pixel_2[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_3_d[i]=i_pixel_3[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_4_d[i]=i_pixel_4[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_5_d[i]=i_pixel_5[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_6_d[i]=i_pixel_6[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_7_d[i]=i_pixel_7[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_8_d[i]=i_pixel_8[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_9_d[i]=i_pixel_9[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
				assign  i_pixel_10_d[i]=i_pixel_10[((WIDTH+1)*i+WIDTH):(WIDTH+1)*i];
			end
		endgenerate	



 reg [WIDTH:0] o_pixel_0_0,o_pixel_0_1,o_pixel_0_2,o_pixel_0_3,o_pixel_0_4,o_pixel_0_5,o_pixel_0_6,o_pixel_0_7,o_pixel_0_8,o_pixel_0_9,o_pixel_0_10;
 reg [WIDTH:0] o_pixel_1_0,o_pixel_1_1,o_pixel_1_2,o_pixel_1_3,o_pixel_1_4,o_pixel_1_5,o_pixel_1_6,o_pixel_1_7,o_pixel_1_8,o_pixel_1_9,o_pixel_1_10;
 reg [WIDTH:0] o_pixel_2_0,o_pixel_2_1,o_pixel_2_2,o_pixel_2_3,o_pixel_2_4,o_pixel_2_5,o_pixel_2_6,o_pixel_2_7,o_pixel_2_8,o_pixel_2_9,o_pixel_2_10;
 reg [WIDTH:0] o_pixel_3_0,o_pixel_3_1,o_pixel_3_2,o_pixel_3_3,o_pixel_3_4,o_pixel_3_5,o_pixel_3_6,o_pixel_3_7,o_pixel_3_8,o_pixel_3_9,o_pixel_3_10;
 reg [WIDTH:0] o_pixel_4_0,o_pixel_4_1,o_pixel_4_2,o_pixel_4_3,o_pixel_4_4,o_pixel_4_5,o_pixel_4_6,o_pixel_4_7,o_pixel_4_8,o_pixel_4_9,o_pixel_4_10;
 reg [WIDTH:0] o_pixel_5_0,o_pixel_5_1,o_pixel_5_2,o_pixel_5_3,o_pixel_5_4,o_pixel_5_5,o_pixel_5_6,o_pixel_5_7,o_pixel_5_8,o_pixel_5_9,o_pixel_5_10;
 reg [WIDTH:0] o_pixel_6_0,o_pixel_6_1,o_pixel_6_2,o_pixel_6_3,o_pixel_6_4,o_pixel_6_5,o_pixel_6_6,o_pixel_6_7,o_pixel_6_8,o_pixel_6_9,o_pixel_6_10;
 reg [WIDTH:0] o_pixel_7_0,o_pixel_7_1,o_pixel_7_2,o_pixel_7_3,o_pixel_7_4,o_pixel_7_5,o_pixel_7_6,o_pixel_7_7,o_pixel_7_8,o_pixel_7_9,o_pixel_7_10;
 reg [WIDTH:0] o_pixel_8_0,o_pixel_8_1,o_pixel_8_2,o_pixel_8_3,o_pixel_8_4,o_pixel_8_5,o_pixel_8_6,o_pixel_8_7,o_pixel_8_8,o_pixel_8_9,o_pixel_8_10;
 reg [WIDTH:0] o_pixel_9_0,o_pixel_9_1,o_pixel_9_2,o_pixel_9_3,o_pixel_9_4,o_pixel_9_5,o_pixel_9_6,o_pixel_9_7,o_pixel_9_8,o_pixel_9_9,o_pixel_9_10;
 reg [WIDTH:0] o_pixel_10_0,o_pixel_10_1,o_pixel_10_2,o_pixel_10_3,o_pixel_10_4,o_pixel_10_5,o_pixel_10_6,o_pixel_10_7,o_pixel_10_8,o_pixel_10_9,o_pixel_10_10;



wire [6:0] sum0 = (i_pixel_0_d[0][bitlv]&i_pixel_0_d[0][WIDTH])+(i_pixel_0_d[1][bitlv]&i_pixel_0_d[1][WIDTH])+(i_pixel_0_d[2][bitlv]&i_pixel_0_d[2][WIDTH])+(i_pixel_0_d[3][bitlv]&i_pixel_0_d[3][WIDTH])+(i_pixel_0_d[4][bitlv]&i_pixel_0_d[4][WIDTH])+(i_pixel_0_d[5][bitlv]&i_pixel_0_d[5][WIDTH])+(i_pixel_0_d[6][bitlv]&i_pixel_0_d[6][WIDTH])+(i_pixel_0_d[7][bitlv]&i_pixel_0_d[7][WIDTH])+(i_pixel_0_d[8][bitlv]&i_pixel_0_d[8][WIDTH])+(i_pixel_0_d[9][bitlv]&i_pixel_0_d[9][WIDTH])+(i_pixel_0_d[10][bitlv]&i_pixel_0_d[10][WIDTH])+
            (i_pixel_1_d[0][bitlv]&i_pixel_1_d[0][WIDTH])+(i_pixel_1_d[1][bitlv]&i_pixel_1_d[1][WIDTH])+(i_pixel_1_d[2][bitlv]&i_pixel_1_d[2][WIDTH])+(i_pixel_1_d[3][bitlv]&i_pixel_1_d[3][WIDTH])+(i_pixel_1_d[4][bitlv]&i_pixel_1_d[4][WIDTH])+(i_pixel_1_d[5][bitlv]&i_pixel_1_d[5][WIDTH])+(i_pixel_1_d[6][bitlv]&i_pixel_1_d[6][WIDTH])+(i_pixel_1_d[7][bitlv]&i_pixel_1_d[7][WIDTH])+(i_pixel_1_d[8][bitlv]&i_pixel_1_d[8][WIDTH])+(i_pixel_1_d[9][bitlv]&i_pixel_1_d[9][WIDTH])+(i_pixel_1_d[10][bitlv]&i_pixel_1_d[10][WIDTH])+
            (i_pixel_2_d[0][bitlv]&i_pixel_2_d[0][WIDTH])+(i_pixel_2_d[1][bitlv]&i_pixel_2_d[1][WIDTH])+(i_pixel_2_d[2][bitlv]&i_pixel_2_d[2][WIDTH])+(i_pixel_2_d[3][bitlv]&i_pixel_2_d[3][WIDTH])+(i_pixel_2_d[4][bitlv]&i_pixel_2_d[4][WIDTH])+(i_pixel_2_d[5][bitlv]&i_pixel_2_d[5][WIDTH])+(i_pixel_2_d[6][bitlv]&i_pixel_2_d[6][WIDTH])+(i_pixel_2_d[7][bitlv]&i_pixel_2_d[7][WIDTH])+(i_pixel_2_d[8][bitlv]&i_pixel_2_d[8][WIDTH])+(i_pixel_2_d[9][bitlv]&i_pixel_2_d[9][WIDTH])+(i_pixel_2_d[10][bitlv]&i_pixel_2_d[10][WIDTH])+
            (i_pixel_3_d[0][bitlv]&i_pixel_3_d[0][WIDTH])+(i_pixel_3_d[1][bitlv]&i_pixel_3_d[1][WIDTH])+(i_pixel_3_d[2][bitlv]&i_pixel_3_d[2][WIDTH])+(i_pixel_3_d[3][bitlv]&i_pixel_3_d[3][WIDTH])+(i_pixel_3_d[4][bitlv]&i_pixel_3_d[4][WIDTH])+(i_pixel_3_d[5][bitlv]&i_pixel_3_d[5][WIDTH])+(i_pixel_3_d[6][bitlv]&i_pixel_3_d[6][WIDTH])+(i_pixel_3_d[7][bitlv]&i_pixel_3_d[7][WIDTH])+(i_pixel_3_d[8][bitlv]&i_pixel_3_d[8][WIDTH])+(i_pixel_3_d[9][bitlv]&i_pixel_3_d[9][WIDTH])+(i_pixel_3_d[10][bitlv]&i_pixel_3_d[10][WIDTH])+
            (i_pixel_4_d[0][bitlv]&i_pixel_4_d[0][WIDTH])+(i_pixel_4_d[1][bitlv]&i_pixel_4_d[1][WIDTH])+(i_pixel_4_d[2][bitlv]&i_pixel_4_d[2][WIDTH])+(i_pixel_4_d[3][bitlv]&i_pixel_4_d[3][WIDTH])+(i_pixel_4_d[4][bitlv]&i_pixel_4_d[4][WIDTH])+(i_pixel_4_d[5][bitlv]&i_pixel_4_d[5][WIDTH])+(i_pixel_4_d[6][bitlv]&i_pixel_4_d[6][WIDTH])+(i_pixel_4_d[7][bitlv]&i_pixel_4_d[7][WIDTH])+(i_pixel_4_d[8][bitlv]&i_pixel_4_d[8][WIDTH])+(i_pixel_4_d[9][bitlv]&i_pixel_4_d[9][WIDTH])+(i_pixel_4_d[10][bitlv]&i_pixel_4_d[10][WIDTH])+
            (i_pixel_5_d[0][bitlv]&i_pixel_5_d[0][WIDTH])+(i_pixel_5_d[1][bitlv]&i_pixel_5_d[1][WIDTH])+(i_pixel_5_d[2][bitlv]&i_pixel_5_d[2][WIDTH])+(i_pixel_5_d[3][bitlv]&i_pixel_5_d[3][WIDTH])+(i_pixel_5_d[4][bitlv]&i_pixel_5_d[4][WIDTH])+(i_pixel_5_d[5][bitlv]&i_pixel_5_d[5][WIDTH])+(i_pixel_5_d[6][bitlv]&i_pixel_5_d[6][WIDTH])+(i_pixel_5_d[7][bitlv]&i_pixel_5_d[7][WIDTH])+(i_pixel_5_d[8][bitlv]&i_pixel_5_d[8][WIDTH])+(i_pixel_5_d[9][bitlv]&i_pixel_5_d[9][WIDTH])+(i_pixel_5_d[10][bitlv]&i_pixel_5_d[10][WIDTH])+
            (i_pixel_6_d[0][bitlv]&i_pixel_6_d[0][WIDTH])+(i_pixel_6_d[1][bitlv]&i_pixel_6_d[1][WIDTH])+(i_pixel_6_d[2][bitlv]&i_pixel_6_d[2][WIDTH])+(i_pixel_6_d[3][bitlv]&i_pixel_6_d[3][WIDTH])+(i_pixel_6_d[4][bitlv]&i_pixel_6_d[4][WIDTH])+(i_pixel_6_d[5][bitlv]&i_pixel_6_d[5][WIDTH])+(i_pixel_6_d[6][bitlv]&i_pixel_6_d[6][WIDTH])+(i_pixel_6_d[7][bitlv]&i_pixel_6_d[7][WIDTH])+(i_pixel_6_d[8][bitlv]&i_pixel_6_d[8][WIDTH])+(i_pixel_6_d[9][bitlv]&i_pixel_6_d[9][WIDTH])+(i_pixel_6_d[10][bitlv]&i_pixel_6_d[10][WIDTH])+
            (i_pixel_7_d[0][bitlv]&i_pixel_7_d[0][WIDTH])+(i_pixel_7_d[1][bitlv]&i_pixel_7_d[1][WIDTH])+(i_pixel_7_d[2][bitlv]&i_pixel_7_d[2][WIDTH])+(i_pixel_7_d[3][bitlv]&i_pixel_7_d[3][WIDTH])+(i_pixel_7_d[4][bitlv]&i_pixel_7_d[4][WIDTH])+(i_pixel_7_d[5][bitlv]&i_pixel_7_d[5][WIDTH])+(i_pixel_7_d[6][bitlv]&i_pixel_7_d[6][WIDTH])+(i_pixel_7_d[7][bitlv]&i_pixel_7_d[7][WIDTH])+(i_pixel_7_d[8][bitlv]&i_pixel_7_d[8][WIDTH])+(i_pixel_7_d[9][bitlv]&i_pixel_7_d[9][WIDTH])+(i_pixel_7_d[10][bitlv]&i_pixel_7_d[10][WIDTH])+
            (i_pixel_8_d[0][bitlv]&i_pixel_8_d[0][WIDTH])+(i_pixel_8_d[1][bitlv]&i_pixel_8_d[1][WIDTH])+(i_pixel_8_d[2][bitlv]&i_pixel_8_d[2][WIDTH])+(i_pixel_8_d[3][bitlv]&i_pixel_8_d[3][WIDTH])+(i_pixel_8_d[4][bitlv]&i_pixel_8_d[4][WIDTH])+(i_pixel_8_d[5][bitlv]&i_pixel_8_d[5][WIDTH])+(i_pixel_8_d[6][bitlv]&i_pixel_8_d[6][WIDTH])+(i_pixel_8_d[7][bitlv]&i_pixel_8_d[7][WIDTH])+(i_pixel_8_d[8][bitlv]&i_pixel_8_d[8][WIDTH])+(i_pixel_8_d[9][bitlv]&i_pixel_8_d[9][WIDTH])+(i_pixel_8_d[10][bitlv]&i_pixel_8_d[10][WIDTH])+
            (i_pixel_9_d[0][bitlv]&i_pixel_9_d[0][WIDTH])+(i_pixel_9_d[1][bitlv]&i_pixel_9_d[1][WIDTH])+(i_pixel_9_d[2][bitlv]&i_pixel_9_d[2][WIDTH])+(i_pixel_9_d[3][bitlv]&i_pixel_9_d[3][WIDTH])+(i_pixel_9_d[4][bitlv]&i_pixel_9_d[4][WIDTH])+(i_pixel_9_d[5][bitlv]&i_pixel_9_d[5][WIDTH])+(i_pixel_9_d[6][bitlv]&i_pixel_9_d[6][WIDTH])+(i_pixel_9_d[7][bitlv]&i_pixel_9_d[7][WIDTH])+(i_pixel_9_d[8][bitlv]&i_pixel_9_d[8][WIDTH])+(i_pixel_9_d[9][bitlv]&i_pixel_9_d[9][WIDTH])+(i_pixel_9_d[10][bitlv]&i_pixel_9_d[10][WIDTH])+
            (i_pixel_10_d[0][bitlv]&i_pixel_10_d[0][WIDTH])+(i_pixel_10_d[1][bitlv]&i_pixel_10_d[1][WIDTH])+(i_pixel_10_d[2][bitlv]&i_pixel_10_d[2][WIDTH])+(i_pixel_10_d[3][bitlv]&i_pixel_10_d[3][WIDTH])+(i_pixel_10_d[4][bitlv]&i_pixel_10_d[4][WIDTH])+(i_pixel_10_d[5][bitlv]&i_pixel_10_d[5][WIDTH])+(i_pixel_10_d[6][bitlv]&i_pixel_10_d[6][WIDTH])+(i_pixel_10_d[7][bitlv]&i_pixel_10_d[7][WIDTH])+(i_pixel_10_d[8][bitlv]&i_pixel_10_d[8][WIDTH])+(i_pixel_10_d[9][bitlv]&i_pixel_10_d[9][WIDTH])+(i_pixel_10_d[10][bitlv]&i_pixel_10_d[10][WIDTH]);

wire [6:0] w_post_sum = (sum0+pre_sum) < Midele ? (sum0+pre_sum) : pre_sum;
wire en_flag = (sum0+pre_sum) < Midele ? 1'b1:1'b0;                         //因为后面用的异或
always @(posedge clk or negedge rst) begin
    if (!rst) begin
	valid <= 0;
        post_sum <= 7'd0;
    end
    else if(clken)begin
        post_sum <= w_post_sum;
	valid <= 1;
    end
    else begin
	post_sum <= post_sum;
	valid <= valid;
    end
end


always @(posedge clk or negedge rst ) begin
    if (!rst) begin
        o_pixel_0_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_0 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_0<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_1 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_1<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_2 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_2<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_3 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_3<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_4 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_4<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_1_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_5 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_5<= {1'b1,{WIDTH{1'b0}}};o_pixel_0_5 <= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_6 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_6<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_7 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_7<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_8 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_8<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_1_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_2_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_3_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_4_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_5_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_6_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_7_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_8_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_9_9 <= {1'b1,{WIDTH{1'b0}}};o_pixel_10_9<= {1'b1,{WIDTH{1'b0}}};
        o_pixel_0_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_1_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_2_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_3_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_4_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_5_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_6_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_7_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_8_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_9_10 <={1'b1,{WIDTH{1'b0}}};o_pixel_10_10<={1'b1,{WIDTH{1'b0}}};
    end
    else if (clken)begin

        o_pixel_0_0 <= {(i_pixel_0_d[0 ][WIDTH]&(i_pixel_0_d[0 ][bitlv]^en_flag)),  i_pixel_0_d[0 ][(WIDTH-1):0]};
        o_pixel_1_0 <= {(i_pixel_1_d[0 ][WIDTH]&(i_pixel_1_d[0 ][bitlv]^en_flag)),  i_pixel_1_d[0 ][(WIDTH-1):0]};
        o_pixel_2_0 <= {(i_pixel_2_d[0 ][WIDTH]&(i_pixel_2_d[0 ][bitlv]^en_flag)),  i_pixel_2_d[0 ][(WIDTH-1):0]};
        o_pixel_3_0 <= {(i_pixel_3_d[0 ][WIDTH]&(i_pixel_3_d[0 ][bitlv]^en_flag)),  i_pixel_3_d[0 ][(WIDTH-1):0]};
        o_pixel_4_0 <= {(i_pixel_4_d[0 ][WIDTH]&(i_pixel_4_d[0 ][bitlv]^en_flag)),  i_pixel_4_d[0 ][(WIDTH-1):0]};
        o_pixel_5_0 <= {(i_pixel_5_d[0 ][WIDTH]&(i_pixel_5_d[0 ][bitlv]^en_flag)),  i_pixel_5_d[0 ][(WIDTH-1):0]};
        o_pixel_6_0 <= {(i_pixel_6_d[0 ][WIDTH]&(i_pixel_6_d[0 ][bitlv]^en_flag)),  i_pixel_6_d[0 ][(WIDTH-1):0]};
        o_pixel_7_0 <= {(i_pixel_7_d[0 ][WIDTH]&(i_pixel_7_d[0 ][bitlv]^en_flag)),  i_pixel_7_d[0 ][(WIDTH-1):0]};
        o_pixel_8_0 <= {(i_pixel_8_d[0 ][WIDTH]&(i_pixel_8_d[0 ][bitlv]^en_flag)),  i_pixel_8_d[0 ][(WIDTH-1):0]};
        o_pixel_9_0 <= {(i_pixel_9_d[0 ][WIDTH]&(i_pixel_9_d[0 ][bitlv]^en_flag)),  i_pixel_9_d[0 ][(WIDTH-1):0]};
        o_pixel_10_0<= {(i_pixel_10_d[0][WIDTH]&(i_pixel_10_d[0][bitlv]^en_flag)),  i_pixel_10_d[0][(WIDTH-1):0]};
        o_pixel_0_1 <= {(i_pixel_0_d[1 ][WIDTH]&(i_pixel_0_d[1 ][bitlv]^en_flag)),  i_pixel_0_d[1 ][(WIDTH-1):0]};
        o_pixel_1_1 <= {(i_pixel_1_d[1 ][WIDTH]&(i_pixel_1_d[1 ][bitlv]^en_flag)),  i_pixel_1_d[1 ][(WIDTH-1):0]};
        o_pixel_2_1 <= {(i_pixel_2_d[1 ][WIDTH]&(i_pixel_2_d[1 ][bitlv]^en_flag)),  i_pixel_2_d[1 ][(WIDTH-1):0]};
        o_pixel_3_1 <= {(i_pixel_3_d[1 ][WIDTH]&(i_pixel_3_d[1 ][bitlv]^en_flag)),  i_pixel_3_d[1 ][(WIDTH-1):0]};
        o_pixel_4_1 <= {(i_pixel_4_d[1 ][WIDTH]&(i_pixel_4_d[1 ][bitlv]^en_flag)),  i_pixel_4_d[1 ][(WIDTH-1):0]};
        o_pixel_5_1 <= {(i_pixel_5_d[1 ][WIDTH]&(i_pixel_5_d[1 ][bitlv]^en_flag)),  i_pixel_5_d[1 ][(WIDTH-1):0]};
        o_pixel_6_1 <= {(i_pixel_6_d[1 ][WIDTH]&(i_pixel_6_d[1 ][bitlv]^en_flag)),  i_pixel_6_d[1 ][(WIDTH-1):0]};
        o_pixel_7_1 <= {(i_pixel_7_d[1 ][WIDTH]&(i_pixel_7_d[1 ][bitlv]^en_flag)),  i_pixel_7_d[1 ][(WIDTH-1):0]};
        o_pixel_8_1 <= {(i_pixel_8_d[1 ][WIDTH]&(i_pixel_8_d[1 ][bitlv]^en_flag)),  i_pixel_8_d[1 ][(WIDTH-1):0]};
        o_pixel_9_1 <= {(i_pixel_9_d[1 ][WIDTH]&(i_pixel_9_d[1 ][bitlv]^en_flag)),  i_pixel_9_d[1 ][(WIDTH-1):0]};
        o_pixel_10_1<= {(i_pixel_10_d[1][WIDTH]&(i_pixel_10_d[1][bitlv]^en_flag)),  i_pixel_10_d[1][(WIDTH-1):0]};
        o_pixel_0_2 <= {(i_pixel_0_d[2 ][WIDTH]&(i_pixel_0_d[2 ][bitlv]^en_flag)),  i_pixel_0_d[2 ][(WIDTH-1):0]};
        o_pixel_1_2 <= {(i_pixel_1_d[2 ][WIDTH]&(i_pixel_1_d[2 ][bitlv]^en_flag)),  i_pixel_1_d[2 ][(WIDTH-1):0]};
        o_pixel_2_2 <= {(i_pixel_2_d[2 ][WIDTH]&(i_pixel_2_d[2 ][bitlv]^en_flag)),  i_pixel_2_d[2 ][(WIDTH-1):0]};
        o_pixel_3_2 <= {(i_pixel_3_d[2 ][WIDTH]&(i_pixel_3_d[2 ][bitlv]^en_flag)),  i_pixel_3_d[2 ][(WIDTH-1):0]};
        o_pixel_4_2 <= {(i_pixel_4_d[2 ][WIDTH]&(i_pixel_4_d[2 ][bitlv]^en_flag)),  i_pixel_4_d[2 ][(WIDTH-1):0]};
        o_pixel_5_2 <= {(i_pixel_5_d[2 ][WIDTH]&(i_pixel_5_d[2 ][bitlv]^en_flag)),  i_pixel_5_d[2 ][(WIDTH-1):0]};
        o_pixel_6_2 <= {(i_pixel_6_d[2 ][WIDTH]&(i_pixel_6_d[2 ][bitlv]^en_flag)),  i_pixel_6_d[2 ][(WIDTH-1):0]};
        o_pixel_7_2 <= {(i_pixel_7_d[2 ][WIDTH]&(i_pixel_7_d[2 ][bitlv]^en_flag)),  i_pixel_7_d[2 ][(WIDTH-1):0]};
        o_pixel_8_2 <= {(i_pixel_8_d[2 ][WIDTH]&(i_pixel_8_d[2 ][bitlv]^en_flag)),  i_pixel_8_d[2 ][(WIDTH-1):0]};
        o_pixel_9_2 <= {(i_pixel_9_d[2 ][WIDTH]&(i_pixel_9_d[2 ][bitlv]^en_flag)),  i_pixel_9_d[2 ][(WIDTH-1):0]};
        o_pixel_10_2<= {(i_pixel_10_d[2][WIDTH]&(i_pixel_10_d[2][bitlv]^en_flag)),  i_pixel_10_d[2][(WIDTH-1):0]};
        o_pixel_0_3 <= {(i_pixel_0_d[3 ][WIDTH]&(i_pixel_0_d[3 ][bitlv]^en_flag)),  i_pixel_0_d[3 ][(WIDTH-1):0]};
        o_pixel_1_3 <= {(i_pixel_1_d[3 ][WIDTH]&(i_pixel_1_d[3 ][bitlv]^en_flag)),  i_pixel_1_d[3 ][(WIDTH-1):0]};
        o_pixel_2_3 <= {(i_pixel_2_d[3 ][WIDTH]&(i_pixel_2_d[3 ][bitlv]^en_flag)),  i_pixel_2_d[3 ][(WIDTH-1):0]};
        o_pixel_3_3 <= {(i_pixel_3_d[3 ][WIDTH]&(i_pixel_3_d[3 ][bitlv]^en_flag)),  i_pixel_3_d[3 ][(WIDTH-1):0]};
        o_pixel_4_3 <= {(i_pixel_4_d[3 ][WIDTH]&(i_pixel_4_d[3 ][bitlv]^en_flag)),  i_pixel_4_d[3 ][(WIDTH-1):0]};
        o_pixel_5_3 <= {(i_pixel_5_d[3 ][WIDTH]&(i_pixel_5_d[3 ][bitlv]^en_flag)),  i_pixel_5_d[3 ][(WIDTH-1):0]};
        o_pixel_6_3 <= {(i_pixel_6_d[3 ][WIDTH]&(i_pixel_6_d[3 ][bitlv]^en_flag)),  i_pixel_6_d[3 ][(WIDTH-1):0]};
        o_pixel_7_3 <= {(i_pixel_7_d[3 ][WIDTH]&(i_pixel_7_d[3 ][bitlv]^en_flag)),  i_pixel_7_d[3 ][(WIDTH-1):0]};
        o_pixel_8_3 <= {(i_pixel_8_d[3 ][WIDTH]&(i_pixel_8_d[3 ][bitlv]^en_flag)),  i_pixel_8_d[3 ][(WIDTH-1):0]};
        o_pixel_9_3 <= {(i_pixel_9_d[3 ][WIDTH]&(i_pixel_9_d[3 ][bitlv]^en_flag)),  i_pixel_9_d[3 ][(WIDTH-1):0]};
        o_pixel_10_3<= {(i_pixel_10_d[3][WIDTH]&(i_pixel_10_d[3][bitlv]^en_flag)),  i_pixel_10_d[3][(WIDTH-1):0]};
        o_pixel_0_4 <= {(i_pixel_0_d[4 ][WIDTH]&(i_pixel_0_d[4 ][bitlv]^en_flag)),  i_pixel_0_d[4 ][(WIDTH-1):0]};
        o_pixel_1_4 <= {(i_pixel_1_d[4 ][WIDTH]&(i_pixel_1_d[4 ][bitlv]^en_flag)),  i_pixel_1_d[4 ][(WIDTH-1):0]};
        o_pixel_2_4 <= {(i_pixel_2_d[4 ][WIDTH]&(i_pixel_2_d[4 ][bitlv]^en_flag)),  i_pixel_2_d[4 ][(WIDTH-1):0]};
        o_pixel_3_4 <= {(i_pixel_3_d[4 ][WIDTH]&(i_pixel_3_d[4 ][bitlv]^en_flag)),  i_pixel_3_d[4 ][(WIDTH-1):0]};
        o_pixel_4_4 <= {(i_pixel_4_d[4 ][WIDTH]&(i_pixel_4_d[4 ][bitlv]^en_flag)),  i_pixel_4_d[4 ][(WIDTH-1):0]};
        o_pixel_5_4 <= {(i_pixel_5_d[4 ][WIDTH]&(i_pixel_5_d[4 ][bitlv]^en_flag)),  i_pixel_5_d[4 ][(WIDTH-1):0]};
        o_pixel_6_4 <= {(i_pixel_6_d[4 ][WIDTH]&(i_pixel_6_d[4 ][bitlv]^en_flag)),  i_pixel_6_d[4 ][(WIDTH-1):0]};
        o_pixel_7_4 <= {(i_pixel_7_d[4 ][WIDTH]&(i_pixel_7_d[4 ][bitlv]^en_flag)),  i_pixel_7_d[4 ][(WIDTH-1):0]};
        o_pixel_8_4 <= {(i_pixel_8_d[4 ][WIDTH]&(i_pixel_8_d[4 ][bitlv]^en_flag)),  i_pixel_8_d[4 ][(WIDTH-1):0]};
        o_pixel_9_4 <= {(i_pixel_9_d[4 ][WIDTH]&(i_pixel_9_d[4 ][bitlv]^en_flag)),  i_pixel_9_d[4 ][(WIDTH-1):0]};
        o_pixel_10_4<= {(i_pixel_10_d[4][WIDTH]&(i_pixel_10_d[4][bitlv]^en_flag)),  i_pixel_10_d[4][(WIDTH-1):0]};
        o_pixel_0_5 <= {(i_pixel_0_d[5 ][WIDTH]&(i_pixel_0_d[5 ][bitlv]^en_flag)),  i_pixel_0_d[5 ][(WIDTH-1):0]};
        o_pixel_1_5 <= {(i_pixel_1_d[5 ][WIDTH]&(i_pixel_1_d[5 ][bitlv]^en_flag)),  i_pixel_1_d[5 ][(WIDTH-1):0]};
        o_pixel_2_5 <= {(i_pixel_2_d[5 ][WIDTH]&(i_pixel_2_d[5 ][bitlv]^en_flag)),  i_pixel_2_d[5 ][(WIDTH-1):0]};
        o_pixel_3_5 <= {(i_pixel_3_d[5 ][WIDTH]&(i_pixel_3_d[5 ][bitlv]^en_flag)),  i_pixel_3_d[5 ][(WIDTH-1):0]};
        o_pixel_4_5 <= {(i_pixel_4_d[5 ][WIDTH]&(i_pixel_4_d[5 ][bitlv]^en_flag)),  i_pixel_4_d[5 ][(WIDTH-1):0]};
        o_pixel_5_5 <= {(i_pixel_5_d[5 ][WIDTH]&(i_pixel_5_d[5 ][bitlv]^en_flag)),  i_pixel_5_d[5 ][(WIDTH-1):0]};
        o_pixel_6_5 <= {(i_pixel_6_d[5 ][WIDTH]&(i_pixel_6_d[5 ][bitlv]^en_flag)),  i_pixel_6_d[5 ][(WIDTH-1):0]};
        o_pixel_7_5 <= {(i_pixel_7_d[5 ][WIDTH]&(i_pixel_7_d[5 ][bitlv]^en_flag)),  i_pixel_7_d[5 ][(WIDTH-1):0]};
        o_pixel_8_5 <= {(i_pixel_8_d[5 ][WIDTH]&(i_pixel_8_d[5 ][bitlv]^en_flag)),  i_pixel_8_d[5 ][(WIDTH-1):0]};
        o_pixel_9_5 <= {(i_pixel_9_d[5 ][WIDTH]&(i_pixel_9_d[5 ][bitlv]^en_flag)),  i_pixel_9_d[5 ][(WIDTH-1):0]};
        o_pixel_10_5<= {(i_pixel_10_d[5][WIDTH]&(i_pixel_10_d[5][bitlv]^en_flag)),  i_pixel_10_d[5][(WIDTH-1):0]};
        o_pixel_0_6 <= {(i_pixel_0_d[6 ][WIDTH]&(i_pixel_0_d[6 ][bitlv]^en_flag)),  i_pixel_0_d[6 ][(WIDTH-1):0]};
        o_pixel_1_6 <= {(i_pixel_1_d[6 ][WIDTH]&(i_pixel_1_d[6 ][bitlv]^en_flag)),  i_pixel_1_d[6 ][(WIDTH-1):0]};
        o_pixel_2_6 <= {(i_pixel_2_d[6 ][WIDTH]&(i_pixel_2_d[6 ][bitlv]^en_flag)),  i_pixel_2_d[6 ][(WIDTH-1):0]};
        o_pixel_3_6 <= {(i_pixel_3_d[6 ][WIDTH]&(i_pixel_3_d[6 ][bitlv]^en_flag)),  i_pixel_3_d[6 ][(WIDTH-1):0]};
        o_pixel_4_6 <= {(i_pixel_4_d[6 ][WIDTH]&(i_pixel_4_d[6 ][bitlv]^en_flag)),  i_pixel_4_d[6 ][(WIDTH-1):0]};
        o_pixel_5_6 <= {(i_pixel_5_d[6 ][WIDTH]&(i_pixel_5_d[6 ][bitlv]^en_flag)),  i_pixel_5_d[6 ][(WIDTH-1):0]};
        o_pixel_6_6 <= {(i_pixel_6_d[6 ][WIDTH]&(i_pixel_6_d[6 ][bitlv]^en_flag)),  i_pixel_6_d[6 ][(WIDTH-1):0]};
        o_pixel_7_6 <= {(i_pixel_7_d[6 ][WIDTH]&(i_pixel_7_d[6 ][bitlv]^en_flag)),  i_pixel_7_d[6 ][(WIDTH-1):0]};
        o_pixel_8_6 <= {(i_pixel_8_d[6 ][WIDTH]&(i_pixel_8_d[6 ][bitlv]^en_flag)),  i_pixel_8_d[6 ][(WIDTH-1):0]};
        o_pixel_9_6 <= {(i_pixel_9_d[6 ][WIDTH]&(i_pixel_9_d[6 ][bitlv]^en_flag)),  i_pixel_9_d[6 ][(WIDTH-1):0]};
        o_pixel_10_6<= {(i_pixel_10_d[6][WIDTH]&(i_pixel_10_d[6][bitlv]^en_flag)),  i_pixel_10_d[6][(WIDTH-1):0]};
        o_pixel_0_7 <= {(i_pixel_0_d[7 ][WIDTH]&(i_pixel_0_d[7 ][bitlv]^en_flag)),  i_pixel_0_d[7 ][(WIDTH-1):0]};
        o_pixel_1_7 <= {(i_pixel_1_d[7 ][WIDTH]&(i_pixel_1_d[7 ][bitlv]^en_flag)),  i_pixel_1_d[7 ][(WIDTH-1):0]};
        o_pixel_2_7 <= {(i_pixel_2_d[7 ][WIDTH]&(i_pixel_2_d[7 ][bitlv]^en_flag)),  i_pixel_2_d[7 ][(WIDTH-1):0]};
        o_pixel_3_7 <= {(i_pixel_3_d[7 ][WIDTH]&(i_pixel_3_d[7 ][bitlv]^en_flag)),  i_pixel_3_d[7 ][(WIDTH-1):0]};
        o_pixel_4_7 <= {(i_pixel_4_d[7 ][WIDTH]&(i_pixel_4_d[7 ][bitlv]^en_flag)),  i_pixel_4_d[7 ][(WIDTH-1):0]};
        o_pixel_5_7 <= {(i_pixel_5_d[7 ][WIDTH]&(i_pixel_5_d[7 ][bitlv]^en_flag)),  i_pixel_5_d[7 ][(WIDTH-1):0]};
        o_pixel_6_7 <= {(i_pixel_6_d[7 ][WIDTH]&(i_pixel_6_d[7 ][bitlv]^en_flag)),  i_pixel_6_d[7 ][(WIDTH-1):0]};
        o_pixel_7_7 <= {(i_pixel_7_d[7 ][WIDTH]&(i_pixel_7_d[7 ][bitlv]^en_flag)),  i_pixel_7_d[7 ][(WIDTH-1):0]};
        o_pixel_8_7 <= {(i_pixel_8_d[7 ][WIDTH]&(i_pixel_8_d[7 ][bitlv]^en_flag)),  i_pixel_8_d[7 ][(WIDTH-1):0]};
        o_pixel_9_7 <= {(i_pixel_9_d[7 ][WIDTH]&(i_pixel_9_d[7 ][bitlv]^en_flag)),  i_pixel_9_d[7 ][(WIDTH-1):0]};
        o_pixel_10_7<= {(i_pixel_10_d[7][WIDTH]&(i_pixel_10_d[7][bitlv]^en_flag)),  i_pixel_10_d[7][(WIDTH-1):0]};
        o_pixel_0_8 <= {(i_pixel_0_d[8 ][WIDTH]&(i_pixel_0_d[8 ][bitlv]^en_flag)),  i_pixel_0_d[8 ][(WIDTH-1):0]};
        o_pixel_1_8 <= {(i_pixel_1_d[8 ][WIDTH]&(i_pixel_1_d[8 ][bitlv]^en_flag)),  i_pixel_1_d[8 ][(WIDTH-1):0]};
        o_pixel_2_8 <= {(i_pixel_2_d[8 ][WIDTH]&(i_pixel_2_d[8 ][bitlv]^en_flag)),  i_pixel_2_d[8 ][(WIDTH-1):0]};
        o_pixel_3_8 <= {(i_pixel_3_d[8 ][WIDTH]&(i_pixel_3_d[8 ][bitlv]^en_flag)),  i_pixel_3_d[8 ][(WIDTH-1):0]};
        o_pixel_4_8 <= {(i_pixel_4_d[8 ][WIDTH]&(i_pixel_4_d[8 ][bitlv]^en_flag)),  i_pixel_4_d[8 ][(WIDTH-1):0]};
        o_pixel_5_8 <= {(i_pixel_5_d[8 ][WIDTH]&(i_pixel_5_d[8 ][bitlv]^en_flag)),  i_pixel_5_d[8 ][(WIDTH-1):0]};
        o_pixel_6_8 <= {(i_pixel_6_d[8 ][WIDTH]&(i_pixel_6_d[8 ][bitlv]^en_flag)),  i_pixel_6_d[8 ][(WIDTH-1):0]};
        o_pixel_7_8 <= {(i_pixel_7_d[8 ][WIDTH]&(i_pixel_7_d[8 ][bitlv]^en_flag)),  i_pixel_7_d[8 ][(WIDTH-1):0]};
        o_pixel_8_8 <= {(i_pixel_8_d[8 ][WIDTH]&(i_pixel_8_d[8 ][bitlv]^en_flag)),  i_pixel_8_d[8 ][(WIDTH-1):0]};
        o_pixel_9_8 <= {(i_pixel_9_d[8 ][WIDTH]&(i_pixel_9_d[8 ][bitlv]^en_flag)),  i_pixel_9_d[8 ][(WIDTH-1):0]};
        o_pixel_10_8<= {(i_pixel_10_d[8][WIDTH]&(i_pixel_10_d[8][bitlv]^en_flag)),  i_pixel_10_d[8][(WIDTH-1):0]};
        o_pixel_0_9 <= {(i_pixel_0_d[9 ][WIDTH]&(i_pixel_0_d[9 ][bitlv]^en_flag)),  i_pixel_0_d[9 ][(WIDTH-1):0]};
        o_pixel_1_9 <= {(i_pixel_1_d[9 ][WIDTH]&(i_pixel_1_d[9 ][bitlv]^en_flag)),  i_pixel_1_d[9 ][(WIDTH-1):0]};
        o_pixel_2_9 <= {(i_pixel_2_d[9 ][WIDTH]&(i_pixel_2_d[9 ][bitlv]^en_flag)),  i_pixel_2_d[9 ][(WIDTH-1):0]};
        o_pixel_3_9 <= {(i_pixel_3_d[9 ][WIDTH]&(i_pixel_3_d[9 ][bitlv]^en_flag)),  i_pixel_3_d[9 ][(WIDTH-1):0]};
        o_pixel_4_9 <= {(i_pixel_4_d[9 ][WIDTH]&(i_pixel_4_d[9 ][bitlv]^en_flag)),  i_pixel_4_d[9 ][(WIDTH-1):0]};
        o_pixel_5_9 <= {(i_pixel_5_d[9 ][WIDTH]&(i_pixel_5_d[9 ][bitlv]^en_flag)),  i_pixel_5_d[9 ][(WIDTH-1):0]};
        o_pixel_6_9 <= {(i_pixel_6_d[9 ][WIDTH]&(i_pixel_6_d[9 ][bitlv]^en_flag)),  i_pixel_6_d[9 ][(WIDTH-1):0]};
        o_pixel_7_9 <= {(i_pixel_7_d[9 ][WIDTH]&(i_pixel_7_d[9 ][bitlv]^en_flag)),  i_pixel_7_d[9 ][(WIDTH-1):0]};
        o_pixel_8_9 <= {(i_pixel_8_d[9 ][WIDTH]&(i_pixel_8_d[9 ][bitlv]^en_flag)),  i_pixel_8_d[9 ][(WIDTH-1):0]};
        o_pixel_9_9 <= {(i_pixel_9_d[9 ][WIDTH]&(i_pixel_9_d[9 ][bitlv]^en_flag)),  i_pixel_9_d[9 ][(WIDTH-1):0]};
        o_pixel_10_9<= {(i_pixel_10_d[9][WIDTH]&(i_pixel_10_d[9][bitlv]^en_flag)),  i_pixel_10_d[9][(WIDTH-1):0]};
        o_pixel_0_10 <={(i_pixel_0_d[10][WIDTH]&(i_pixel_0_d[10][bitlv]^en_flag)),  i_pixel_0_d[10][(WIDTH-1):0]};
        o_pixel_1_10 <={(i_pixel_1_d[10][WIDTH]&(i_pixel_1_d[10][bitlv]^en_flag)),  i_pixel_1_d[10][(WIDTH-1):0]};
        o_pixel_2_10 <={(i_pixel_2_d[10][WIDTH]&(i_pixel_2_d[10][bitlv]^en_flag)),  i_pixel_2_d[10][(WIDTH-1):0]};
        o_pixel_3_10 <={(i_pixel_3_d[10][WIDTH]&(i_pixel_3_d[10][bitlv]^en_flag)),  i_pixel_3_d[10][(WIDTH-1):0]};
        o_pixel_4_10 <={(i_pixel_4_d[10][WIDTH]&(i_pixel_4_d[10][bitlv]^en_flag)),  i_pixel_4_d[10][(WIDTH-1):0]};
        o_pixel_5_10 <={(i_pixel_5_d[10][WIDTH]&(i_pixel_5_d[10][bitlv]^en_flag)),  i_pixel_5_d[10][(WIDTH-1):0]};
        o_pixel_6_10 <={(i_pixel_6_d[10][WIDTH]&(i_pixel_6_d[10][bitlv]^en_flag)),  i_pixel_6_d[10][(WIDTH-1):0]};
        o_pixel_7_10 <={(i_pixel_7_d[10][WIDTH]&(i_pixel_7_d[10][bitlv]^en_flag)),  i_pixel_7_d[10][(WIDTH-1):0]};
        o_pixel_8_10 <={(i_pixel_8_d[10][WIDTH]&(i_pixel_8_d[10][bitlv]^en_flag)),  i_pixel_8_d[10][(WIDTH-1):0]};
        o_pixel_9_10 <={(i_pixel_9_d[10][WIDTH]&(i_pixel_9_d[10][bitlv]^en_flag)),  i_pixel_9_d[10][(WIDTH-1):0]};
        o_pixel_10_10<={(i_pixel_10_d[10][WIDTH]&(i_pixel_10_d[10][bitlv]^en_flag)),  i_pixel_10_d[10][(WIDTH-1):0]};
    end
    else begin
        o_pixel_0_0 <= o_pixel_0_0  ;
        o_pixel_1_0 <= o_pixel_1_0  ;
        o_pixel_2_0 <= o_pixel_2_0  ;
        o_pixel_3_0 <= o_pixel_3_0  ;
        o_pixel_4_0 <= o_pixel_4_0  ;
        o_pixel_5_0 <= o_pixel_5_0  ;
        o_pixel_6_0 <= o_pixel_6_0  ;
        o_pixel_7_0 <= o_pixel_7_0  ;
        o_pixel_8_0 <= o_pixel_8_0  ;
        o_pixel_9_0 <= o_pixel_9_0  ;
        o_pixel_10_0<= o_pixel_10_0 ;
        o_pixel_0_1 <= o_pixel_0_1  ;
        o_pixel_1_1 <= o_pixel_1_1  ;
        o_pixel_2_1 <= o_pixel_2_1  ;
        o_pixel_3_1 <= o_pixel_3_1  ;
        o_pixel_4_1 <= o_pixel_4_1  ;
        o_pixel_5_1 <= o_pixel_5_1  ;
        o_pixel_6_1 <= o_pixel_6_1  ;
        o_pixel_7_1 <= o_pixel_7_1  ;
        o_pixel_8_1 <= o_pixel_8_1  ;
        o_pixel_9_1 <= o_pixel_9_1  ;
        o_pixel_10_1<= o_pixel_10_1 ;
        o_pixel_0_2 <= o_pixel_0_2  ;
        o_pixel_1_2 <= o_pixel_1_2  ;
        o_pixel_2_2 <= o_pixel_2_2  ;
        o_pixel_3_2 <= o_pixel_3_2  ;
        o_pixel_4_2 <= o_pixel_4_2  ;
        o_pixel_5_2 <= o_pixel_5_2  ;
        o_pixel_6_2 <= o_pixel_6_2  ;
        o_pixel_7_2 <= o_pixel_7_2  ;
        o_pixel_8_2 <= o_pixel_8_2  ;
        o_pixel_9_2 <= o_pixel_9_2  ;
        o_pixel_10_2<= o_pixel_10_2 ;
        o_pixel_0_3 <= o_pixel_0_3  ;
        o_pixel_1_3 <= o_pixel_1_3  ;
        o_pixel_2_3 <= o_pixel_2_3  ;
        o_pixel_3_3 <= o_pixel_3_3  ;
        o_pixel_4_3 <= o_pixel_4_3  ;
        o_pixel_5_3 <= o_pixel_5_3  ;
        o_pixel_6_3 <= o_pixel_6_3  ;
        o_pixel_7_3 <= o_pixel_7_3  ;
        o_pixel_8_3 <= o_pixel_8_3  ;
        o_pixel_9_3 <= o_pixel_9_3  ;
        o_pixel_10_3<= o_pixel_10_3 ;
        o_pixel_0_4 <= o_pixel_0_4  ;
        o_pixel_1_4 <= o_pixel_1_4  ;
        o_pixel_2_4 <= o_pixel_2_4  ;
        o_pixel_3_4 <= o_pixel_3_4  ;
        o_pixel_4_4 <= o_pixel_4_4  ;
        o_pixel_5_4 <= o_pixel_5_4  ;
        o_pixel_6_4 <= o_pixel_6_4  ;
        o_pixel_7_4 <= o_pixel_7_4  ;
        o_pixel_8_4 <= o_pixel_8_4  ;
        o_pixel_9_4 <= o_pixel_9_4  ;
        o_pixel_10_4<= o_pixel_10_4 ;
        o_pixel_0_5 <= o_pixel_0_5  ;
        o_pixel_1_5 <= o_pixel_1_5  ;
        o_pixel_2_5 <= o_pixel_2_5  ;
        o_pixel_3_5 <= o_pixel_3_5  ;
        o_pixel_4_5 <= o_pixel_4_5  ;
        o_pixel_5_5 <= o_pixel_5_5  ;
        o_pixel_6_5 <= o_pixel_6_5  ;
        o_pixel_7_5 <= o_pixel_7_5  ;
        o_pixel_8_5 <= o_pixel_8_5  ;
        o_pixel_9_5 <= o_pixel_9_5  ;
        o_pixel_10_5<= o_pixel_10_5 ;
        o_pixel_0_6 <= o_pixel_0_6  ;
        o_pixel_1_6 <= o_pixel_1_6  ;
        o_pixel_2_6 <= o_pixel_2_6  ;
        o_pixel_3_6 <= o_pixel_3_6  ;
        o_pixel_4_6 <= o_pixel_4_6  ;
        o_pixel_5_6 <= o_pixel_5_6  ;
        o_pixel_6_6 <= o_pixel_6_6  ;
        o_pixel_7_6 <= o_pixel_7_6  ;
        o_pixel_8_6 <= o_pixel_8_6  ;
        o_pixel_9_6 <= o_pixel_9_6  ;
        o_pixel_10_6<= o_pixel_10_6 ;
        o_pixel_0_7 <= o_pixel_0_7  ;
        o_pixel_1_7 <= o_pixel_1_7  ;
        o_pixel_2_7 <= o_pixel_2_7  ;
        o_pixel_3_7 <= o_pixel_3_7  ;
        o_pixel_4_7 <= o_pixel_4_7  ;
        o_pixel_5_7 <= o_pixel_5_7  ;
        o_pixel_6_7 <= o_pixel_6_7  ;
        o_pixel_7_7 <= o_pixel_7_7  ;
        o_pixel_8_7 <= o_pixel_8_7  ;
        o_pixel_9_7 <= o_pixel_9_7  ;
        o_pixel_10_7<= o_pixel_10_7 ;
        o_pixel_0_8 <= o_pixel_0_8  ;
        o_pixel_1_8 <= o_pixel_1_8  ;
        o_pixel_2_8 <= o_pixel_2_8  ;
        o_pixel_3_8 <= o_pixel_3_8  ;
        o_pixel_4_8 <= o_pixel_4_8  ;
        o_pixel_5_8 <= o_pixel_5_8  ;
        o_pixel_6_8 <= o_pixel_6_8  ;
        o_pixel_7_8 <= o_pixel_7_8  ;
        o_pixel_8_8 <= o_pixel_8_8  ;
        o_pixel_9_8 <= o_pixel_9_8  ;
        o_pixel_10_8<= o_pixel_10_8 ;
        o_pixel_0_9 <= o_pixel_0_9  ;
        o_pixel_1_9 <= o_pixel_1_9  ;
        o_pixel_2_9 <= o_pixel_2_9  ;
        o_pixel_3_9 <= o_pixel_3_9  ;
        o_pixel_4_9 <= o_pixel_4_9  ;
        o_pixel_5_9 <= o_pixel_5_9  ;
        o_pixel_6_9 <= o_pixel_6_9  ;
        o_pixel_7_9 <= o_pixel_7_9  ;
        o_pixel_8_9 <= o_pixel_8_9  ;
        o_pixel_9_9 <= o_pixel_9_9  ;
        o_pixel_10_9<= o_pixel_10_9 ;
        o_pixel_0_10 <=o_pixel_0_10 ;
        o_pixel_1_10 <=o_pixel_1_10 ;
        o_pixel_2_10 <=o_pixel_2_10 ;
        o_pixel_3_10 <=o_pixel_3_10 ;
        o_pixel_4_10 <=o_pixel_4_10 ;
        o_pixel_5_10 <=o_pixel_5_10 ;
        o_pixel_6_10 <=o_pixel_6_10 ;
        o_pixel_7_10 <=o_pixel_7_10 ;
        o_pixel_8_10 <=o_pixel_8_10 ;
        o_pixel_9_10 <=o_pixel_9_10 ;
        o_pixel_10_10<=o_pixel_10_10;
    end
end

assign o_pixel_0={o_pixel_0_10,o_pixel_0_9,o_pixel_0_8,o_pixel_0_7,o_pixel_0_6,o_pixel_0_5,o_pixel_0_4,o_pixel_0_3,o_pixel_0_2,o_pixel_0_1,o_pixel_0_0};
assign o_pixel_1={o_pixel_1_10,o_pixel_1_9,o_pixel_1_8,o_pixel_1_7,o_pixel_1_6,o_pixel_1_5,o_pixel_1_4,o_pixel_1_3,o_pixel_1_2,o_pixel_1_1,o_pixel_1_0};
assign o_pixel_2={o_pixel_2_10,o_pixel_2_9,o_pixel_2_8,o_pixel_2_7,o_pixel_2_6,o_pixel_2_5,o_pixel_2_4,o_pixel_2_3,o_pixel_2_2,o_pixel_2_1,o_pixel_2_0};
assign o_pixel_3={o_pixel_3_10,o_pixel_3_9,o_pixel_3_8,o_pixel_3_7,o_pixel_3_6,o_pixel_3_5,o_pixel_3_4,o_pixel_3_3,o_pixel_3_2,o_pixel_3_1,o_pixel_3_0};
assign o_pixel_4={o_pixel_4_10,o_pixel_4_9,o_pixel_4_8,o_pixel_4_7,o_pixel_4_6,o_pixel_4_5,o_pixel_4_4,o_pixel_4_3,o_pixel_4_2,o_pixel_4_1,o_pixel_4_0};
assign o_pixel_5={o_pixel_5_10,o_pixel_5_9,o_pixel_5_8,o_pixel_5_7,o_pixel_5_6,o_pixel_5_5,o_pixel_5_4,o_pixel_5_3,o_pixel_5_2,o_pixel_5_1,o_pixel_5_0};
assign o_pixel_6={o_pixel_6_10,o_pixel_6_9,o_pixel_6_8,o_pixel_6_7,o_pixel_6_6,o_pixel_6_5,o_pixel_6_4,o_pixel_6_3,o_pixel_6_2,o_pixel_6_1,o_pixel_6_0};
assign o_pixel_7={o_pixel_7_10,o_pixel_7_9,o_pixel_7_8,o_pixel_7_7,o_pixel_7_6,o_pixel_7_5,o_pixel_7_4,o_pixel_7_3,o_pixel_7_2,o_pixel_7_1,o_pixel_7_0};
assign o_pixel_8={o_pixel_8_10,o_pixel_8_9,o_pixel_8_8,o_pixel_8_7,o_pixel_8_6,o_pixel_8_5,o_pixel_8_4,o_pixel_8_3,o_pixel_8_2,o_pixel_8_1,o_pixel_8_0};
assign o_pixel_9={o_pixel_9_10,o_pixel_9_9,o_pixel_9_8,o_pixel_9_7,o_pixel_9_6,o_pixel_9_5,o_pixel_9_4,o_pixel_9_3,o_pixel_9_2,o_pixel_9_1,o_pixel_9_0};
assign o_pixel_10={o_pixel_10_10,o_pixel_10_9,o_pixel_10_8,o_pixel_10_7,o_pixel_10_6,o_pixel_10_5,o_pixel_10_4,o_pixel_10_3,o_pixel_10_2,o_pixel_10_1,o_pixel_10_0};

endmodule
