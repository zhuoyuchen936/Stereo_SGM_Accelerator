module grad_com (
    input clk,
    input rst,
    input clken,
    input [23:0] line0,
	input [23:0] line1,
	input [23:0] line2,
    
    output [10:0] Ix,
    output [10:0] Iy,
    output [10:0] Ig

);

    wire [7:0] p11,p12,p13,p21,p23,p31,p32,p33;
    wire [9:0] Ix_ans,Iy_ans;
     
    
    //11 12 13
    //21 22 23
    //31 32 33

    assign p11=line0[7:0];
    assign p21=line1[7:0];
    assign p31=line2[7:0];

    assign p12=line0[15:8];
    assign p32=line2[15:8];

    assign p13=line0[23:16];
    assign p23=line1[23:16];
    assign p33=line2[23:16];

    //sobelx
    //-1 0 1
    //-2 0 2
    //-1 0 1

    //sobely
    // 1  2  1
    // 0  0  0
    //-1 -2 -1

    assign    Ix[10:0]=   -{3'd0,p11[7:0]}     +{3'd0,p13[7:0]}
                          -({3'd0,p21[7:0]}<<1)+({3'd0,p23[7:0]}<<1)
                          -{3'd0,p31[7:0]}     +{3'd0,p33[7:0]};

    assign    Iy[10:0]=    {3'd0,p11[7:0]}+({3'd0,p12[7:0]}<<1)+{3'd0,p13[7:0]}
                          -{3'd0,p31[7:0]}-({3'd0,p32[7:0]}<<1)-{3'd0,p33[7:0]};

    assign     Ix_ans[9:0]=Ix[10]?(~(Ix[9:0]-1)):Ix[9:0];
    assign     Iy_ans[9:0]=Iy[10]?(~(Iy[9:0]-1)):Iy[9:0];
    assign     Ig[10:0]={1'b0,Ix_ans[9:0]}+{1'b0,Iy_ans[9:0]};



endmodule
