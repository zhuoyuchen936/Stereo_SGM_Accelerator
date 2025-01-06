//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Guan Xinyu
// 
// Create Date: 2023/08/10 22:06:53
// Design Name: 
// Module Name: PE_Bilinear
//////////////////////////////////////////////////////////////////////////////////


module PE_Bilinear
#(parameter AWIDTH = 11, parameter EXTEND = 30, parameter DWIDTH = 8)
(    
    a00,
    a01,
    a10,
    a11,

    index_row,
    index_col,
    
    index_row_origin,
    index_col_origin,

    b
    );
    input [DWIDTH-1:0] a00,a11,a10,a01;
    input [AWIDTH+EXTEND-1:0] index_col, index_row,index_row_origin,index_col_origin;

    output [DWIDTH-1:0] b;
    wire [AWIDTH+EXTEND-1:0] diff_row,diff_col;
    assign diff_row = index_row - index_row_origin;
    assign diff_col = index_col - index_col_origin;
    wire [EXTEND:0] wx0,wx1,wy0,wy1;
    assign wx0 = diff_row[EXTEND:0];
    assign wy0 = diff_col[EXTEND:0];
    assign wx1 = {1'b1,{(EXTEND){1'b0}}}- {1'b1,wx0};
    assign wy1 = {1'b1,{(EXTEND){1'b0}}}- {1'b1,wy0};

    wire [EXTEND*2+1:0] w00,w11,w10,w01;   
    assign w00 = wx1 * wy1;
    assign w10 = wx0 * wy1;
    assign w01 = wx1 * wy0;
    assign w11 = wx0 * wy0;

    wire [EXTEND*2+DWIDTH+1:0] b00,b10,b11,b01;   
    assign b00 = w00 * a00;
    assign b01 = w01 * a01;
    assign b10 = w10 * a10;
    assign b11 = w11 * a11;

    wire [EXTEND*2+DWIDTH+1:0] sum,sum2;
    assign sum = b00 + b01 + b10 + b11;
    
    assign sum2 = sum+{{DWIDTH{1'b0}},1'b1,{(EXTEND*2-1){1'b0}}}; 
    assign b   = (sum[EXTEND*2-1]==1'b1)? sum2[EXTEND*2+DWIDTH+1:EXTEND*2]:sum[EXTEND*2+DWIDTH+1:EXTEND*2];

endmodule

