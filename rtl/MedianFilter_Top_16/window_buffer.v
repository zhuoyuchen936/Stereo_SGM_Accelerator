/*
 * @Author: xxx 
 * @Date: xxx
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-22 16:41:11
 */
module window_buffer (
    clk,
    rst,
    clken,
    window_size,
    pixel0,
    pixel1,
    pixel2,
    pixel3,
    pixel4,
    pixel5,
    pixel6,
    pixel7,
    pixel8,
    pixel9,
    pixel10,


     pixel_out_0,         //10bit x 11    11x11 window_buffer
     pixel_out_1,   
     pixel_out_2,   
     pixel_out_3,   
     pixel_out_4,   
     pixel_out_5,   
     pixel_out_6,   
     pixel_out_7,
     pixel_out_8,   
     pixel_out_9,   
     pixel_out_10,      
    
     valid
);


parameter WIDTH=9;
    input clk;
    input rst;
    input clken;
    input [1:0] window_size;
    input [(WIDTH-1):0] pixel0;
    input [(WIDTH-1):0] pixel1;
    input [(WIDTH-1):0] pixel2;
    input [(WIDTH-1):0] pixel3;
    input [(WIDTH-1):0] pixel4;
    input [(WIDTH-1):0] pixel5;
    input [(WIDTH-1):0] pixel6;
    input [(WIDTH-1):0] pixel7;
    input [(WIDTH-1):0] pixel8;
    input [(WIDTH-1):0] pixel9;
    input [(WIDTH-1):0] pixel10;


    output [(WIDTH*11+10):0]pixel_out_0;         //10bit x 11    11x11 window_buffer
    output [(WIDTH*11+10):0]pixel_out_1;   
    output [(WIDTH*11+10):0]pixel_out_2;   
    output [(WIDTH*11+10):0]pixel_out_3;   
    output [(WIDTH*11+10):0]pixel_out_4;   
    output [(WIDTH*11+10):0]pixel_out_5;   
    output [(WIDTH*11+10):0]pixel_out_6;   
    output [(WIDTH*11+10):0]pixel_out_7;
    output [(WIDTH*11+10):0]pixel_out_8;   
    output [(WIDTH*11+10):0]pixel_out_9;   
    output [(WIDTH*11+10):0]pixel_out_10;      
    
    output reg valid;

