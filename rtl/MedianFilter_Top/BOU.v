module BOU (
    input clk,
    input rst,
    input clken,

    input [109:0]i_pixel_0,
    input [109:0]i_pixel_1,
    input [109:0]i_pixel_2,
    input [109:0]i_pixel_3,
    input [109:0]i_pixel_4,
    input [109:0]i_pixel_5,
    input [109:0]i_pixel_6,
    input [109:0]i_pixel_7,
    input [109:0]i_pixel_8,
    input [109:0]i_pixel_9,
    input [109:0]i_pixel_10,

    
    input [6:0] pre_sum,

    output [109:0]o_pixel_0,
    output [109:0]o_pixel_1,
    output [109:0]o_pixel_2,
    output [109:0]o_pixel_3,
    output [109:0]o_pixel_4,
    output [109:0]o_pixel_5,
    output [109:0]o_pixel_6,
    output [109:0]o_pixel_7,
    output [109:0]o_pixel_8,
    output [109:0]o_pixel_9,
    output [109:0]o_pixel_10,


    output reg [6:0] post_sum,
    output reg valid
);

parameter bitlv = 7;

parameter Midele = 61;


wire [9:0] i_pixel_0_0,i_pixel_0_1,i_pixel_0_2,i_pixel_0_3,i_pixel_0_4,i_pixel_0_5,i_pixel_0_6,i_pixel_0_7,i_pixel_0_8,i_pixel_0_9,i_pixel_0_10;
wire [9:0] i_pixel_1_0,i_pixel_1_1,i_pixel_1_2,i_pixel_1_3,i_pixel_1_4,i_pixel_1_5,i_pixel_1_6,i_pixel_1_7,i_pixel_1_8,i_pixel_1_9,i_pixel_1_10;
wire [9:0] i_pixel_2_0,i_pixel_2_1,i_pixel_2_2,i_pixel_2_3,i_pixel_2_4,i_pixel_2_5,i_pixel_2_6,i_pixel_2_7,i_pixel_2_8,i_pixel_2_9,i_pixel_2_10;
wire [9:0] i_pixel_3_0,i_pixel_3_1,i_pixel_3_2,i_pixel_3_3,i_pixel_3_4,i_pixel_3_5,i_pixel_3_6,i_pixel_3_7,i_pixel_3_8,i_pixel_3_9,i_pixel_3_10;
wire [9:0] i_pixel_4_0,i_pixel_4_1,i_pixel_4_2,i_pixel_4_3,i_pixel_4_4,i_pixel_4_5,i_pixel_4_6,i_pixel_4_7,i_pixel_4_8,i_pixel_4_9,i_pixel_4_10;
wire [9:0] i_pixel_5_0,i_pixel_5_1,i_pixel_5_2,i_pixel_5_3,i_pixel_5_4,i_pixel_5_5,i_pixel_5_6,i_pixel_5_7,i_pixel_5_8,i_pixel_5_9,i_pixel_5_10;
wire [9:0] i_pixel_6_0,i_pixel_6_1,i_pixel_6_2,i_pixel_6_3,i_pixel_6_4,i_pixel_6_5,i_pixel_6_6,i_pixel_6_7,i_pixel_6_8,i_pixel_6_9,i_pixel_6_10;
wire [9:0] i_pixel_7_0,i_pixel_7_1,i_pixel_7_2,i_pixel_7_3,i_pixel_7_4,i_pixel_7_5,i_pixel_7_6,i_pixel_7_7,i_pixel_7_8,i_pixel_7_9,i_pixel_7_10;
wire [9:0] i_pixel_8_0,i_pixel_8_1,i_pixel_8_2,i_pixel_8_3,i_pixel_8_4,i_pixel_8_5,i_pixel_8_6,i_pixel_8_7,i_pixel_8_8,i_pixel_8_9,i_pixel_8_10;
wire [9:0] i_pixel_9_0,i_pixel_9_1,i_pixel_9_2,i_pixel_9_3,i_pixel_9_4,i_pixel_9_5,i_pixel_9_6,i_pixel_9_7,i_pixel_9_8,i_pixel_9_9,i_pixel_9_10;
wire [9:0] i_pixel_10_0,i_pixel_10_1,i_pixel_10_2,i_pixel_10_3,i_pixel_10_4,i_pixel_10_5,i_pixel_10_6,i_pixel_10_7,i_pixel_10_8,i_pixel_10_9,i_pixel_10_10;


assign i_pixel_0_0=i_pixel_0[9:0];
assign i_pixel_0_1=i_pixel_0[19:10];
assign i_pixel_0_2=i_pixel_0[29:20];
assign i_pixel_0_3=i_pixel_0[39:30];
assign i_pixel_0_4=i_pixel_0[49:40];
assign i_pixel_0_5=i_pixel_0[59:50];
assign i_pixel_0_6=i_pixel_0[69:60];
assign i_pixel_0_7=i_pixel_0[79:70];
assign i_pixel_0_8=i_pixel_0[89:80];
assign i_pixel_0_9=i_pixel_0[99:90];
assign i_pixel_0_10=i_pixel_0[109:100];

assign i_pixel_1_0=i_pixel_1[9:0];
assign i_pixel_1_1=i_pixel_1[19:10];
assign i_pixel_1_2=i_pixel_1[29:20];
assign i_pixel_1_3=i_pixel_1[39:30];
assign i_pixel_1_4=i_pixel_1[49:40];
assign i_pixel_1_5=i_pixel_1[59:50];
assign i_pixel_1_6=i_pixel_1[69:60];
assign i_pixel_1_7=i_pixel_1[79:70];
assign i_pixel_1_8=i_pixel_1[89:80];
assign i_pixel_1_9=i_pixel_1[99:90];
assign i_pixel_1_10=i_pixel_1[109:100];

assign i_pixel_2_0=i_pixel_2[9:0];
assign i_pixel_2_1=i_pixel_2[19:10];
assign i_pixel_2_2=i_pixel_2[29:20];
assign i_pixel_2_3=i_pixel_2[39:30];
assign i_pixel_2_4=i_pixel_2[49:40];
assign i_pixel_2_5=i_pixel_2[59:50];
assign i_pixel_2_6=i_pixel_2[69:60];
assign i_pixel_2_7=i_pixel_2[79:70];
assign i_pixel_2_8=i_pixel_2[89:80];
assign i_pixel_2_9=i_pixel_2[99:90];
assign i_pixel_2_10=i_pixel_2[109:100];


