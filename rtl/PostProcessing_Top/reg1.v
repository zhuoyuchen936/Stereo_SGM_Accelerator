
module reg1(
    clk, 
    rst, 
    clken, 
    enable, 
    din, 
    din_reg3, 
    din_reg4,
    dout_reg1_45, 
    dout_reg1_90, 
    dout_reg1_135, 
    valid
);
    parameter DWIDTH = 8'd7;
	input  clk;
    input  rst;
    input  clken;
    input  enable;
    input  [DWIDTH+1:0] din;
    //din[7] occlusion (copy) din[8] mismatch
    //  0 0 --> valid 
    input  [DWIDTH+1:0] din_reg3;
    input  [DWIDTH+1:0] din_reg4;
    output reg [DWIDTH+1:0] dout_reg1_45;
    output reg [DWIDTH+1:0] dout_reg1_90;
	output reg [DWIDTH+1:0] dout_reg1_135;
    output reg valid;

    reg [DWIDTH+1:0] dout_reg1_45_temp,dout_reg1_90_temp,dout_reg1_135_temp;

reg valid_temp;
always@(posedge clk or negedge rst)begin
        if (!rst) begin
            dout_reg1_45_temp<=0;
            dout_reg1_90_temp<=0;
            dout_reg1_135_temp<=0;
        end
        else begin
            if (clken && enable)begin
                //valid
                if((!din[DWIDTH+1])&&(!din[DWIDTH]))begin
                    dout_reg1_45_temp<=din;
                    dout_reg1_90_temp<=din;
                    dout_reg1_135_temp<=din;
                end
                //invalid
                else begin
                    dout_reg1_45_temp<={din[DWIDTH+1:DWIDTH],din_reg4[DWIDTH-1:0]};
                    dout_reg1_90_temp<={din[DWIDTH+1:DWIDTH],din_reg3[DWIDTH-1:0]}; 
					dout_reg1_135_temp<={din[DWIDTH+1:DWIDTH],7'd0};				
		        end
            end
            else begin
              dout_reg1_45_temp<=dout_reg1_45_temp;
              dout_reg1_90_temp<=dout_reg1_90_temp;
              dout_reg1_135_temp<=dout_reg1_135_temp;
            end
        end
end

always @(posedge clk or negedge rst) begin
        if (!rst) begin
            dout_reg1_45<=0;
            dout_reg1_90<=0;
            dout_reg1_135<=0;
            valid<=0;
            valid_temp<=0;
        end
        else begin
          if (clken && enable) begin
              valid_temp<=enable;
              valid<=valid_temp;
              dout_reg1_45<=dout_reg1_45_temp;
              dout_reg1_90<=dout_reg1_90_temp;
              dout_reg1_135<=dout_reg1_135_temp;
          end
          else begin
            valid_temp<=valid_temp;
            valid<=valid;
            dout_reg1_45<=dout_reg1_45;
            dout_reg1_90<=dout_reg1_90;
            dout_reg1_135<=dout_reg1_135;
          end
        end
end

endmodule