reg [3:0] cnt;
always@(posedge clk or negedge rst)begin
	if(!rst)begin
		valid<=0;
		cnt<=11'd0;
	end
	else if(clken)begin
		if(cnt==11'd5)begin
			cnt <= 11'd0;
			valid <= 1;
		end
		else begin
			cnt <= cnt + 1;
		end
	end
	else begin
		valid <= valid;
		cnt <= cnt;
	end
end

reg [WIDTH:0]window_line_0[10:0];
reg [WIDTH:0]window_line_1[10:0];
reg [WIDTH:0]window_line_2[10:0];
reg [WIDTH:0]window_line_3[10:0];
reg [WIDTH:0]window_line_4[10:0];
reg [WIDTH:0]window_line_5[10:0];
reg [WIDTH:0]window_line_6[10:0];
reg [WIDTH:0]window_line_7[10:0];
reg [WIDTH:0]window_line_8[10:0];
reg [WIDTH:0]window_line_9[10:0];
reg [WIDTH:0]window_line_10[10:0];

integer i;
integer j;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        for(i=0;i<11;i=i+1) begin
            window_line_0[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_1[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_2[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_3[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_4[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_5[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_6[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_7[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_8[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_9[i]<={1'b1,{WIDTH{1'b0}}};
            window_line_10[i]<={1'b1,{WIDTH{1'b0}}};
        end
    end
    else if(clken)begin
        window_line_0[0] <= {~window_size[0],pixel0 };
        window_line_1[0] <= {~window_size[1],pixel1 };
        window_line_2[0] <= {1'b1,pixel2 };
        window_line_3[0] <= {1'b1,pixel3 };
        window_line_4[0] <= {1'b1,pixel4 };
        window_line_5[0] <= {1'b1,pixel5 };
        window_line_6[0] <= {1'b1,pixel6 };
        window_line_7[0] <= {1'b1,pixel7 };
        window_line_8[0] <= {1'b1,pixel8 }; 
        window_line_9[0] <= {~window_size[1],pixel9 };
        window_line_10[0]<= {~window_size[0],pixel10};
        for(j=0;j<10;j=j+1) begin
        window_line_0[j+1]<=window_line_0[j];
        window_line_1[j+1]<=window_line_1[j];
        window_line_2[j+1]<=window_line_2[j];
        window_line_3[j+1]<=window_line_3[j];
        window_line_4[j+1]<=window_line_4[j];
        window_line_5[j+1]<=window_line_5[j];
        window_line_6[j+1]<=window_line_6[j];
        window_line_7[j+1]<=window_line_7[j];
        window_line_8[j+1]<=window_line_8[j];
        window_line_9[j+1]<=window_line_9[j];
        window_line_10[j+1]<=window_line_10[j];
        end
    end
    else begin
        for(i=0;i<11;i=i+1)begin
        window_line_0[i]<=window_line_0[i];
        window_line_1[i]<=window_line_1[i];
        window_line_2[i]<=window_line_2[i];
        window_line_3[i]<=window_line_3[i];
        window_line_4[i]<=window_line_4[i];
        window_line_5[i]<=window_line_5[i];
        window_line_6[i]<=window_line_6[i];
        window_line_7[i]<=window_line_7[i];
        window_line_8[i]<=window_line_8[i];
        window_line_9[i]<=window_line_9[i];
        window_line_10[i]<=window_line_10[i];
    end
        
    end
end

wire [WIDTH:0]window_line_1_10_sel;
wire [WIDTH:0]window_line_2_10_sel;
wire [WIDTH:0]window_line_3_10_sel;
wire [WIDTH:0]window_line_4_10_sel;
wire [WIDTH:0]window_line_5_10_sel;
wire [WIDTH:0]window_line_6_10_sel;
wire [WIDTH:0]window_line_7_10_sel;
wire [WIDTH:0]window_line_8_10_sel;
wire [WIDTH:0]window_line_9_10_sel;

assign window_line_1_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_1[10];
assign window_line_2_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_2[10];
assign window_line_3_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_3[10];
assign window_line_4_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_4[10];
assign window_line_5_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_5[10];
assign window_line_6_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_6[10];
assign window_line_7_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_7[10];
assign window_line_8_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_8[10];
assign window_line_9_10_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_9[10];

wire [WIDTH:0]window_line_1_0_sel;
wire [WIDTH:0]window_line_2_0_sel;
wire [WIDTH:0]window_line_3_0_sel;
wire [WIDTH:0]window_line_4_0_sel;
wire [WIDTH:0]window_line_5_0_sel;
wire [WIDTH:0]window_line_6_0_sel;
wire [WIDTH:0]window_line_7_0_sel;
wire [WIDTH:0]window_line_8_0_sel;
wire [WIDTH:0]window_line_9_0_sel;

assign window_line_1_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_1[0];
assign window_line_2_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_2[0];
assign window_line_3_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_3[0];
assign window_line_4_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_4[0];
assign window_line_5_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_5[0];
assign window_line_6_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_6[0];
assign window_line_7_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_7[0];
assign window_line_8_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_8[0];
assign window_line_9_0_sel = window_size[0] ? {(WIDTH+1){1'b0}}: window_line_9[0];

wire [WIDTH:0]window_line_2_9_sel;
wire [WIDTH:0]window_line_3_9_sel;
wire [WIDTH:0]window_line_4_9_sel;
wire [WIDTH:0]window_line_5_9_sel;
wire [WIDTH:0]window_line_6_9_sel;
wire [WIDTH:0]window_line_7_9_sel;
wire [WIDTH:0]window_line_8_9_sel;

assign window_line_2_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_2[9];
assign window_line_3_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_3[9];
assign window_line_4_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_4[9];
assign window_line_5_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_5[9];
assign window_line_6_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_6[9];
assign window_line_7_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_7[9];
assign window_line_8_9_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_8[9];

wire [WIDTH:0]window_line_2_1_sel;
wire [WIDTH:0]window_line_3_1_sel;
wire [WIDTH:0]window_line_4_1_sel;
wire [WIDTH:0]window_line_5_1_sel;
wire [WIDTH:0]window_line_6_1_sel;
wire [WIDTH:0]window_line_7_1_sel;
wire [WIDTH:0]window_line_8_1_sel;

assign window_line_2_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_2[1];
assign window_line_3_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_3[1];
assign window_line_4_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_4[1];
assign window_line_5_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_5[1];
assign window_line_6_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_6[1];
assign window_line_7_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_7[1];
assign window_line_8_1_sel = window_size[1] ? {(WIDTH+1){1'b0}}: window_line_8[1];

assign pixel_out_0={window_line_0[10],window_line_0[9],window_line_0[8],window_line_0[7],window_line_0[6],window_line_0[5],window_line_0[4],window_line_0[3],window_line_0[2],window_line_0[1],window_line_0[0]};
assign pixel_out_1={window_line_1_10_sel,window_line_1[9],window_line_1[8],window_line_1[7],window_line_1[6],window_line_1[5],window_line_1[4],window_line_1[3],window_line_1[2],window_line_1[1],window_line_1_0_sel};
assign pixel_out_2={window_line_2_10_sel,window_line_2_9_sel,window_line_2[8],window_line_2[7],window_line_2[6],window_line_2[5],window_line_2[4],window_line_2[3],window_line_2[2],window_line_2_1_sel,window_line_2_0_sel};
assign pixel_out_3={window_line_3_10_sel,window_line_3_9_sel,window_line_3[8],window_line_3[7],window_line_3[6],window_line_3[5],window_line_3[4],window_line_3[3],window_line_3[2],window_line_3_1_sel,window_line_3_0_sel};
assign pixel_out_4={window_line_4_10_sel,window_line_4_9_sel,window_line_4[8],window_line_4[7],window_line_4[6],window_line_4[5],window_line_4[4],window_line_4[3],window_line_4[2],window_line_4_1_sel,window_line_4_0_sel};
assign pixel_out_5={window_line_5_10_sel,window_line_5_9_sel,window_line_5[8],window_line_5[7],window_line_5[6],window_line_5[5],window_line_5[4],window_line_5[3],window_line_5[2],window_line_5_1_sel,window_line_5_0_sel};
assign pixel_out_6={window_line_6_10_sel,window_line_6_9_sel,window_line_6[8],window_line_6[7],window_line_6[6],window_line_6[5],window_line_6[4],window_line_6[3],window_line_6[2],window_line_6_1_sel,window_line_6_0_sel};
assign pixel_out_7={window_line_7_10_sel,window_line_7_9_sel,window_line_7[8],window_line_7[7],window_line_7[6],window_line_7[5],window_line_7[4],window_line_7[3],window_line_7[2],window_line_7_1_sel,window_line_7_0_sel};
assign pixel_out_8={window_line_8_10_sel,window_line_8_9_sel,window_line_8[8],window_line_8[7],window_line_8[6],window_line_8[5],window_line_8[4],window_line_8[3],window_line_8[2],window_line_8_1_sel,window_line_8_0_sel};
assign pixel_out_9={window_line_9_10_sel,window_line_9[9],window_line_9[8],window_line_9[7],window_line_9[6],window_line_9[5],window_line_9[4],window_line_9[3],window_line_9[2],window_line_9[1],window_line_9_0_sel};
assign pixel_out_10={window_line_10[10],window_line_10[9],window_line_10[8],window_line_10[7],window_line_10[6],window_line_10[5],window_line_10[4],window_line_10[3],window_line_10[2],window_line_10[1],window_line_10[0]};


endmodule