assign i_pixel_3_0=i_pixel_3[9:0];
assign i_pixel_3_1=i_pixel_3[19:10];
assign i_pixel_3_2=i_pixel_3[29:20];
assign i_pixel_3_3=i_pixel_3[39:30];
assign i_pixel_3_4=i_pixel_3[49:40];
assign i_pixel_3_5=i_pixel_3[59:50];
assign i_pixel_3_6=i_pixel_3[69:60];
assign i_pixel_3_7=i_pixel_3[79:70];
assign i_pixel_3_8=i_pixel_3[89:80];
assign i_pixel_3_9=i_pixel_3[99:90];
assign i_pixel_3_10=i_pixel_3[109:100];

assign i_pixel_4_0=i_pixel_4[9:0];
assign i_pixel_4_1=i_pixel_4[19:10];
assign i_pixel_4_2=i_pixel_4[29:20];
assign i_pixel_4_3=i_pixel_4[39:30];
assign i_pixel_4_4=i_pixel_4[49:40];
assign i_pixel_4_5=i_pixel_4[59:50];
assign i_pixel_4_6=i_pixel_4[69:60];
assign i_pixel_4_7=i_pixel_4[79:70];
assign i_pixel_4_8=i_pixel_4[89:80];
assign i_pixel_4_9=i_pixel_4[99:90];
assign i_pixel_4_10=i_pixel_4[109:100];

assign i_pixel_5_0=i_pixel_5[9:0];
assign i_pixel_5_1=i_pixel_5[19:10];
assign i_pixel_5_2=i_pixel_5[29:20];
assign i_pixel_5_3=i_pixel_5[39:30];
assign i_pixel_5_4=i_pixel_5[49:40];
assign i_pixel_5_5=i_pixel_5[59:50];
assign i_pixel_5_6=i_pixel_5[69:60];
assign i_pixel_5_7=i_pixel_5[79:70];
assign i_pixel_5_8=i_pixel_5[89:80];
assign i_pixel_5_9=i_pixel_5[99:90];
assign i_pixel_5_10=i_pixel_5[109:100];

assign i_pixel_6_0=i_pixel_6[9:0];
assign i_pixel_6_1=i_pixel_6[19:10];
assign i_pixel_6_2=i_pixel_6[29:20];
assign i_pixel_6_3=i_pixel_6[39:30];
assign i_pixel_6_4=i_pixel_6[49:40];
assign i_pixel_6_5=i_pixel_6[59:50];
assign i_pixel_6_6=i_pixel_6[69:60];
assign i_pixel_6_7=i_pixel_6[79:70];
assign i_pixel_6_8=i_pixel_6[89:80];
assign i_pixel_6_9=i_pixel_6[99:90];
assign i_pixel_6_10=i_pixel_6[109:100];

assign i_pixel_7_0 =i_pixel_7[9:0];
assign i_pixel_7_1 =i_pixel_7[19:10];
assign i_pixel_7_2 =i_pixel_7[29:20];
assign i_pixel_7_3 =i_pixel_7[39:30];
assign i_pixel_7_4 =i_pixel_7[49:40];
assign i_pixel_7_5 =i_pixel_7[59:50];
assign i_pixel_7_6 =i_pixel_7[69:60];
assign i_pixel_7_7 =i_pixel_7[79:70];
assign i_pixel_7_8 =i_pixel_7[89:80];
assign i_pixel_7_9 =i_pixel_7[99:90];
assign i_pixel_7_10=i_pixel_7[109:100];


assign i_pixel_8_0 =i_pixel_8[9:0];
assign i_pixel_8_1 =i_pixel_8[19:10];
assign i_pixel_8_2 =i_pixel_8[29:20];
assign i_pixel_8_3 =i_pixel_8[39:30];
assign i_pixel_8_4 =i_pixel_8[49:40];
assign i_pixel_8_5 =i_pixel_8[59:50];
assign i_pixel_8_6 =i_pixel_8[69:60];
assign i_pixel_8_7 =i_pixel_8[79:70];
assign i_pixel_8_8 =i_pixel_8[89:80];
assign i_pixel_8_9 =i_pixel_8[99:90];
assign i_pixel_8_10=i_pixel_8[109:100];

assign i_pixel_9_0 =i_pixel_9[9:0];
assign i_pixel_9_1 =i_pixel_9[19:10];
assign i_pixel_9_2 =i_pixel_9[29:20];
assign i_pixel_9_3 =i_pixel_9[39:30];
assign i_pixel_9_4 =i_pixel_9[49:40];
assign i_pixel_9_5 =i_pixel_9[59:50];
assign i_pixel_9_6 =i_pixel_9[69:60];
assign i_pixel_9_7 =i_pixel_9[79:70];
assign i_pixel_9_8 =i_pixel_9[89:80];
assign i_pixel_9_9 =i_pixel_9[99:90];
assign i_pixel_9_10=i_pixel_9[109:100];

