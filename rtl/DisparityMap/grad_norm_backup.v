module grad_norm(
    input clk,
    input rst,
    input clken,

    input [11:0]cost_grad,

    output [10:0]cost_grad_norm
);

wire [10:0]RangeSel;
wire a = !cost_grad[11] & !cost_grad[10] & !cost_grad[9] & !cost_grad[8];

assign RangeSel[0] = a & !cost_grad[7] & !cost_grad[6] & !cost_grad[5] & !cost_grad[4] & !cost_grad[3] & !cost_grad[2];
assign RangeSel[1] = a & !cost_grad[7] & !cost_grad[6] & !cost_grad[5] & !cost_grad[4] & !cost_grad[3] &  cost_grad[2];
assign RangeSel[2] = a & !cost_grad[7] & !cost_grad[6] & !cost_grad[5] & !cost_grad[4] &  cost_grad[3]; 
assign RangeSel[3] = a & !cost_grad[7] & !cost_grad[6] & !cost_grad[5] &  cost_grad[4];

assign RangeSel[4] = a & !cost_grad[7] & !cost_grad[6] &  cost_grad[5] & !cost_grad[4];
assign RangeSel[5] = a & !cost_grad[7] & !cost_grad[6] &  cost_grad[5] &  cost_grad[4]; 
assign RangeSel[6] = a & !cost_grad[7] &  cost_grad[6] & !cost_grad[5];
assign RangeSel[7] = a & !cost_grad[7] &  cost_grad[6] &  cost_grad[5];

assign RangeSel[8] = a &  cost_grad[7] & !cost_grad[6] & !cost_grad[5];
assign RangeSel[9] = a &  cost_grad[7] & !cost_grad[6] &  cost_grad[5];

assign RangeSel[10]= !a | (cost_grad[7]&cost_grad[6]);


reg [17:0]cost_grad_normTemp;
always@(posedge clk or negedge rst)begin
    if(!rst)begin
        cost_grad_normTemp <=18'd0;
    end

    else if(clken)begin
    case (RangeSel)
   11'b0_00000_00001: cost_grad_normTemp <= 11'b1_000000_0000 - {cost_grad[1:0],2'b0} - {cost_grad[1:0],3'b0} - {cost_grad[1:0],4'b0};        //1-0.875x (1-0.11100x)    10bit demical
   11'b0_00000_00010: cost_grad_normTemp <= 11'b0_111100_0000 - {cost_grad[2:0],1'b0} - {cost_grad[2:0],3'b0} - {cost_grad[2:0],4'b0};        //0.9375-0.8125x(0.1111-0.11010x)
   11'b0_00000_00100: cost_grad_normTemp <= 11'b0_111100_0000 - {cost_grad[3:0],1'b0} - {cost_grad[3:0],2'b0} - {cost_grad[3:0],4'b0};
   11'b0_00000_01000: cost_grad_normTemp <= 11'b0_110100_0000 - {cost_grad[4:0],1'b0} - {cost_grad[4:0],2'b0} - {cost_grad[4:0],3'b0};
   11'b0_00000_10000: cost_grad_normTemp <= 11'b0_101000_0000 - {cost_grad[5:0],3'b0};

   11'b0_00001_00000: cost_grad_normTemp <= 11'b0_011100_0000 - {cost_grad[5:0],2'b0};
   11'b0_00010_00000: cost_grad_normTemp <= 11'b0_010000_0000 - {cost_grad[6:0],1'b0};
   11'b0_00100_00000: cost_grad_normTemp <= 11'b0_001001_0000 - cost_grad[6:0];
   11'b0_01000_00000: cost_grad_normTemp <= 11'b0_000100_0000;
   11'b0_10000_00000: cost_grad_normTemp <= 11'b0_000001_0000;
   11'b1_00000_00000:cost_grad_normTemp <= 18'b0;
   default: cost_grad_normTemp <= 18'b0;
   endcase
   end

   else begin
        cost_grad_normTemp<=cost_grad_normTemp;
   end
end

assign cost_grad_norm = cost_grad_normTemp[10:0];

endmodule
