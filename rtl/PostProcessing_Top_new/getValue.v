module getValue(din_0,din_45,din_90,din_135,din_180,disp);
    // input clk,
    // input rst,
    // input clken,
	parameter DWIDTH = 8'd7;
    input [DWIDTH+1:0] din_0;
    input [DWIDTH+1:0] din_45;
    input [DWIDTH+1:0] din_90;
    input [DWIDTH+1:0] din_135;
    input [DWIDTH+1:0] din_180;

    output [DWIDTH-1:0] disp;


    wire  [DWIDTH-1:0] value_0,value_45,value_90,value_135,value_180;
    assign value_0   = din_0  [DWIDTH-1:0];
    assign value_45  = din_45 [DWIDTH-1:0];
    assign value_90  = din_90 [DWIDTH-1:0];
    assign value_135 = din_135[DWIDTH-1:0];
    assign value_180 = din_180[DWIDTH-1:0];

//----------------sort--------------------
wire [DWIDTH-1:0] temp1_1,temp2_1,temp3_1,temp4_1,temp5_1;
// 0   45   90   135   180
// 1    2    3     4    5       
assign temp1_1=(value_45==value_0)||(value_0<value_45)?value_0:value_45;
assign temp2_1=(value_45==value_0)||(value_0<value_45)?value_45:value_0;
assign temp3_1=(value_90==value_135)||(value_90<value_135)?value_90:value_135;
assign temp4_1=(value_90==value_135)||(value_90<value_135)?value_135:value_90;
assign temp5_1=value_180;

wire [DWIDTH-1:0] temp1_2,temp2_2,temp3_2,temp4_2,temp5_2;
assign temp1_2=temp1_1;
assign temp2_2=((temp2_1==temp3_1)||(temp2_1<temp3_1))?temp2_1:temp3_1;
assign temp3_2=((temp2_1==temp3_1)||(temp2_1<temp3_1))?temp3_1:temp2_1;
assign temp4_2=((temp4_1==temp5_1)||(temp4_1<temp5_1))?temp4_1:temp5_1;
assign temp5_2=((temp4_1==temp5_1)||(temp4_1<temp5_1))?temp5_1:temp4_1;

wire [DWIDTH-1:0]  temp1_3,temp2_3,temp3_3,temp4_3,temp5_3;
assign temp1_3=((temp1_2==temp2_2)||(temp1_2<temp2_2))?temp1_2:temp2_2;
assign temp2_3=((temp1_2==temp2_2)||(temp1_2<temp2_2))?temp2_2:temp1_2;
assign temp3_3=((temp3_2==temp4_2)||(temp3_2<temp4_2))?temp3_2:temp4_2;
assign temp4_3=((temp3_2==temp4_2)||(temp3_2<temp4_2))?temp4_2:temp3_2;
assign temp5_3=temp5_2;

wire [DWIDTH-1:0] temp1_4,temp2_4,temp3_4,temp4_4,temp5_4;
assign temp1_4=temp1_3;
assign temp2_4=((temp2_3==temp3_3)||(temp2_3<temp3_3))?temp2_3:temp3_3;
assign temp3_4=((temp2_3==temp3_3)||(temp2_3<temp3_3))?temp3_3:temp2_3;
assign temp4_4=((temp4_3==temp5_3)||(temp4_3<temp5_3))?temp4_3:temp5_3;
assign temp5_4=((temp4_3==temp5_3)||(temp4_3<temp5_3))?temp5_3:temp4_3;

wire [DWIDTH-1:0]  temp1_5,temp2_5,temp3_5,temp4_5,temp5_5;
assign temp1_5=((temp1_4==temp2_4)||(temp1_4<temp2_4))?temp1_4:temp2_4;
assign temp2_5=((temp1_4==temp2_4)||(temp1_4<temp2_4))?temp2_4:temp1_4;
assign temp3_5=((temp3_4==temp4_4)||(temp3_4<temp4_4))?temp3_4:temp4_4;
assign temp4_5=((temp3_4==temp4_4)||(temp3_4<temp4_4))?temp4_4:temp3_4;
assign temp5_5=temp5_4;

//7 occlusion  8 mismatch
assign disp = (din_45[DWIDTH])?temp2_5:((din_45[DWIDTH+1])?temp3_5:din_45[DWIDTH-1:0]);

endmodule