assign i_pixel_10_0 =i_pixel_10[9:0];
assign i_pixel_10_1 =i_pixel_10[19:10];
assign i_pixel_10_2 =i_pixel_10[29:20];
assign i_pixel_10_3 =i_pixel_10[39:30];
assign i_pixel_10_4 =i_pixel_10[49:40];
assign i_pixel_10_5 =i_pixel_10[59:50];
assign i_pixel_10_6 =i_pixel_10[69:60];
assign i_pixel_10_7 =i_pixel_10[79:70];
assign i_pixel_10_8 =i_pixel_10[89:80];
assign i_pixel_10_9 =i_pixel_10[99:90];
assign i_pixel_10_10=i_pixel_10[109:100];


 reg [9:0] o_pixel_0_0,o_pixel_0_1,o_pixel_0_2,o_pixel_0_3,o_pixel_0_4,o_pixel_0_5,o_pixel_0_6,o_pixel_0_7,o_pixel_0_8,o_pixel_0_9,o_pixel_0_10;
 reg [9:0] o_pixel_1_0,o_pixel_1_1,o_pixel_1_2,o_pixel_1_3,o_pixel_1_4,o_pixel_1_5,o_pixel_1_6,o_pixel_1_7,o_pixel_1_8,o_pixel_1_9,o_pixel_1_10;
 reg [9:0] o_pixel_2_0,o_pixel_2_1,o_pixel_2_2,o_pixel_2_3,o_pixel_2_4,o_pixel_2_5,o_pixel_2_6,o_pixel_2_7,o_pixel_2_8,o_pixel_2_9,o_pixel_2_10;
 reg [9:0] o_pixel_3_0,o_pixel_3_1,o_pixel_3_2,o_pixel_3_3,o_pixel_3_4,o_pixel_3_5,o_pixel_3_6,o_pixel_3_7,o_pixel_3_8,o_pixel_3_9,o_pixel_3_10;
 reg [9:0] o_pixel_4_0,o_pixel_4_1,o_pixel_4_2,o_pixel_4_3,o_pixel_4_4,o_pixel_4_5,o_pixel_4_6,o_pixel_4_7,o_pixel_4_8,o_pixel_4_9,o_pixel_4_10;
 reg [9:0] o_pixel_5_0,o_pixel_5_1,o_pixel_5_2,o_pixel_5_3,o_pixel_5_4,o_pixel_5_5,o_pixel_5_6,o_pixel_5_7,o_pixel_5_8,o_pixel_5_9,o_pixel_5_10;
 reg [9:0] o_pixel_6_0,o_pixel_6_1,o_pixel_6_2,o_pixel_6_3,o_pixel_6_4,o_pixel_6_5,o_pixel_6_6,o_pixel_6_7,o_pixel_6_8,o_pixel_6_9,o_pixel_6_10;
 reg [9:0] o_pixel_7_0,o_pixel_7_1,o_pixel_7_2,o_pixel_7_3,o_pixel_7_4,o_pixel_7_5,o_pixel_7_6,o_pixel_7_7,o_pixel_7_8,o_pixel_7_9,o_pixel_7_10;
 reg [9:0] o_pixel_8_0,o_pixel_8_1,o_pixel_8_2,o_pixel_8_3,o_pixel_8_4,o_pixel_8_5,o_pixel_8_6,o_pixel_8_7,o_pixel_8_8,o_pixel_8_9,o_pixel_8_10;
 reg [9:0] o_pixel_9_0,o_pixel_9_1,o_pixel_9_2,o_pixel_9_3,o_pixel_9_4,o_pixel_9_5,o_pixel_9_6,o_pixel_9_7,o_pixel_9_8,o_pixel_9_9,o_pixel_9_10;
 reg [9:0] o_pixel_10_0,o_pixel_10_1,o_pixel_10_2,o_pixel_10_3,o_pixel_10_4,o_pixel_10_5,o_pixel_10_6,o_pixel_10_7,o_pixel_10_8,o_pixel_10_9,o_pixel_10_10;



