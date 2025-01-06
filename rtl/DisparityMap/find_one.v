module find_one(
        input       [31:0]  din,
        output      [4:0]   index
    );
wire    [15:0]   tmp3;
wire    [7:0]   tmp0;
wire    [3:0]   tmp1;
wire    [1:0]   tmp2;

assign index[4] = (|din[31:16]);
assign tmp3 = index[4] ? din[31:16] : din[15:0];

assign index[3] = (|tmp3[15:8]);
assign tmp0 = index[3] ? tmp3[15:8] : tmp3[7:0];

assign index[2] = (|tmp0[7:4]);
assign tmp1 = index[2] ? tmp0[7:4] : tmp0[3:0];

assign index[1] = (|tmp1[3:2]);
assign tmp2 = index[1] ? tmp1[3:2] : tmp1[1:0];

assign index[0] = tmp2[1]; 
    
endmodule
