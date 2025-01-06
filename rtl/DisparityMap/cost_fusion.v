module cost_fusion(
    input clk,
	input rst,
	input clken,

    output reg valid,

    input [1023:0]cost_hamming,
    input [3071:0]cost_grad,

    output [1279:0]cost_fusion


);
reg [2:0] valid_shift; 
always @(posedge clk or negedge rst) begin
    if (!rst) begin
        valid_shift <= 3'b000; 
        valid <= 1'b0;         
    end else if (clken) begin
        valid_shift <= {valid_shift[1:0], 1'b1}; 
        valid <= valid_shift[2];                 
    end else begin
        valid_shift <= valid_shift;  
        valid <= valid;              
    end
end

wire [2815:0]cost_grad_norm;
genvar i;
generate for(i=0;i<256;i=i+1)
begin: GradCostNormalization
grad_norm CostGradNorm_inst(
    .clk(clk),
    .rst(rst),
    .clken(clken),

    .cost_grad(cost_grad[i*12+11:i*12+0]),
    .cost_grad_norm(cost_grad_norm[i*11+10:i*11+0])
);
end
endgenerate


wire [1791:0]cost_hamming_norm;   
//7bit 1 integer 6 demical
genvar j;
generate for(j=0;j<256;j=j+1)
begin: HammingCostNormalization
hamming_norm CostHammingNorm_inst(
    .clk(clk),
    .rst(rst),
    .clken(clken),


    .cost_hamming(cost_hamming[j*4+3:j*4+0]),
    .cost_hamming_norm(cost_hamming_norm[j*7+6:j*7+0])
);
end
endgenerate

reg [1791:0] cost_hamming_norm_stage1; 
reg [1791:0] cost_hamming_norm_stage2; 

always @(posedge clk or negedge rst) begin
    if (!rst) begin
        cost_hamming_norm_stage1 <= 1792'd0;
        cost_hamming_norm_stage2 <= 1792'd0;
    end else if (clken) begin
        cost_hamming_norm_stage1 <= cost_hamming_norm; 
        cost_hamming_norm_stage2 <= cost_hamming_norm_stage1; 

    end
end

genvar k ;
wire [3071:0]cost_fusion_temp;
generate for(k=0;k<256;k=k+1)
begin: cost_norm
    assign cost_fusion_temp[k*12+11:k*12+0] = 12'b10_00000_00000 - {cost_hamming_norm_stage2[k*7+6:k*7+0],4'b0}-cost_grad_norm[k*11+10:k*11+0];
    assign cost_fusion[k*5+4:k*5+0] = cost_fusion_temp[k*12+11:k*12+7];      //2bit interger 9bit demical 舍掉了一位小数   //2bit+3bit 
end
endgenerate

endmodule