wire [6:0] sum0 = (i_pixel_0_0[bitlv]&i_pixel_0_0[9])+(i_pixel_0_1[bitlv]&i_pixel_0_1[9])+(i_pixel_0_2[bitlv]&i_pixel_0_2[9])+(i_pixel_0_3[bitlv]&i_pixel_0_3[9])+(i_pixel_0_4[bitlv]&i_pixel_0_4[9])+(i_pixel_0_5[bitlv]&i_pixel_0_5[9])+(i_pixel_0_6[bitlv]&i_pixel_0_6[9])+(i_pixel_0_7[bitlv]&i_pixel_0_7[9])+(i_pixel_0_8[bitlv]&i_pixel_0_8[9])+(i_pixel_0_9[bitlv]&i_pixel_0_9[9])+(i_pixel_0_10[bitlv]&i_pixel_0_10[9])+
            (i_pixel_1_0[bitlv]&i_pixel_1_0[9])+(i_pixel_1_1[bitlv]&i_pixel_1_1[9])+(i_pixel_1_2[bitlv]&i_pixel_1_2[9])+(i_pixel_1_3[bitlv]&i_pixel_1_3[9])+(i_pixel_1_4[bitlv]&i_pixel_1_4[9])+(i_pixel_1_5[bitlv]&i_pixel_1_5[9])+(i_pixel_1_6[bitlv]&i_pixel_1_6[9])+(i_pixel_1_7[bitlv]&i_pixel_1_7[9])+(i_pixel_1_8[bitlv]&i_pixel_1_8[9])+(i_pixel_1_9[bitlv]&i_pixel_1_9[9])+(i_pixel_1_10[bitlv]&i_pixel_1_10[9])+
            (i_pixel_2_0[bitlv]&i_pixel_2_0[9])+(i_pixel_2_1[bitlv]&i_pixel_2_1[9])+(i_pixel_2_2[bitlv]&i_pixel_2_2[9])+(i_pixel_2_3[bitlv]&i_pixel_2_3[9])+(i_pixel_2_4[bitlv]&i_pixel_2_4[9])+(i_pixel_2_5[bitlv]&i_pixel_2_5[9])+(i_pixel_2_6[bitlv]&i_pixel_2_6[9])+(i_pixel_2_7[bitlv]&i_pixel_2_7[9])+(i_pixel_2_8[bitlv]&i_pixel_2_8[9])+(i_pixel_2_9[bitlv]&i_pixel_2_9[9])+(i_pixel_2_10[bitlv]&i_pixel_2_10[9])+
            (i_pixel_3_0[bitlv]&i_pixel_3_0[9])+(i_pixel_3_1[bitlv]&i_pixel_3_1[9])+(i_pixel_3_2[bitlv]&i_pixel_3_2[9])+(i_pixel_3_3[bitlv]&i_pixel_3_3[9])+(i_pixel_3_4[bitlv]&i_pixel_3_4[9])+(i_pixel_3_5[bitlv]&i_pixel_3_5[9])+(i_pixel_3_6[bitlv]&i_pixel_3_6[9])+(i_pixel_3_7[bitlv]&i_pixel_3_7[9])+(i_pixel_3_8[bitlv]&i_pixel_3_8[9])+(i_pixel_3_9[bitlv]&i_pixel_3_9[9])+(i_pixel_3_10[bitlv]&i_pixel_3_10[9])+
            (i_pixel_4_0[bitlv]&i_pixel_4_0[9])+(i_pixel_4_1[bitlv]&i_pixel_4_1[9])+(i_pixel_4_2[bitlv]&i_pixel_4_2[9])+(i_pixel_4_3[bitlv]&i_pixel_4_3[9])+(i_pixel_4_4[bitlv]&i_pixel_4_4[9])+(i_pixel_4_5[bitlv]&i_pixel_4_5[9])+(i_pixel_4_6[bitlv]&i_pixel_4_6[9])+(i_pixel_4_7[bitlv]&i_pixel_4_7[9])+(i_pixel_4_8[bitlv]&i_pixel_4_8[9])+(i_pixel_4_9[bitlv]&i_pixel_4_9[9])+(i_pixel_4_10[bitlv]&i_pixel_4_10[9])+
            (i_pixel_5_0[bitlv]&i_pixel_5_0[9])+(i_pixel_5_1[bitlv]&i_pixel_5_1[9])+(i_pixel_5_2[bitlv]&i_pixel_5_2[9])+(i_pixel_5_3[bitlv]&i_pixel_5_3[9])+(i_pixel_5_4[bitlv]&i_pixel_5_4[9])+(i_pixel_5_5[bitlv]&i_pixel_5_5[9])+(i_pixel_5_6[bitlv]&i_pixel_5_6[9])+(i_pixel_5_7[bitlv]&i_pixel_5_7[9])+(i_pixel_5_8[bitlv]&i_pixel_5_8[9])+(i_pixel_5_9[bitlv]&i_pixel_5_9[9])+(i_pixel_5_10[bitlv]&i_pixel_5_10[9])+
            (i_pixel_6_0[bitlv]&i_pixel_6_0[9])+(i_pixel_6_1[bitlv]&i_pixel_6_1[9])+(i_pixel_6_2[bitlv]&i_pixel_6_2[9])+(i_pixel_6_3[bitlv]&i_pixel_6_3[9])+(i_pixel_6_4[bitlv]&i_pixel_6_4[9])+(i_pixel_6_5[bitlv]&i_pixel_6_5[9])+(i_pixel_6_6[bitlv]&i_pixel_6_6[9])+(i_pixel_6_7[bitlv]&i_pixel_6_7[9])+(i_pixel_6_8[bitlv]&i_pixel_6_8[9])+(i_pixel_6_9[bitlv]&i_pixel_6_9[9])+(i_pixel_6_10[bitlv]&i_pixel_6_10[9])+
            (i_pixel_7_0[bitlv]&i_pixel_7_0[9])+(i_pixel_7_1[bitlv]&i_pixel_7_1[9])+(i_pixel_7_2[bitlv]&i_pixel_7_2[9])+(i_pixel_7_3[bitlv]&i_pixel_7_3[9])+(i_pixel_7_4[bitlv]&i_pixel_7_4[9])+(i_pixel_7_5[bitlv]&i_pixel_7_5[9])+(i_pixel_7_6[bitlv]&i_pixel_7_6[9])+(i_pixel_7_7[bitlv]&i_pixel_7_7[9])+(i_pixel_7_8[bitlv]&i_pixel_7_8[9])+(i_pixel_7_9[bitlv]&i_pixel_7_9[9])+(i_pixel_7_10[bitlv]&i_pixel_7_10[9])+
            (i_pixel_8_0[bitlv]&i_pixel_8_0[9])+(i_pixel_8_1[bitlv]&i_pixel_8_1[9])+(i_pixel_8_2[bitlv]&i_pixel_8_2[9])+(i_pixel_8_3[bitlv]&i_pixel_8_3[9])+(i_pixel_8_4[bitlv]&i_pixel_8_4[9])+(i_pixel_8_5[bitlv]&i_pixel_8_5[9])+(i_pixel_8_6[bitlv]&i_pixel_8_6[9])+(i_pixel_8_7[bitlv]&i_pixel_8_7[9])+(i_pixel_8_8[bitlv]&i_pixel_8_8[9])+(i_pixel_8_9[bitlv]&i_pixel_8_9[9])+(i_pixel_8_10[bitlv]&i_pixel_8_10[9])+
            (i_pixel_9_0[bitlv]&i_pixel_9_0[9])+(i_pixel_9_1[bitlv]&i_pixel_9_1[9])+(i_pixel_9_2[bitlv]&i_pixel_9_2[9])+(i_pixel_9_3[bitlv]&i_pixel_9_3[9])+(i_pixel_9_4[bitlv]&i_pixel_9_4[9])+(i_pixel_9_5[bitlv]&i_pixel_9_5[9])+(i_pixel_9_6[bitlv]&i_pixel_9_6[9])+(i_pixel_9_7[bitlv]&i_pixel_9_7[9])+(i_pixel_9_8[bitlv]&i_pixel_9_8[9])+(i_pixel_9_9[bitlv]&i_pixel_9_9[9])+(i_pixel_9_10[bitlv]&i_pixel_9_10[9])+
            (i_pixel_10_0[bitlv]&i_pixel_10_0[9])+(i_pixel_10_1[bitlv]&i_pixel_10_1[9])+(i_pixel_10_2[bitlv]&i_pixel_10_2[9])+(i_pixel_10_3[bitlv]&i_pixel_10_3[9])+(i_pixel_10_4[bitlv]&i_pixel_10_4[9])+(i_pixel_10_5[bitlv]&i_pixel_10_5[9])+(i_pixel_10_6[bitlv]&i_pixel_10_6[9])+(i_pixel_10_7[bitlv]&i_pixel_10_7[9])+(i_pixel_10_8[bitlv]&i_pixel_10_8[9])+(i_pixel_10_9[bitlv]&i_pixel_10_9[9])+(i_pixel_10_10[bitlv]&i_pixel_10_10[9]);

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

integer i;

