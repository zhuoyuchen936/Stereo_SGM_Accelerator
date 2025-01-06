module reg3(
    clk, 
    rst, 
    clken, 
    enable, 
    din, 
    dout_reg3_45, 
    dout_reg3_90, 
    dout_reg3_135, 
    valid
);
	parameter DWIDTH = 8'd7;        
	input clk;
    input rst;
    input clken;
    input enable;
    input [3*DWIDTH+5:0] din;
    
    
    output reg [DWIDTH+1:0] dout_reg3_45;
    output reg [DWIDTH+1:0]dout_reg3_90;
    output reg [DWIDTH+1:0]dout_reg3_135;
    output reg valid;

	reg valid_temp;
always @(posedge clk or negedge rst) begin
        if (!rst) begin
            dout_reg3_135<=0;
            dout_reg3_90<=0;
            dout_reg3_45<=0;
            valid<=0;
            valid_temp<=0;
        end
        else begin
          if (clken && enable) begin
              valid_temp<=enable;
              valid<=valid_temp;
              dout_reg3_45<=din[DWIDTH+1:0];
              dout_reg3_90<=din[2*DWIDTH+3:DWIDTH+2];
              dout_reg3_135<=din[3*DWIDTH+5:2*DWIDTH+4];
          end
          else begin
            valid_temp<=valid_temp;
            valid<=valid;
            dout_reg3_45<=dout_reg3_45;
            dout_reg3_90<=dout_reg3_90;
            dout_reg3_135<=dout_reg3_135;
          end
        end
end


endmodule
