module LUT_para(
    height,
    width,
    H_SYNC,
    H_BACK, 
    H_VALID,
    H_TOTAL,
    V_SYNC, 
    V_TOTAL
    
    );
    input [10:0] height,width;
    output reg [10:0] H_SYNC,H_BACK;
    output reg [10:0] H_VALID,H_TOTAL;
    output reg [10:0] V_SYNC;
    output reg [10:0] V_TOTAL;

    always @(*) begin
        if(width==11'd1920)begin 
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1920;
            H_TOTAL = 11'd1932;
        end
        else if(width==11'd1870)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1870;
            H_TOTAL = 11'd1882;
        end
        else if(width==11'd1820)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1820;
            H_TOTAL = 11'd1832;
        end
        else if(width==11'd1600)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1600;
            H_TOTAL = 11'd1612;
        end
        else if(width==11'd1550)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1550;
            H_TOTAL = 11'd1562;
        end
         else if(width==11'd1500)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1500;
            H_TOTAL = 11'd1512;
        end       
        else if(width==11'd1280)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1280;
            H_TOTAL = 11'd1292;
        end
         else if(width==11'd1230)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1230;
            H_TOTAL = 11'd1242;
        end    
        else if(width==11'd1180)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1180;
            H_TOTAL = 11'd1192;
        end
        else if(width==11'd1024)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1024;
            H_TOTAL = 11'd1036;
        end
         else if(width==11'd974)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd974;
            H_TOTAL = 11'd986;
        end     
        else if(width==11'd924)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd924;
            H_TOTAL = 11'd936;
        end
        else if(width==11'd640)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd640;
            H_TOTAL = 11'd652;
        end
         else if(width==11'd590)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd590;
            H_TOTAL = 11'd602;
        end    
        else if(width==11'd540)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd540;
            H_TOTAL = 11'd552;
        end
        else if(width==11'd320)begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd320;
            H_TOTAL= 11'd332;
        end
        else begin
            H_SYNC  = 11'd4;
            H_BACK  = 11'd4; 
            H_VALID = 11'd1920;
            H_TOTAL = 11'd1932;
        end
    
  end

  always @(*) begin
            if(height==11'd1080)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd1080;
            end
            else if(height==11'd1030)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd1030;
            end
            else if(height==11'd980)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd980;
            end
            else if(height==11'd800)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd800;
            end
            else if(height==11'd750)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd750;
            end
            else if(height==11'd700)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd700;
            end
            else if(height==11'd768)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd768;
            end
            else if(height==11'd718)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd718;
            end
            else if(height==11'd668)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd668;
            end
            else if(height==11'd720)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd720;
            end
            else if(height==11'd670)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd670;
            end
            else if(height==11'd620)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd620;
            end
            else if(height==11'd480)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd480;
            end
            else if(height==11'd430)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd430;
            end
            else if(height==11'd380)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd380;
            end
            else if(height==11'd360)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd360;
            end
            else if(height==11'd310)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd360;
            end
            else if(height==11'd260)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd360;
            end
            else if(height==11'd240)begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd240;
            end
            else begin
                V_SYNC  = 11'd1;
                V_TOTAL = 11'd1080;
            end
    end

endmodule
