module hole_filling_new(din_1,din_2,din_3,din_4,din_5,dout);
	parameter depth = 1920;
	parameter WIDTH = 16;
	parameter AWIDTH =11;
    input [WIDTH+1:0] din_1;
    input [WIDTH+1:0] din_2;
    input [WIDTH+1:0] din_3;
    input [WIDTH+1:0] din_4;
    input [WIDTH+1:0] din_5;

	

    output reg [WIDTH+1:0] dout;


wire [WIDTH:0] data0 = din_1[WIDTH+1:WIDTH]==2'b00 ? {1'b1,din_1[WIDTH-1:0]} : {WIDTH+2{1'b0}};
wire [WIDTH:0] data1 = din_2[WIDTH+1:WIDTH]==2'b00 ? {1'b1,din_2[WIDTH-1:0]} : {WIDTH+2{1'b0}};
wire [WIDTH:0] data2 = din_3[WIDTH+1:WIDTH]==2'b00 ? {1'b1,din_3[WIDTH-1:0]} : {WIDTH+2{1'b0}};
wire [WIDTH:0] data3 = din_4[WIDTH+1:WIDTH]==2'b00 ? {1'b1,din_4[WIDTH-1:0]} : {WIDTH+2{1'b0}};
wire [WIDTH:0] data4 = din_5[WIDTH+1:WIDTH]==2'b00 ? {1'b1,din_5[WIDTH-1:0]} : {WIDTH+2{1'b0}};

wire [2:0] cnt = data0[WIDTH] + data1[WIDTH] + data2[WIDTH] + data3[WIDTH] + data4[WIDTH] ; 

wire [WIDTH-1:0]com0_0 = data0[WIDTH-1:0] > data1[WIDTH-1:0] ? data0[WIDTH-1:0] : data1[WIDTH-1:0];
wire [WIDTH-1:0]com0_1 = data0[WIDTH-1:0] > data1[WIDTH-1:0] ? data1[WIDTH-1:0] : data0[WIDTH-1:0];
wire [WIDTH-1:0]com0_2 = data2[WIDTH-1:0] > data3[WIDTH-1:0] ? data2[WIDTH-1:0] : data3[WIDTH-1:0];
wire [WIDTH-1:0]com0_3 = data2[WIDTH-1:0] > data3[WIDTH-1:0] ? data3[WIDTH-1:0] : data2[WIDTH-1:0];
wire [WIDTH-1:0]com0_4 = data4[WIDTH-1:0];


wire [WIDTH-1:0]com1_0 = com0_0;
wire [WIDTH-1:0]com1_1 = com0_1 > com0_2 ? com0_1 : com0_2;
wire [WIDTH-1:0]com1_2 = com0_1 > com0_2 ? com0_2 : com0_1;
wire [WIDTH-1:0]com1_3 = com0_3 > com0_4 ? com0_3 : com0_4;
wire [WIDTH-1:0]com1_4 = com0_3 > com0_4 ? com0_4 : com0_3;

 
wire [WIDTH-1:0]com2_0 = com1_0 > com1_1 ? com1_0 : com1_1;
wire [WIDTH-1:0]com2_1 = com1_0 > com1_1 ? com1_1 : com1_0;
wire [WIDTH-1:0]com2_2 = com1_2 > com1_3 ? com1_2 : com1_3;
wire [WIDTH-1:0]com2_3 = com1_2 > com1_3 ? com1_3 : com1_2;
wire [WIDTH-1:0]com2_4 = com1_4;


wire [WIDTH-1:0]com3_0 = com2_0;
wire [WIDTH-1:0]com3_1 = com2_1 > com2_2 ? com2_1 : com2_2;
wire [WIDTH-1:0]com3_2 = com2_1 > com2_2 ? com2_2 : com2_1;
wire [WIDTH-1:0]com3_3 = com2_3 > com2_4 ? com2_3 : com2_4;
wire [WIDTH-1:0]com3_4 = com2_3 > com2_4 ? com2_4 : com2_3;

 
wire [WIDTH-1:0]com4_0 = com3_0 > com3_1 ? com3_0 : com3_1;
wire [WIDTH-1:0]com4_1 = com3_0 > com3_1 ? com3_1 : com3_0;
wire [WIDTH-1:0]com4_2 = com3_2 > com3_3 ? com3_2 : com3_3;
wire [WIDTH-1:0]com4_3 = com3_2 > com3_3 ? com3_3 : com3_2;
wire [WIDTH-1:0]com4_4 = com3_4;


reg [WIDTH-1:0] subminor;
reg [WIDTH-1:0] median;

always@(*)begin
case(cnt)
    3'd1: begin subminor<= com4_0; median<=com4_0;end
    3'd2: begin subminor<= com4_0; median<=com4_0;end
    3'd3: begin subminor<= com4_1; median<=com4_1;end
    3'd4: begin subminor<= com4_2; median<=com4_1;end
    3'd5: begin subminor<= com4_3; median<=com4_3;end
    default:begin subminor<= com4_0; median<=com4_0;end
endcase
end

//reg [WIDTH+1:0]dout_temp;
always@(*)begin
    case(din_5[WIDTH+1:WIDTH])
        2'b00: dout <={2'b00, din_5[WIDTH-1:0]};
        2'b10: dout<={2'b00,median};
        2'b01: dout<={2'b00,subminor};
        default: dout<= 'b0;
    endcase

end

//assign dout = cnt == 3'd0 ? {2'b11,din_5[WIDTH-1:0]} : dout_temp;

endmodule

