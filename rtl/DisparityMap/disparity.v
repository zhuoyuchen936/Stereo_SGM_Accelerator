//////////////////////////////////////////////////////////////////////////////////

// 

// Create Date: 2023/02/06 

// Uptade Date: 2023/02/23



// Design Name: FangXiwei

// Module Name: disparity

// Project Name: SGM

// 

//////////////////////////////////////////////////////////////////////////////////	


module disparity(

	rst, 
	clk,
	clken,
	en_disp,

	aggregateCost0_0 , aggregateCost0_1 , aggregateCost0_2,
	aggregateCost0_3 , aggregateCost0_4 , aggregateCost0_5,
	aggregateCost0_6 , aggregateCost0_7 , aggregateCost0_8,
	aggregateCost0_9 , aggregateCost0_10, aggregateCost0_11,
	aggregateCost0_12, aggregateCost0_13, aggregateCost0_14,
	aggregateCost0_15, aggregateCost0_16, aggregateCost0_17,
	aggregateCost0_18, aggregateCost0_19, aggregateCost0_20,
	aggregateCost0_21, aggregateCost0_22, aggregateCost0_23,
	aggregateCost0_24, aggregateCost0_25, aggregateCost0_26,
	aggregateCost0_27, aggregateCost0_28, aggregateCost0_29,
	aggregateCost0_30, aggregateCost0_31, aggregateCost0_32,
	aggregateCost0_33, aggregateCost0_34, aggregateCost0_35,
	aggregateCost0_36, aggregateCost0_37, aggregateCost0_38,
	aggregateCost0_39, aggregateCost0_40, aggregateCost0_41,
	aggregateCost0_42, aggregateCost0_43, aggregateCost0_44,
	aggregateCost0_45, aggregateCost0_46, aggregateCost0_47,
	aggregateCost0_48, aggregateCost0_49, aggregateCost0_50,
	aggregateCost0_51, aggregateCost0_52, aggregateCost0_53,
	aggregateCost0_54, aggregateCost0_55, aggregateCost0_56,
	aggregateCost0_57, aggregateCost0_58, aggregateCost0_59,
	aggregateCost0_60, aggregateCost0_61, aggregateCost0_62,
	aggregateCost0_63,

	aggregateCost3_0 , aggregateCost3_1 , aggregateCost3_2,
	aggregateCost3_3 , aggregateCost3_4 , aggregateCost3_5,
	aggregateCost3_6 , aggregateCost3_7 , aggregateCost3_8,
	aggregateCost3_9 , aggregateCost3_10, aggregateCost3_11,
	aggregateCost3_12, aggregateCost3_13, aggregateCost3_14,
	aggregateCost3_15, aggregateCost3_16, aggregateCost3_17,
	aggregateCost3_18, aggregateCost3_19, aggregateCost3_20,
	aggregateCost3_21, aggregateCost3_22, aggregateCost3_23,
	aggregateCost3_24, aggregateCost3_25, aggregateCost3_26,
	aggregateCost3_27, aggregateCost3_28, aggregateCost3_29,
	aggregateCost3_30, aggregateCost3_31, aggregateCost3_32,
	aggregateCost3_33, aggregateCost3_34, aggregateCost3_35,
	aggregateCost3_36, aggregateCost3_37, aggregateCost3_38,
	aggregateCost3_39, aggregateCost3_40, aggregateCost3_41,
	aggregateCost3_42, aggregateCost3_43, aggregateCost3_44,
	aggregateCost3_45, aggregateCost3_46, aggregateCost3_47,
	aggregateCost3_48, aggregateCost3_49, aggregateCost3_50,
	aggregateCost3_51, aggregateCost3_52, aggregateCost3_53,
	aggregateCost3_54, aggregateCost3_55, aggregateCost3_56,
	aggregateCost3_57, aggregateCost3_58, aggregateCost3_59,
	aggregateCost3_60, aggregateCost3_61, aggregateCost3_62,
	aggregateCost3_63,

	

	//output reg [1:0] disp_w,

	disp_final,

	valid_final,
    
    cost_valid
);

input rst;
input clk;
input clken;
input en_disp;

parameter cost_width = 9;

input [cost_width-1:0] aggregateCost0_0 ;input [cost_width-1:0] aggregateCost0_1 ;input [cost_width-1:0] aggregateCost0_2 ;
input [cost_width-1:0] aggregateCost0_3 ;input [cost_width-1:0] aggregateCost0_4 ;input [cost_width-1:0] aggregateCost0_5 ;
input [cost_width-1:0] aggregateCost0_6 ;input [cost_width-1:0] aggregateCost0_7 ;input [cost_width-1:0] aggregateCost0_8 ;
input [cost_width-1:0] aggregateCost0_9 ;input [cost_width-1:0] aggregateCost0_10;input [cost_width-1:0] aggregateCost0_11;
input [cost_width-1:0] aggregateCost0_12;input [cost_width-1:0] aggregateCost0_13;input [cost_width-1:0] aggregateCost0_14;
input [cost_width-1:0] aggregateCost0_15;input [cost_width-1:0] aggregateCost0_16;input [cost_width-1:0] aggregateCost0_17;
input [cost_width-1:0] aggregateCost0_18;input [cost_width-1:0] aggregateCost0_19;input [cost_width-1:0] aggregateCost0_20;
input [cost_width-1:0] aggregateCost0_21;input [cost_width-1:0] aggregateCost0_22;input [cost_width-1:0] aggregateCost0_23;
input [cost_width-1:0] aggregateCost0_24;input [cost_width-1:0] aggregateCost0_25;input [cost_width-1:0] aggregateCost0_26;
input [cost_width-1:0] aggregateCost0_27;input [cost_width-1:0] aggregateCost0_28;input [cost_width-1:0] aggregateCost0_29;
input [cost_width-1:0] aggregateCost0_30;input [cost_width-1:0] aggregateCost0_31;input [cost_width-1:0] aggregateCost0_32;
input [cost_width-1:0] aggregateCost0_33;input [cost_width-1:0] aggregateCost0_34;input [cost_width-1:0] aggregateCost0_35;
input [cost_width-1:0] aggregateCost0_36;input [cost_width-1:0] aggregateCost0_37;input [cost_width-1:0] aggregateCost0_38;
input [cost_width-1:0] aggregateCost0_39;input [cost_width-1:0] aggregateCost0_40;input [cost_width-1:0] aggregateCost0_41;
input [cost_width-1:0] aggregateCost0_42;input [cost_width-1:0] aggregateCost0_43;input [cost_width-1:0] aggregateCost0_44;
input [cost_width-1:0] aggregateCost0_45;input [cost_width-1:0] aggregateCost0_46;input [cost_width-1:0] aggregateCost0_47;
input [cost_width-1:0] aggregateCost0_48;input [cost_width-1:0] aggregateCost0_49;input [cost_width-1:0] aggregateCost0_50;
input [cost_width-1:0] aggregateCost0_51;input [cost_width-1:0] aggregateCost0_52;input [cost_width-1:0] aggregateCost0_53;
input [cost_width-1:0] aggregateCost0_54;input [cost_width-1:0] aggregateCost0_55;input [cost_width-1:0] aggregateCost0_56;
input [cost_width-1:0] aggregateCost0_57;input [cost_width-1:0] aggregateCost0_58;input [cost_width-1:0] aggregateCost0_59;
input [cost_width-1:0] aggregateCost0_60;input [cost_width-1:0] aggregateCost0_61;input [cost_width-1:0] aggregateCost0_62;
input [cost_width-1:0] aggregateCost0_63;

input [cost_width-3:0] aggregateCost3_0 ;input [cost_width-3:0] aggregateCost3_1 ;input [cost_width-3:0] aggregateCost3_2 ;
input [cost_width-3:0] aggregateCost3_3 ;input [cost_width-3:0] aggregateCost3_4 ;input [cost_width-3:0] aggregateCost3_5 ;
input [cost_width-3:0] aggregateCost3_6 ;input [cost_width-3:0] aggregateCost3_7 ;input [cost_width-3:0] aggregateCost3_8 ;
input [cost_width-3:0] aggregateCost3_9 ;input [cost_width-3:0] aggregateCost3_10;input [cost_width-3:0] aggregateCost3_11;
input [cost_width-3:0] aggregateCost3_12;input [cost_width-3:0] aggregateCost3_13;input [cost_width-3:0] aggregateCost3_14;
input [cost_width-3:0] aggregateCost3_15;input [cost_width-3:0] aggregateCost3_16;input [cost_width-3:0] aggregateCost3_17;
input [cost_width-3:0] aggregateCost3_18;input [cost_width-3:0] aggregateCost3_19;input [cost_width-3:0] aggregateCost3_20;
input [cost_width-3:0] aggregateCost3_21;input [cost_width-3:0] aggregateCost3_22;input [cost_width-3:0] aggregateCost3_23;
input [cost_width-3:0] aggregateCost3_24;input [cost_width-3:0] aggregateCost3_25;input [cost_width-3:0] aggregateCost3_26;
input [cost_width-3:0] aggregateCost3_27;input [cost_width-3:0] aggregateCost3_28;input [cost_width-3:0] aggregateCost3_29;
input [cost_width-3:0] aggregateCost3_30;input [cost_width-3:0] aggregateCost3_31;input [cost_width-3:0] aggregateCost3_32;
input [cost_width-3:0] aggregateCost3_33;input [cost_width-3:0] aggregateCost3_34;input [cost_width-3:0] aggregateCost3_35;
input [cost_width-3:0] aggregateCost3_36;input [cost_width-3:0] aggregateCost3_37;input [cost_width-3:0] aggregateCost3_38;
input [cost_width-3:0] aggregateCost3_39;input [cost_width-3:0] aggregateCost3_40;input [cost_width-3:0] aggregateCost3_41;
input [cost_width-3:0] aggregateCost3_42;input [cost_width-3:0] aggregateCost3_43;input [cost_width-3:0] aggregateCost3_44;
input [cost_width-3:0] aggregateCost3_45;input [cost_width-3:0] aggregateCost3_46;input [cost_width-3:0] aggregateCost3_47;
input [cost_width-3:0] aggregateCost3_48;input [cost_width-3:0] aggregateCost3_49;input [cost_width-3:0] aggregateCost3_50;
input [cost_width-3:0] aggregateCost3_51;input [cost_width-3:0] aggregateCost3_52;input [cost_width-3:0] aggregateCost3_53;
input [cost_width-3:0] aggregateCost3_54;input [cost_width-3:0] aggregateCost3_55;input [cost_width-3:0] aggregateCost3_56;
input [cost_width-3:0] aggregateCost3_57;input [cost_width-3:0] aggregateCost3_58;input [cost_width-3:0] aggregateCost3_59;
input [cost_width-3:0] aggregateCost3_60;input [cost_width-3:0] aggregateCost3_61;input [cost_width-3:0] aggregateCost3_62;
input [cost_width-3:0] aggregateCost3_63;

output reg [15:0] disp_final;

output reg valid_final;

input [63:0] cost_valid;

reg[cost_width-2:0] S [63:0];
reg[cost_width-2:0] S1 [63:0];
reg[cost_width-2:0] S2 [63:0];
reg[cost_width-2:0] S3 [63:0];
reg[cost_width-2:0] S4 [63:0];
reg[cost_width-2:0] S5 [63:0];
reg[cost_width-2:0] S6 [63:0];
reg[cost_width-2:0] S7 [63:0];
reg[cost_width-2:0] S8 [63:0];
reg[cost_width-2:0] S9 [63:0];
reg[cost_width-2:0] S10 [63:0];
reg[cost_width-2:0] S11 [63:0];
reg[cost_width-2:0] S12 [63:0];
reg[cost_width-2:0] S13 [63:0];
reg[cost_width-2:0] S14 [63:0];
reg[cost_width-2:0] S15 [63:0];

reg [cost_width-2:0] S20;
reg [cost_width-2:0] S21;
reg [cost_width-2:0] S22;
//reg [cost_width-2:0] S331;

reg valid0,valid1,valid2,valid3,valid4,valid5,valid6,valid7,valid8,valid9,valid10,valid11,valid12,valid13,valid14,valid15,valid16,valid17,valid18,valid19,valid20,valid21,valid22;
wire validLUT;


