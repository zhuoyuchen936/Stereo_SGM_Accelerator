module cost_grad_com (
    input clk,
    input rst,
    input clken,
    input [10:0]Ix_R,
    input [10:0]Iy_R,

    input [2815:0]Ix_L,
    input [2815:0]Iy_L,
    output [3071:0] cost_grad

);
wire [11:0] Ix_com_R,Iy_com_R;
wire [3071:0] Ix_com_L,Iy_com_L;
wire [3071:0] grad_Ix,grad_Iy;
wire [2815:0] grad_Ix_ans,grad_Iy_ans;

assign Ix_com_R={Ix_R[10],Ix_R};
assign Iy_com_R={Iy_R[10],Iy_R};


genvar i;
    generate for(i=0;i<256;i=i+1)
    begin :com_grad_cost
        assign Ix_com_L[i*12+11:i*12+0]={Ix_L[i*11+10],Ix_L[i*11+10:i*11+0]};
        assign Iy_com_L[i*12+11:i*12+0]={Iy_L[i*11+10],Iy_L[i*11+10:i*11+0]};
        assign grad_Ix[i*12+11:i*12+0]=Ix_com_R-Ix_com_L[i*12+11:i*12+0];
        assign grad_Iy[i*12+11:i*12+0]=Iy_com_R-Iy_com_L[i*12+11:i*12+0];
        assign grad_Ix_ans[i*11+10:i*11+0]=grad_Ix[i*12+11]?(~(grad_Ix[i*12+10:i*12+0]-1)):grad_Ix[i*12+10:i*12+0];
        assign grad_Iy_ans[i*11+10:i*11+0]=grad_Iy[i*12+11]?(~(grad_Iy[i*12+10:i*12+0]-1)):grad_Iy[i*12+10:i*12+0];
        assign cost_grad[i*12+11:i*12+0]={1'b0,grad_Ix_ans[i*11+10:i*11+0]}+{1'b0,grad_Iy_ans[i*11+10:i*11+0]};
    end
    endgenerate

endmodule
