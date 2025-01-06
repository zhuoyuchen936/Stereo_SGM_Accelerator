/*
 * @Author: ZhuoyuChen  
 * @Date: 2021-03-17 20:31:35 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 14:47:10
 */


//256 range
 module window_5x3 (
    input clock,
    input clken,
    input rst,
    input [10:0] width,
    input [7:0]  linebuffer0,
    input [7:0]  linebuffer1,
    input [7:0]  linebuffer2,
    input [7:0]  linebuffer3,
    input [7:0]  linebuffer4,


    output [23:0] lb0_pixel,
    output [23:0] lb1_pixel,
    output [23:0] lb2_pixel,
    output [23:0] lb3_pixel,
    output [23:0] lb4_pixel,

    output reg en

);
    reg [7:0] lb0 [2:0];
    reg [7:0] lb1 [2:0];
    reg [7:0] lb2 [2:0];
    reg [7:0] lb3 [2:0];
    reg [7:0] lb4 [2:0];
    


     assign lb0_pixel = {lb0[0],lb0[1],lb0[2]};

     assign lb1_pixel = {lb1[0],lb1[1],lb1[2]};

     assign lb2_pixel = {lb2[0],lb2[1],lb2[2]};

    assign lb3_pixel = {lb3[0],lb3[1],lb3[2]};

    assign lb4_pixel = {lb4[0],lb4[1],lb4[2]};
                    
    //用于计数
    reg [31:0] i;
    always @(posedge clock or negedge rst) begin
        if(!rst)begin
            en<=1'd0;
            i<=0;
        end 
        else if(clken)begin
            if(i>=5*width+1)begin
                i<=5*width+1;
            end
            else begin
                i<=i+1;
            end
        if(i>=5*width+1)begin
                en<=1'b1;
            end
        end
    end

        //用于for循环
        integer a0,a1,a2,a3,a4;
        integer b0,b1,b2,b3,b4;
        always @(posedge clock or negedge rst)begin
            if(!rst)begin
                for(a0=0;a0<3;a0=a0+1)
                    lb0[a0]<=8'd0;
                for(a1=0;a1<3;a1=a1+1)
                    lb1[a1]<=8'd0;
                for(a2=0;a2<3;a2=a2+1)
                    lb2[a2]<=8'd0;
                for(a3=0;a3<3;a3=a3+1)
                    lb3[a3]<=8'd0;
                for(a4=0;a4<3;a4=a4+1)
                    lb4[a4]<=8'd0;
                

            end
            else if(clken)begin
                lb4[0]<=linebuffer4;	
                for(b4=0;b4<2;b4=b4+1)
                lb4[b4+1]<=lb4[b4];

                lb3[0]<=linebuffer3;	
                for(b3=0;b3<2;b3=b3+1)
                lb3[b3+1]<=lb3[b3];

                lb2[0]<=linebuffer2;	
                for(b2=0;b2<2;b2=b2+1)
                lb2[b2+1]<=lb2[b2];
        
                lb1[0]<=linebuffer1;	
                for(b1=0;b1<2;b1=b1+1)
                lb1[b1+1]<=lb1[b1];
        
                lb0[0]<=linebuffer0;	
                for(b0=0;b0<2;b0=b0+1)
                lb0[b0+1]<=lb0[b0];
            end
            
        else begin
            for(a0=0;a0<3;a0=a0+1)
                lb0[a0]<=lb0[a0];
            for(a1=0;a1<3;a1=a1+1)
                lb1[a1]<=lb1[a1];
            for(a2=0;a2<3;a2=a2+1)
                lb2[a2]<=lb2[a2];
            for(a3=0;a3<3;a3=a3+1)
                lb3[a3]<=lb3[a3];
            for(a4=0;a4<3;a4=a4+1)
                lb4[a4]<=lb4[a4];
            end
        end 
endmodule 