always@(posedge clk or negedge rst)begin

	if(rst==0)begin

		S[0]<={(cost_width-1){1'b0}};
		S[1]<={(cost_width-1){1'b0}};
		S[2]<={(cost_width-1){1'b0}};
		S[3]<={(cost_width-1){1'b0}};
		S[4]<={(cost_width-1){1'b0}};
		S[5]<={(cost_width-1){1'b0}};
		S[6]<={(cost_width-1){1'b0}};
		S[7]<={(cost_width-1){1'b0}};
		S[8]<={(cost_width-1){1'b0}};
		S[9]<={(cost_width-1){1'b0}};
		S[10]<={(cost_width-1){1'b0}};
		S[11]<={(cost_width-1){1'b0}};
		S[12]<={(cost_width-1){1'b0}};
		S[13]<={(cost_width-1){1'b0}};
		S[14]<={(cost_width-1){1'b0}};
		S[15]<={(cost_width-1){1'b0}};
		S[16]<={(cost_width-1){1'b0}};
		S[17]<={(cost_width-1){1'b0}};
		S[18]<={(cost_width-1){1'b0}};
		S[19]<={(cost_width-1){1'b0}};
		S[20]<={(cost_width-1){1'b0}};
		S[21]<={(cost_width-1){1'b0}};
		S[22]<={(cost_width-1){1'b0}};
		S[23]<={(cost_width-1){1'b0}};
		S[24]<={(cost_width-1){1'b0}};
		S[25]<={(cost_width-1){1'b0}};
		S[26]<={(cost_width-1){1'b0}};
		S[27]<={(cost_width-1){1'b0}};
		S[28]<={(cost_width-1){1'b0}};
		S[29]<={(cost_width-1){1'b0}};
		S[30]<={(cost_width-1){1'b0}};
		S[31]<={(cost_width-1){1'b0}};
		S[32]<={(cost_width-1){1'b0}};
		S[33]<={(cost_width-1){1'b0}};
		S[34]<={(cost_width-1){1'b0}};
		S[35]<={(cost_width-1){1'b0}};
		S[36]<={(cost_width-1){1'b0}};
		S[37]<={(cost_width-1){1'b0}};
		S[38]<={(cost_width-1){1'b0}};
		S[39]<={(cost_width-1){1'b0}};
		S[40]<={(cost_width-1){1'b0}};
		S[41]<={(cost_width-1){1'b0}};
		S[42]<={(cost_width-1){1'b0}};
		S[43]<={(cost_width-1){1'b0}};
		S[44]<={(cost_width-1){1'b0}};
		S[45]<={(cost_width-1){1'b0}};
		S[46]<={(cost_width-1){1'b0}};
		S[47]<={(cost_width-1){1'b0}};
		S[48]<={(cost_width-1){1'b0}};
		S[49]<={(cost_width-1){1'b0}};
		S[50]<={(cost_width-1){1'b0}};
		S[51]<={(cost_width-1){1'b0}};
		S[52]<={(cost_width-1){1'b0}};
		S[53]<={(cost_width-1){1'b0}};
		S[54]<={(cost_width-1){1'b0}};
		S[55]<={(cost_width-1){1'b0}};
		S[56]<={(cost_width-1){1'b0}};
		S[57]<={(cost_width-1){1'b0}};
		S[58]<={(cost_width-1){1'b0}};
		S[59]<={(cost_width-1){1'b0}};
		S[60]<={(cost_width-1){1'b0}};
		S[61]<={(cost_width-1){1'b0}};
		S[62]<={(cost_width-1){1'b0}};
		S[63]<={(cost_width-1){1'b0}};

		valid0<=0;

	end

	else if(clken) begin

		 S[0] <=cost_valid[0] ? (aggregateCost0_0[cost_width-1:2]+aggregateCost3_0)  :{(cost_width-1){1'b1}};
		 S[1] <=cost_valid[1] ? (aggregateCost0_1[cost_width-1:2]+aggregateCost3_1)  :{(cost_width-1){1'b1}};
		 S[2] <=cost_valid[2] ? (aggregateCost0_2[cost_width-1:2]+aggregateCost3_2)  :{(cost_width-1){1'b1}};
		 S[3] <=cost_valid[3] ? (aggregateCost0_3[cost_width-1:2]+aggregateCost3_3)  :{(cost_width-1){1'b1}};
		 S[4] <=cost_valid[4] ? (aggregateCost0_4[cost_width-1:2]+aggregateCost3_4)  :{(cost_width-1){1'b1}};
		 S[5] <=cost_valid[5] ? (aggregateCost0_5[cost_width-1:2]+aggregateCost3_5)  :{(cost_width-1){1'b1}};
		 S[6] <=cost_valid[6] ? (aggregateCost0_6[cost_width-1:2]+aggregateCost3_6)  :{(cost_width-1){1'b1}};
		 S[7] <=cost_valid[7] ? (aggregateCost0_7[cost_width-1:2]+aggregateCost3_7)  :{(cost_width-1){1'b1}};
		 S[8] <=cost_valid[8] ? (aggregateCost0_8[cost_width-1:2]+aggregateCost3_8)  :{(cost_width-1){1'b1}};
		 S[9] <=cost_valid[9] ? (aggregateCost0_9[cost_width-1:2]+aggregateCost3_9)  :{(cost_width-1){1'b1}};
		 S[10]<=cost_valid[10]? (aggregateCost0_10[cost_width-1:2]+aggregateCost3_10):{(cost_width-1){1'b1}};
		 S[11]<=cost_valid[11]? (aggregateCost0_11[cost_width-1:2]+aggregateCost3_11):{(cost_width-1){1'b1}};
		 S[12]<=cost_valid[12]? (aggregateCost0_12[cost_width-1:2]+aggregateCost3_12):{(cost_width-1){1'b1}};
		 S[13]<=cost_valid[13]? (aggregateCost0_13[cost_width-1:2]+aggregateCost3_13):{(cost_width-1){1'b1}};		
 		 S[14]<=cost_valid[14]? (aggregateCost0_14[cost_width-1:2]+aggregateCost3_14):{(cost_width-1){1'b1}};
 		 S[15]<=cost_valid[15]? (aggregateCost0_15[cost_width-1:2]+aggregateCost3_15):{(cost_width-1){1'b1}};
 		 S[16]<=cost_valid[16]? (aggregateCost0_16[cost_width-1:2]+aggregateCost3_16):{(cost_width-1){1'b1}};
 		 S[17]<=cost_valid[17]? (aggregateCost0_17[cost_width-1:2]+aggregateCost3_17):{(cost_width-1){1'b1}};
 		 S[18]<=cost_valid[18]? (aggregateCost0_18[cost_width-1:2]+aggregateCost3_18):{(cost_width-1){1'b1}};
 		 S[19]<=cost_valid[19]? (aggregateCost0_19[cost_width-1:2]+aggregateCost3_19):{(cost_width-1){1'b1}};
 		 S[20]<=cost_valid[20]? (aggregateCost0_20[cost_width-1:2]+aggregateCost3_20):{(cost_width-1){1'b1}};
 		 S[21]<=cost_valid[21]? (aggregateCost0_21[cost_width-1:2]+aggregateCost3_21):{(cost_width-1){1'b1}};
 		 S[22]<=cost_valid[22]? (aggregateCost0_22[cost_width-1:2]+aggregateCost3_22):{(cost_width-1){1'b1}};
 		 S[23]<=cost_valid[23]? (aggregateCost0_23[cost_width-1:2]+aggregateCost3_23):{(cost_width-1){1'b1}};
 		 S[24]<=cost_valid[24]? (aggregateCost0_24[cost_width-1:2]+aggregateCost3_24):{(cost_width-1){1'b1}};
 		 S[25]<=cost_valid[25]? (aggregateCost0_25[cost_width-1:2]+aggregateCost3_25):{(cost_width-1){1'b1}};
 		 S[26]<=cost_valid[26]? (aggregateCost0_26[cost_width-1:2]+aggregateCost3_26):{(cost_width-1){1'b1}};
 		 S[27]<=cost_valid[27]? (aggregateCost0_27[cost_width-1:2]+aggregateCost3_27):{(cost_width-1){1'b1}};
 		 S[28]<=cost_valid[28]? (aggregateCost0_28[cost_width-1:2]+aggregateCost3_28):{(cost_width-1){1'b1}};
 		 S[29]<=cost_valid[29]? (aggregateCost0_29[cost_width-1:2]+aggregateCost3_29):{(cost_width-1){1'b1}};
 		 S[30]<=cost_valid[30]? (aggregateCost0_30[cost_width-1:2]+aggregateCost3_30):{(cost_width-1){1'b1}};
 		 S[31]<=cost_valid[31]? (aggregateCost0_31[cost_width-1:2]+aggregateCost3_31):{(cost_width-1){1'b1}};
		 S[32]<=cost_valid[32]? (aggregateCost0_32[cost_width-1:2]+aggregateCost3_32):{(cost_width-1){1'b1}};
		 S[33]<=cost_valid[33]? (aggregateCost0_33[cost_width-1:2]+aggregateCost3_33):{(cost_width-1){1'b1}};
		 S[34]<=cost_valid[34]? (aggregateCost0_34[cost_width-1:2]+aggregateCost3_34):{(cost_width-1){1'b1}};
		 S[35]<=cost_valid[35]? (aggregateCost0_35[cost_width-1:2]+aggregateCost3_35):{(cost_width-1){1'b1}};
		 S[36]<=cost_valid[36]? (aggregateCost0_36[cost_width-1:2]+aggregateCost3_36):{(cost_width-1){1'b1}};
		 S[37]<=cost_valid[37]? (aggregateCost0_37[cost_width-1:2]+aggregateCost3_37):{(cost_width-1){1'b1}};
		 S[38]<=cost_valid[38]? (aggregateCost0_38[cost_width-1:2]+aggregateCost3_38):{(cost_width-1){1'b1}};
		 S[39]<=cost_valid[39]? (aggregateCost0_39[cost_width-1:2]+aggregateCost3_39):{(cost_width-1){1'b1}};
		 S[40]<=cost_valid[40]? (aggregateCost0_40[cost_width-1:2]+aggregateCost3_40):{(cost_width-1){1'b1}};
		 S[41]<=cost_valid[41]? (aggregateCost0_41[cost_width-1:2]+aggregateCost3_41):{(cost_width-1){1'b1}};
		 S[42]<=cost_valid[42]? (aggregateCost0_42[cost_width-1:2]+aggregateCost3_42):{(cost_width-1){1'b1}};
		 S[43]<=cost_valid[43]? (aggregateCost0_43[cost_width-1:2]+aggregateCost3_43):{(cost_width-1){1'b1}};		
 		 S[44]<=cost_valid[44]? (aggregateCost0_44[cost_width-1:2]+aggregateCost3_44):{(cost_width-1){1'b1}};
 		 S[45]<=cost_valid[45]? (aggregateCost0_45[cost_width-1:2]+aggregateCost3_45):{(cost_width-1){1'b1}};
 		 S[46]<=cost_valid[46]? (aggregateCost0_46[cost_width-1:2]+aggregateCost3_46):{(cost_width-1){1'b1}};
 		 S[47]<=cost_valid[47]? (aggregateCost0_47[cost_width-1:2]+aggregateCost3_47):{(cost_width-1){1'b1}};
 		 S[48]<=cost_valid[48]? (aggregateCost0_48[cost_width-1:2]+aggregateCost3_48):{(cost_width-1){1'b1}};
 		 S[49]<=cost_valid[49]? (aggregateCost0_49[cost_width-1:2]+aggregateCost3_49):{(cost_width-1){1'b1}};
 		 S[50]<=cost_valid[50]? (aggregateCost0_50[cost_width-1:2]+aggregateCost3_50):{(cost_width-1){1'b1}};
 		 S[51]<=cost_valid[51]? (aggregateCost0_51[cost_width-1:2]+aggregateCost3_51):{(cost_width-1){1'b1}};
 		 S[52]<=cost_valid[52]? (aggregateCost0_52[cost_width-1:2]+aggregateCost3_52):{(cost_width-1){1'b1}};
 		 S[53]<=cost_valid[53]? (aggregateCost0_53[cost_width-1:2]+aggregateCost3_53):{(cost_width-1){1'b1}};
 		 S[54]<=cost_valid[54]? (aggregateCost0_54[cost_width-1:2]+aggregateCost3_54):{(cost_width-1){1'b1}};
 		 S[55]<=cost_valid[55]? (aggregateCost0_55[cost_width-1:2]+aggregateCost3_55):{(cost_width-1){1'b1}};
 		 S[56]<=cost_valid[56]? (aggregateCost0_56[cost_width-1:2]+aggregateCost3_56):{(cost_width-1){1'b1}};
 		 S[57]<=cost_valid[57]? (aggregateCost0_57[cost_width-1:2]+aggregateCost3_57):{(cost_width-1){1'b1}};
 		 S[58]<=cost_valid[58]? (aggregateCost0_58[cost_width-1:2]+aggregateCost3_58):{(cost_width-1){1'b1}};
 		 S[59]<=cost_valid[59]? (aggregateCost0_59[cost_width-1:2]+aggregateCost3_59):{(cost_width-1){1'b1}};
 		 S[60]<=cost_valid[60]? (aggregateCost0_60[cost_width-1:2]+aggregateCost3_60):{(cost_width-1){1'b1}};
 		 S[61]<=cost_valid[61]? (aggregateCost0_61[cost_width-1:2]+aggregateCost3_61):{(cost_width-1){1'b1}};
		 S[62]<=cost_valid[62]? (aggregateCost0_62[cost_width-1:2]+aggregateCost3_62):{(cost_width-1){1'b1}};
		 S[63]<=cost_valid[63]? (aggregateCost0_63[cost_width-1:2]+aggregateCost3_63):{(cost_width-1){1'b1}};
//S129<=S1[29];
//S30<=S[30];
//S131<=S1[31];

		valid0<=en_disp;

	end

end

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
        	S1[0]<={(cost_width-1){1'b0}};
		S1[1]<={(cost_width-1){1'b0}};
		S1[2]<={(cost_width-1){1'b0}};
		S1[3]<={(cost_width-1){1'b0}};
		S1[4]<={(cost_width-1){1'b0}};
		S1[5]<={(cost_width-1){1'b0}};
		S1[6]<={(cost_width-1){1'b0}};
		S1[7]<={(cost_width-1){1'b0}};
		S1[8]<={(cost_width-1){1'b0}};
		S1[9]<={(cost_width-1){1'b0}};
		S1[10]<={(cost_width-1){1'b0}};
		S1[11]<={(cost_width-1){1'b0}};
		S1[12]<={(cost_width-1){1'b0}};
		S1[13]<={(cost_width-1){1'b0}};
		S1[14]<={(cost_width-1){1'b0}};
		S1[15]<={(cost_width-1){1'b0}};
		S1[16]<={(cost_width-1){1'b0}};
		S1[17]<={(cost_width-1){1'b0}};
		S1[18]<={(cost_width-1){1'b0}};
		S1[19]<={(cost_width-1){1'b0}};
		S1[20]<={(cost_width-1){1'b0}};
		S1[21]<={(cost_width-1){1'b0}};
		S1[22]<={(cost_width-1){1'b0}};
		S1[23]<={(cost_width-1){1'b0}};
		S1[24]<={(cost_width-1){1'b0}};
		S1[25]<={(cost_width-1){1'b0}};
		S1[26]<={(cost_width-1){1'b0}};
		S1[27]<={(cost_width-1){1'b0}};
		S1[28]<={(cost_width-1){1'b0}};
		S1[29]<={(cost_width-1){1'b0}};
		S1[30]<={(cost_width-1){1'b0}};
		S1[31]<={(cost_width-1){1'b0}};
		S1[32]<={(cost_width-1){1'b0}};
		S1[33]<={(cost_width-1){1'b0}};
		S1[34]<={(cost_width-1){1'b0}};
		S1[35]<={(cost_width-1){1'b0}};
		S1[36]<={(cost_width-1){1'b0}};
		S1[37]<={(cost_width-1){1'b0}};
		S1[38]<={(cost_width-1){1'b0}};
		S1[39]<={(cost_width-1){1'b0}};
		S1[40]<={(cost_width-1){1'b0}};
		S1[41]<={(cost_width-1){1'b0}};
		S1[42]<={(cost_width-1){1'b0}};
		S1[43]<={(cost_width-1){1'b0}};
		S1[44]<={(cost_width-1){1'b0}};
		S1[45]<={(cost_width-1){1'b0}};
		S1[46]<={(cost_width-1){1'b0}};
		S1[47]<={(cost_width-1){1'b0}};
		S1[48]<={(cost_width-1){1'b0}};
		S1[49]<={(cost_width-1){1'b0}};
		S1[50]<={(cost_width-1){1'b0}};
		S1[51]<={(cost_width-1){1'b0}};
		S1[52]<={(cost_width-1){1'b0}};
		S1[53]<={(cost_width-1){1'b0}};
		S1[54]<={(cost_width-1){1'b0}};
		S1[55]<={(cost_width-1){1'b0}};
		S1[56]<={(cost_width-1){1'b0}};
		S1[57]<={(cost_width-1){1'b0}};
		S1[58]<={(cost_width-1){1'b0}};
		S1[59]<={(cost_width-1){1'b0}};
		S1[60]<={(cost_width-1){1'b0}};
		S1[61]<={(cost_width-1){1'b0}};
		S1[62]<={(cost_width-1){1'b0}};
		S1[63]<={(cost_width-1){1'b0}};

	end

	else if(clken) begin
		S1[0]<=S[0];
		S1[1]<=S[1];
		S1[2]<=S[2];
		S1[3]<=S[3];
     		S1[4]<=S[4];
		S1[5]<=S[5];
      		S1[6]<=S[6];
		S1[7]<=S[7];
		S1[8]<=S[8];
		S1[9]<=S[9];
		S1[10]<=S[10];
		S1[11]<=S[11];
      		S1[12]<=S[12];
		S1[13]<=S[13];
      		S1[14]<=S[14];
		S1[15]<=S[15];
		S1[16]<=S[16];
		S1[17]<=S[17];
		S1[18]<=S[18];
		S1[19]<=S[19];
      		S1[20]<=S[20];
		S1[21]<=S[21];
      		S1[22]<=S[22];
		S1[23]<=S[23];
		S1[24]<=S[24];
		S1[25]<=S[25];
		S1[26]<=S[26];
		S1[27]<=S[27];
      		S1[28]<=S[28];
		S1[29]<=S[29];
      		S1[30]<=S[30];
		S1[31]<=S[31];
		S1[32]<=S[32];
		S1[33]<=S[33];
		S1[34]<=S[34];
		S1[35]<=S[35];
      		S1[36]<=S[36];
		S1[37]<=S[37];
     		S1[38]<=S[38];
		S1[39]<=S[39];
		S1[40]<=S[40];
		S1[41]<=S[41];
		S1[42]<=S[42];
		S1[43]<=S[43];
      		S1[44]<=S[44];
		S1[45]<=S[45];
      		S1[46]<=S[46];
		S1[47]<=S[47];
		S1[48]<=S[48];
		S1[49]<=S[49];
		S1[50]<=S[50];
		S1[51]<=S[51];
      		S1[52]<=S[52];
		S1[53]<=S[53];
      		S1[54]<=S[54];
		S1[55]<=S[55];
		S1[56]<=S[56];
		S1[57]<=S[57];
		S1[58]<=S[58];
		S1[59]<=S[59];
      		S1[60]<=S[60];
		S1[61]<=S[61];
     		S1[62]<=S[62];
		S1[63]<=S[63];
end
end

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
      		S2[0]<={(cost_width-1){1'b0}};
		S2[1]<={(cost_width-1){1'b0}};
		S2[2]<={(cost_width-1){1'b0}};
		S2[3]<={(cost_width-1){1'b0}};
		S2[4]<={(cost_width-1){1'b0}};
		S2[5]<={(cost_width-1){1'b0}};
		S2[6]<={(cost_width-1){1'b0}};
		S2[7]<={(cost_width-1){1'b0}};
		S2[8]<={(cost_width-1){1'b0}};
		S2[9]<={(cost_width-1){1'b0}};
		S2[10]<={(cost_width-1){1'b0}};
		S2[11]<={(cost_width-1){1'b0}};
		S2[12]<={(cost_width-1){1'b0}};
		S2[13]<={(cost_width-1){1'b0}};
		S2[14]<={(cost_width-1){1'b0}};
		S2[15]<={(cost_width-1){1'b0}};
		S2[16]<={(cost_width-1){1'b0}};
		S2[17]<={(cost_width-1){1'b0}};
		S2[18]<={(cost_width-1){1'b0}};
		S2[19]<={(cost_width-1){1'b0}};
		S2[20]<={(cost_width-1){1'b0}};
		S2[21]<={(cost_width-1){1'b0}};
		S2[22]<={(cost_width-1){1'b0}};
		S2[23]<={(cost_width-1){1'b0}};
		S2[24]<={(cost_width-1){1'b0}};
		S2[25]<={(cost_width-1){1'b0}};
		S2[26]<={(cost_width-1){1'b0}};
		S2[27]<={(cost_width-1){1'b0}};
		S2[28]<={(cost_width-1){1'b0}};
		S2[29]<={(cost_width-1){1'b0}};
		S2[30]<={(cost_width-1){1'b0}};
		S2[31]<={(cost_width-1){1'b0}};
		S2[32]<={(cost_width-1){1'b0}};
		S2[33]<={(cost_width-1){1'b0}};
		S2[34]<={(cost_width-1){1'b0}};
		S2[35]<={(cost_width-1){1'b0}};
		S2[36]<={(cost_width-1){1'b0}};
		S2[37]<={(cost_width-1){1'b0}};
		S2[38]<={(cost_width-1){1'b0}};
		S2[39]<={(cost_width-1){1'b0}};
		S2[40]<={(cost_width-1){1'b0}};
		S2[41]<={(cost_width-1){1'b0}};
		S2[42]<={(cost_width-1){1'b0}};
		S2[43]<={(cost_width-1){1'b0}};
		S2[44]<={(cost_width-1){1'b0}};
		S2[45]<={(cost_width-1){1'b0}};
		S2[46]<={(cost_width-1){1'b0}};
		S2[47]<={(cost_width-1){1'b0}};
		S2[48]<={(cost_width-1){1'b0}};
		S2[49]<={(cost_width-1){1'b0}};
		S2[50]<={(cost_width-1){1'b0}};
		S2[51]<={(cost_width-1){1'b0}};
		S2[52]<={(cost_width-1){1'b0}};
		S2[53]<={(cost_width-1){1'b0}};
		S2[54]<={(cost_width-1){1'b0}};
		S2[55]<={(cost_width-1){1'b0}};
		S2[56]<={(cost_width-1){1'b0}};
		S2[57]<={(cost_width-1){1'b0}};
		S2[58]<={(cost_width-1){1'b0}};
		S2[59]<={(cost_width-1){1'b0}};
		S2[60]<={(cost_width-1){1'b0}};
		S2[61]<={(cost_width-1){1'b0}};
		S2[62]<={(cost_width-1){1'b0}};
		S2[63]<={(cost_width-1){1'b0}};

	end

	else if(clken) begin
		S2[0]<=S1[0];
		S2[1]<=S1[1];
		S2[2]<=S1[2];
		S2[3]<=S1[3];
      		S2[4]<=S1[4];
		S2[5]<=S1[5];
      		S2[6]<=S1[6];
		S2[7]<=S1[7];
		S2[8]<=S1[8];
		S2[9]<=S1[9];
		S2[10]<=S1[10];
		S2[11]<=S1[11];
      		S2[12]<=S1[12];
		S2[13]<=S1[13];
      		S2[14]<=S1[14];
		S2[15]<=S1[15];
		S2[16]<=S1[16];
		S2[17]<=S1[17];
		S2[18]<=S1[18];
		S2[19]<=S1[19];
      		S2[20]<=S1[20];
		S2[21]<=S1[21];
      		S2[22]<=S1[22];
		S2[23]<=S1[23];
		S2[24]<=S1[24];
		S2[25]<=S1[25];
		S2[26]<=S1[26];
		S2[27]<=S1[27];
      		S2[28]<=S1[28];
		S2[29]<=S1[29];
      		S2[30]<=S1[30];
		S2[31]<=S1[31];
		S2[32]<=S1[32];
		S2[33]<=S1[33];
		S2[34]<=S1[34];
		S2[35]<=S1[35];
      		S2[36]<=S1[36];
		S2[37]<=S1[37];
      		S2[38]<=S1[38];
		S2[39]<=S1[39];
		S2[40]<=S1[40];
		S2[41]<=S1[41];
		S2[42]<=S1[42];
		S2[43]<=S1[43];
      		S2[44]<=S1[44];
		S2[45]<=S1[45];
      		S2[46]<=S1[46];
		S2[47]<=S1[47];
		S2[48]<=S1[48];
		S2[49]<=S1[49];
		S2[50]<=S1[50];
		S2[51]<=S1[51];
     		S2[52]<=S1[52];
		S2[53]<=S1[53];
      		S2[54]<=S1[54];
		S2[55]<=S1[55];
		S2[56]<=S1[56];
		S2[57]<=S1[57];
		S2[58]<=S1[58];
		S2[59]<=S1[59];
      		S2[60]<=S1[60];
		S2[61]<=S1[61];
     		S2[62]<=S1[62];
		S2[63]<=S1[63];
	end
end

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
        	S3[0]<={(cost_width-1){1'b0}};
		S3[1]<={(cost_width-1){1'b0}};
		S3[2]<={(cost_width-1){1'b0}};
		S3[3]<={(cost_width-1){1'b0}};
		S3[4]<={(cost_width-1){1'b0}};
		S3[5]<={(cost_width-1){1'b0}};
		S3[6]<={(cost_width-1){1'b0}};
		S3[7]<={(cost_width-1){1'b0}};
		S3[8]<={(cost_width-1){1'b0}};
		S3[9]<={(cost_width-1){1'b0}};
		S3[10]<={(cost_width-1){1'b0}};
		S3[11]<={(cost_width-1){1'b0}};
		S3[12]<={(cost_width-1){1'b0}};
		S3[13]<={(cost_width-1){1'b0}};
		S3[14]<={(cost_width-1){1'b0}};
		S3[15]<={(cost_width-1){1'b0}};
		S3[16]<={(cost_width-1){1'b0}};
		S3[17]<={(cost_width-1){1'b0}};
		S3[18]<={(cost_width-1){1'b0}};
		S3[19]<={(cost_width-1){1'b0}};
		S3[20]<={(cost_width-1){1'b0}};
		S3[21]<={(cost_width-1){1'b0}};
		S3[22]<={(cost_width-1){1'b0}};
		S3[23]<={(cost_width-1){1'b0}};
		S3[24]<={(cost_width-1){1'b0}};
		S3[25]<={(cost_width-1){1'b0}};
		S3[26]<={(cost_width-1){1'b0}};
		S3[27]<={(cost_width-1){1'b0}};
		S3[28]<={(cost_width-1){1'b0}};
		S3[29]<={(cost_width-1){1'b0}};
		S3[30]<={(cost_width-1){1'b0}};
		S3[31]<={(cost_width-1){1'b0}};
		S3[32]<={(cost_width-1){1'b0}};
		S3[33]<={(cost_width-1){1'b0}};
		S3[34]<={(cost_width-1){1'b0}};
		S3[35]<={(cost_width-1){1'b0}};
		S3[36]<={(cost_width-1){1'b0}};
		S3[37]<={(cost_width-1){1'b0}};
		S3[38]<={(cost_width-1){1'b0}};
		S3[39]<={(cost_width-1){1'b0}};
		S3[40]<={(cost_width-1){1'b0}};
		S3[41]<={(cost_width-1){1'b0}};
		S3[42]<={(cost_width-1){1'b0}};
		S3[43]<={(cost_width-1){1'b0}};
		S3[44]<={(cost_width-1){1'b0}};
		S3[45]<={(cost_width-1){1'b0}};
		S3[46]<={(cost_width-1){1'b0}};
		S3[47]<={(cost_width-1){1'b0}};
		S3[48]<={(cost_width-1){1'b0}};
		S3[49]<={(cost_width-1){1'b0}};
		S3[50]<={(cost_width-1){1'b0}};
		S3[51]<={(cost_width-1){1'b0}};
		S3[52]<={(cost_width-1){1'b0}};
		S3[53]<={(cost_width-1){1'b0}};
		S3[54]<={(cost_width-1){1'b0}};
		S3[55]<={(cost_width-1){1'b0}};
		S3[56]<={(cost_width-1){1'b0}};
		S3[57]<={(cost_width-1){1'b0}};
		S3[58]<={(cost_width-1){1'b0}};
		S3[59]<={(cost_width-1){1'b0}};
		S3[60]<={(cost_width-1){1'b0}};
		S3[61]<={(cost_width-1){1'b0}};
		S3[62]<={(cost_width-1){1'b0}};
		S3[63]<={(cost_width-1){1'b0}};

	end

	else if(clken) begin
		S3[0]<=S2[0];
		S3[1]<=S2[1];
		S3[2]<=S2[2];
		S3[3]<=S2[3];
     		S3[4]<=S2[4];
		S3[5]<=S2[5];
      		S3[6]<=S2[6];
		S3[7]<=S2[7];
		S3[8]<=S2[8];
		S3[9]<=S2[9];
		S3[10]<=S2[10];
		S3[11]<=S2[11];
      		S3[12]<=S2[12];
		S3[13]<=S2[13];
      		S3[14]<=S2[14];
		S3[15]<=S2[15];
		S3[16]<=S2[16];
		S3[17]<=S2[17];
		S3[18]<=S2[18];
		S3[19]<=S2[19];
      		S3[20]<=S2[20];
		S3[21]<=S2[21];
      		S3[22]<=S2[22];
		S3[23]<=S2[23];
		S3[24]<=S2[24];
		S3[25]<=S2[25];
		S3[26]<=S2[26];
		S3[27]<=S2[27];
      		S3[28]<=S2[28];
		S3[29]<=S2[29];
      		S3[30]<=S2[30];
		S3[31]<=S2[31];
		S3[32]<=S2[32];
		S3[33]<=S2[33];
		S3[34]<=S2[34];
		S3[35]<=S2[35];
      		S3[36]<=S2[36];
		S3[37]<=S2[37];
     		S3[38]<=S2[38];
		S3[39]<=S2[39];
		S3[40]<=S2[40];
		S3[41]<=S2[41];
		S3[42]<=S2[42];
		S3[43]<=S2[43];
      		S3[44]<=S2[44];
		S3[45]<=S2[45];
      		S3[46]<=S2[46];
		S3[47]<=S2[47];
		S3[48]<=S2[48];
		S3[49]<=S2[49];
		S3[50]<=S2[50];
		S3[51]<=S2[51];
      		S3[52]<=S2[52];
		S3[53]<=S2[53];
      		S3[54]<=S2[54];
		S3[55]<=S2[55];
		S3[56]<=S2[56];
		S3[57]<=S2[57];
		S3[58]<=S2[58];
		S3[59]<=S2[59];
      		S3[60]<=S2[60];
		S3[61]<=S2[61];
     		S3[62]<=S2[62];
		S3[63]<=S2[63];
end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
     		S4[0]<={(cost_width-1){1'b0}};
		S4[1]<={(cost_width-1){1'b0}};
		S4[2]<={(cost_width-1){1'b0}};
		S4[3]<={(cost_width-1){1'b0}};
		S4[4]<={(cost_width-1){1'b0}};
		S4[5]<={(cost_width-1){1'b0}};
		S4[6]<={(cost_width-1){1'b0}};
		S4[7]<={(cost_width-1){1'b0}};
		S4[8]<={(cost_width-1){1'b0}};
		S4[9]<={(cost_width-1){1'b0}};
		S4[10]<={(cost_width-1){1'b0}};
		S4[11]<={(cost_width-1){1'b0}};
		S4[12]<={(cost_width-1){1'b0}};
		S4[13]<={(cost_width-1){1'b0}};
		S4[14]<={(cost_width-1){1'b0}};
		S4[15]<={(cost_width-1){1'b0}};
		S4[16]<={(cost_width-1){1'b0}};
		S4[17]<={(cost_width-1){1'b0}};
		S4[18]<={(cost_width-1){1'b0}};
		S4[19]<={(cost_width-1){1'b0}};
		S4[20]<={(cost_width-1){1'b0}};
		S4[21]<={(cost_width-1){1'b0}};
		S4[22]<={(cost_width-1){1'b0}};
		S4[23]<={(cost_width-1){1'b0}};
		S4[24]<={(cost_width-1){1'b0}};
		S4[25]<={(cost_width-1){1'b0}};
		S4[26]<={(cost_width-1){1'b0}};
		S4[27]<={(cost_width-1){1'b0}};
		S4[28]<={(cost_width-1){1'b0}};
		S4[29]<={(cost_width-1){1'b0}};
		S4[30]<={(cost_width-1){1'b0}};
		S4[31]<={(cost_width-1){1'b0}};
		S4[32]<={(cost_width-1){1'b0}};
		S4[33]<={(cost_width-1){1'b0}};
		S4[34]<={(cost_width-1){1'b0}};
		S4[35]<={(cost_width-1){1'b0}};
		S4[36]<={(cost_width-1){1'b0}};
		S4[37]<={(cost_width-1){1'b0}};
		S4[38]<={(cost_width-1){1'b0}};
		S4[39]<={(cost_width-1){1'b0}};
		S4[40]<={(cost_width-1){1'b0}};
		S4[41]<={(cost_width-1){1'b0}};
		S4[42]<={(cost_width-1){1'b0}};
		S4[43]<={(cost_width-1){1'b0}};
		S4[44]<={(cost_width-1){1'b0}};
		S4[45]<={(cost_width-1){1'b0}};
		S4[46]<={(cost_width-1){1'b0}};
		S4[47]<={(cost_width-1){1'b0}};
		S4[48]<={(cost_width-1){1'b0}};
		S4[49]<={(cost_width-1){1'b0}};
		S4[50]<={(cost_width-1){1'b0}};
		S4[51]<={(cost_width-1){1'b0}};
		S4[52]<={(cost_width-1){1'b0}};
		S4[53]<={(cost_width-1){1'b0}};
		S4[54]<={(cost_width-1){1'b0}};
		S4[55]<={(cost_width-1){1'b0}};
		S4[56]<={(cost_width-1){1'b0}};
		S4[57]<={(cost_width-1){1'b0}};
		S4[58]<={(cost_width-1){1'b0}};
		S4[59]<={(cost_width-1){1'b0}};
		S4[60]<={(cost_width-1){1'b0}};
		S4[61]<={(cost_width-1){1'b0}};
		S4[62]<={(cost_width-1){1'b0}};
		S4[63]<={(cost_width-1){1'b0}};
	end
	else if(clken) begin
		S4[0]<=S3[0];
		S4[1]<=S3[1];
		S4[2]<=S3[2];
		S4[3]<=S3[3];
    		S4[4]<=S3[4];
		S4[5]<=S3[5];
      		S4[6]<=S3[6];
		S4[7]<=S3[7];
		S4[8]<=S3[8];
		S4[9]<=S3[9];
		S4[10]<=S3[10];
		S4[11]<=S3[11];
      		S4[12]<=S3[12];
		S4[13]<=S3[13];
      		S4[14]<=S3[14];
		S4[15]<=S3[15];
		S4[16]<=S3[16];
		S4[17]<=S3[17];
		S4[18]<=S3[18];
		S4[19]<=S3[19];
     		S4[20]<=S3[20];
		S4[21]<=S3[21];
     		S4[22]<=S3[22];
		S4[23]<=S3[23];
		S4[24]<=S3[24];
		S4[25]<=S3[25];
		S4[26]<=S3[26];
		S4[27]<=S3[27];
   		S4[28]<=S3[28];
		S4[29]<=S3[29];
    		S4[30]<=S3[30];
		S4[31]<=S3[31];
		S4[32]<=S3[32];
		S4[33]<=S3[33];
		S4[34]<=S3[34];
		S4[35]<=S3[35];
     		S4[36]<=S3[36];
		S4[37]<=S3[37];
     		S4[38]<=S3[38];
		S4[39]<=S3[39];
		S4[40]<=S3[40];
		S4[41]<=S3[41];
		S4[42]<=S3[42];
		S4[43]<=S3[43];
      		S4[44]<=S3[44];
		S4[45]<=S3[45];
      		S4[46]<=S3[46];
		S4[47]<=S3[47];
		S4[48]<=S3[48];
		S4[49]<=S3[49];
		S4[50]<=S3[50];
		S4[51]<=S3[51];
      		S4[52]<=S3[52];
		S4[53]<=S3[53];
      		S4[54]<=S3[54];
		S4[55]<=S3[55];
		S4[56]<=S3[56];
		S4[57]<=S3[57];
		S4[58]<=S3[58];
		S4[59]<=S3[59];
      		S4[60]<=S3[60];
		S4[61]<=S3[61];
     		S4[62]<=S3[62];
		S4[63]<=S3[63];

end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
     		S5[0]<={(cost_width-1){1'b0}};
		S5[1]<={(cost_width-1){1'b0}};
		S5[2]<={(cost_width-1){1'b0}};
		S5[3]<={(cost_width-1){1'b0}};
		S5[4]<={(cost_width-1){1'b0}};
		S5[5]<={(cost_width-1){1'b0}};
		S5[6]<={(cost_width-1){1'b0}};
		S5[7]<={(cost_width-1){1'b0}};
		S5[8]<={(cost_width-1){1'b0}};
		S5[9]<={(cost_width-1){1'b0}};
		S5[10]<={(cost_width-1){1'b0}};
		S5[11]<={(cost_width-1){1'b0}};
		S5[12]<={(cost_width-1){1'b0}};
		S5[13]<={(cost_width-1){1'b0}};
		S5[14]<={(cost_width-1){1'b0}};
		S5[15]<={(cost_width-1){1'b0}};
		S5[16]<={(cost_width-1){1'b0}};
		S5[17]<={(cost_width-1){1'b0}};
		S5[18]<={(cost_width-1){1'b0}};
		S5[19]<={(cost_width-1){1'b0}};
		S5[20]<={(cost_width-1){1'b0}};
		S5[21]<={(cost_width-1){1'b0}};
		S5[22]<={(cost_width-1){1'b0}};
		S5[23]<={(cost_width-1){1'b0}};
		S5[24]<={(cost_width-1){1'b0}};
		S5[25]<={(cost_width-1){1'b0}};
		S5[26]<={(cost_width-1){1'b0}};
		S5[27]<={(cost_width-1){1'b0}};
		S5[28]<={(cost_width-1){1'b0}};
		S5[29]<={(cost_width-1){1'b0}};
		S5[30]<={(cost_width-1){1'b0}};
		S5[31]<={(cost_width-1){1'b0}};
		S5[32]<={(cost_width-1){1'b0}};
		S5[33]<={(cost_width-1){1'b0}};
		S5[34]<={(cost_width-1){1'b0}};
		S5[35]<={(cost_width-1){1'b0}};
		S5[36]<={(cost_width-1){1'b0}};
		S5[37]<={(cost_width-1){1'b0}};
		S5[38]<={(cost_width-1){1'b0}};
		S5[39]<={(cost_width-1){1'b0}};
		S5[40]<={(cost_width-1){1'b0}};
		S5[41]<={(cost_width-1){1'b0}};
		S5[42]<={(cost_width-1){1'b0}};
		S5[43]<={(cost_width-1){1'b0}};
		S5[44]<={(cost_width-1){1'b0}};
		S5[45]<={(cost_width-1){1'b0}};
		S5[46]<={(cost_width-1){1'b0}};
		S5[47]<={(cost_width-1){1'b0}};
		S5[48]<={(cost_width-1){1'b0}};
		S5[49]<={(cost_width-1){1'b0}};
		S5[50]<={(cost_width-1){1'b0}};
		S5[51]<={(cost_width-1){1'b0}};
		S5[52]<={(cost_width-1){1'b0}};
		S5[53]<={(cost_width-1){1'b0}};
		S5[54]<={(cost_width-1){1'b0}};
		S5[55]<={(cost_width-1){1'b0}};
		S5[56]<={(cost_width-1){1'b0}};
		S5[57]<={(cost_width-1){1'b0}};
		S5[58]<={(cost_width-1){1'b0}};
		S5[59]<={(cost_width-1){1'b0}};
		S5[60]<={(cost_width-1){1'b0}};
		S5[61]<={(cost_width-1){1'b0}};
		S5[62]<={(cost_width-1){1'b0}};
		S5[63]<={(cost_width-1){1'b0}};
	end
	else if(clken) begin
		S5[0]<=S4[0];
		S5[1]<=S4[1];
		S5[2]<=S4[2];
		S5[3]<=S4[3];
    		S5[4]<=S4[4];
		S5[5]<=S4[5];
      		S5[6]<=S4[6];
		S5[7]<=S4[7];
		S5[8]<=S4[8];
		S5[9]<=S4[9];
		S5[10]<=S4[10];
		S5[11]<=S4[11];
      		S5[12]<=S4[12];
		S5[13]<=S4[13];
      		S5[14]<=S4[14];
		S5[15]<=S4[15];
		S5[16]<=S4[16];
		S5[17]<=S4[17];
		S5[18]<=S4[18];
		S5[19]<=S4[19];
     		S5[20]<=S4[20];
		S5[21]<=S4[21];
     		S5[22]<=S4[22];
		S5[23]<=S4[23];
		S5[24]<=S4[24];
		S5[25]<=S4[25];
		S5[26]<=S4[26];
		S5[27]<=S4[27];
   		S5[28]<=S4[28];
		S5[29]<=S4[29];
    		S5[30]<=S4[30];
		S5[31]<=S4[31];
		S5[32]<=S4[32];
		S5[33]<=S4[33];
		S5[34]<=S4[34];
		S5[35]<=S4[35];
     		S5[36]<=S4[36];
		S5[37]<=S4[37];
     		S5[38]<=S4[38];
		S5[39]<=S4[39];
		S5[40]<=S4[40];
		S5[41]<=S4[41];
		S5[42]<=S4[42];
		S5[43]<=S4[43];
      		S5[44]<=S4[44];
		S5[45]<=S4[45];
      		S5[46]<=S4[46];
		S5[47]<=S4[47];
		S5[48]<=S4[48];
		S5[49]<=S4[49];
		S5[50]<=S4[50];
		S5[51]<=S4[51];
      		S5[52]<=S4[52];
		S5[53]<=S4[53];
      		S5[54]<=S4[54];
		S5[55]<=S4[55];
		S5[56]<=S4[56];
		S5[57]<=S4[57];
		S5[58]<=S4[58];
		S5[59]<=S4[59];
      		S5[60]<=S4[60];
		S5[61]<=S4[61];
     		S5[62]<=S4[62];
		S5[63]<=S4[63];

end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
     		S6[0]<={(cost_width-1){1'b0}};
		S6[1]<={(cost_width-1){1'b0}};
		S6[2]<={(cost_width-1){1'b0}};
		S6[3]<={(cost_width-1){1'b0}};
		S6[4]<={(cost_width-1){1'b0}};
		S6[5]<={(cost_width-1){1'b0}};
		S6[6]<={(cost_width-1){1'b0}};
		S6[7]<={(cost_width-1){1'b0}};
		S6[8]<={(cost_width-1){1'b0}};
		S6[9]<={(cost_width-1){1'b0}};
		S6[10]<={(cost_width-1){1'b0}};
		S6[11]<={(cost_width-1){1'b0}};
		S6[12]<={(cost_width-1){1'b0}};
		S6[13]<={(cost_width-1){1'b0}};
		S6[14]<={(cost_width-1){1'b0}};
		S6[15]<={(cost_width-1){1'b0}};
		S6[16]<={(cost_width-1){1'b0}};
		S6[17]<={(cost_width-1){1'b0}};
		S6[18]<={(cost_width-1){1'b0}};
		S6[19]<={(cost_width-1){1'b0}};
		S6[20]<={(cost_width-1){1'b0}};
		S6[21]<={(cost_width-1){1'b0}};
		S6[22]<={(cost_width-1){1'b0}};
		S6[23]<={(cost_width-1){1'b0}};
		S6[24]<={(cost_width-1){1'b0}};
		S6[25]<={(cost_width-1){1'b0}};
		S6[26]<={(cost_width-1){1'b0}};
		S6[27]<={(cost_width-1){1'b0}};
		S6[28]<={(cost_width-1){1'b0}};
		S6[29]<={(cost_width-1){1'b0}};
		S6[30]<={(cost_width-1){1'b0}};
		S6[31]<={(cost_width-1){1'b0}};
		S6[32]<={(cost_width-1){1'b0}};
		S6[33]<={(cost_width-1){1'b0}};
		S6[34]<={(cost_width-1){1'b0}};
		S6[35]<={(cost_width-1){1'b0}};
		S6[36]<={(cost_width-1){1'b0}};
		S6[37]<={(cost_width-1){1'b0}};
		S6[38]<={(cost_width-1){1'b0}};
		S6[39]<={(cost_width-1){1'b0}};
		S6[40]<={(cost_width-1){1'b0}};
		S6[41]<={(cost_width-1){1'b0}};
		S6[42]<={(cost_width-1){1'b0}};
		S6[43]<={(cost_width-1){1'b0}};
		S6[44]<={(cost_width-1){1'b0}};
		S6[45]<={(cost_width-1){1'b0}};
		S6[46]<={(cost_width-1){1'b0}};
		S6[47]<={(cost_width-1){1'b0}};
		S6[48]<={(cost_width-1){1'b0}};
		S6[49]<={(cost_width-1){1'b0}};
		S6[50]<={(cost_width-1){1'b0}};
		S6[51]<={(cost_width-1){1'b0}};
		S6[52]<={(cost_width-1){1'b0}};
		S6[53]<={(cost_width-1){1'b0}};
		S6[54]<={(cost_width-1){1'b0}};
		S6[55]<={(cost_width-1){1'b0}};
		S6[56]<={(cost_width-1){1'b0}};
		S6[57]<={(cost_width-1){1'b0}};
		S6[58]<={(cost_width-1){1'b0}};
		S6[59]<={(cost_width-1){1'b0}};
		S6[60]<={(cost_width-1){1'b0}};
		S6[61]<={(cost_width-1){1'b0}};
		S6[62]<={(cost_width-1){1'b0}};
		S6[63]<={(cost_width-1){1'b0}};
	end
	else if(clken) begin
		S6[0]<=S5[0];
		S6[1]<=S5[1];
		S6[2]<=S5[2];
		S6[3]<=S5[3];
    		S6[4]<=S5[4];
		S6[5]<=S5[5];
      		S6[6]<=S5[6];
		S6[7]<=S5[7];
		S6[8]<=S5[8];
		S6[9]<=S5[9];
		S6[10]<=S5[10];
		S6[11]<=S5[11];
      		S6[12]<=S5[12];
		S6[13]<=S5[13];
      		S6[14]<=S5[14];
		S6[15]<=S5[15];
		S6[16]<=S5[16];
		S6[17]<=S5[17];
		S6[18]<=S5[18];
		S6[19]<=S5[19];
     		S6[20]<=S5[20];
		S6[21]<=S5[21];
     		S6[22]<=S5[22];
		S6[23]<=S5[23];
		S6[24]<=S5[24];
		S6[25]<=S5[25];
		S6[26]<=S5[26];
		S6[27]<=S5[27];
   		S6[28]<=S5[28];
		S6[29]<=S5[29];
    		S6[30]<=S5[30];
		S6[31]<=S5[31];
		S6[32]<=S5[32];
		S6[33]<=S5[33];
		S6[34]<=S5[34];
		S6[35]<=S5[35];
     		S6[36]<=S5[36];
		S6[37]<=S5[37];
     		S6[38]<=S5[38];
		S6[39]<=S5[39];
		S6[40]<=S5[40];
		S6[41]<=S5[41];
		S6[42]<=S5[42];
		S6[43]<=S5[43];
      		S6[44]<=S5[44];
		S6[45]<=S5[45];
      		S6[46]<=S5[46];
		S6[47]<=S5[47];
		S6[48]<=S5[48];
		S6[49]<=S5[49];
		S6[50]<=S5[50];
		S6[51]<=S5[51];
      		S6[52]<=S5[52];
		S6[53]<=S5[53];
      		S6[54]<=S5[54];
		S6[55]<=S5[55];
		S6[56]<=S5[56];
		S6[57]<=S5[57];
		S6[58]<=S5[58];
		S6[59]<=S5[59];
      		S6[60]<=S5[60];
		S6[61]<=S5[61];
     		S6[62]<=S5[62];
		S6[63]<=S5[63];

end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
     		S7[0]<={(cost_width-1){1'b0}};
		S7[1]<={(cost_width-1){1'b0}};
		S7[2]<={(cost_width-1){1'b0}};
		S7[3]<={(cost_width-1){1'b0}};
		S7[4]<={(cost_width-1){1'b0}};
		S7[5]<={(cost_width-1){1'b0}};
		S7[6]<={(cost_width-1){1'b0}};
		S7[7]<={(cost_width-1){1'b0}};
		S7[8]<={(cost_width-1){1'b0}};
		S7[9]<={(cost_width-1){1'b0}};
		S7[10]<={(cost_width-1){1'b0}};
		S7[11]<={(cost_width-1){1'b0}};
		S7[12]<={(cost_width-1){1'b0}};
		S7[13]<={(cost_width-1){1'b0}};
		S7[14]<={(cost_width-1){1'b0}};
		S7[15]<={(cost_width-1){1'b0}};
		S7[16]<={(cost_width-1){1'b0}};
		S7[17]<={(cost_width-1){1'b0}};
		S7[18]<={(cost_width-1){1'b0}};
		S7[19]<={(cost_width-1){1'b0}};
		S7[20]<={(cost_width-1){1'b0}};
		S7[21]<={(cost_width-1){1'b0}};
		S7[22]<={(cost_width-1){1'b0}};
		S7[23]<={(cost_width-1){1'b0}};
		S7[24]<={(cost_width-1){1'b0}};
		S7[25]<={(cost_width-1){1'b0}};
		S7[26]<={(cost_width-1){1'b0}};
		S7[27]<={(cost_width-1){1'b0}};
		S7[28]<={(cost_width-1){1'b0}};
		S7[29]<={(cost_width-1){1'b0}};
		S7[30]<={(cost_width-1){1'b0}};
		S7[31]<={(cost_width-1){1'b0}};
		S7[32]<={(cost_width-1){1'b0}};
		S7[33]<={(cost_width-1){1'b0}};
		S7[34]<={(cost_width-1){1'b0}};
		S7[35]<={(cost_width-1){1'b0}};
		S7[36]<={(cost_width-1){1'b0}};
		S7[37]<={(cost_width-1){1'b0}};
		S7[38]<={(cost_width-1){1'b0}};
		S7[39]<={(cost_width-1){1'b0}};
		S7[40]<={(cost_width-1){1'b0}};
		S7[41]<={(cost_width-1){1'b0}};
		S7[42]<={(cost_width-1){1'b0}};
		S7[43]<={(cost_width-1){1'b0}};
		S7[44]<={(cost_width-1){1'b0}};
		S7[45]<={(cost_width-1){1'b0}};
		S7[46]<={(cost_width-1){1'b0}};
		S7[47]<={(cost_width-1){1'b0}};
		S7[48]<={(cost_width-1){1'b0}};
		S7[49]<={(cost_width-1){1'b0}};
		S7[50]<={(cost_width-1){1'b0}};
		S7[51]<={(cost_width-1){1'b0}};
		S7[52]<={(cost_width-1){1'b0}};
		S7[53]<={(cost_width-1){1'b0}};
		S7[54]<={(cost_width-1){1'b0}};
		S7[55]<={(cost_width-1){1'b0}};
		S7[56]<={(cost_width-1){1'b0}};
		S7[57]<={(cost_width-1){1'b0}};
		S7[58]<={(cost_width-1){1'b0}};
		S7[59]<={(cost_width-1){1'b0}};
		S7[60]<={(cost_width-1){1'b0}};
		S7[61]<={(cost_width-1){1'b0}};
		S7[62]<={(cost_width-1){1'b0}};
		S7[63]<={(cost_width-1){1'b0}};
	end
	else if(clken) begin
		S7[0]<=S6[0];
		S7[1]<=S6[1];
		S7[2]<=S6[2];
		S7[3]<=S6[3];
    		S7[4]<=S6[4];
		S7[5]<=S6[5];
      		S7[6]<=S6[6];
		S7[7]<=S6[7];
		S7[8]<=S6[8];
		S7[9]<=S6[9];
		S7[10]<=S6[10];
		S7[11]<=S6[11];
      		S7[12]<=S6[12];
		S7[13]<=S6[13];
      		S7[14]<=S6[14];
		S7[15]<=S6[15];
		S7[16]<=S6[16];
		S7[17]<=S6[17];
		S7[18]<=S6[18];
		S7[19]<=S6[19];
     		S7[20]<=S6[20];
		S7[21]<=S6[21];
     		S7[22]<=S6[22];
		S7[23]<=S6[23];
		S7[24]<=S6[24];
		S7[25]<=S6[25];
		S7[26]<=S6[26];
		S7[27]<=S6[27];
   		S7[28]<=S6[28];
		S7[29]<=S6[29];
    		S7[30]<=S6[30];
		S7[31]<=S6[31];
		S7[32]<=S6[32];
		S7[33]<=S6[33];
		S7[34]<=S6[34];
		S7[35]<=S6[35];
     		S7[36]<=S6[36];
		S7[37]<=S6[37];
     		S7[38]<=S6[38];
		S7[39]<=S6[39];
		S7[40]<=S6[40];
		S7[41]<=S6[41];
		S7[42]<=S6[42];
		S7[43]<=S6[43];
      		S7[44]<=S6[44];
		S7[45]<=S6[45];
      		S7[46]<=S6[46];
		S7[47]<=S6[47];
		S7[48]<=S6[48];
		S7[49]<=S6[49];
		S7[50]<=S6[50];
		S7[51]<=S6[51];
      		S7[52]<=S6[52];
		S7[53]<=S6[53];
      		S7[54]<=S6[54];
		S7[55]<=S6[55];
		S7[56]<=S6[56];
		S7[57]<=S6[57];
		S7[58]<=S6[58];
		S7[59]<=S6[59];
      		S7[60]<=S6[60];
		S7[61]<=S6[61];
     		S7[62]<=S6[62];
		S7[63]<=S6[63];

end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
     		S8[0]<={(cost_width-1){1'b0}};
		S8[1]<={(cost_width-1){1'b0}};
		S8[2]<={(cost_width-1){1'b0}};
		S8[3]<={(cost_width-1){1'b0}};
		S8[4]<={(cost_width-1){1'b0}};
		S8[5]<={(cost_width-1){1'b0}};
		S8[6]<={(cost_width-1){1'b0}};
		S8[7]<={(cost_width-1){1'b0}};
		S8[8]<={(cost_width-1){1'b0}};
		S8[9]<={(cost_width-1){1'b0}};
		S8[10]<={(cost_width-1){1'b0}};
		S8[11]<={(cost_width-1){1'b0}};
		S8[12]<={(cost_width-1){1'b0}};
		S8[13]<={(cost_width-1){1'b0}};
		S8[14]<={(cost_width-1){1'b0}};
		S8[15]<={(cost_width-1){1'b0}};
		S8[16]<={(cost_width-1){1'b0}};
		S8[17]<={(cost_width-1){1'b0}};
		S8[18]<={(cost_width-1){1'b0}};
		S8[19]<={(cost_width-1){1'b0}};
		S8[20]<={(cost_width-1){1'b0}};
		S8[21]<={(cost_width-1){1'b0}};
		S8[22]<={(cost_width-1){1'b0}};
		S8[23]<={(cost_width-1){1'b0}};
		S8[24]<={(cost_width-1){1'b0}};
		S8[25]<={(cost_width-1){1'b0}};
		S8[26]<={(cost_width-1){1'b0}};
		S8[27]<={(cost_width-1){1'b0}};
		S8[28]<={(cost_width-1){1'b0}};
		S8[29]<={(cost_width-1){1'b0}};
		S8[30]<={(cost_width-1){1'b0}};
		S8[31]<={(cost_width-1){1'b0}};
		S8[32]<={(cost_width-1){1'b0}};
		S8[33]<={(cost_width-1){1'b0}};
		S8[34]<={(cost_width-1){1'b0}};
		S8[35]<={(cost_width-1){1'b0}};
		S8[36]<={(cost_width-1){1'b0}};
		S8[37]<={(cost_width-1){1'b0}};
		S8[38]<={(cost_width-1){1'b0}};
		S8[39]<={(cost_width-1){1'b0}};
		S8[40]<={(cost_width-1){1'b0}};
		S8[41]<={(cost_width-1){1'b0}};
		S8[42]<={(cost_width-1){1'b0}};
		S8[43]<={(cost_width-1){1'b0}};
		S8[44]<={(cost_width-1){1'b0}};
		S8[45]<={(cost_width-1){1'b0}};
		S8[46]<={(cost_width-1){1'b0}};
		S8[47]<={(cost_width-1){1'b0}};
		S8[48]<={(cost_width-1){1'b0}};
		S8[49]<={(cost_width-1){1'b0}};
		S8[50]<={(cost_width-1){1'b0}};
		S8[51]<={(cost_width-1){1'b0}};
		S8[52]<={(cost_width-1){1'b0}};
		S8[53]<={(cost_width-1){1'b0}};
		S8[54]<={(cost_width-1){1'b0}};
		S8[55]<={(cost_width-1){1'b0}};
		S8[56]<={(cost_width-1){1'b0}};
		S8[57]<={(cost_width-1){1'b0}};
		S8[58]<={(cost_width-1){1'b0}};
		S8[59]<={(cost_width-1){1'b0}};
		S8[60]<={(cost_width-1){1'b0}};
		S8[61]<={(cost_width-1){1'b0}};
		S8[62]<={(cost_width-1){1'b0}};
		S8[63]<={(cost_width-1){1'b0}};
	end
	else if(clken) begin
		S8[0]<=S7[0];
		S8[1]<=S7[1];
		S8[2]<=S7[2];
		S8[3]<=S7[3];
    		S8[4]<=S7[4];
		S8[5]<=S7[5];
      		S8[6]<=S7[6];
		S8[7]<=S7[7];
		S8[8]<=S7[8];
		S8[9]<=S7[9];
		S8[10]<=S7[10];
		S8[11]<=S7[11];
      		S8[12]<=S7[12];
		S8[13]<=S7[13];
      		S8[14]<=S7[14];
		S8[15]<=S7[15];
		S8[16]<=S7[16];
		S8[17]<=S7[17];
		S8[18]<=S7[18];
		S8[19]<=S7[19];
     		S8[20]<=S7[20];
		S8[21]<=S7[21];
     		S8[22]<=S7[22];
		S8[23]<=S7[23];
		S8[24]<=S7[24];
		S8[25]<=S7[25];
		S8[26]<=S7[26];
		S8[27]<=S7[27];
   		S8[28]<=S7[28];
		S8[29]<=S7[29];
    		S8[30]<=S7[30];
		S8[31]<=S7[31];
		S8[32]<=S7[32];
		S8[33]<=S7[33];
		S8[34]<=S7[34];
		S8[35]<=S7[35];
     		S8[36]<=S7[36];
		S8[37]<=S7[37];
     		S8[38]<=S7[38];
		S8[39]<=S7[39];
		S8[40]<=S7[40];
		S8[41]<=S7[41];
		S8[42]<=S7[42];
		S8[43]<=S7[43];
      		S8[44]<=S7[44];
		S8[45]<=S7[45];
      		S8[46]<=S7[46];
		S8[47]<=S7[47];
		S8[48]<=S7[48];
		S8[49]<=S7[49];
		S8[50]<=S7[50];
		S8[51]<=S7[51];
      		S8[52]<=S7[52];
		S8[53]<=S7[53];
      		S8[54]<=S7[54];
		S8[55]<=S7[55];
		S8[56]<=S7[56];
		S8[57]<=S7[57];
		S8[58]<=S7[58];
		S8[59]<=S7[59];
      		S8[60]<=S7[60];
		S8[61]<=S7[61];
     		S8[62]<=S7[62];
		S8[63]<=S7[63];

end
end

//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S9[0]<={(cost_width-1){1'b0}};
//		S9[1]<={(cost_width-1){1'b0}};
//		S9[2]<={(cost_width-1){1'b0}};
//		S9[3]<={(cost_width-1){1'b0}};
//		S9[4]<={(cost_width-1){1'b0}};
//		S9[5]<={(cost_width-1){1'b0}};
//		S9[6]<={(cost_width-1){1'b0}};
//		S9[7]<={(cost_width-1){1'b0}};
//		S9[8]<={(cost_width-1){1'b0}};
//		S9[9]<={(cost_width-1){1'b0}};
//		S9[10]<={(cost_width-1){1'b0}};
//		S9[11]<={(cost_width-1){1'b0}};
//		S9[12]<={(cost_width-1){1'b0}};
//		S9[13]<={(cost_width-1){1'b0}};
//		S9[14]<={(cost_width-1){1'b0}};
//		S9[15]<={(cost_width-1){1'b0}};
//		S9[16]<={(cost_width-1){1'b0}};
//		S9[17]<={(cost_width-1){1'b0}};
//		S9[18]<={(cost_width-1){1'b0}};
//		S9[19]<={(cost_width-1){1'b0}};
//		S9[20]<={(cost_width-1){1'b0}};
//		S9[21]<={(cost_width-1){1'b0}};
//		S9[22]<={(cost_width-1){1'b0}};
//		S9[23]<={(cost_width-1){1'b0}};
//		S9[24]<={(cost_width-1){1'b0}};
//		S9[25]<={(cost_width-1){1'b0}};
//		S9[26]<={(cost_width-1){1'b0}};
//		S9[27]<={(cost_width-1){1'b0}};
//		S9[28]<={(cost_width-1){1'b0}};
//		S9[29]<={(cost_width-1){1'b0}};
//		S9[30]<={(cost_width-1){1'b0}};
//		S9[31]<={(cost_width-1){1'b0}};
//		S9[32]<={(cost_width-1){1'b0}};
//		S9[33]<={(cost_width-1){1'b0}};
//		S9[34]<={(cost_width-1){1'b0}};
//		S9[35]<={(cost_width-1){1'b0}};
//		S9[36]<={(cost_width-1){1'b0}};
//		S9[37]<={(cost_width-1){1'b0}};
//		S9[38]<={(cost_width-1){1'b0}};
//		S9[39]<={(cost_width-1){1'b0}};
//		S9[40]<={(cost_width-1){1'b0}};
//		S9[41]<={(cost_width-1){1'b0}};
//		S9[42]<={(cost_width-1){1'b0}};
//		S9[43]<={(cost_width-1){1'b0}};
//		S9[44]<={(cost_width-1){1'b0}};
//		S9[45]<={(cost_width-1){1'b0}};
//		S9[46]<={(cost_width-1){1'b0}};
//		S9[47]<={(cost_width-1){1'b0}};
//		S9[48]<={(cost_width-1){1'b0}};
//		S9[49]<={(cost_width-1){1'b0}};
//		S9[50]<={(cost_width-1){1'b0}};
//		S9[51]<={(cost_width-1){1'b0}};
//		S9[52]<={(cost_width-1){1'b0}};
//		S9[53]<={(cost_width-1){1'b0}};
//		S9[54]<={(cost_width-1){1'b0}};
//		S9[55]<={(cost_width-1){1'b0}};
//		S9[56]<={(cost_width-1){1'b0}};
//		S9[57]<={(cost_width-1){1'b0}};
//		S9[58]<={(cost_width-1){1'b0}};
//		S9[59]<={(cost_width-1){1'b0}};
//		S9[60]<={(cost_width-1){1'b0}};
//		S9[61]<={(cost_width-1){1'b0}};
//		S9[62]<={(cost_width-1){1'b0}};
//		S9[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S9[0]<=S8[0];
//		S9[1]<=S8[1];
//		S9[2]<=S8[2];
//		S9[3]<=S8[3];
//    		S9[4]<=S8[4];
//		S9[5]<=S8[5];
//      		S9[6]<=S8[6];
//		S9[7]<=S8[7];
//		S9[8]<=S8[8];
//		S9[9]<=S8[9];
//		S9[10]<=S8[10];
//		S9[11]<=S8[11];
//      		S9[12]<=S8[12];
//		S9[13]<=S8[13];
//      		S9[14]<=S8[14];
//		S9[15]<=S8[15];
//		S9[16]<=S8[16];
//		S9[17]<=S8[17];
//		S9[18]<=S8[18];
//		S9[19]<=S8[19];
//     		S9[20]<=S8[20];
//		S9[21]<=S8[21];
//     		S9[22]<=S8[22];
//		S9[23]<=S8[23];
//		S9[24]<=S8[24];
//		S9[25]<=S8[25];
//		S9[26]<=S8[26];
//		S9[27]<=S8[27];
//   		S9[28]<=S8[28];
//		S9[29]<=S8[29];
//    		S9[30]<=S8[30];
//		S9[31]<=S8[31];
//		S9[32]<=S8[32];
//		S9[33]<=S8[33];
//		S9[34]<=S8[34];
//		S9[35]<=S8[35];
//     		S9[36]<=S8[36];
//		S9[37]<=S8[37];
//     		S9[38]<=S8[38];
//		S9[39]<=S8[39];
//		S9[40]<=S8[40];
//		S9[41]<=S8[41];
//		S9[42]<=S8[42];
//		S9[43]<=S8[43];
//      		S9[44]<=S8[44];
//		S9[45]<=S8[45];
//      		S9[46]<=S8[46];
//		S9[47]<=S8[47];
//		S9[48]<=S8[48];
//		S9[49]<=S8[49];
//		S9[50]<=S8[50];
//		S9[51]<=S8[51];
//      		S9[52]<=S8[52];
//		S9[53]<=S8[53];
//      		S9[54]<=S8[54];
//		S9[55]<=S8[55];
//		S9[56]<=S8[56];
//		S9[57]<=S8[57];
//		S9[58]<=S8[58];
//		S9[59]<=S8[59];
//      		S9[60]<=S8[60];
//		S9[61]<=S8[61];
//     		S9[62]<=S8[62];
//		S9[63]<=S8[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S10[0]<={(cost_width-1){1'b0}};
//		S10[1]<={(cost_width-1){1'b0}};
//		S10[2]<={(cost_width-1){1'b0}};
//		S10[3]<={(cost_width-1){1'b0}};
//		S10[4]<={(cost_width-1){1'b0}};
//		S10[5]<={(cost_width-1){1'b0}};
//		S10[6]<={(cost_width-1){1'b0}};
//		S10[7]<={(cost_width-1){1'b0}};
//		S10[8]<={(cost_width-1){1'b0}};
//		S10[9]<={(cost_width-1){1'b0}};
//		S10[10]<={(cost_width-1){1'b0}};
//		S10[11]<={(cost_width-1){1'b0}};
//		S10[12]<={(cost_width-1){1'b0}};
//		S10[13]<={(cost_width-1){1'b0}};
//		S10[14]<={(cost_width-1){1'b0}};
//		S10[15]<={(cost_width-1){1'b0}};
//		S10[16]<={(cost_width-1){1'b0}};
//		S10[17]<={(cost_width-1){1'b0}};
//		S10[18]<={(cost_width-1){1'b0}};
//		S10[19]<={(cost_width-1){1'b0}};
//		S10[20]<={(cost_width-1){1'b0}};
//		S10[21]<={(cost_width-1){1'b0}};
//		S10[22]<={(cost_width-1){1'b0}};
//		S10[23]<={(cost_width-1){1'b0}};
//		S10[24]<={(cost_width-1){1'b0}};
//		S10[25]<={(cost_width-1){1'b0}};
//		S10[26]<={(cost_width-1){1'b0}};
//		S10[27]<={(cost_width-1){1'b0}};
//		S10[28]<={(cost_width-1){1'b0}};
//		S10[29]<={(cost_width-1){1'b0}};
//		S10[30]<={(cost_width-1){1'b0}};
//		S10[31]<={(cost_width-1){1'b0}};
//		S10[32]<={(cost_width-1){1'b0}};
//		S10[33]<={(cost_width-1){1'b0}};
//		S10[34]<={(cost_width-1){1'b0}};
//		S10[35]<={(cost_width-1){1'b0}};
//		S10[36]<={(cost_width-1){1'b0}};
//		S10[37]<={(cost_width-1){1'b0}};
//		S10[38]<={(cost_width-1){1'b0}};
//		S10[39]<={(cost_width-1){1'b0}};
//		S10[40]<={(cost_width-1){1'b0}};
//		S10[41]<={(cost_width-1){1'b0}};
//		S10[42]<={(cost_width-1){1'b0}};
//		S10[43]<={(cost_width-1){1'b0}};
//		S10[44]<={(cost_width-1){1'b0}};
//		S10[45]<={(cost_width-1){1'b0}};
//		S10[46]<={(cost_width-1){1'b0}};
//		S10[47]<={(cost_width-1){1'b0}};
//		S10[48]<={(cost_width-1){1'b0}};
//		S10[49]<={(cost_width-1){1'b0}};
//		S10[50]<={(cost_width-1){1'b0}};
//		S10[51]<={(cost_width-1){1'b0}};
//		S10[52]<={(cost_width-1){1'b0}};
//		S10[53]<={(cost_width-1){1'b0}};
//		S10[54]<={(cost_width-1){1'b0}};
//		S10[55]<={(cost_width-1){1'b0}};
//		S10[56]<={(cost_width-1){1'b0}};
//		S10[57]<={(cost_width-1){1'b0}};
//		S10[58]<={(cost_width-1){1'b0}};
//		S10[59]<={(cost_width-1){1'b0}};
//		S10[60]<={(cost_width-1){1'b0}};
//		S10[61]<={(cost_width-1){1'b0}};
//		S10[62]<={(cost_width-1){1'b0}};
//		S10[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S10[0]<=S9[0];
//		S10[1]<=S9[1];
//		S10[2]<=S9[2];
//		S10[3]<=S9[3];
//    		S10[4]<=S9[4];
//		S10[5]<=S9[5];
//      		S10[6]<=S9[6];
//		S10[7]<=S9[7];
//		S10[8]<=S9[8];
//		S10[9]<=S9[9];
//		S10[10]<=S9[10];
//		S10[11]<=S9[11];
//      		S10[12]<=S9[12];
//		S10[13]<=S9[13];
//      		S10[14]<=S9[14];
//		S10[15]<=S9[15];
//		S10[16]<=S9[16];
//		S10[17]<=S9[17];
//		S10[18]<=S9[18];
//		S10[19]<=S9[19];
//     		S10[20]<=S9[20];
//		S10[21]<=S9[21];
//     		S10[22]<=S9[22];
//		S10[23]<=S9[23];
//		S10[24]<=S9[24];
//		S10[25]<=S9[25];
//		S10[26]<=S9[26];
//		S10[27]<=S9[27];
//   		S10[28]<=S9[28];
//		S10[29]<=S9[29];
//    		S10[30]<=S9[30];
//		S10[31]<=S9[31];
//		S10[32]<=S9[32];
//		S10[33]<=S9[33];
//		S10[34]<=S9[34];
//		S10[35]<=S9[35];
//     		S10[36]<=S9[36];
//		S10[37]<=S9[37];
//     		S10[38]<=S9[38];
//		S10[39]<=S9[39];
//		S10[40]<=S9[40];
//		S10[41]<=S9[41];
//		S10[42]<=S9[42];
//		S10[43]<=S9[43];
//      		S10[44]<=S9[44];
//		S10[45]<=S9[45];
//      		S10[46]<=S9[46];
//		S10[47]<=S9[47];
//		S10[48]<=S9[48];
//		S10[49]<=S9[49];
//		S10[50]<=S9[50];
//		S10[51]<=S9[51];
//      		S10[52]<=S9[52];
//		S10[53]<=S9[53];
//      		S10[54]<=S9[54];
//		S10[55]<=S9[55];
//		S10[56]<=S9[56];
//		S10[57]<=S9[57];
//		S10[58]<=S9[58];
//		S10[59]<=S9[59];
//      		S10[60]<=S9[60];
//		S10[61]<=S9[61];
//     		S10[62]<=S9[62];
//		S10[63]<=S9[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S11[0]<={(cost_width-1){1'b0}};
//		S11[1]<={(cost_width-1){1'b0}};
//		S11[2]<={(cost_width-1){1'b0}};
//		S11[3]<={(cost_width-1){1'b0}};
//		S11[4]<={(cost_width-1){1'b0}};
//		S11[5]<={(cost_width-1){1'b0}};
//		S11[6]<={(cost_width-1){1'b0}};
//		S11[7]<={(cost_width-1){1'b0}};
//		S11[8]<={(cost_width-1){1'b0}};
//		S11[9]<={(cost_width-1){1'b0}};
//		S11[10]<={(cost_width-1){1'b0}};
//		S11[11]<={(cost_width-1){1'b0}};
//		S11[12]<={(cost_width-1){1'b0}};
//		S11[13]<={(cost_width-1){1'b0}};
//		S11[14]<={(cost_width-1){1'b0}};
//		S11[15]<={(cost_width-1){1'b0}};
//		S11[16]<={(cost_width-1){1'b0}};
//		S11[17]<={(cost_width-1){1'b0}};
//		S11[18]<={(cost_width-1){1'b0}};
//		S11[19]<={(cost_width-1){1'b0}};
//		S11[20]<={(cost_width-1){1'b0}};
//		S11[21]<={(cost_width-1){1'b0}};
//		S11[22]<={(cost_width-1){1'b0}};
//		S11[23]<={(cost_width-1){1'b0}};
//		S11[24]<={(cost_width-1){1'b0}};
//		S11[25]<={(cost_width-1){1'b0}};
//		S11[26]<={(cost_width-1){1'b0}};
//		S11[27]<={(cost_width-1){1'b0}};
//		S11[28]<={(cost_width-1){1'b0}};
//		S11[29]<={(cost_width-1){1'b0}};
//		S11[30]<={(cost_width-1){1'b0}};
//		S11[31]<={(cost_width-1){1'b0}};
//		S11[32]<={(cost_width-1){1'b0}};
//		S11[33]<={(cost_width-1){1'b0}};
//		S11[34]<={(cost_width-1){1'b0}};
//		S11[35]<={(cost_width-1){1'b0}};
//		S11[36]<={(cost_width-1){1'b0}};
//		S11[37]<={(cost_width-1){1'b0}};
//		S11[38]<={(cost_width-1){1'b0}};
//		S11[39]<={(cost_width-1){1'b0}};
//		S11[40]<={(cost_width-1){1'b0}};
//		S11[41]<={(cost_width-1){1'b0}};
//		S11[42]<={(cost_width-1){1'b0}};
//		S11[43]<={(cost_width-1){1'b0}};
//		S11[44]<={(cost_width-1){1'b0}};
//		S11[45]<={(cost_width-1){1'b0}};
//		S11[46]<={(cost_width-1){1'b0}};
//		S11[47]<={(cost_width-1){1'b0}};
//		S11[48]<={(cost_width-1){1'b0}};
//		S11[49]<={(cost_width-1){1'b0}};
//		S11[50]<={(cost_width-1){1'b0}};
//		S11[51]<={(cost_width-1){1'b0}};
//		S11[52]<={(cost_width-1){1'b0}};
//		S11[53]<={(cost_width-1){1'b0}};
//		S11[54]<={(cost_width-1){1'b0}};
//		S11[55]<={(cost_width-1){1'b0}};
//		S11[56]<={(cost_width-1){1'b0}};
//		S11[57]<={(cost_width-1){1'b0}};
//		S11[58]<={(cost_width-1){1'b0}};
//		S11[59]<={(cost_width-1){1'b0}};
//		S11[60]<={(cost_width-1){1'b0}};
//		S11[61]<={(cost_width-1){1'b0}};
//		S11[62]<={(cost_width-1){1'b0}};
//		S11[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S11[0]<=S10[0];
//		S11[1]<=S10[1];
//		S11[2]<=S10[2];
//		S11[3]<=S10[3];
//    		S11[4]<=S10[4];
//		S11[5]<=S10[5];
//      		S11[6]<=S10[6];
//		S11[7]<=S10[7];
//		S11[8]<=S10[8];
//		S11[9]<=S10[9];
//		S11[10]<=S10[10];
//		S11[11]<=S10[11];
//      		S11[12]<=S10[12];
//		S11[13]<=S10[13];
//      		S11[14]<=S10[14];
//		S11[15]<=S10[15];
//		S11[16]<=S10[16];
//		S11[17]<=S10[17];
//		S11[18]<=S10[18];
//		S11[19]<=S10[19];
//     		S11[20]<=S10[20];
//		S11[21]<=S10[21];
//     		S11[22]<=S10[22];
//		S11[23]<=S10[23];
//		S11[24]<=S10[24];
//		S11[25]<=S10[25];
//		S11[26]<=S10[26];
//		S11[27]<=S10[27];
//   		S11[28]<=S10[28];
//		S11[29]<=S10[29];
//    		S11[30]<=S10[30];
//		S11[31]<=S10[31];
//		S11[32]<=S10[32];
//		S11[33]<=S10[33];
//		S11[34]<=S10[34];
//		S11[35]<=S10[35];
//     		S11[36]<=S10[36];
//		S11[37]<=S10[37];
//     		S11[38]<=S10[38];
//		S11[39]<=S10[39];
//		S11[40]<=S10[40];
//		S11[41]<=S10[41];
//		S11[42]<=S10[42];
//		S11[43]<=S10[43];
//      		S11[44]<=S10[44];
//		S11[45]<=S10[45];
//      		S11[46]<=S10[46];
//		S11[47]<=S10[47];
//		S11[48]<=S10[48];
//		S11[49]<=S10[49];
//		S11[50]<=S10[50];
//		S11[51]<=S10[51];
//      		S11[52]<=S10[52];
//		S11[53]<=S10[53];
//      		S11[54]<=S10[54];
//		S11[55]<=S10[55];
//		S11[56]<=S10[56];
//		S11[57]<=S10[57];
//		S11[58]<=S10[58];
//		S11[59]<=S10[59];
//      		S11[60]<=S10[60];
//		S11[61]<=S10[61];
//     		S11[62]<=S10[62];
//		S11[63]<=S10[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S12[0]<={(cost_width-1){1'b0}};
//		S12[1]<={(cost_width-1){1'b0}};
//		S12[2]<={(cost_width-1){1'b0}};
//		S12[3]<={(cost_width-1){1'b0}};
//		S12[4]<={(cost_width-1){1'b0}};
//		S12[5]<={(cost_width-1){1'b0}};
//		S12[6]<={(cost_width-1){1'b0}};
//		S12[7]<={(cost_width-1){1'b0}};
//		S12[8]<={(cost_width-1){1'b0}};
//		S12[9]<={(cost_width-1){1'b0}};
//		S12[10]<={(cost_width-1){1'b0}};
//		S12[11]<={(cost_width-1){1'b0}};
//		S12[12]<={(cost_width-1){1'b0}};
//		S12[13]<={(cost_width-1){1'b0}};
//		S12[14]<={(cost_width-1){1'b0}};
//		S12[15]<={(cost_width-1){1'b0}};
//		S12[16]<={(cost_width-1){1'b0}};
//		S12[17]<={(cost_width-1){1'b0}};
//		S12[18]<={(cost_width-1){1'b0}};
//		S12[19]<={(cost_width-1){1'b0}};
//		S12[20]<={(cost_width-1){1'b0}};
//		S12[21]<={(cost_width-1){1'b0}};
//		S12[22]<={(cost_width-1){1'b0}};
//		S12[23]<={(cost_width-1){1'b0}};
//		S12[24]<={(cost_width-1){1'b0}};
//		S12[25]<={(cost_width-1){1'b0}};
//		S12[26]<={(cost_width-1){1'b0}};
//		S12[27]<={(cost_width-1){1'b0}};
//		S12[28]<={(cost_width-1){1'b0}};
//		S12[29]<={(cost_width-1){1'b0}};
//		S12[30]<={(cost_width-1){1'b0}};
//		S12[31]<={(cost_width-1){1'b0}};
//		S12[32]<={(cost_width-1){1'b0}};
//		S12[33]<={(cost_width-1){1'b0}};
//		S12[34]<={(cost_width-1){1'b0}};
//		S12[35]<={(cost_width-1){1'b0}};
//		S12[36]<={(cost_width-1){1'b0}};
//		S12[37]<={(cost_width-1){1'b0}};
//		S12[38]<={(cost_width-1){1'b0}};
//		S12[39]<={(cost_width-1){1'b0}};
//		S12[40]<={(cost_width-1){1'b0}};
//		S12[41]<={(cost_width-1){1'b0}};
//		S12[42]<={(cost_width-1){1'b0}};
//		S12[43]<={(cost_width-1){1'b0}};
//		S12[44]<={(cost_width-1){1'b0}};
//		S12[45]<={(cost_width-1){1'b0}};
//		S12[46]<={(cost_width-1){1'b0}};
//		S12[47]<={(cost_width-1){1'b0}};
//		S12[48]<={(cost_width-1){1'b0}};
//		S12[49]<={(cost_width-1){1'b0}};
//		S12[50]<={(cost_width-1){1'b0}};
//		S12[51]<={(cost_width-1){1'b0}};
//		S12[52]<={(cost_width-1){1'b0}};
//		S12[53]<={(cost_width-1){1'b0}};
//		S12[54]<={(cost_width-1){1'b0}};
//		S12[55]<={(cost_width-1){1'b0}};
//		S12[56]<={(cost_width-1){1'b0}};
//		S12[57]<={(cost_width-1){1'b0}};
//		S12[58]<={(cost_width-1){1'b0}};
//		S12[59]<={(cost_width-1){1'b0}};
//		S12[60]<={(cost_width-1){1'b0}};
//		S12[61]<={(cost_width-1){1'b0}};
//		S12[62]<={(cost_width-1){1'b0}};
//		S12[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S12[0]<=S11[0];
//		S12[1]<=S11[1];
//		S12[2]<=S11[2];
//		S12[3]<=S11[3];
//    		S12[4]<=S11[4];
//		S12[5]<=S11[5];
//      		S12[6]<=S11[6];
//		S12[7]<=S11[7];
//		S12[8]<=S11[8];
//		S12[9]<=S11[9];
//		S12[10]<=S11[10];
//		S12[11]<=S11[11];
//      		S12[12]<=S11[12];
//		S12[13]<=S11[13];
//      		S12[14]<=S11[14];
//		S12[15]<=S11[15];
//		S12[16]<=S11[16];
//		S12[17]<=S11[17];
//		S12[18]<=S11[18];
//		S12[19]<=S11[19];
//     		S12[20]<=S11[20];
//		S12[21]<=S11[21];
//     		S12[22]<=S11[22];
//		S12[23]<=S11[23];
//		S12[24]<=S11[24];
//		S12[25]<=S11[25];
//		S12[26]<=S11[26];
//		S12[27]<=S11[27];
//   		S12[28]<=S11[28];
//		S12[29]<=S11[29];
//    		S12[30]<=S11[30];
//		S12[31]<=S11[31];
//		S12[32]<=S11[32];
//		S12[33]<=S11[33];
//		S12[34]<=S11[34];
//		S12[35]<=S11[35];
//     		S12[36]<=S11[36];
//		S12[37]<=S11[37];
//     		S12[38]<=S11[38];
//		S12[39]<=S11[39];
//		S12[40]<=S11[40];
//		S12[41]<=S11[41];
//		S12[42]<=S11[42];
//		S12[43]<=S11[43];
//      		S12[44]<=S11[44];
//		S12[45]<=S11[45];
//      		S12[46]<=S11[46];
//		S12[47]<=S11[47];
//		S12[48]<=S11[48];
//		S12[49]<=S11[49];
//		S12[50]<=S11[50];
//		S12[51]<=S11[51];
//      		S12[52]<=S11[52];
//		S12[53]<=S11[53];
//      		S12[54]<=S11[54];
//		S12[55]<=S11[55];
//		S12[56]<=S11[56];
//		S12[57]<=S11[57];
//		S12[58]<=S11[58];
//		S12[59]<=S11[59];
//      		S12[60]<=S11[60];
//		S12[61]<=S11[61];
//     		S12[62]<=S11[62];
//		S12[63]<=S11[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S13[0]<={(cost_width-1){1'b0}};
//		S13[1]<={(cost_width-1){1'b0}};
//		S13[2]<={(cost_width-1){1'b0}};
//		S13[3]<={(cost_width-1){1'b0}};
//		S13[4]<={(cost_width-1){1'b0}};
//		S13[5]<={(cost_width-1){1'b0}};
//		S13[6]<={(cost_width-1){1'b0}};
//		S13[7]<={(cost_width-1){1'b0}};
//		S13[8]<={(cost_width-1){1'b0}};
//		S13[9]<={(cost_width-1){1'b0}};
//		S13[10]<={(cost_width-1){1'b0}};
//		S13[11]<={(cost_width-1){1'b0}};
//		S13[12]<={(cost_width-1){1'b0}};
//		S13[13]<={(cost_width-1){1'b0}};
//		S13[14]<={(cost_width-1){1'b0}};
//		S13[15]<={(cost_width-1){1'b0}};
//		S13[16]<={(cost_width-1){1'b0}};
//		S13[17]<={(cost_width-1){1'b0}};
//		S13[18]<={(cost_width-1){1'b0}};
//		S13[19]<={(cost_width-1){1'b0}};
//		S13[20]<={(cost_width-1){1'b0}};
//		S13[21]<={(cost_width-1){1'b0}};
//		S13[22]<={(cost_width-1){1'b0}};
//		S13[23]<={(cost_width-1){1'b0}};
//		S13[24]<={(cost_width-1){1'b0}};
//		S13[25]<={(cost_width-1){1'b0}};
//		S13[26]<={(cost_width-1){1'b0}};
//		S13[27]<={(cost_width-1){1'b0}};
//		S13[28]<={(cost_width-1){1'b0}};
//		S13[29]<={(cost_width-1){1'b0}};
//		S13[30]<={(cost_width-1){1'b0}};
//		S13[31]<={(cost_width-1){1'b0}};
//		S13[32]<={(cost_width-1){1'b0}};
//		S13[33]<={(cost_width-1){1'b0}};
//		S13[34]<={(cost_width-1){1'b0}};
//		S13[35]<={(cost_width-1){1'b0}};
//		S13[36]<={(cost_width-1){1'b0}};
//		S13[37]<={(cost_width-1){1'b0}};
//		S13[38]<={(cost_width-1){1'b0}};
//		S13[39]<={(cost_width-1){1'b0}};
//		S13[40]<={(cost_width-1){1'b0}};
//		S13[41]<={(cost_width-1){1'b0}};
//		S13[42]<={(cost_width-1){1'b0}};
//		S13[43]<={(cost_width-1){1'b0}};
//		S13[44]<={(cost_width-1){1'b0}};
//		S13[45]<={(cost_width-1){1'b0}};
//		S13[46]<={(cost_width-1){1'b0}};
//		S13[47]<={(cost_width-1){1'b0}};
//		S13[48]<={(cost_width-1){1'b0}};
//		S13[49]<={(cost_width-1){1'b0}};
//		S13[50]<={(cost_width-1){1'b0}};
//		S13[51]<={(cost_width-1){1'b0}};
//		S13[52]<={(cost_width-1){1'b0}};
//		S13[53]<={(cost_width-1){1'b0}};
//		S13[54]<={(cost_width-1){1'b0}};
//		S13[55]<={(cost_width-1){1'b0}};
//		S13[56]<={(cost_width-1){1'b0}};
//		S13[57]<={(cost_width-1){1'b0}};
//		S13[58]<={(cost_width-1){1'b0}};
//		S13[59]<={(cost_width-1){1'b0}};
//		S13[60]<={(cost_width-1){1'b0}};
//		S13[61]<={(cost_width-1){1'b0}};
//		S13[62]<={(cost_width-1){1'b0}};
//		S13[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S13[0]<=S12[0];
//		S13[1]<=S12[1];
//		S13[2]<=S12[2];
//		S13[3]<=S12[3];
//    		S13[4]<=S12[4];
//		S13[5]<=S12[5];
//      		S13[6]<=S12[6];
//		S13[7]<=S12[7];
//		S13[8]<=S12[8];
//		S13[9]<=S12[9];
//		S13[10]<=S12[10];
//		S13[11]<=S12[11];
//      		S13[12]<=S12[12];
//		S13[13]<=S12[13];
//      		S13[14]<=S12[14];
//		S13[15]<=S12[15];
//		S13[16]<=S12[16];
//		S13[17]<=S12[17];
//		S13[18]<=S12[18];
//		S13[19]<=S12[19];
//     		S13[20]<=S12[20];
//		S13[21]<=S12[21];
//     		S13[22]<=S12[22];
//		S13[23]<=S12[23];
//		S13[24]<=S12[24];
//		S13[25]<=S12[25];
//		S13[26]<=S12[26];
//		S13[27]<=S12[27];
//   		S13[28]<=S12[28];
//		S13[29]<=S12[29];
//    		S13[30]<=S12[30];
//		S13[31]<=S12[31];
//		S13[32]<=S12[32];
//		S13[33]<=S12[33];
//		S13[34]<=S12[34];
//		S13[35]<=S12[35];
//     		S13[36]<=S12[36];
//		S13[37]<=S12[37];
//     		S13[38]<=S12[38];
//		S13[39]<=S12[39];
//		S13[40]<=S12[40];
//		S13[41]<=S12[41];
//		S13[42]<=S12[42];
//		S13[43]<=S12[43];
//      		S13[44]<=S12[44];
//		S13[45]<=S12[45];
//      		S13[46]<=S12[46];
//		S13[47]<=S12[47];
//		S13[48]<=S12[48];
//		S13[49]<=S12[49];
//		S13[50]<=S12[50];
//		S13[51]<=S12[51];
//      		S13[52]<=S12[52];
//		S13[53]<=S12[53];
//      		S13[54]<=S12[54];
//		S13[55]<=S12[55];
//		S13[56]<=S12[56];
//		S13[57]<=S12[57];
//		S13[58]<=S12[58];
//		S13[59]<=S12[59];
//      		S13[60]<=S12[60];
//		S13[61]<=S12[61];
//     		S13[62]<=S12[62];
//		S13[63]<=S12[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S14[0]<={(cost_width-1){1'b0}};
//		S14[1]<={(cost_width-1){1'b0}};
//		S14[2]<={(cost_width-1){1'b0}};
//		S14[3]<={(cost_width-1){1'b0}};
//		S14[4]<={(cost_width-1){1'b0}};
//		S14[5]<={(cost_width-1){1'b0}};
//		S14[6]<={(cost_width-1){1'b0}};
//		S14[7]<={(cost_width-1){1'b0}};
//		S14[8]<={(cost_width-1){1'b0}};
//		S14[9]<={(cost_width-1){1'b0}};
//		S14[10]<={(cost_width-1){1'b0}};
//		S14[11]<={(cost_width-1){1'b0}};
//		S14[12]<={(cost_width-1){1'b0}};
//		S14[13]<={(cost_width-1){1'b0}};
//		S14[14]<={(cost_width-1){1'b0}};
//		S14[15]<={(cost_width-1){1'b0}};
//		S14[16]<={(cost_width-1){1'b0}};
//		S14[17]<={(cost_width-1){1'b0}};
//		S14[18]<={(cost_width-1){1'b0}};
//		S14[19]<={(cost_width-1){1'b0}};
//		S14[20]<={(cost_width-1){1'b0}};
//		S14[21]<={(cost_width-1){1'b0}};
//		S14[22]<={(cost_width-1){1'b0}};
//		S14[23]<={(cost_width-1){1'b0}};
//		S14[24]<={(cost_width-1){1'b0}};
//		S14[25]<={(cost_width-1){1'b0}};
//		S14[26]<={(cost_width-1){1'b0}};
//		S14[27]<={(cost_width-1){1'b0}};
//		S14[28]<={(cost_width-1){1'b0}};
//		S14[29]<={(cost_width-1){1'b0}};
//		S14[30]<={(cost_width-1){1'b0}};
//		S14[31]<={(cost_width-1){1'b0}};
//		S14[32]<={(cost_width-1){1'b0}};
//		S14[33]<={(cost_width-1){1'b0}};
//		S14[34]<={(cost_width-1){1'b0}};
//		S14[35]<={(cost_width-1){1'b0}};
//		S14[36]<={(cost_width-1){1'b0}};
//		S14[37]<={(cost_width-1){1'b0}};
//		S14[38]<={(cost_width-1){1'b0}};
//		S14[39]<={(cost_width-1){1'b0}};
//		S14[40]<={(cost_width-1){1'b0}};
//		S14[41]<={(cost_width-1){1'b0}};
//		S14[42]<={(cost_width-1){1'b0}};
//		S14[43]<={(cost_width-1){1'b0}};
//		S14[44]<={(cost_width-1){1'b0}};
//		S14[45]<={(cost_width-1){1'b0}};
//		S14[46]<={(cost_width-1){1'b0}};
//		S14[47]<={(cost_width-1){1'b0}};
//		S14[48]<={(cost_width-1){1'b0}};
//		S14[49]<={(cost_width-1){1'b0}};
//		S14[50]<={(cost_width-1){1'b0}};
//		S14[51]<={(cost_width-1){1'b0}};
//		S14[52]<={(cost_width-1){1'b0}};
//		S14[53]<={(cost_width-1){1'b0}};
//		S14[54]<={(cost_width-1){1'b0}};
//		S14[55]<={(cost_width-1){1'b0}};
//		S14[56]<={(cost_width-1){1'b0}};
//		S14[57]<={(cost_width-1){1'b0}};
//		S14[58]<={(cost_width-1){1'b0}};
//		S14[59]<={(cost_width-1){1'b0}};
//		S14[60]<={(cost_width-1){1'b0}};
//		S14[61]<={(cost_width-1){1'b0}};
//		S14[62]<={(cost_width-1){1'b0}};
//		S14[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S14[0]<=S13[0];
//		S14[1]<=S13[1];
//		S14[2]<=S13[2];
//		S14[3]<=S13[3];
//    		S14[4]<=S13[4];
//		S14[5]<=S13[5];
//      		S14[6]<=S13[6];
//		S14[7]<=S13[7];
//		S14[8]<=S13[8];
//		S14[9]<=S13[9];
//		S14[10]<=S13[10];
//		S14[11]<=S13[11];
//      		S14[12]<=S13[12];
//		S14[13]<=S13[13];
//      		S14[14]<=S13[14];
//		S14[15]<=S13[15];
//		S14[16]<=S13[16];
//		S14[17]<=S13[17];
//		S14[18]<=S13[18];
//		S14[19]<=S13[19];
//     		S14[20]<=S13[20];
//		S14[21]<=S13[21];
//     		S14[22]<=S13[22];
//		S14[23]<=S13[23];
//		S14[24]<=S13[24];
//		S14[25]<=S13[25];
//		S14[26]<=S13[26];
//		S14[27]<=S13[27];
//   		S14[28]<=S13[28];
//		S14[29]<=S13[29];
//    		S14[30]<=S13[30];
//		S14[31]<=S13[31];
//		S14[32]<=S13[32];
//		S14[33]<=S13[33];
//		S14[34]<=S13[34];
//		S14[35]<=S13[35];
//     		S14[36]<=S13[36];
//		S14[37]<=S13[37];
//     		S14[38]<=S13[38];
//		S14[39]<=S13[39];
//		S14[40]<=S13[40];
//		S14[41]<=S13[41];
//		S14[42]<=S13[42];
//		S14[43]<=S13[43];
//      		S14[44]<=S13[44];
//		S14[45]<=S13[45];
//      		S14[46]<=S13[46];
//		S14[47]<=S13[47];
//		S14[48]<=S13[48];
//		S14[49]<=S13[49];
//		S14[50]<=S13[50];
//		S14[51]<=S13[51];
//      		S14[52]<=S13[52];
//		S14[53]<=S13[53];
//      		S14[54]<=S13[54];
//		S14[55]<=S13[55];
//		S14[56]<=S13[56];
//		S14[57]<=S13[57];
//		S14[58]<=S13[58];
//		S14[59]<=S13[59];
//      		S14[60]<=S13[60];
//		S14[61]<=S13[61];
//     		S14[62]<=S13[62];
//		S14[63]<=S13[63];
//
//end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//     		S15[0]<={(cost_width-1){1'b0}};
//		S15[1]<={(cost_width-1){1'b0}};
//		S15[2]<={(cost_width-1){1'b0}};
//		S15[3]<={(cost_width-1){1'b0}};
//		S15[4]<={(cost_width-1){1'b0}};
//		S15[5]<={(cost_width-1){1'b0}};
//		S15[6]<={(cost_width-1){1'b0}};
//		S15[7]<={(cost_width-1){1'b0}};
//		S15[8]<={(cost_width-1){1'b0}};
//		S15[9]<={(cost_width-1){1'b0}};
//		S15[10]<={(cost_width-1){1'b0}};
//		S15[11]<={(cost_width-1){1'b0}};
//		S15[12]<={(cost_width-1){1'b0}};
//		S15[13]<={(cost_width-1){1'b0}};
//		S15[14]<={(cost_width-1){1'b0}};
//		S15[15]<={(cost_width-1){1'b0}};
//		S15[16]<={(cost_width-1){1'b0}};
//		S15[17]<={(cost_width-1){1'b0}};
//		S15[18]<={(cost_width-1){1'b0}};
//		S15[19]<={(cost_width-1){1'b0}};
//		S15[20]<={(cost_width-1){1'b0}};
//		S15[21]<={(cost_width-1){1'b0}};
//		S15[22]<={(cost_width-1){1'b0}};
//		S15[23]<={(cost_width-1){1'b0}};
//		S15[24]<={(cost_width-1){1'b0}};
//		S15[25]<={(cost_width-1){1'b0}};
//		S15[26]<={(cost_width-1){1'b0}};
//		S15[27]<={(cost_width-1){1'b0}};
//		S15[28]<={(cost_width-1){1'b0}};
//		S15[29]<={(cost_width-1){1'b0}};
//		S15[30]<={(cost_width-1){1'b0}};
//		S15[31]<={(cost_width-1){1'b0}};
//		S15[32]<={(cost_width-1){1'b0}};
//		S15[33]<={(cost_width-1){1'b0}};
//		S15[34]<={(cost_width-1){1'b0}};
//		S15[35]<={(cost_width-1){1'b0}};
//		S15[36]<={(cost_width-1){1'b0}};
//		S15[37]<={(cost_width-1){1'b0}};
//		S15[38]<={(cost_width-1){1'b0}};
//		S15[39]<={(cost_width-1){1'b0}};
//		S15[40]<={(cost_width-1){1'b0}};
//		S15[41]<={(cost_width-1){1'b0}};
//		S15[42]<={(cost_width-1){1'b0}};
//		S15[43]<={(cost_width-1){1'b0}};
//		S15[44]<={(cost_width-1){1'b0}};
//		S15[45]<={(cost_width-1){1'b0}};
//		S15[46]<={(cost_width-1){1'b0}};
//		S15[47]<={(cost_width-1){1'b0}};
//		S15[48]<={(cost_width-1){1'b0}};
//		S15[49]<={(cost_width-1){1'b0}};
//		S15[50]<={(cost_width-1){1'b0}};
//		S15[51]<={(cost_width-1){1'b0}};
//		S15[52]<={(cost_width-1){1'b0}};
//		S15[53]<={(cost_width-1){1'b0}};
//		S15[54]<={(cost_width-1){1'b0}};
//		S15[55]<={(cost_width-1){1'b0}};
//		S15[56]<={(cost_width-1){1'b0}};
//		S15[57]<={(cost_width-1){1'b0}};
//		S15[58]<={(cost_width-1){1'b0}};
//		S15[59]<={(cost_width-1){1'b0}};
//		S15[60]<={(cost_width-1){1'b0}};
//		S15[61]<={(cost_width-1){1'b0}};
//		S15[62]<={(cost_width-1){1'b0}};
//		S15[63]<={(cost_width-1){1'b0}};
//	end
//	else if(clken) begin
//		S15[0]<=S14[0];
//		S15[1]<=S14[1];
//		S15[2]<=S14[2];
//		S15[3]<=S14[3];
//    		S15[4]<=S14[4];
//		S15[5]<=S14[5];
//      		S15[6]<=S14[6];
//		S15[7]<=S14[7];
//		S15[8]<=S14[8];
//		S15[9]<=S14[9];
//		S15[10]<=S14[10];
//		S15[11]<=S14[11];
//      		S15[12]<=S14[12];
//		S15[13]<=S14[13];
//      		S15[14]<=S14[14];
//		S15[15]<=S14[15];
//		S15[16]<=S14[16];
//		S15[17]<=S14[17];
//		S15[18]<=S14[18];
//		S15[19]<=S14[19];
//     		S15[20]<=S14[20];
//		S15[21]<=S14[21];
//     		S15[22]<=S14[22];
//		S15[23]<=S14[23];
//		S15[24]<=S14[24];
//		S15[25]<=S14[25];
//		S15[26]<=S14[26];
//		S15[27]<=S14[27];
//   		S15[28]<=S14[28];
//		S15[29]<=S14[29];
//    		S15[30]<=S14[30];
//		S15[31]<=S14[31];
//		S15[32]<=S14[32];
//		S15[33]<=S14[33];
//		S15[34]<=S14[34];
//		S15[35]<=S14[35];
//     		S15[36]<=S14[36];
//		S15[37]<=S14[37];
//     		S15[38]<=S14[38];
//		S15[39]<=S14[39];
//		S15[40]<=S14[40];
//		S15[41]<=S14[41];
//		S15[42]<=S14[42];
//		S15[43]<=S14[43];
//      		S15[44]<=S14[44];
//		S15[45]<=S14[45];
//      		S15[46]<=S14[46];
//		S15[47]<=S14[47];
//		S15[48]<=S14[48];
//		S15[49]<=S14[49];
//		S15[50]<=S14[50];
//		S15[51]<=S14[51];
//      		S15[52]<=S14[52];
//		S15[53]<=S14[53];
//      		S15[54]<=S14[54];
//		S15[55]<=S14[55];
//		S15[56]<=S14[56];
//		S15[57]<=S14[57];
//		S15[58]<=S14[58];
//		S15[59]<=S14[59];
//      		S15[60]<=S14[60];
//		S15[61]<=S14[61];
//     		S15[62]<=S14[62];
//		S15[63]<=S14[63];
//
//end
//end
wire [63:0] line[(cost_width-2):0];

genvar i;
generate for(i=0;i<(cost_width-1);i=i+1) begin: loop
    assign line[(cost_width-2)-i] = {S[0][i],S[1][i],S[2][i],S[3][i],S[4][i],S[5][i],S[6][i],S[7][i],
					S[8][i],S[9][i],S[10][i],S[11][i],S[12][i],S[13][i],S[14][i],S[15][i],
					S[16][i],S[17][i],S[18][i],S[19][i],S[20][i],S[21][i],S[22][i],S[23][i],
					S[24][i],S[25][i],S[26][i],S[27][i],S[28][i],S[29][i],S[30][i],S[31][i],
					S[32][i],S[33][i],S[34][i],S[35][i],S[36][i],S[37][i],S[38][i],S[39][i],
					S[40][i],S[41][i],S[42][i],S[43][i],S[44][i],S[45][i],S[46][i],S[47][i],
					S[48][i],S[49][i],S[50][i],S[51][i],S[52][i],S[53][i],S[54][i],S[55][i],
					S[56][i],S[57][i],S[58][i],S[59][i],S[60][i],S[61][i],S[62][i],S[63][i]};
end
endgenerate

//wire  line1_add,line2_add,line3_add,line4_add,line5_add,line6_add,line7_add,line8_add,line9_add,line10_add,line11_add,line12_add,line13_add,line14_add;
//reg [63:0] line1_sel,line2_sel,line3_sel,line4_sel,line5_sel,line6_sel,line7_sel,line8_sel,line9_sel,line10_sel,line11_sel,line12_sel,line13_sel,line14_sel;
//wire [63:0] line2_com,line3_com,line4_com,line5_com,line6_com,line7_com,line8_com,line9_com,line10_com,line11_com,line12_com,line13_com,line14_com;
//reg [127:0] signal0,signal1,signal2,signal3,signal4,signal5,signal6,signal7,signal8,signal9,signal10,signal11,signal12,signal13,signal14;
wire  line1_add,line2_add,line3_add,line4_add,line5_add,line6_add,line7_add,line8_add;
reg [63:0] line1_sel,line2_sel,line3_sel,line4_sel,line5_sel,line6_sel,line7_sel,line8_sel;
wire [63:0] line2_com,line3_com,line4_com,line5_com,line6_com,line7_com,line8_com;
reg [127:0] signal0,signal1,signal2,signal3,signal4,signal5,signal6,signal7,signal8;
reg [63:0] line2_reg;
reg [63:0] line3_reg0,line3_reg1;
reg [63:0] line4_reg0,line4_reg1,line4_reg2;
reg [63:0] line5_reg0,line5_reg1,line5_reg2,line5_reg3;
reg [63:0] line6_reg0,line6_reg1,line6_reg2,line6_reg3,line6_reg4;
reg [63:0] line7_reg0,line7_reg1,line7_reg2,line7_reg3,line7_reg4,line7_reg5;
reg [63:0] line8_reg0,line8_reg1,line8_reg2,line8_reg3,line8_reg4,line8_reg5,line8_reg6;
//reg [63:0] line9_reg0,line9_reg1,line9_reg2,line9_reg3,line9_reg4,line9_reg5,line9_reg6,line9_reg7;
//reg [63:0] line10_reg0,line10_reg1,line10_reg2,line10_reg3,line10_reg4,line10_reg5,line10_reg6,line10_reg7,line10_reg8;
//reg [63:0] line11_reg0,line11_reg1,line11_reg2,line11_reg3,line11_reg4,line11_reg5,line11_reg6,line11_reg7,line11_reg8,line11_reg9;
//reg [63:0] line12_reg0,line12_reg1,line12_reg2,line12_reg3,line12_reg4,line12_reg5,line12_reg6,line12_reg7,line12_reg8,line12_reg9,line12_reg10;
//reg [63:0] line13_reg0,line13_reg1,line13_reg2,line13_reg3,line13_reg4,line13_reg5,line13_reg6,line13_reg7,line13_reg8,line13_reg9,line13_reg10,line13_reg11;
//reg [63:0] line14_reg0,line14_reg1,line14_reg2,line14_reg3,line14_reg4,line14_reg5,line14_reg6,line14_reg7,line14_reg8,line14_reg9,line14_reg10,line14_reg11,line14_reg12;
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line2_reg<=0;
	end
	else if(clken) begin
		line2_reg<=line[1];
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line3_reg0<=0;
		line3_reg1<=0;
	end
	else if(clken) begin
		line3_reg0<=line[2];
		line3_reg1<=line3_reg0;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line4_reg0<=0;
		line4_reg1<=0;
		line4_reg2<=0;
	end
	else if(clken) begin
		line4_reg0<=line[3];
		line4_reg1<=line4_reg0;
		line4_reg2<=line4_reg1;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line5_reg0<=0;
		line5_reg1<=0;
		line5_reg2<=0;
		line5_reg3<=0;
	end
	else if(clken) begin
		line5_reg0<=line[4];
		line5_reg1<=line5_reg0;
		line5_reg2<=line5_reg1;
		line5_reg3<=line5_reg2;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line6_reg0<=0;
		line6_reg1<=0;
		line6_reg2<=0;
		line6_reg3<=0;
		line6_reg4<=0;
	end
	else if(clken) begin
		line6_reg0<=line[5];
		line6_reg1<=line6_reg0;
		line6_reg2<=line6_reg1;
		line6_reg3<=line6_reg2;
		line6_reg4<=line6_reg3;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line7_reg0<=0;
		line7_reg1<=0;
		line7_reg2<=0;
		line7_reg3<=0;
		line7_reg4<=0;
		line7_reg5<=0;
	end
	else if(clken) begin
		line7_reg0<=line[6];
		line7_reg1<=line7_reg0;
		line7_reg2<=line7_reg1;
		line7_reg3<=line7_reg2;
		line7_reg4<=line7_reg3;
		line7_reg5<=line7_reg4;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line8_reg0<=0;
		line8_reg1<=0;
		line8_reg2<=0;
		line8_reg3<=0;
		line8_reg4<=0;
		line8_reg5<=0;
		line8_reg6<=0;
	end
	else if(clken) begin
		line8_reg0<=line[7];
		line8_reg1<=line8_reg0;
		line8_reg2<=line8_reg1;
		line8_reg3<=line8_reg2;
		line8_reg4<=line8_reg3;
		line8_reg5<=line8_reg4;
		line8_reg6<=line8_reg5;
	end
end

//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line9_reg0<=0;
//		line9_reg1<=0;
//		line9_reg2<=0;
//		line9_reg3<=0;
//		line9_reg4<=0;
//		line9_reg5<=0;
//		line9_reg6<=0;
//		line9_reg7<=0;
//	end
//	else if(clken) begin
//		line9_reg0<=line[8];
//		line9_reg1<=line9_reg0;
//		line9_reg2<=line9_reg1;
//		line9_reg3<=line9_reg2;
//		line9_reg4<=line9_reg3;
//		line9_reg5<=line9_reg4;
//		line9_reg6<=line9_reg5;
//		line9_reg7<=line9_reg6;
//	end
//end
//
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line10_reg0<=0;
//		line10_reg1<=0;
//		line10_reg2<=0;
//		line10_reg3<=0;
//		line10_reg4<=0;
//		line10_reg5<=0;
//		line10_reg6<=0;
//		line10_reg7<=0;
//		line10_reg8<=0;
//	end
//	else if(clken) begin
//		line10_reg0<=line[9];
//		line10_reg1<=line10_reg0;
//		line10_reg2<=line10_reg1;
//		line10_reg3<=line10_reg2;
//		line10_reg4<=line10_reg3;
//		line10_reg5<=line10_reg4;
//		line10_reg6<=line10_reg5;
//		line10_reg7<=line10_reg6;
//		line10_reg8<=line10_reg7;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line11_reg0<=0;
//		line11_reg1<=0;
//		line11_reg2<=0;
//		line11_reg3<=0;
//		line11_reg4<=0;
//		line11_reg5<=0;
//		line11_reg6<=0;
//		line11_reg7<=0;
//		line11_reg8<=0;
//		line11_reg9<=0;
//	end
//	else if(clken) begin
//		line11_reg0<=line[10];
//		line11_reg1<=line11_reg0;
//		line11_reg2<=line11_reg1;
//		line11_reg3<=line11_reg2;
//		line11_reg4<=line11_reg3;
//		line11_reg5<=line11_reg4;
//		line11_reg6<=line11_reg5;
//		line11_reg7<=line11_reg6;
//		line11_reg8<=line11_reg7;
//		line11_reg9<=line11_reg8;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line12_reg0<=0;
//		line12_reg1<=0;
//		line12_reg2<=0;
//		line12_reg3<=0;
//		line12_reg4<=0;
//		line12_reg5<=0;
//		line12_reg6<=0;
//		line12_reg7<=0;
//		line12_reg8<=0;
//		line12_reg9<=0;
//		line12_reg10<=0;
//	end
//	else if(clken) begin
//		line12_reg0<=line[11];
//		line12_reg1<=line12_reg0;
//		line12_reg2<=line12_reg1;
//		line12_reg3<=line12_reg2;
//		line12_reg4<=line12_reg3;
//		line12_reg5<=line12_reg4;
//		line12_reg6<=line12_reg5;
//		line12_reg7<=line12_reg6;
//		line12_reg8<=line12_reg7;
//		line12_reg9<=line12_reg8;
//		line12_reg10<=line12_reg9;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line13_reg0<=0;
//		line13_reg1<=0;
//		line13_reg2<=0;
//		line13_reg3<=0;
//		line13_reg4<=0;
//		line13_reg5<=0;
//		line13_reg6<=0;
//		line13_reg7<=0;
//		line13_reg8<=0;
//		line13_reg9<=0;
//		line13_reg10<=0;
//		line13_reg11<=0;
//	end
//	else if(clken) begin
//		line13_reg0<=line[12];
//		line13_reg1<=line13_reg0;
//		line13_reg2<=line13_reg1;
//		line13_reg3<=line13_reg2;
//		line13_reg4<=line13_reg3;
//		line13_reg5<=line13_reg4;
//		line13_reg6<=line13_reg5;
//		line13_reg7<=line13_reg6;
//		line13_reg8<=line13_reg7;
//		line13_reg9<=line13_reg8;
//		line13_reg10<=line13_reg9;
//		line13_reg11<=line13_reg10;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line14_reg0<=0;
//		line14_reg1<=0;
//		line14_reg2<=0;
//		line14_reg3<=0;
//		line14_reg4<=0;
//		line14_reg5<=0;
//		line14_reg6<=0;
//		line14_reg7<=0;
//		line14_reg8<=0;
//		line14_reg9<=0;
//		line14_reg10<=0;
//		line14_reg11<=0;
//		line14_reg12<=0;
//	end
//	else if(clken) begin
//		line14_reg0<=line[13];
//		line14_reg1<=line14_reg0;
//		line14_reg2<=line14_reg1;
//		line14_reg3<=line14_reg2;
//		line14_reg4<=line14_reg3;
//		line14_reg5<=line14_reg4;
//		line14_reg6<=line14_reg5;
//		line14_reg7<=line14_reg6;
//		line14_reg8<=line14_reg7;
//		line14_reg9<=line14_reg8;
//		line14_reg10<=line14_reg9;
//		line14_reg11<=line14_reg10;
//		line14_reg12<=line14_reg11;
//	end
//end
assign line2_com = line1_sel | line2_reg;
assign line3_com = line2_sel | line3_reg1;
assign line4_com = line3_sel | line4_reg2;
assign line5_com = line4_sel | line5_reg3;
assign line6_com = line5_sel | line6_reg4;
assign line7_com = line6_sel | line7_reg5;
assign line8_com = line7_sel | line8_reg6;
//assign line9_com = line8_sel | line9_reg7;
//assign line10_com = line9_sel | line10_reg8;
//assign line11_com = line10_sel | line11_reg9;
//assign line12_com = line11_sel | line12_reg10;
//assign line13_com = line12_sel | line13_reg11;
//assign line14_com = line13_sel | line14_reg12;

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		signal0<=0;	
	end
	else if(clken) begin
		signal0<={aggregateCost0_0[1:0],aggregateCost0_1[1:0],aggregateCost0_2[1:0],aggregateCost0_3[1:0],aggregateCost0_4[1:0],aggregateCost0_5[1:0],aggregateCost0_6[1:0],aggregateCost0_7[1:0],
		          aggregateCost0_8[1:0],aggregateCost0_9[1:0],aggregateCost0_10[1:0],aggregateCost0_11[1:0],aggregateCost0_12[1:0],aggregateCost0_13[1:0],aggregateCost0_14[1:0],aggregateCost0_15[1:0],
		          aggregateCost0_16[1:0],aggregateCost0_17[1:0],aggregateCost0_18[1:0],aggregateCost0_19[1:0],aggregateCost0_20[1:0],aggregateCost0_21[1:0],aggregateCost0_22[1:0],aggregateCost0_23[1:0],
		          aggregateCost0_24[1:0],aggregateCost0_25[1:0],aggregateCost0_26[1:0],aggregateCost0_27[1:0],aggregateCost0_28[1:0],aggregateCost0_29[1:0],aggregateCost0_30[1:0],aggregateCost0_31[1:0],
		          aggregateCost0_32[1:0],aggregateCost0_33[1:0],aggregateCost0_34[1:0],aggregateCost0_35[1:0],aggregateCost0_36[1:0],aggregateCost0_37[1:0],aggregateCost0_38[1:0],aggregateCost0_39[1:0],
		          aggregateCost0_40[1:0],aggregateCost0_41[1:0],aggregateCost0_42[1:0],aggregateCost0_43[1:0],aggregateCost0_44[1:0],aggregateCost0_45[1:0],aggregateCost0_46[1:0],aggregateCost0_47[1:0],
		          aggregateCost0_48[1:0],aggregateCost0_49[1:0],aggregateCost0_50[1:0],aggregateCost0_51[1:0],aggregateCost0_52[1:0],aggregateCost0_53[1:0],aggregateCost0_54[1:0],aggregateCost0_55[1:0],
		          aggregateCost0_56[1:0],aggregateCost0_57[1:0],aggregateCost0_58[1:0],aggregateCost0_59[1:0],aggregateCost0_60[1:0],aggregateCost0_61[1:0],aggregateCost0_62[1:0],aggregateCost0_63[1:0]};
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line1_sel<=0;
		valid1<=0;
		signal1<=0;	
	end
	else if(clken) begin
		line1_sel<= ( & line[0]) ? ~line[0]:line[0];
		valid1<=valid0;
		signal1<=signal0;
	end
end

always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line2_sel<=0;
		valid2<=0;
		signal2<=0;		
	end
	else if(clken) begin
		line2_sel<= ( & line2_com) ? line1_sel:line2_com;
		valid2<=valid1;
		signal2<=signal1;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line3_sel<=0;
		valid3<=0;
		signal3<=0;	
	end
	else if(clken) begin
		line3_sel<= ( & line3_com) ? line2_sel:line3_com;
		valid3<=valid2;
		signal3<=signal2;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line4_sel<=0;
		valid4<=0;
		signal4<=0;	
	end
	else if(clken) begin
		line4_sel<= ( & line4_com) ? line3_sel:line4_com;
		valid4<=valid3;
		signal4<=signal3;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line5_sel<=0;
		valid5<=0;	
		signal5<=0;
	end
	else if(clken) begin
		line5_sel<= ( & line5_com) ? line4_sel:line5_com;
		valid5<=valid4;
		signal5<=signal4;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line6_sel<=0;
		valid6<=0;
		signal6<=0;	
	end
	else if(clken) begin
		line6_sel<= ( & line6_com) ? line5_sel:line6_com;
		valid6<=valid5;
		signal6<=signal5;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line7_sel<=0;
		valid7<=0;
		signal7<=0;	
	end
	else if(clken) begin
		line7_sel<= ( & line7_com) ? line6_sel:line7_com;
		valid7<=valid6;
		signal7<=signal6;
	end
end
always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		line8_sel<=0;
		valid8<=0;
		signal8<=0;	
	end
	else if(clken) begin
		line8_sel<= ( & line8_com) ? line7_sel:line8_com;
		valid8<=valid7;
		signal8<=signal7;
	end
end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line9_sel<=0;
//		valid9<=0;
//		signal9<=0;	
//	end
//	else if(clken) begin
//		line9_sel<= ( & line9_com) ? line8_sel:line9_com;
//		valid9<=valid8;
//		signal9<=signal8;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line10_sel<=0;
//		valid10<=0;
//		signal10<=0;	
//	end
//	else if(clken) begin
//		line10_sel<= ( & line10_com) ? line9_sel:line10_com;
//		valid10<=valid9;
//		signal10<=signal9;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line11_sel<=0;
//		valid11<=0;
//		signal11<=0;	
//	end
//	else if(clken) begin
//		line11_sel<= ( & line11_com) ? line10_sel:line11_com;
//		valid11<=valid10;
//		signal11<=signal10;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line12_sel<=0;
//		valid12<=0;
//		signal12<=0;	
//	end
//	else if(clken) begin
//		line12_sel<= ( & line12_com) ? line11_sel:line12_com;
//		valid12<=valid11;
//		signal12<=signal11;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line13_sel<=0;
//		valid13<=0;
//		signal13<=0;	
//	end
//	else if(clken) begin
//		line13_sel<= ( & line13_com) ? line12_sel:line13_com;
//		valid13<=valid12;
//		signal13<=signal12;
//	end
//end
//always@(posedge clk or negedge rst)begin
//	if(rst==0)begin
//		line14_sel<=0;
//		valid14<=0;
//		signal14<=0;	
//	end
//	else if(clken) begin
//		line14_sel<= ( & line14_com) ? line13_sel:line14_com;
//		valid14<=valid13;
//		signal14<=signal13;
//	end
//end
reg [5:0] disp_w1;

reg [1:0] disp_w2;
/*
always @(*) begin
	if(!line14_sel[63]) begin
		disp_w2 = signal14[127:126];
		disp_w1 = 6'd0;
	end
	else if (!line14_sel[62])begin
		disp_w2 = signal14[125:124];
		disp_w1 = 6'd1;
	end
	else if (!line14_sel[61])begin
		disp_w2 = signal14[123:122];
		disp_w1 = 6'd2;
	end
	else if (!line14_sel[60])begin
		disp_w2 = signal14[121:120];
		disp_w1 = 6'd3;
	end
	else if (!line14_sel[59])begin
		disp_w2 = signal14[119:118];
		disp_w1 = 6'd4;
	end
	else if (!line14_sel[58])begin
		disp_w2 = signal14[117:116];
		disp_w1 = 6'd5;
	end
	else if (!line14_sel[57])begin
		disp_w2 = signal14[115:114];
		disp_w1 = 6'd6;
	end
	else if (!line14_sel[56])begin
		disp_w2 = signal14[113:112];
		disp_w1 = 6'd7;
	end
	else if (!line14_sel[55])begin
		disp_w2 = signal14[111:110];
		disp_w1 = 6'd8;
	end
	else if (!line14_sel[54])begin
		disp_w2 = signal14[109:108];
		disp_w1 = 6'd9;
	end
	else if (!line14_sel[53])begin
		disp_w2 = signal14[107:106];
		disp_w1 = 6'd10;
	end
	else if (!line14_sel[52])begin
		disp_w2 = signal14[105:104];
		disp_w1 = 6'd11;
	end
	else if (!line14_sel[51])begin
		disp_w2 = signal14[103:102];
		disp_w1 = 6'd12;
	end
	else if (!line14_sel[50])begin
		disp_w2 = signal14[101:100];
		disp_w1 = 6'd13;
	end
	else if (!line14_sel[49])begin
		disp_w2 = signal14[99:98];
		disp_w1 = 6'd14;
	end
	else if (!line14_sel[48])begin
		disp_w2 = signal14[97:96];
		disp_w1 = 6'd15;
	end
	else if (!line14_sel[47])begin
		disp_w2 = signal14[95:94];
		disp_w1 = 6'd16;
	end
	else if (!line14_sel[46])begin
		disp_w2 = signal14[93:92];
		disp_w1 = 6'd17;
	end
	else if (!line14_sel[45])begin
		disp_w2 = signal14[91:90];
		disp_w1 = 6'd18;
	end
	else if (!line14_sel[44])begin
		disp_w2 = signal14[89:88];
		disp_w1 = 6'd19;
	end
	else if (!line14_sel[43])begin
		disp_w2 = signal14[87:86];
		disp_w1 = 6'd20;
	end
	else if (!line14_sel[42])begin
		disp_w2 = signal14[85:84];
		disp_w1 = 6'd21;
	end	
	else if (!line14_sel[41])begin
		disp_w2 = signal14[83:82];
		disp_w1 = 6'd22;
	end
	else if (!line14_sel[40])begin
		disp_w2 = signal14[81:80];
		disp_w1 = 6'd23;
	end
	else if (!line14_sel[39])begin
		disp_w2 = signal14[79:78];
		disp_w1 = 6'd24;
	end
	else if (!line14_sel[38])begin
		disp_w2 = signal14[77:76];
		disp_w1 = 6'd25;
	end
	else if (!line14_sel[37])begin
		disp_w2 = signal14[75:74];
		disp_w1 = 6'd26;
	end
	else if (!line14_sel[36])begin
		disp_w2 = signal14[73:72];
		disp_w1 = 6'd27;
	end
	else if (!line14_sel[35])begin
		disp_w2 = signal14[71:70];
		disp_w1 = 6'd28;
	end
	else if (!line14_sel[34])begin
		disp_w2 = signal14[69:68];
		disp_w1 = 6'd29;
	end
	else if (!line14_sel[33])begin
		disp_w2 = signal14[67:66];
		disp_w1 = 6'd30;
	end
	else if (!line14_sel[32])begin
		disp_w2 = signal14[65:64];
		disp_w1 = 6'd31;
	end
	else if (!line14_sel[31])begin
		disp_w2 = signal14[63:62];
		disp_w1 = 6'd32;
	end
	else if (!line14_sel[30])begin
		disp_w2 = signal14[61:60];
		disp_w1 = 6'd33;
	end
	else if (!line14_sel[29])begin
		disp_w2 = signal14[59:58];
		disp_w1 = 6'd34;
	end
	else if (!line14_sel[28])begin
		disp_w2 = signal14[57:56];
		disp_w1 = 6'd35;
	end
	else if (!line14_sel[27])begin
		disp_w2 = signal14[55:54];
		disp_w1 = 6'd36;
	end
	else if (!line14_sel[26])begin
		disp_w2 = signal14[53:52];
		disp_w1 = 6'd37;
	end
	else if (!line14_sel[25])begin
		disp_w2 = signal14[51:50];
		disp_w1 = 6'd38;
	end
	else if (!line14_sel[24])begin
		disp_w2 = signal14[49:48];
		disp_w1 = 6'd39;
	end
	else if (!line14_sel[23])begin
		disp_w2 = signal14[47:46];
		disp_w1 = 6'd40;
	end
	else if (!line14_sel[22])begin
		disp_w2 = signal14[45:44];
		disp_w1 = 6'd41;
	end
	else if (!line14_sel[21])begin
		disp_w2 = signal14[43:42];
		disp_w1 = 6'd42;
	end	
	else if (!line14_sel[20])begin
		disp_w2 = signal14[41:40];
		disp_w1 = 6'd43;
	end
	else if (!line14_sel[19])begin
		disp_w2 = signal14[39:38];
		disp_w1 = 6'd44;
	end
	else if (!line14_sel[18])begin
		disp_w2 = signal14[37:36];
		disp_w1 = 6'd45;
	end
	else if (!line14_sel[17])begin
		disp_w2 = signal14[35:34];
		disp_w1 = 6'd46;
	end
	else if (!line14_sel[16])begin
		disp_w2 = signal14[33:32];
		disp_w1 = 6'd47;
	end
	else if (!line14_sel[15])begin
		disp_w2 = signal14[31:30];
		disp_w1 = 6'd48;
	end
	else if (!line14_sel[14])begin
		disp_w2 = signal14[29:28];
		disp_w1 = 6'd49;
	end
	else if (!line14_sel[13])begin
		disp_w2 = signal14[27:26];
		disp_w1 = 6'd50;
	end
	else if (!line14_sel[12])begin
		disp_w2 = signal14[25:24];
		disp_w1 = 6'd51;
	end
	else if (!line14_sel[11])begin
		disp_w2 = signal14[23:22];
		disp_w1 = 6'd52;
	end
	else if (!line14_sel[10])begin
		disp_w2 = signal14[21:20];
		disp_w1 = 6'd53;
	end
	else if (!line14_sel[9])begin
		disp_w2 = signal14[19:18];
		disp_w1 = 6'd54;
	end
	else if (!line14_sel[8])begin
		disp_w2 = signal14[17:16];
		disp_w1 = 6'd55;
	end
	else if (!line14_sel[7])begin
		disp_w2 = signal14[15:14];
		disp_w1 = 6'd56;
	end
	else if (!line14_sel[6])begin
		disp_w2 = signal14[13:12];
		disp_w1 = 6'd57;
	end
	else if (!line14_sel[5])begin
		disp_w2 = signal14[11:10];
		disp_w1 = 6'd58;
	end
	else if (!line14_sel[4])begin
		disp_w2 = signal14[9:8];
		disp_w1 = 6'd59;
	end
	else if (!line14_sel[3])begin
		disp_w2 = signal14[7:6];
		disp_w1 = 6'd60;
	end
	else if (!line14_sel[2])begin
		disp_w2 = signal14[5:4];
		disp_w1 = 6'd61;
	end
	else if (!line14_sel[1])begin
		disp_w2 = signal14[3:2];
		disp_w1 = 6'd62;
	end
	else if (!line14_sel[0])begin
		disp_w2 = signal14[1:0];
		disp_w1 = 6'd63;
	end
	else begin
		disp_w2 = 2'd0;
		disp_w1 = 6'd0;
	end	
end*/
always @(*) begin
	if(!line8_sel[63]) begin
		disp_w2 = signal8[127:126];
		disp_w1 = 6'd0;
	end
	else if (!line8_sel[62])begin
		disp_w2 = signal8[125:124];
		disp_w1 = 6'd1;
	end
	else if (!line8_sel[61])begin
		disp_w2 = signal8[123:122];
		disp_w1 = 6'd2;
	end
	else if (!line8_sel[60])begin
		disp_w2 = signal8[121:120];
		disp_w1 = 6'd3;
	end
	else if (!line8_sel[59])begin
		disp_w2 = signal8[119:118];
		disp_w1 = 6'd4;
	end
	else if (!line8_sel[58])begin
		disp_w2 = signal8[117:116];
		disp_w1 = 6'd5;
	end
	else if (!line8_sel[57])begin
		disp_w2 = signal8[115:114];
		disp_w1 = 6'd6;
	end
	else if (!line8_sel[56])begin
		disp_w2 = signal8[113:112];
		disp_w1 = 6'd7;
	end
	else if (!line8_sel[55])begin
		disp_w2 = signal8[111:110];
		disp_w1 = 6'd8;
	end
	else if (!line8_sel[54])begin
		disp_w2 = signal8[109:108];
		disp_w1 = 6'd9;
	end
	else if (!line8_sel[53])begin
		disp_w2 = signal8[107:106];
		disp_w1 = 6'd10;
	end
	else if (!line8_sel[52])begin
		disp_w2 = signal8[105:104];
		disp_w1 = 6'd11;
	end
	else if (!line8_sel[51])begin
		disp_w2 = signal8[103:102];
		disp_w1 = 6'd12;
	end
	else if (!line8_sel[50])begin
		disp_w2 = signal8[101:100];
		disp_w1 = 6'd13;
	end
	else if (!line8_sel[49])begin
		disp_w2 = signal8[99:98];
		disp_w1 = 6'd14;
	end
	else if (!line8_sel[48])begin
		disp_w2 = signal8[97:96];
		disp_w1 = 6'd15;
	end
	else if (!line8_sel[47])begin
		disp_w2 = signal8[95:94];
		disp_w1 = 6'd16;
	end
	else if (!line8_sel[46])begin
		disp_w2 = signal8[93:92];
		disp_w1 = 6'd17;
	end
	else if (!line8_sel[45])begin
		disp_w2 = signal8[91:90];
		disp_w1 = 6'd18;
	end
	else if (!line8_sel[44])begin
		disp_w2 = signal8[89:88];
		disp_w1 = 6'd19;
	end
	else if (!line8_sel[43])begin
		disp_w2 = signal8[87:86];
		disp_w1 = 6'd20;
	end
	else if (!line8_sel[42])begin
		disp_w2 = signal8[85:84];
		disp_w1 = 6'd21;
	end	
	else if (!line8_sel[41])begin
		disp_w2 = signal8[83:82];
		disp_w1 = 6'd22;
	end
	else if (!line8_sel[40])begin
		disp_w2 = signal8[81:80];
		disp_w1 = 6'd23;
	end
	else if (!line8_sel[39])begin
		disp_w2 = signal8[79:78];
		disp_w1 = 6'd24;
	end
	else if (!line8_sel[38])begin
		disp_w2 = signal8[77:76];
		disp_w1 = 6'd25;
	end
	else if (!line8_sel[37])begin
		disp_w2 = signal8[75:74];
		disp_w1 = 6'd26;
	end
	else if (!line8_sel[36])begin
		disp_w2 = signal8[73:72];
		disp_w1 = 6'd27;
	end
	else if (!line8_sel[35])begin
		disp_w2 = signal8[71:70];
		disp_w1 = 6'd28;
	end
	else if (!line8_sel[34])begin
		disp_w2 = signal8[69:68];
		disp_w1 = 6'd29;
	end
	else if (!line8_sel[33])begin
		disp_w2 = signal8[67:66];
		disp_w1 = 6'd30;
	end
	else if (!line8_sel[32])begin
		disp_w2 = signal8[65:64];
		disp_w1 = 6'd31;
	end
	else if (!line8_sel[31])begin
		disp_w2 = signal8[63:62];
		disp_w1 = 6'd32;
	end
	else if (!line8_sel[30])begin
		disp_w2 = signal8[61:60];
		disp_w1 = 6'd33;
	end
	else if (!line8_sel[29])begin
		disp_w2 = signal8[59:58];
		disp_w1 = 6'd34;
	end
	else if (!line8_sel[28])begin
		disp_w2 = signal8[57:56];
		disp_w1 = 6'd35;
	end
	else if (!line8_sel[27])begin
		disp_w2 = signal8[55:54];
		disp_w1 = 6'd36;
	end
	else if (!line8_sel[26])begin
		disp_w2 = signal8[53:52];
		disp_w1 = 6'd37;
	end
	else if (!line8_sel[25])begin
		disp_w2 = signal8[51:50];
		disp_w1 = 6'd38;
	end
	else if (!line8_sel[24])begin
		disp_w2 = signal8[49:48];
		disp_w1 = 6'd39;
	end
	else if (!line8_sel[23])begin
		disp_w2 = signal8[47:46];
		disp_w1 = 6'd40;
	end
	else if (!line8_sel[22])begin
		disp_w2 = signal8[45:44];
		disp_w1 = 6'd41;
	end
	else if (!line8_sel[21])begin
		disp_w2 = signal8[43:42];
		disp_w1 = 6'd42;
	end	
	else if (!line8_sel[20])begin
		disp_w2 = signal8[41:40];
		disp_w1 = 6'd43;
	end
	else if (!line8_sel[19])begin
		disp_w2 = signal8[39:38];
		disp_w1 = 6'd44;
	end
	else if (!line8_sel[18])begin
		disp_w2 = signal8[37:36];
		disp_w1 = 6'd45;
	end
	else if (!line8_sel[17])begin
		disp_w2 = signal8[35:34];
		disp_w1 = 6'd46;
	end
	else if (!line8_sel[16])begin
		disp_w2 = signal8[33:32];
		disp_w1 = 6'd47;
	end
	else if (!line8_sel[15])begin
		disp_w2 = signal8[31:30];
		disp_w1 = 6'd48;
	end
	else if (!line8_sel[14])begin
		disp_w2 = signal8[29:28];
		disp_w1 = 6'd49;
	end
	else if (!line8_sel[13])begin
		disp_w2 = signal8[27:26];
		disp_w1 = 6'd50;
	end
	else if (!line8_sel[12])begin
		disp_w2 = signal8[25:24];
		disp_w1 = 6'd51;
	end
	else if (!line8_sel[11])begin
		disp_w2 = signal8[23:22];
		disp_w1 = 6'd52;
	end
	else if (!line8_sel[10])begin
		disp_w2 = signal8[21:20];
		disp_w1 = 6'd53;
	end
	else if (!line8_sel[9])begin
		disp_w2 = signal8[19:18];
		disp_w1 = 6'd54;
	end
	else if (!line8_sel[8])begin
		disp_w2 = signal8[17:16];
		disp_w1 = 6'd55;
	end
	else if (!line8_sel[7])begin
		disp_w2 = signal8[15:14];
		disp_w1 = 6'd56;
	end
	else if (!line8_sel[6])begin
		disp_w2 = signal8[13:12];
		disp_w1 = 6'd57;
	end
	else if (!line8_sel[5])begin
		disp_w2 = signal8[11:10];
		disp_w1 = 6'd58;
	end
	else if (!line8_sel[4])begin
		disp_w2 = signal8[9:8];
		disp_w1 = 6'd59;
	end
	else if (!line8_sel[3])begin
		disp_w2 = signal8[7:6];
		disp_w1 = 6'd60;
	end
	else if (!line8_sel[2])begin
		disp_w2 = signal8[5:4];
		disp_w1 = 6'd61;
	end
	else if (!line8_sel[1])begin
		disp_w2 = signal8[3:2];
		disp_w1 = 6'd62;
	end
	else if (!line8_sel[0])begin
		disp_w2 = signal8[1:0];
		disp_w1 = 6'd63;
	end
	else begin
		disp_w2 = 2'd0;
		disp_w1 = 6'd0;
	end	
end


reg [cost_width-2:0] Smin0,Smin01;
reg [cost_width-2:0] Smin1,Smin11;
reg [cost_width-2:0] Smin2,Smin21;
always@(posedge clk or negedge rst)begin

	if(rst==0)begin

		Smin0 <= {(cost_width-1){1'b0}};;
        Smin1 <= {(cost_width-1){1'b0}};;
        Smin2 <= {(cost_width-1){1'b0}};;
        valid19<=1'b0;
		

	end

	else if(clken) begin
if(disp_w1==6'd0)begin
	Smin0 <= {(cost_width-1){1'b0}};;
        Smin1 <= {(cost_width-1){1'b0}};;
	Smin2 <= {(cost_width-1){1'b0}};;
	valid19<=1'b1;
	end
else if(disp_w1==6'd63)begin
	Smin0 <= {(cost_width-1){1'b0}};;
        Smin1 <= {(cost_width-1){1'b0}};;
	Smin2 <= {(cost_width-1){1'b0}};;
	valid19<=1'b1;
	end
else begin
	Smin0 <= S8[disp_w1];
        Smin1 <= S8[disp_w1+1'b1];
	Smin2 <= S8[disp_w1-1'b1];//14
	valid19<=1'b1;
	end
end
else begin
Smin0 <= Smin0;
        Smin1 <= Smin1;
	Smin2 <= Smin2;
	valid19<=valid19;
	end
end

always@(posedge clk or negedge rst)begin

	if(rst==0)begin

	Smin01 <= {(cost_width-1){1'b0}};;
        Smin11 <= {(cost_width-1){1'b0}};;
       Smin21 <= {(cost_width-1){1'b0}};;
	end

	else if(clken) begin
        Smin01 <= Smin0 ;
        Smin11 <= Smin1 ;
	Smin21 <= Smin2 ;
       
	end
else begin
	Smin01 <= Smin01 ;
        Smin11 <= Smin11 ;
	Smin21 <= Smin21 ;
end
end

reg [cost_width-1:0] denom;
wire [cost_width+2:0] x_divider1;
wire [cost_width+1:0] d_divider;
wire [16:0] q_divider;
reg [16:0] interpFunction;
reg [8:0] disp_int;
reg [7:0] disp_int1;
reg [15:0] disp;

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		denom<={(cost_width-1){1'b0}};;
		valid9<=0;
		
	end

	else if(clken) begin
        if(valid19)begin
		if(disp_w1==6'd0)begin
			denom<={(cost_width-1){1'b0}};;
			valid9<=valid8;
		end
		else if(disp_w1==6'd63)begin	
			denom<={(cost_width-1){1'b0}};;
			valid9<=valid8;
		end
		else begin
    
			denom <= ((Smin2+Smin1-Smin0-Smin0) > 15'b1_000)? (Smin2+Smin1-Smin0-Smin0):15'b1_000;
    valid9<=valid8;
end
		end
		end
		else begin
		denom<=denom;
		valid9<=valid9;
		end
end


assign x_divider1={Smin21,4'b0000}- {Smin11,4'b0000}+denom;
wire [cost_width+1:0] x_divider = x_divider1[cost_width+2]?{~x_divider1[cost_width+1:0]+11'd1}:{x_divider1[cost_width+1:0]};
assign d_divider=denom+denom;
SRT4divider u_SRT4divider(.rst(rst),.clk(clk),.clken(clken),.validin(valid9),.f(x_divider1[cost_width+2]),.x(x_divider),.d(d_divider),.q(q_divider),.valid(validLUT));


always@(posedge clk or negedge rst)begin

	if(rst==0)begin

		disp_int1<=8'd0;
		disp_int<=9'd0;
		valid16<=1'd0;
	end

	else if(clken) begin

			if(disp_w2==2'b00)begin

				disp_int1<=({2'b00,disp_w1}<<2);
				disp_int<={disp_int1,1'd0};
				valid16<=validLUT;
			end

			else if(disp_w2==2'b10)begin

				disp_int1<=({2'b00,disp_w1}<<2)+8'b000001;
				disp_int<={disp_int1,1'd0};
				valid16<=validLUT;
			end

			else if(disp_w2==2'b01)begin

				disp_int1<=({2'b00,disp_w1}<<2)+8'b000010;
				disp_int<={disp_int1,1'd0};
				valid16<=validLUT;
end

			else if(disp_w2==2'b11)begin

				disp_int1<=({2'b00,disp_w1}<<2)+8'b000011;
				disp_int<={disp_int1,1'd0};
				valid16<=validLUT;
			end

	end

	else begin
				disp_int1 <= disp_int1;
				disp_int<=disp_int;
				valid16<=valid16;
		
	end

end 

reg [8:0] disp_int_reg1;
reg [8:0] disp_int_reg2;
reg [8:0] disp_int_reg3;
reg [8:0] disp_int_reg4;
reg [8:0] disp_int_reg5;
reg [8:0] disp_int_reg6;
reg [8:0] disp_int_reg7;
reg [8:0] disp_int_reg8;

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg1 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg1<=disp_int;
end
		else begin
		disp_int_reg1 <= disp_int_reg1;
		end
	end

always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg2 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg2<=disp_int_reg1;
end
		else begin
	disp_int_reg2 <= disp_int_reg2;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg3 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg3<=disp_int_reg2;
end
		else begin
	disp_int_reg3 <= disp_int_reg3;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg4 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg4<=disp_int_reg3;
end
		else begin
	disp_int_reg4 <= disp_int_reg4;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg5 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg5<=disp_int_reg4;
end
		else begin
	disp_int_reg5 <= disp_int_reg5;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg6 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg6<=disp_int_reg5;
end
		else begin
	disp_int_reg6 <= disp_int_reg6;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg7 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg7<=disp_int_reg6;
end
		else begin
	disp_int_reg7 <= disp_int_reg7;
		end
	end
always@(posedge clk or negedge rst)begin

	if(rst==0)begin
		disp_int_reg8 <=9'd0;
	end
	else if(clken) begin
        disp_int_reg8<=disp_int_reg7;
	end else begin
	disp_int_reg8 <= disp_int_reg8;
		end
	end

 always@(posedge clk or negedge rst)begin
if(rst==0)begin
		interpFunction<=17'd0;
	end
	else if(clken) begin
		if(disp_w1==6'd0)begin
				interpFunction<=17'd0;
			end

			else if(disp_w1==6'd63)begin
				interpFunction<=17'd0;
			end
			else begin
				interpFunction <= q_divider;
//interpFunction<=10'd0;			
end
		end	
		else begin
				interpFunction <= interpFunction;
//interpFunction<=10'd0;		
end

end


always@(posedge clk or negedge rst)begin

	if(rst==0)begin

		disp<=16'd0;
		
	end

	else if(clken) begin
	        if(interpFunction[16])begin
		        disp<={disp_int_reg3,7'd0}-interpFunction[15:0];
	        end
	        else begin
		        disp<={disp_int_reg3,7'd0}+interpFunction[15:0];
	        end
end
 	else begin
		disp <= disp;
	end
	
end
reg [5:0]count;
always@(posedge clk or negedge rst)begin
    if(!rst)begin
        count<=0;
    end
    else if(clken)begin
if(en_disp)begin
       count<=count+1'b1;
	end	  
	 end
    else begin
		count<=count; 
    end
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        valid_final<=0;
    end
    else if(clken)begin
if(count == 6'd14)begin//25
        valid_final<=1'b1;
		 end
	 end
    else begin
        valid_final<=valid_final;
    end
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
 	disp_final<=0;
    end
    else if(clken)begin
		  disp_final<=disp;
	 end
    else begin
		disp_final<=disp; 
    end
end



endmodule 
