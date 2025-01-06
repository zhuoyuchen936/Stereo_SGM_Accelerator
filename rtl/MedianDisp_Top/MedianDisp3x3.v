module MedianDisp3x3(din_1,din_2,din_3,din_4,din_5, din_6, din_7, din_8, din_9,dout);

	parameter WIDTH = 16;
    input [WIDTH-1:0] din_1;
    input [WIDTH-1:0] din_2;
    input [WIDTH-1:0] din_3;
    input [WIDTH-1:0] din_4;
    input [WIDTH-1:0] din_5;
	input [WIDTH-1:0] din_6;
	input [WIDTH-1:0] din_7;
	input [WIDTH-1:0] din_8;
	input [WIDTH-1:0] din_9;
 
	

    output  [WIDTH-1:0] dout;
 
    	wire [WIDTH-1:0] min_00;
    	wire [WIDTH-1:0] min_01;
    	wire [WIDTH-1:0] min_02;

    	wire [WIDTH-1:0] med_00;
    	wire [WIDTH-1:0] med_01;
    	wire [WIDTH-1:0] med_02;

       	wire [WIDTH-1:0] max_00;
    	wire [WIDTH-1:0] max_01;
    	wire [WIDTH-1:0] max_02;

        sort_3 inst_00(
            .a(din_1[WIDTH-1:0]),
            .b(din_2[WIDTH-1:0]),
            .c(din_3[WIDTH-1:0]),

            .max(max_00),
            .med(med_00),
            .min(min_00)

        );
        sort_3 inst_01(
            .a(din_4[WIDTH-1:0]),
            .b(din_5[WIDTH-1:0]),
            .c(din_6[WIDTH-1:0]),

            .max(max_01),
            .med(med_01),
            .min(min_01)

        );

        sort_3 inst_02(
            .a(din_7[WIDTH-1:0]),
            .b(din_8[WIDTH-1:0]),
            .c(din_9[WIDTH-1:0]),

            .max(max_02),
            .med(med_02),
            .min(min_02)

        );

wire [WIDTH-1:0] data0_temp = max_00 < max_01 ? max_00 : max_01;
wire [WIDTH-1:0] data0 = data0_temp < max_02 ? data0_temp: max_02;           //min in max

//med in med
wire [WIDTH-1:0] data1;
sort_3 inst_1(
            .a(med_00),
            .b(med_01),
            .c(med_02),

            .max(),
            .med(data1),
            .min()

        );
wire [WIDTH-1:0] data2_temp = min_00 > min_01 ? min_00 : min_01;
wire [WIDTH-1:0] data2 = data2_temp > min_02 ? data2_temp: min_02;           //max in min
wire [WIDTH-1:0] dout_temp;
sort_3 inst_2(
            .a(data0),
            .b(data1),
            .c(data2),

            .max(),
            .med(dout_temp),
            .min()

        );

assign dout= dout_temp;
endmodule
