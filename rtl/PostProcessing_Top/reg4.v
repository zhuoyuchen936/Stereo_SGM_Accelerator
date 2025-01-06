module reg4(
    clk, 
    rst, 
    clken, 
    enable, 
    din_45, 
    din_90, 
    din_135, 
    din_0_180, 
    dout_reg4_45, 
    disp, 
    valid
);
	parameter DWIDTH = 8'd7;
        input clk;
        input rst;
        input clken;
        input enable;
        input [DWIDTH+1:0] din_45;
        //din[7] occlusion (copy) din[8] mismatch
        //  0 0 --> valid 
        input [DWIDTH+1:0] din_90;
        input [DWIDTH+1:0] din_135;
        input [2*DWIDTH+3:0] din_0_180;
       
        output reg [DWIDTH+1:0] dout_reg4_45;
        output  reg [DWIDTH-1:0] disp;
        
        output reg valid;

wire [DWIDTH+1:0] din_0,din_180;
wire [DWIDTH-1:0] disp_temp;
reg [DWIDTH+1:0] din_135_temp1,din_135_temp2,din_135_temp3,din_135_temp4,din_135_temp5;
reg [DWIDTH+1:0] din_45_temp1,din_45_temp2,din_45_temp3,din_45_temp4,din_45_temp5,din_45_temp6;
reg [DWIDTH+1:0] din_90_temp1,din_90_temp2,din_90_temp3,din_90_temp4,din_90_temp5,din_90_temp6;
reg [DWIDTH+1:0] din_180_temp1,din_180_temp2;

assign din_0 = din_0_180[2*DWIDTH+3:DWIDTH+2];
assign din_180 = din_0_180[DWIDTH+1:0];


getValue#(DWIDTH) inst(
      .din_0(din_0),
      .din_45(din_45_temp6),
      .din_90(din_90_temp6),
      .din_135(din_135_temp5),
      .din_180(din_180_temp2),

      .disp(disp_temp)
);


reg valid_temp;

always@(posedge clk or negedge rst)begin
        if(!rst)begin
               din_180_temp1 <= 0;
               din_180_temp2 <= 0;
               
        end
       else if (clken)begin
               din_180_temp1 <= din_180;
               din_180_temp2 <= din_180_temp1;
               
      end
end

always@(posedge clk or negedge rst)begin
        if(!rst)begin
               din_45_temp1 <= 0;
               din_45_temp2 <= 0;
               din_45_temp3 <= 0;
               din_45_temp4 <= 0;
               din_45_temp5 <= 0;
		       din_45_temp6 <= 0;
        end
       else if (clken)begin
               din_45_temp1 <= din_45;
               din_45_temp2 <= din_45_temp1;
               din_45_temp3 <= din_45_temp2;
               din_45_temp4 <= din_45_temp3;
               din_45_temp5 <= din_45_temp4;
               din_45_temp6 <= din_45_temp5;
      end
end

always@(posedge clk or negedge rst)begin
        if(!rst)begin
               din_90_temp1 <= 0;
               din_90_temp2 <= 0;
               din_90_temp3 <= 0;
               din_90_temp4 <= 0;
               din_90_temp5 <= 0;
               din_90_temp6 <= 0;
        end
       else if (clken)begin
               din_90_temp1 <= din_90;
               din_90_temp2 <= din_90_temp1;
               din_90_temp3 <= din_90_temp2;
               din_90_temp4 <= din_90_temp3;
               din_90_temp5 <= din_90_temp4;
               din_90_temp6 <= din_90_temp5;
      end
end

always@(posedge clk or negedge rst)begin
        if(!rst)begin
               din_135_temp1 <= 0;
               din_135_temp2 <= 0;
               din_135_temp3 <= 0;
               din_135_temp4 <= 0;
               din_135_temp5 <= 0;
        end
       else if (clken)begin
               din_135_temp1 <= din_135;
               din_135_temp2 <= din_135_temp1;
               din_135_temp3 <= din_135_temp2;
               din_135_temp4 <= din_135_temp3;
               din_135_temp5 <= din_135_temp4;
      end
end	

always @(posedge clk or negedge rst) begin
        if (!rst) begin
            disp<=0;
            dout_reg4_45<=0;
           // valid<=0;	
            //valid_temp<=0;
        end
        else begin
          if (clken && enable) begin
              //valid_temp<=enable;
              //valid<=enable;
              //valid<=enable;
              dout_reg4_45<=din_45;
              disp <= disp_temp;
	
          end
          else begin
              //valid_temp<=valid_temp;
              //valid<=valid;
              dout_reg4_45<=dout_reg4_45;
              disp<=disp;
          end
        end
end

reg valid_temp1,valid_temp2,valid_temp3,valid_temp4,valid_temp5,valid_temp6;
always @(posedge clk or negedge rst)begin
    if(!rst)begin
            valid_temp1 <= 0;
            valid_temp2 <= 0;
            valid_temp3 <= 0;
            valid_temp4 <= 0;
            valid_temp5 <= 0;
            valid_temp6 <= 0;
                        valid<=0;
    end
    else if(clken)begin
            valid_temp1 <= enable;
            valid_temp2 <= valid_temp1;
            valid_temp3 <= valid_temp2;
            valid_temp4 <= valid_temp3;
            valid_temp5 <= valid_temp4;
            valid_temp6 <= valid_temp5;
            valid<= valid_temp6;     
    end
        
end

endmodule