always @(posedge clk or negedge rst ) begin
    if (!rst) begin
        o_pixel_0_0 <= {1'b1,9'd0};o_pixel_1_0 <= {1'b1,9'd0};o_pixel_2_0 <= {1'b1,9'd0};o_pixel_3_0 <= {1'b1,9'd0};o_pixel_4_0 <= {1'b1,9'd0};o_pixel_5_0 <= {1'b1,9'd0};o_pixel_6_0 <= {1'b1,9'd0};o_pixel_7_0 <= {1'b1,9'd0};o_pixel_8_0 <= {1'b1,9'd0};o_pixel_9_0 <= {1'b1,9'd0};o_pixel_10_0<= {1'b1,9'd0};
        o_pixel_0_1 <= {1'b1,9'd0};o_pixel_1_1 <= {1'b1,9'd0};o_pixel_2_1 <= {1'b1,9'd0};o_pixel_3_1 <= {1'b1,9'd0};o_pixel_4_1 <= {1'b1,9'd0};o_pixel_5_1 <= {1'b1,9'd0};o_pixel_6_1 <= {1'b1,9'd0};o_pixel_7_1 <= {1'b1,9'd0};o_pixel_8_1 <= {1'b1,9'd0};o_pixel_9_1 <= {1'b1,9'd0};o_pixel_10_1<= {1'b1,9'd0};
        o_pixel_0_2 <= {1'b1,9'd0};o_pixel_1_2 <= {1'b1,9'd0};o_pixel_2_2 <= {1'b1,9'd0};o_pixel_3_2 <= {1'b1,9'd0};o_pixel_4_2 <= {1'b1,9'd0};o_pixel_5_2 <= {1'b1,9'd0};o_pixel_6_2 <= {1'b1,9'd0};o_pixel_7_2 <= {1'b1,9'd0};o_pixel_8_2 <= {1'b1,9'd0};o_pixel_9_2 <= {1'b1,9'd0};o_pixel_10_2<= {1'b1,9'd0};
        o_pixel_0_3 <= {1'b1,9'd0};o_pixel_1_3 <= {1'b1,9'd0};o_pixel_2_3 <= {1'b1,9'd0};o_pixel_3_3 <= {1'b1,9'd0};o_pixel_4_3 <= {1'b1,9'd0};o_pixel_5_3 <= {1'b1,9'd0};o_pixel_6_3 <= {1'b1,9'd0};o_pixel_7_3 <= {1'b1,9'd0};o_pixel_8_3 <= {1'b1,9'd0};o_pixel_9_3 <= {1'b1,9'd0};o_pixel_10_3<= {1'b1,9'd0};
        o_pixel_0_4 <= {1'b1,9'd0};o_pixel_1_4 <= {1'b1,9'd0};o_pixel_2_4 <= {1'b1,9'd0};o_pixel_3_4 <= {1'b1,9'd0};o_pixel_4_4 <= {1'b1,9'd0};o_pixel_5_4 <= {1'b1,9'd0};o_pixel_6_4 <= {1'b1,9'd0};o_pixel_7_4 <= {1'b1,9'd0};o_pixel_8_4 <= {1'b1,9'd0};o_pixel_9_4 <= {1'b1,9'd0};o_pixel_10_4<= {1'b1,9'd0};
        o_pixel_1_5 <= {1'b1,9'd0};o_pixel_2_5 <= {1'b1,9'd0};o_pixel_3_5 <= {1'b1,9'd0};o_pixel_4_5 <= {1'b1,9'd0};o_pixel_5_5 <= {1'b1,9'd0};o_pixel_6_5 <= {1'b1,9'd0};o_pixel_7_5 <= {1'b1,9'd0};o_pixel_8_5 <= {1'b1,9'd0};o_pixel_9_5 <= {1'b1,9'd0};o_pixel_10_5<= {1'b1,9'd0};o_pixel_0_5 <= {1'b1,9'd0};
        o_pixel_0_6 <= {1'b1,9'd0};o_pixel_1_6 <= {1'b1,9'd0};o_pixel_2_6 <= {1'b1,9'd0};o_pixel_3_6 <= {1'b1,9'd0};o_pixel_4_6 <= {1'b1,9'd0};o_pixel_5_6 <= {1'b1,9'd0};o_pixel_6_6 <= {1'b1,9'd0};o_pixel_7_6 <= {1'b1,9'd0};o_pixel_8_6 <= {1'b1,9'd0};o_pixel_9_6 <= {1'b1,9'd0};o_pixel_10_6<= {1'b1,9'd0};
        o_pixel_0_7 <= {1'b1,9'd0};o_pixel_1_7 <= {1'b1,9'd0};o_pixel_2_7 <= {1'b1,9'd0};o_pixel_3_7 <= {1'b1,9'd0};o_pixel_4_7 <= {1'b1,9'd0};o_pixel_5_7 <= {1'b1,9'd0};o_pixel_6_7 <= {1'b1,9'd0};o_pixel_7_7 <= {1'b1,9'd0};o_pixel_8_7 <= {1'b1,9'd0};o_pixel_9_7 <= {1'b1,9'd0};o_pixel_10_7<= {1'b1,9'd0};
        o_pixel_0_8 <= {1'b1,9'd0};o_pixel_1_8 <= {1'b1,9'd0};o_pixel_2_8 <= {1'b1,9'd0};o_pixel_3_8 <= {1'b1,9'd0};o_pixel_4_8 <= {1'b1,9'd0};o_pixel_5_8 <= {1'b1,9'd0};o_pixel_6_8 <= {1'b1,9'd0};o_pixel_7_8 <= {1'b1,9'd0};o_pixel_8_8 <= {1'b1,9'd0};o_pixel_9_8 <= {1'b1,9'd0};o_pixel_10_8<= {1'b1,9'd0};
        o_pixel_0_9 <= {1'b1,9'd0};o_pixel_1_9 <= {1'b1,9'd0};o_pixel_2_9 <= {1'b1,9'd0};o_pixel_3_9 <= {1'b1,9'd0};o_pixel_4_9 <= {1'b1,9'd0};o_pixel_5_9 <= {1'b1,9'd0};o_pixel_6_9 <= {1'b1,9'd0};o_pixel_7_9 <= {1'b1,9'd0};o_pixel_8_9 <= {1'b1,9'd0};o_pixel_9_9 <= {1'b1,9'd0};o_pixel_10_9<= {1'b1,9'd0};
        o_pixel_0_10 <={1'b1,9'd0};o_pixel_1_10 <={1'b1,9'd0};o_pixel_2_10 <={1'b1,9'd0};o_pixel_3_10 <={1'b1,9'd0};o_pixel_4_10 <={1'b1,9'd0};o_pixel_5_10 <={1'b1,9'd0};o_pixel_6_10 <={1'b1,9'd0};o_pixel_7_10 <={1'b1,9'd0};o_pixel_8_10 <={1'b1,9'd0};o_pixel_9_10 <={1'b1,9'd0};o_pixel_10_10<={1'b1,9'd0};
    end
    else if (clken)begin

        o_pixel_0_0 <= {(i_pixel_0_0 [9]&(i_pixel_0_0 [bitlv]^en_flag)),  i_pixel_0_0 [8:0]};
        o_pixel_1_0 <= {(i_pixel_1_0 [9]&(i_pixel_1_0 [bitlv]^en_flag)),  i_pixel_1_0 [8:0]};
        o_pixel_2_0 <= {(i_pixel_2_0 [9]&(i_pixel_2_0 [bitlv]^en_flag)),  i_pixel_2_0 [8:0]};
        o_pixel_3_0 <= {(i_pixel_3_0 [9]&(i_pixel_3_0 [bitlv]^en_flag)),  i_pixel_3_0 [8:0]};
        o_pixel_4_0 <= {(i_pixel_4_0 [9]&(i_pixel_4_0 [bitlv]^en_flag)),  i_pixel_4_0 [8:0]};
        o_pixel_5_0 <= {(i_pixel_5_0 [9]&(i_pixel_5_0 [bitlv]^en_flag)),  i_pixel_5_0 [8:0]};
        o_pixel_6_0 <= {(i_pixel_6_0 [9]&(i_pixel_6_0 [bitlv]^en_flag)),  i_pixel_6_0 [8:0]};
        o_pixel_7_0 <= {(i_pixel_7_0 [9]&(i_pixel_7_0 [bitlv]^en_flag)),  i_pixel_7_0 [8:0]};
        o_pixel_8_0 <= {(i_pixel_8_0 [9]&(i_pixel_8_0 [bitlv]^en_flag)),  i_pixel_8_0 [8:0]};
        o_pixel_9_0 <= {(i_pixel_9_0 [9]&(i_pixel_9_0 [bitlv]^en_flag)),  i_pixel_9_0 [8:0]};
        o_pixel_10_0<= {(i_pixel_10_0[9]&(i_pixel_10_0[bitlv]^en_flag)),  i_pixel_10_0[8:0]};
        o_pixel_0_1 <= {(i_pixel_0_1 [9]&(i_pixel_0_1 [bitlv]^en_flag)),  i_pixel_0_1 [8:0]};
        o_pixel_1_1 <= {(i_pixel_1_1 [9]&(i_pixel_1_1 [bitlv]^en_flag)),  i_pixel_1_1 [8:0]};
        o_pixel_2_1 <= {(i_pixel_2_1 [9]&(i_pixel_2_1 [bitlv]^en_flag)),  i_pixel_2_1 [8:0]};
        o_pixel_3_1 <= {(i_pixel_3_1 [9]&(i_pixel_3_1 [bitlv]^en_flag)),  i_pixel_3_1 [8:0]};
        o_pixel_4_1 <= {(i_pixel_4_1 [9]&(i_pixel_4_1 [bitlv]^en_flag)),  i_pixel_4_1 [8:0]};
        o_pixel_5_1 <= {(i_pixel_5_1 [9]&(i_pixel_5_1 [bitlv]^en_flag)),  i_pixel_5_1 [8:0]};
        o_pixel_6_1 <= {(i_pixel_6_1 [9]&(i_pixel_6_1 [bitlv]^en_flag)),  i_pixel_6_1 [8:0]};
        o_pixel_7_1 <= {(i_pixel_7_1 [9]&(i_pixel_7_1 [bitlv]^en_flag)),  i_pixel_7_1 [8:0]};
        o_pixel_8_1 <= {(i_pixel_8_1 [9]&(i_pixel_8_1 [bitlv]^en_flag)),  i_pixel_8_1 [8:0]};
        o_pixel_9_1 <= {(i_pixel_9_1 [9]&(i_pixel_9_1 [bitlv]^en_flag)),  i_pixel_9_1 [8:0]};
        o_pixel_10_1<= {(i_pixel_10_1[9]&(i_pixel_10_1[bitlv]^en_flag)),  i_pixel_10_1[8:0]};
        o_pixel_0_2 <= {(i_pixel_0_2 [9]&(i_pixel_0_2 [bitlv]^en_flag)),  i_pixel_0_2 [8:0]};
        o_pixel_1_2 <= {(i_pixel_1_2 [9]&(i_pixel_1_2 [bitlv]^en_flag)),  i_pixel_1_2 [8:0]};
        o_pixel_2_2 <= {(i_pixel_2_2 [9]&(i_pixel_2_2 [bitlv]^en_flag)),  i_pixel_2_2 [8:0]};
        o_pixel_3_2 <= {(i_pixel_3_2 [9]&(i_pixel_3_2 [bitlv]^en_flag)),  i_pixel_3_2 [8:0]};
        o_pixel_4_2 <= {(i_pixel_4_2 [9]&(i_pixel_4_2 [bitlv]^en_flag)),  i_pixel_4_2 [8:0]};
        o_pixel_5_2 <= {(i_pixel_5_2 [9]&(i_pixel_5_2 [bitlv]^en_flag)),  i_pixel_5_2 [8:0]};
        o_pixel_6_2 <= {(i_pixel_6_2 [9]&(i_pixel_6_2 [bitlv]^en_flag)),  i_pixel_6_2 [8:0]};
        o_pixel_7_2 <= {(i_pixel_7_2 [9]&(i_pixel_7_2 [bitlv]^en_flag)),  i_pixel_7_2 [8:0]};
        o_pixel_8_2 <= {(i_pixel_8_2 [9]&(i_pixel_8_2 [bitlv]^en_flag)),  i_pixel_8_2 [8:0]};
        o_pixel_9_2 <= {(i_pixel_9_2 [9]&(i_pixel_9_2 [bitlv]^en_flag)),  i_pixel_9_2 [8:0]};
        o_pixel_10_2<= {(i_pixel_10_2[9]&(i_pixel_10_2[bitlv]^en_flag)),  i_pixel_10_2[8:0]};
        o_pixel_0_3 <= {(i_pixel_0_3 [9]&(i_pixel_0_3 [bitlv]^en_flag)),  i_pixel_0_3 [8:0]};
        o_pixel_1_3 <= {(i_pixel_1_3 [9]&(i_pixel_1_3 [bitlv]^en_flag)),  i_pixel_1_3 [8:0]};
        o_pixel_2_3 <= {(i_pixel_2_3 [9]&(i_pixel_2_3 [bitlv]^en_flag)),  i_pixel_2_3 [8:0]};
        o_pixel_3_3 <= {(i_pixel_3_3 [9]&(i_pixel_3_3 [bitlv]^en_flag)),  i_pixel_3_3 [8:0]};
        o_pixel_4_3 <= {(i_pixel_4_3 [9]&(i_pixel_4_3 [bitlv]^en_flag)),  i_pixel_4_3 [8:0]};
        o_pixel_5_3 <= {(i_pixel_5_3 [9]&(i_pixel_5_3 [bitlv]^en_flag)),  i_pixel_5_3 [8:0]};
        o_pixel_6_3 <= {(i_pixel_6_3 [9]&(i_pixel_6_3 [bitlv]^en_flag)),  i_pixel_6_3 [8:0]};
        o_pixel_7_3 <= {(i_pixel_7_3 [9]&(i_pixel_7_3 [bitlv]^en_flag)),  i_pixel_7_3 [8:0]};
        o_pixel_8_3 <= {(i_pixel_8_3 [9]&(i_pixel_8_3 [bitlv]^en_flag)),  i_pixel_8_3 [8:0]};
        o_pixel_9_3 <= {(i_pixel_9_3 [9]&(i_pixel_9_3 [bitlv]^en_flag)),  i_pixel_9_3 [8:0]};
        o_pixel_10_3<= {(i_pixel_10_3[9]&(i_pixel_10_3[bitlv]^en_flag)),  i_pixel_10_3[8:0]};
        o_pixel_0_4 <= {(i_pixel_0_4 [9]&(i_pixel_0_4 [bitlv]^en_flag)),  i_pixel_0_4 [8:0]};
        o_pixel_1_4 <= {(i_pixel_1_4 [9]&(i_pixel_1_4 [bitlv]^en_flag)),  i_pixel_1_4 [8:0]};
        o_pixel_2_4 <= {(i_pixel_2_4 [9]&(i_pixel_2_4 [bitlv]^en_flag)),  i_pixel_2_4 [8:0]};
        o_pixel_3_4 <= {(i_pixel_3_4 [9]&(i_pixel_3_4 [bitlv]^en_flag)),  i_pixel_3_4 [8:0]};
        o_pixel_4_4 <= {(i_pixel_4_4 [9]&(i_pixel_4_4 [bitlv]^en_flag)),  i_pixel_4_4 [8:0]};
        o_pixel_5_4 <= {(i_pixel_5_4 [9]&(i_pixel_5_4 [bitlv]^en_flag)),  i_pixel_5_4 [8:0]};
        o_pixel_6_4 <= {(i_pixel_6_4 [9]&(i_pixel_6_4 [bitlv]^en_flag)),  i_pixel_6_4 [8:0]};
        o_pixel_7_4 <= {(i_pixel_7_4 [9]&(i_pixel_7_4 [bitlv]^en_flag)),  i_pixel_7_4 [8:0]};
        o_pixel_8_4 <= {(i_pixel_8_4 [9]&(i_pixel_8_4 [bitlv]^en_flag)),  i_pixel_8_4 [8:0]};
        o_pixel_9_4 <= {(i_pixel_9_4 [9]&(i_pixel_9_4 [bitlv]^en_flag)),  i_pixel_9_4 [8:0]};
        o_pixel_10_4<= {(i_pixel_10_4[9]&(i_pixel_10_4[bitlv]^en_flag)),  i_pixel_10_4[8:0]};
        o_pixel_0_5 <= {(i_pixel_0_5 [9]&(i_pixel_0_5 [bitlv]^en_flag)),  i_pixel_0_5 [8:0]};
        o_pixel_1_5 <= {(i_pixel_1_5 [9]&(i_pixel_1_5 [bitlv]^en_flag)),  i_pixel_1_5 [8:0]};
        o_pixel_2_5 <= {(i_pixel_2_5 [9]&(i_pixel_2_5 [bitlv]^en_flag)),  i_pixel_2_5 [8:0]};
        o_pixel_3_5 <= {(i_pixel_3_5 [9]&(i_pixel_3_5 [bitlv]^en_flag)),  i_pixel_3_5 [8:0]};
        o_pixel_4_5 <= {(i_pixel_4_5 [9]&(i_pixel_4_5 [bitlv]^en_flag)),  i_pixel_4_5 [8:0]};
        o_pixel_5_5 <= {(i_pixel_5_5 [9]&(i_pixel_5_5 [bitlv]^en_flag)),  i_pixel_5_5 [8:0]};
        o_pixel_6_5 <= {(i_pixel_6_5 [9]&(i_pixel_6_5 [bitlv]^en_flag)),  i_pixel_6_5 [8:0]};
        o_pixel_7_5 <= {(i_pixel_7_5 [9]&(i_pixel_7_5 [bitlv]^en_flag)),  i_pixel_7_5 [8:0]};
        o_pixel_8_5 <= {(i_pixel_8_5 [9]&(i_pixel_8_5 [bitlv]^en_flag)),  i_pixel_8_5 [8:0]};
        o_pixel_9_5 <= {(i_pixel_9_5 [9]&(i_pixel_9_5 [bitlv]^en_flag)),  i_pixel_9_5 [8:0]};
        o_pixel_10_5<= {(i_pixel_10_5[9]&(i_pixel_10_5[bitlv]^en_flag)),  i_pixel_10_5[8:0]};
        o_pixel_0_6 <= {(i_pixel_0_6 [9]&(i_pixel_0_6 [bitlv]^en_flag)),  i_pixel_0_6 [8:0]};
        o_pixel_1_6 <= {(i_pixel_1_6 [9]&(i_pixel_1_6 [bitlv]^en_flag)),  i_pixel_1_6 [8:0]};
        o_pixel_2_6 <= {(i_pixel_2_6 [9]&(i_pixel_2_6 [bitlv]^en_flag)),  i_pixel_2_6 [8:0]};
        o_pixel_3_6 <= {(i_pixel_3_6 [9]&(i_pixel_3_6 [bitlv]^en_flag)),  i_pixel_3_6 [8:0]};
        o_pixel_4_6 <= {(i_pixel_4_6 [9]&(i_pixel_4_6 [bitlv]^en_flag)),  i_pixel_4_6 [8:0]};
        o_pixel_5_6 <= {(i_pixel_5_6 [9]&(i_pixel_5_6 [bitlv]^en_flag)),  i_pixel_5_6 [8:0]};
        o_pixel_6_6 <= {(i_pixel_6_6 [9]&(i_pixel_6_6 [bitlv]^en_flag)),  i_pixel_6_6 [8:0]};
        o_pixel_7_6 <= {(i_pixel_7_6 [9]&(i_pixel_7_6 [bitlv]^en_flag)),  i_pixel_7_6 [8:0]};
        o_pixel_8_6 <= {(i_pixel_8_6 [9]&(i_pixel_8_6 [bitlv]^en_flag)),  i_pixel_8_6 [8:0]};
        o_pixel_9_6 <= {(i_pixel_9_6 [9]&(i_pixel_9_6 [bitlv]^en_flag)),  i_pixel_9_6 [8:0]};
        o_pixel_10_6<= {(i_pixel_10_6[9]&(i_pixel_10_6[bitlv]^en_flag)),  i_pixel_10_6[8:0]};
        o_pixel_0_7 <= {(i_pixel_0_7 [9]&(i_pixel_0_7 [bitlv]^en_flag)),  i_pixel_0_7 [8:0]};
        o_pixel_1_7 <= {(i_pixel_1_7 [9]&(i_pixel_1_7 [bitlv]^en_flag)),  i_pixel_1_7 [8:0]};
        o_pixel_2_7 <= {(i_pixel_2_7 [9]&(i_pixel_2_7 [bitlv]^en_flag)),  i_pixel_2_7 [8:0]};
        o_pixel_3_7 <= {(i_pixel_3_7 [9]&(i_pixel_3_7 [bitlv]^en_flag)),  i_pixel_3_7 [8:0]};
        o_pixel_4_7 <= {(i_pixel_4_7 [9]&(i_pixel_4_7 [bitlv]^en_flag)),  i_pixel_4_7 [8:0]};
        o_pixel_5_7 <= {(i_pixel_5_7 [9]&(i_pixel_5_7 [bitlv]^en_flag)),  i_pixel_5_7 [8:0]};
        o_pixel_6_7 <= {(i_pixel_6_7 [9]&(i_pixel_6_7 [bitlv]^en_flag)),  i_pixel_6_7 [8:0]};
        o_pixel_7_7 <= {(i_pixel_7_7 [9]&(i_pixel_7_7 [bitlv]^en_flag)),  i_pixel_7_7 [8:0]};
        o_pixel_8_7 <= {(i_pixel_8_7 [9]&(i_pixel_8_7 [bitlv]^en_flag)),  i_pixel_8_7 [8:0]};
        o_pixel_9_7 <= {(i_pixel_9_7 [9]&(i_pixel_9_7 [bitlv]^en_flag)),  i_pixel_9_7 [8:0]};
        o_pixel_10_7<= {(i_pixel_10_7[9]&(i_pixel_10_7[bitlv]^en_flag)),  i_pixel_10_7[8:0]};
        o_pixel_0_8 <= {(i_pixel_0_8 [9]&(i_pixel_0_8 [bitlv]^en_flag)),  i_pixel_0_8 [8:0]};
        o_pixel_1_8 <= {(i_pixel_1_8 [9]&(i_pixel_1_8 [bitlv]^en_flag)),  i_pixel_1_8 [8:0]};
        o_pixel_2_8 <= {(i_pixel_2_8 [9]&(i_pixel_2_8 [bitlv]^en_flag)),  i_pixel_2_8 [8:0]};
        o_pixel_3_8 <= {(i_pixel_3_8 [9]&(i_pixel_3_8 [bitlv]^en_flag)),  i_pixel_3_8 [8:0]};
        o_pixel_4_8 <= {(i_pixel_4_8 [9]&(i_pixel_4_8 [bitlv]^en_flag)),  i_pixel_4_8 [8:0]};
        o_pixel_5_8 <= {(i_pixel_5_8 [9]&(i_pixel_5_8 [bitlv]^en_flag)),  i_pixel_5_8 [8:0]};
        o_pixel_6_8 <= {(i_pixel_6_8 [9]&(i_pixel_6_8 [bitlv]^en_flag)),  i_pixel_6_8 [8:0]};
        o_pixel_7_8 <= {(i_pixel_7_8 [9]&(i_pixel_7_8 [bitlv]^en_flag)),  i_pixel_7_8 [8:0]};
        o_pixel_8_8 <= {(i_pixel_8_8 [9]&(i_pixel_8_8 [bitlv]^en_flag)),  i_pixel_8_8 [8:0]};
        o_pixel_9_8 <= {(i_pixel_9_8 [9]&(i_pixel_9_8 [bitlv]^en_flag)),  i_pixel_9_8 [8:0]};
        o_pixel_10_8<= {(i_pixel_10_8[9]&(i_pixel_10_8[bitlv]^en_flag)),  i_pixel_10_8[8:0]};
        o_pixel_0_9 <= {(i_pixel_0_9 [9]&(i_pixel_0_9 [bitlv]^en_flag)),  i_pixel_0_9 [8:0]};
        o_pixel_1_9 <= {(i_pixel_1_9 [9]&(i_pixel_1_9 [bitlv]^en_flag)),  i_pixel_1_9 [8:0]};
        o_pixel_2_9 <= {(i_pixel_2_9 [9]&(i_pixel_2_9 [bitlv]^en_flag)),  i_pixel_2_9 [8:0]};
        o_pixel_3_9 <= {(i_pixel_3_9 [9]&(i_pixel_3_9 [bitlv]^en_flag)),  i_pixel_3_9 [8:0]};
        o_pixel_4_9 <= {(i_pixel_4_9 [9]&(i_pixel_4_9 [bitlv]^en_flag)),  i_pixel_4_9 [8:0]};
        o_pixel_5_9 <= {(i_pixel_5_9 [9]&(i_pixel_5_9 [bitlv]^en_flag)),  i_pixel_5_9 [8:0]};
        o_pixel_6_9 <= {(i_pixel_6_9 [9]&(i_pixel_6_9 [bitlv]^en_flag)),  i_pixel_6_9 [8:0]};
        o_pixel_7_9 <= {(i_pixel_7_9 [9]&(i_pixel_7_9 [bitlv]^en_flag)),  i_pixel_7_9 [8:0]};
        o_pixel_8_9 <= {(i_pixel_8_9 [9]&(i_pixel_8_9 [bitlv]^en_flag)),  i_pixel_8_9 [8:0]};
        o_pixel_9_9 <= {(i_pixel_9_9 [9]&(i_pixel_9_9 [bitlv]^en_flag)),  i_pixel_9_9 [8:0]};
        o_pixel_10_9<= {(i_pixel_10_9[9]&(i_pixel_10_9[bitlv]^en_flag)),  i_pixel_10_9[8:0]};
        o_pixel_0_10 <={(i_pixel_0_10[9]&(i_pixel_0_10[bitlv]^en_flag)),  i_pixel_0_10[8:0]};
        o_pixel_1_10 <={(i_pixel_1_10[9]&(i_pixel_1_10[bitlv]^en_flag)),  i_pixel_1_10[8:0]};
        o_pixel_2_10 <={(i_pixel_2_10[9]&(i_pixel_2_10[bitlv]^en_flag)),  i_pixel_2_10[8:0]};
        o_pixel_3_10 <={(i_pixel_3_10[9]&(i_pixel_3_10[bitlv]^en_flag)),  i_pixel_3_10[8:0]};
        o_pixel_4_10 <={(i_pixel_4_10[9]&(i_pixel_4_10[bitlv]^en_flag)),  i_pixel_4_10[8:0]};
        o_pixel_5_10 <={(i_pixel_5_10[9]&(i_pixel_5_10[bitlv]^en_flag)),  i_pixel_5_10[8:0]};
        o_pixel_6_10 <={(i_pixel_6_10[9]&(i_pixel_6_10[bitlv]^en_flag)),  i_pixel_6_10[8:0]};
        o_pixel_7_10 <={(i_pixel_7_10[9]&(i_pixel_7_10[bitlv]^en_flag)),  i_pixel_7_10[8:0]};
        o_pixel_8_10 <={(i_pixel_8_10[9]&(i_pixel_8_10[bitlv]^en_flag)),  i_pixel_8_10[8:0]};
        o_pixel_9_10 <={(i_pixel_9_10[9]&(i_pixel_9_10[bitlv]^en_flag)),  i_pixel_9_10[8:0]};
        o_pixel_10_10<={(i_pixel_10_10[9]&(i_pixel_10_10[bitlv]^en_flag)),  i_pixel_10_10[8:0]};
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
