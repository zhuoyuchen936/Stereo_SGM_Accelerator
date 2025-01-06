module SRT4divider_1(
		rst,
		clk,
		clken,
		validin,
        f,
		x, 
	    d,
   		q,
        valid
	  	     );

			  
input clk,rst,clken,f;
input   [10:0] x;//0bit fraction,dividend//[16:0]->[10:0]
input  [10:0] d;//0bit fraction.divisor
input  validin;
output reg  [9:0] q;//12bit fraction,quotient
output valid;


reg valid1,valid2,valid3,valid4,valid5,valid6,valid7;

reg [21:0] temp_x;//m
reg [21:0] temp_d;//n
wire [4:0] m,n;
reg f1;
reg zero;

find_one find_one1({21'd0,x},m);
find_one find_one2({21'd0,d},n);

always@(*)
begin
    case(m)
        5'd0:
        begin
		  	temp_x={5'd0,x[0],16'd0};//x=0110 -> temp_x=000.00110 第一位为符号位，二三位为移位预留
        	
        end
        5'd1:
        begin
        	temp_x={5'd0,x[1:0],15'd0};
        end
        5'd2:
        begin
        	temp_x={5'd0,x[2:0],14'd0};
        end
        5'd3:
        begin
        	temp_x={5'd0,x[3:0],13'd0};
        end
        5'd4:
        begin
        	temp_x={5'd0,x[4:0],12'd0};
        end
        5'd5:
        begin
        	temp_x={5'd0,x[5:0],11'd0};
        end
        5'd6:
        begin
        temp_x={5'd0,x[6:0],10'd0};
        end
        5'd7:
        begin
        	temp_x={5'd0,x[7:0],9'd0};
        end
        5'd8:
        begin
        	temp_x={5'd0,x[8:0],8'd0};
        end
        5'd9:
        begin
        temp_x={5'd0,x[9:0],7'd0};
        end
        5'd10:
        begin
        	temp_x={5'd0,x[10:0],6'd0};
        end
        	default: 
	begin	
			temp_x=22'd0;
	end
	endcase
end

always@(*)
begin
    case(n)
        5'd0:
        begin
		  	temp_d={3'd0,d[0],18'd0};//d=0110 -> temp_d=000.110 第一位为符号位，二三位为移位预留
        end
        5'd1:
        begin
        	temp_d={3'd0,d[1:0],17'd0};
        end
        5'd2:
        begin
        	temp_d={3'd0,d[2:0],16'd0};
        end
        5'd3:
        begin
        	temp_d={3'd0,d[3:0],15'd0};
        end
        5'd4:
        begin
        	temp_d={3'd0,d[4:0],14'd0};
        end
        5'd5:
        begin
        	temp_d={3'd0,d[5:0],13'd0};
        end
        5'd6:
        begin
        temp_d={3'd0,d[6:0],12'd0};
        end
        5'd7:
        begin
        	temp_d={3'd0,d[7:0],11'd0};
        end
        5'd8:
        begin
        	temp_d={3'd0,d[8:0],10'd0};
        end
        5'd9:
        begin
        temp_d={3'd0,d[9:0],9'd0};
        end
        5'd10:
        begin
        	temp_d={3'd0,d[10:0],8'd0};
        end 
	default: 
	begin	
			temp_d=22'd0;
	end
	endcase
end

//shift d right to find value in range [1/2,1)
//shift x right to find value X<D
//初始化完成
wire [21:0] X;
wire [21:0] D;
wire [4:0]M;
wire [4:0]N;

assign X=temp_x;
assign D=temp_d;
assign M=m;
assign N=n;

wire [3:0] LUT_D;
assign LUT_D=D[18:15];//小数前4位
wire [21:0] w0;//4*w0部分余数
assign w0=X;

//On-the-Fly Conversion
	wire [2:0] q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11;
	wire [21:0] output_w1;
	wire [21:0] output_w2;
	wire [21:0] output_w3;
	wire [21:0] output_w4;
	wire [21:0] output_w5;
	wire [21:0] output_w6;
	wire [21:0] output_w7;
	wire [21:0] output_w8;
	wire [21:0] output_w9;
	wire [21:0] output_w10;
	wire [21:0] output_w11;
	//wire [19:0] output_w8;
	wire [25:0] output_A_1;
	wire [25:0] output_A_2;
	wire [25:0] output_A_3;
	wire [25:0] output_A_4;
	wire [25:0] output_A_5;
	wire [25:0] output_A_6;
	wire [25:0] output_A_7;
	wire [25:0] output_A_8;
	wire [25:0] output_A_9;
	wire [25:0] output_A_10;
	wire [25:0] output_A_11;
	//wire [17:0] output_A_8;
	wire [25:0] output_B_1;
	wire [25:0] output_B_2;
	wire [25:0] output_B_3;
	wire [25:0] output_B_4;
	wire [25:0] output_B_5;
	wire [25:0] output_B_6;
	wire [25:0] output_B_7;
	wire [25:0] output_B_8;
	wire [25:0] output_B_9;
	wire [25:0] output_B_10;
	wire [25:0] output_B_11;
	//wire [17:0] output_B_8;
	reg[25:0] output_AB;
	wire [25:0] A;
	wire [25:0] B;
	assign A=26'b0;
	assign B=26'b0;
	
	
	
	LUT_SRT4 LUT_SRT41(LUT_D,w0,q1);
	output_ABW output_ABW1(w0,q1,D,A,B,4'd1,output_A_1,output_B_1,output_w1);

	LUT_SRT4 LUT_SRT42(LUT_D,output_w1,q2);
	output_ABW output_ABW2(output_w1,q2,D,output_A_1,output_B_1,4'd2,output_A_2,output_B_2,output_w2);
	
	LUT_SRT4 LUT_SRT43(LUT_D,output_w2,q3);
	output_ABW output_ABW3(output_w2,q3,D,output_A_2,output_B_2,4'd3,output_A_3,output_B_3,output_w3);
	
	LUT_SRT4 LUT_SRT44(LUT_D,output_w3,q4);
	output_ABW output_ABW4(output_w3,q4,D,output_A_3,output_B_3,4'd4,output_A_4,output_B_4,output_w4);
	
	/*LUT_SRT4 LUT_SRT45(LUT_D,output_w4,q5);
	output_ABW output_ABW5(output_w4,q5,D,output_A_4,output_B_4,4'd5,output_A_5,output_B_5,output_w5);
	
	LUT_SRT4 LUT_SRT46(LUT_D,output_w5,q6);
	output_ABW output_ABW6(output_w5,q6,D,output_A_5,output_B_5,4'd6,output_A_6,output_B_6,output_w6);
	
	LUT_SRT4 LUT_SRT47(LUT_D,output_w6,q7);
	output_ABW output_ABW7(output_w6,q7,D,output_A_6,output_B_6,4'd7,output_A_7,output_B_7,output_w7);

	LUT_SRT4 LUT_SRT48(LUT_D,output_w7,q8);
	output_ABW output_ABW8(output_w7,q8,D,output_A_7,output_B_7,4'd8,output_A_8,output_B_8,output_w8);

	LUT_SRT4 LUT_SRT49(LUT_D,output_w8,q9);
	output_ABW output_ABW9(output_w8,q9,D,output_A_8,output_B_8,4'd9,output_A_9,output_B_9,output_w9);
	
	LUT_SRT4 LUT_SRT410(LUT_D,output_w9,q10);
	output_ABW output_ABW10(output_w9,q10,D,output_A_9,output_B_9,4'd10,output_A_10,output_B_10,output_w10);
	
	LUT_SRT4 LUT_SRT411(LUT_D,output_w10,q11);
	output_ABW output_ABW11(output_w10,q11,D,output_A_10,output_B_10,4'd11,output_A_11,output_B_11,output_w11);*/
	
	//LUT_SRT4 LUT_SRT412(LUT_D,output_w11,q12);
	//output_ABW output_ABW12(output_w11,q12,D,output_A_11,output_B_11,4'd12,output_A_12,output_B_12,output_w12);
reg[8:0] q_final;

reg compare;//com=1;M>N
reg [4:0] num;
//reg [4:0] num2;
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		output_AB<=26'd0;
		compare<= 1'd0;
		 num<=4'd0;
		valid1<=1'd0;
	end
	else if(clken) begin
	if(validin)begin
		//output_AB<=(output_w11[21]) ? output_B_11:output_A_11;
        output_AB<=(output_w4[21]) ? output_B_4:output_A_4;
		 compare<=(M>=N) ? 1'b0:1'b1;
		 num<=(M>=N) ? M-N:N-M;
		valid1<=validin;
		end
		end
		else begin
		output_AB <= output_AB;//0000_0.000_0000
		compare<=compare;
		 num<=num;
		valid1<=valid1;
		end

end


always@(*)begin
    case({compare,num})
        6'd0:
        begin
		  q_final<={3'd0,output_AB[25:21],output_AB[20]};//10整数9小数->8,1
           
        end
        6'd1:
        begin
        	q_final<={2'd0,output_AB[25:20],output_AB[19]};
            
        end
        6'd2:
        begin
        	q_final<={1'd0,output_AB[25:19],output_AB[18]};
            end
        6'd3:
        begin
        	q_final<={output_AB[25:18],output_AB[17]};
            
        end
        6'd4:
        begin
        q_final<={output_AB[24:17],output_AB[16]};
       
        end
        6'd5:
        begin
        q_final<={output_AB[23:16],output_AB[15]};
            
        end
        6'd6:
        begin
        q_final<={output_AB[22:15],output_AB[14]};
         
        end
        6'd7:
        begin
         q_final<={output_AB[21:14],output_AB[13]};
        
        end
        6'd8:
        begin
         q_final<={output_AB[20:13],output_AB[12]};
         
        end
        6'd9:
        begin
         q_final<={output_AB[19:12],output_AB[11]};
        
        end
        6'd10:
        begin
        	 q_final<={output_AB[18:11],output_AB[10]};
         
        end
        6'd11:
        begin
         q_final<={output_AB[17:10],output_AB[9]};
        
        end
        6'd12:
        begin
         q_final<={output_AB[16:9],output_AB[8]};
         
        end
        6'd13:
        begin
        	 q_final<={output_AB[15:8],output_AB[7]};
        
        end
		   6'd14:
        begin
        	 q_final<={output_AB[14:7],output_AB[6]};
        
        end
		   6'd15:
        begin
        	 q_final<={output_AB[13:6],output_AB[5]};
        
        end
		   6'd16:
        begin
        	 q_final<={output_AB[12:5],output_AB[4]};
        
        end
		  6'd32:
        begin
		  q_final<={3'd0,output_AB[25:21],output_AB[20]};
         
        end
        6'd33:
        begin
        	q_final<={4'b0,output_AB[25:22],output_AB[21]};
        
        end
		  6'd34:
        begin
        	q_final<={5'b0,output_AB[25:23],output_AB[22]};
        
        end
		  6'd35:
        begin
        	q_final<={6'b0,output_AB[25:24],output_AB[23]};
        
        end
		  6'd36:
        begin
        	q_final<={7'b0,output_AB[25],output_AB[24]};
 
        end
		  6'd37:
        begin
        	q_final<={8'b0,output_AB[25]};
 
        end
		default: 
	begin	
			q_final<=9'b0;
        
	end
	endcase
	end
	
always@(posedge clk or negedge rst)begin
    if(!rst)begin
		 f1<=1'd0;
         valid2<=1'd0;
    end
    else if(clken)begin
	//  if(valid1)begin
        f1<=f;
		 valid2<=valid1;
		 //q <= A;
    end
	// end
    else begin
         f1<= f;
		  valid2<=valid2;
    end
end


always@(posedge clk or negedge rst)begin
    if(!rst)begin
       zero<= 1'd0;
    end
    else if(clken)begin
if(x == 17'b0)begin
       zero <= 1'd0;
end else begin
	zero <=1'b1;
end
  end  else begin
        zero <= zero;
end
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
       q <= 10'd0;
		 valid3<=1'd0;
    end
    else if(clken)begin
	 if(zero ==1'b0)begin
	q<=10'd0;
valid3<=valid2;
end else begin

       q <= {f1,q_final};
		 valid3<=valid2;
		end
	 end
    else begin
        q <= q;
		  valid3<=valid3;
    end
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        //valid3<=1'b0;
        valid4<=1'b0;
        valid5<=1'b0;
        valid6<=1'b0;
        valid7<=1'b0;
       
    end
    else if(clken)begin
       // valid3<=valid2;
        valid4<=valid3;
        valid5<=valid4;
        valid6<=valid5;
        valid7<=valid6;
    end
    else begin
        //valid3<=valid3;
        valid4<=valid4;
        valid5<=valid5;
        valid6<=valid6;
        valid7<=valid7;
    end
end

assign valid = valid3;

endmodule
	
	
	
	

