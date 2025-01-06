module reg2(clk, rst,clken, enable, din_45, din_90, din_135, din_reg3, dout_reg2_overall, valid);
	parameter DWIDTH = 8'd7;        
	input clk;
    input rst;
    input clken;
    input enable;
    input [DWIDTH+1:0] din_45;
    input [DWIDTH+1:0] din_90;
	input [DWIDTH+1:0] din_135;
        //din[7] occlusion (copy) din[8] mismatch
        //  0 0 --> valid 
    input [DWIDTH+1:0] din_reg3;
    output [3*DWIDTH+5:0] dout_reg2_overall;
    output reg valid;

    reg [DWIDTH+1:0] dout_reg2_45_temp,dout_reg2_90_temp,dout_reg2_135_temp;
    reg valid_temp;
    reg [DWIDTH+1:0] dout_reg2_135,dout_reg2_90,dout_reg2_45;
    always@(posedge clk or negedge rst)begin
        if (!rst) begin
            dout_reg2_135_temp<=0;
        end
        else begin
            if (clken && enable)begin
                //valid
                if((!din_135[DWIDTH+1])&&(!din_135[DWIDTH])) dout_reg2_135_temp<=din_135;
                //invalid
                else  dout_reg2_135_temp<={din_135[DWIDTH+1:DWIDTH],din_reg3[DWIDTH-1:0]};
            end
            else begin
              dout_reg2_135_temp<=dout_reg2_135_temp;
            end
        end
    end
always @(posedge clk or negedge rst) begin
        if (!rst) begin
            dout_reg2_45<=0;
            dout_reg2_90<=0;
            dout_reg2_135<=0;
            valid<=0;
            valid_temp<=0;
        end
        else begin
          if (clken && enable) begin
              //valid<=enable;
              valid_temp<=enable; 
              valid<=valid_temp;
              dout_reg2_135<=dout_reg2_135_temp;
              dout_reg2_45<=din_45;
              dout_reg2_90<=din_90;
          end
          else begin
            valid_temp<=valid_temp;
            valid<=valid;
            dout_reg2_45<=dout_reg2_45;
            dout_reg2_90<=dout_reg2_90;
            dout_reg2_135<=dout_reg2_135;
          end
        end
end
assign dout_reg2_overall={dout_reg2_135,dout_reg2_90,dout_reg2_45};

endmodule
