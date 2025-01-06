//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 2020/05/25 23:09:53
// Uptade Date: 2020/07/19 10:24:10
// Design  by DongPingcheng
// Revised by LiZhuoao 
// Module Name:  agg3
// Project Name: SGM
// 128 range
//////////////////////////////////////////////////////////////////////////////////	

module agg3(
    clk,
	rst0,
	rst,
	clken,
    P1,
    P2,
	en_first,
	en_agg3,
	L0_0,
	L0_1,
	L0_2,
	L0_3,
	L0_4,
	L0_5,
	L0_6,
	L0_7,
	L0_8,
	L0_9,
	L0_10,
	L0_11,
	L0_12,
	L0_13,
	L0_14,
	L0_15,
	L0_16,
	L0_17,
	L0_18,
	L0_19,
	L0_20,
	L0_21,
	L0_22,
	L0_23,
	L0_24,
	L0_25,
	L0_26,
	L0_27,
	L0_28,
	L0_29,
	L0_30,
	L0_31,
	L0_32,
	L0_33,
	L0_34,
	L0_35,
	L0_36,
	L0_37,
	L0_38,
	L0_39,
	L0_40,
	L0_41,
	L0_42,
	L0_43,
	L0_44,
	L0_45,
	L0_46,
	L0_47,
	L0_48,
	L0_49,
	L0_50,
	L0_51,
	L0_52,
	L0_53,
	L0_54,
	L0_55,
	L0_56,
	L0_57,
	L0_58,
	L0_59,
	L0_60,
	L0_61,
	L0_62,
	L0_63,

	L135_0,
	L135_1,
	L135_2,
	L135_3,
	L135_4,
	L135_5,
	L135_6,
	L135_7,
	L135_8,
	L135_9,
	L135_10,
	L135_11,
	L135_12,
	L135_13,
	L135_14,
	L135_15,
	L135_16,
	L135_17,
	L135_18,
	L135_19,
	L135_20,
	L135_21,
	L135_22,
	L135_23,
	L135_24,
	L135_25,
	L135_26,
	L135_27,
	L135_28,
	L135_29,
	L135_30,
	L135_31,
	L135_32,
	L135_33,
	L135_34,
	L135_35,
	L135_36,
	L135_37,
	L135_38,
	L135_39,
	L135_40,
	L135_41,
	L135_42,
	L135_43,
	L135_44,
	L135_45,
	L135_46,
	L135_47,
	L135_48,
	L135_49,
	L135_50,
	L135_51,
	L135_52,
	L135_53,
	L135_54,
	L135_55,
	L135_56,
	L135_57,
	L135_58,
	L135_59,
	L135_60,
	L135_61,
	L135_62,
	L135_63,

	min_135,

	agg135_0,
	agg135_1,
	agg135_2,
	agg135_3,
	agg135_4,
	agg135_5,
	agg135_6,
	agg135_7,
	agg135_8,
	agg135_9,
	agg135_10,
	agg135_11,
	agg135_12,
	agg135_13,
	agg135_14,
	agg135_15,
	agg135_16,
	agg135_17,
	agg135_18,
	agg135_19,
	agg135_20,
	agg135_21,
	agg135_22,
	agg135_23,	
	agg135_24,
	agg135_25,
	agg135_26,
	agg135_27,
	agg135_28,
	agg135_29,
	agg135_30,
	agg135_31,
	agg135_32,
	agg135_33,
	agg135_34,
	agg135_35,
	agg135_36,
	agg135_37,
	agg135_38,
	agg135_39,
	agg135_40,
	agg135_41,
	agg135_42,
	agg135_43,
	agg135_44,
	agg135_45,
	agg135_46,
	agg135_47,
	agg135_48,
	agg135_49,
	agg135_50,
	agg135_51,
	agg135_52,
	agg135_53,
	agg135_54,
	agg135_55,
	agg135_56,
	agg135_57,
	agg135_58,
	agg135_59,
	agg135_60,
	agg135_61,
	agg135_62,
	agg135_63,
//鏇存柊鍚庣殑鑱氬悎鍊?	
	new_L0_0,
	new_L0_1,
	new_L0_2,
	new_L0_3,
	new_L0_4,
	new_L0_5,
	new_L0_6,
	new_L0_7,
	new_L0_8,
	new_L0_9,
	new_L0_10,
	new_L0_11,
	new_L0_12,
	new_L0_13,
	new_L0_14,
	new_L0_15,
	new_L0_16,
	new_L0_17,
	new_L0_18,
	new_L0_19,
	new_L0_20,
	new_L0_21,
	new_L0_22,
	new_L0_23,
	new_L0_24,
	new_L0_25,
	new_L0_26,
	new_L0_27,
	new_L0_28,
	new_L0_29,
	new_L0_30,
	new_L0_31,
	new_L0_32,
	new_L0_33,
	new_L0_34,
	new_L0_35,
	new_L0_36,
	new_L0_37,
	new_L0_38,
	new_L0_39,
	new_L0_40,
	new_L0_41,
	new_L0_42,
	new_L0_43,
	new_L0_44,
	new_L0_45,
	new_L0_46,
	new_L0_47,
	new_L0_48,
	new_L0_49,
	new_L0_50,
	new_L0_51,
	new_L0_52,
	new_L0_53,
	new_L0_54,
	new_L0_55,
	new_L0_56,
	new_L0_57,
	new_L0_58,
	new_L0_59,
	new_L0_60,
	new_L0_61,
	new_L0_62,
	new_L0_63,
	
	new_L135_0,
	new_L135_1,
	new_L135_2,
	new_L135_3,
	new_L135_4,
	new_L135_5,
	new_L135_6,
	new_L135_7,
	new_L135_8,
	new_L135_9,
	new_L135_10,
	new_L135_11,
	new_L135_12,
	new_L135_13,
	new_L135_14,
	new_L135_15,
	new_L135_16,
	new_L135_17,
	new_L135_18,
	new_L135_19,
	new_L135_20,
	new_L135_21,
	new_L135_22,
	new_L135_23,
	new_L135_24,
	new_L135_25,
	new_L135_26,
	new_L135_27,
	new_L135_28,
	new_L135_29,
	new_L135_30,
	new_L135_31,
	new_L135_32,
	new_L135_33,
	new_L135_34,
	new_L135_35,
	new_L135_36,
	new_L135_37,
	new_L135_38,
	new_L135_39,
	new_L135_40,
	new_L135_41,
	new_L135_42,
	new_L135_43,
	new_L135_44,
	new_L135_45,
	new_L135_46,
	new_L135_47,
	new_L135_48,
	new_L135_49,
	new_L135_50,
	new_L135_51,
	new_L135_52,
	new_L135_53,
	new_L135_54,
	new_L135_55,
	new_L135_56,
	new_L135_57,
	new_L135_58,
	new_L135_59,
	new_L135_60,
	new_L135_61,
	new_L135_62,
	new_L135_63,

	en_disp,

	cost_valid
);
    input clk;
	input rst0;
	input rst;
	input clken;
	input en_first;
	input en_agg3;
    input [6:0]P1,P2;

	parameter cost_width = 9;

	input [cost_width-1:0] L0_0;
	input [cost_width-1:0] L0_1;
	input [cost_width-1:0] L0_2;
	input [cost_width-1:0] L0_3;
	input [cost_width-1:0] L0_4;
	input [cost_width-1:0] L0_5;
	input [cost_width-1:0] L0_6;
	input [cost_width-1:0] L0_7;
	input [cost_width-1:0] L0_8;
	input [cost_width-1:0] L0_9;
	input [cost_width-1:0] L0_10;
	input [cost_width-1:0] L0_11;
	input [cost_width-1:0] L0_12;
	input [cost_width-1:0] L0_13;
	input [cost_width-1:0] L0_14;
	input [cost_width-1:0] L0_15;
	input [cost_width-1:0] L0_16;
	input [cost_width-1:0] L0_17;
	input [cost_width-1:0] L0_18;
	input [cost_width-1:0] L0_19;
	input [cost_width-1:0] L0_20;
	input [cost_width-1:0] L0_21;
	input [cost_width-1:0] L0_22;
	input [cost_width-1:0] L0_23;
	input [cost_width-1:0] L0_24;
	input [cost_width-1:0] L0_25;
	input [cost_width-1:0] L0_26;
	input [cost_width-1:0] L0_27;
	input [cost_width-1:0] L0_28;
	input [cost_width-1:0] L0_29;
	input [cost_width-1:0] L0_30;
	input [cost_width-1:0] L0_31;
	input [cost_width-1:0] L0_32;
	input [cost_width-1:0] L0_33;
	input [cost_width-1:0] L0_34;
	input [cost_width-1:0] L0_35;
	input [cost_width-1:0] L0_36;
	input [cost_width-1:0] L0_37;
	input [cost_width-1:0] L0_38;
	input [cost_width-1:0] L0_39;
	input [cost_width-1:0] L0_40;
	input [cost_width-1:0] L0_41;
	input [cost_width-1:0] L0_42;
	input [cost_width-1:0] L0_43;
	input [cost_width-1:0] L0_44;
	input [cost_width-1:0] L0_45;
	input [cost_width-1:0] L0_46;
	input [cost_width-1:0] L0_47;
	input [cost_width-1:0] L0_48;
	input [cost_width-1:0] L0_49;
	input [cost_width-1:0] L0_50;
	input [cost_width-1:0] L0_51;
	input [cost_width-1:0] L0_52;
	input [cost_width-1:0] L0_53;
	input [cost_width-1:0] L0_54;
	input [cost_width-1:0] L0_55;
	input [cost_width-1:0] L0_56;
	input [cost_width-1:0] L0_57;
	input [cost_width-1:0] L0_58;
	input [cost_width-1:0] L0_59;
	input [cost_width-1:0] L0_60;
	input [cost_width-1:0] L0_61;
	input [cost_width-1:0] L0_62;
	input [cost_width-1:0] L0_63;

	input [cost_width-3:0] L135_0;
	input [cost_width-3:0] L135_1;
	input [cost_width-3:0] L135_2;
	input [cost_width-3:0] L135_3;
	input [cost_width-3:0] L135_4;
	input [cost_width-3:0] L135_5;
	input [cost_width-3:0] L135_6;
	input [cost_width-3:0] L135_7;
	input [cost_width-3:0] L135_8;
	input [cost_width-3:0] L135_9;
	input [cost_width-3:0] L135_10;
	input [cost_width-3:0] L135_11;
	input [cost_width-3:0] L135_12;
	input [cost_width-3:0] L135_13;
	input [cost_width-3:0] L135_14;
	input [cost_width-3:0] L135_15;
	input [cost_width-3:0] L135_16;
	input [cost_width-3:0] L135_17;
	input [cost_width-3:0] L135_18;
	input [cost_width-3:0] L135_19;
	input [cost_width-3:0] L135_20;
	input [cost_width-3:0] L135_21;
	input [cost_width-3:0] L135_22;
	input [cost_width-3:0] L135_23;
	input [cost_width-3:0] L135_24;
	input [cost_width-3:0] L135_25;
	input [cost_width-3:0] L135_26;
	input [cost_width-3:0] L135_27;
	input [cost_width-3:0] L135_28;
	input [cost_width-3:0] L135_29;
	input [cost_width-3:0] L135_30;
	input [cost_width-3:0] L135_31;
	input [cost_width-3:0] L135_32;
	input [cost_width-3:0] L135_33;
	input [cost_width-3:0] L135_34;
	input [cost_width-3:0] L135_35;
	input [cost_width-3:0] L135_36;
	input [cost_width-3:0] L135_37;
	input [cost_width-3:0] L135_38;
	input [cost_width-3:0] L135_39;
	input [cost_width-3:0] L135_40;
	input [cost_width-3:0] L135_41;
	input [cost_width-3:0] L135_42;
	input [cost_width-3:0] L135_43;
	input [cost_width-3:0] L135_44;
	input [cost_width-3:0] L135_45;
	input [cost_width-3:0] L135_46;
	input [cost_width-3:0] L135_47;
	input [cost_width-3:0] L135_48;
	input [cost_width-3:0] L135_49;
	input [cost_width-3:0] L135_50;
	input [cost_width-3:0] L135_51;
	input [cost_width-3:0] L135_52;
	input [cost_width-3:0] L135_53;
	input [cost_width-3:0] L135_54;
	input [cost_width-3:0] L135_55;
	input [cost_width-3:0] L135_56;
	input [cost_width-3:0] L135_57;
	input [cost_width-3:0] L135_58;
	input [cost_width-3:0] L135_59;
	input [cost_width-3:0] L135_60;
	input [cost_width-3:0] L135_61;
	input [cost_width-3:0] L135_62;
	input [cost_width-3:0] L135_63;

	input [cost_width-3:0] min_135;

	input [cost_width-3:0] agg135_0;
	input [cost_width-3:0] agg135_1;
	input [cost_width-3:0] agg135_2;
	input [cost_width-3:0] agg135_3;
	input [cost_width-3:0] agg135_4;
	input [cost_width-3:0] agg135_5;
	input [cost_width-3:0] agg135_6;
	input [cost_width-3:0] agg135_7;
	input [cost_width-3:0] agg135_8;
	input [cost_width-3:0] agg135_9;
	input [cost_width-3:0] agg135_10;
	input [cost_width-3:0] agg135_11;
	input [cost_width-3:0] agg135_12;
	input [cost_width-3:0] agg135_13;
	input [cost_width-3:0] agg135_14;
	input [cost_width-3:0] agg135_15;
	input [cost_width-3:0] agg135_16;
	input [cost_width-3:0] agg135_17;
	input [cost_width-3:0] agg135_18;
	input [cost_width-3:0] agg135_19;
	input [cost_width-3:0] agg135_20;
	input [cost_width-3:0] agg135_21;
	input [cost_width-3:0] agg135_22;
	input [cost_width-3:0] agg135_23;	
	input [cost_width-3:0] agg135_24;
	input [cost_width-3:0] agg135_25;
	input [cost_width-3:0] agg135_26;
	input [cost_width-3:0] agg135_27;
	input [cost_width-3:0] agg135_28;
	input [cost_width-3:0] agg135_29;
	input [cost_width-3:0] agg135_30;
	input [cost_width-3:0] agg135_31;
	input [cost_width-3:0] agg135_32;
	input [cost_width-3:0] agg135_33;
	input [cost_width-3:0] agg135_34;
	input [cost_width-3:0] agg135_35;
	input [cost_width-3:0] agg135_36;
	input [cost_width-3:0] agg135_37;
	input [cost_width-3:0] agg135_38;
	input [cost_width-3:0] agg135_39;
	input [cost_width-3:0] agg135_40;
	input [cost_width-3:0] agg135_41;
	input [cost_width-3:0] agg135_42;
	input [cost_width-3:0] agg135_43;
	input [cost_width-3:0] agg135_44;
	input [cost_width-3:0] agg135_45;
	input [cost_width-3:0] agg135_46;
	input [cost_width-3:0] agg135_47;
	input [cost_width-3:0] agg135_48;
	input [cost_width-3:0] agg135_49;
	input [cost_width-3:0] agg135_50;
	input [cost_width-3:0] agg135_51;
	input [cost_width-3:0] agg135_52;
	input [cost_width-3:0] agg135_53;
	input [cost_width-3:0] agg135_54;
	input [cost_width-3:0] agg135_55;
	input [cost_width-3:0] agg135_56;
	input [cost_width-3:0] agg135_57;
	input [cost_width-3:0] agg135_58;
	input [cost_width-3:0] agg135_59;
	input [cost_width-3:0] agg135_60;
	input [cost_width-3:0] agg135_61;
	input [cost_width-3:0] agg135_62;
	input [cost_width-3:0] agg135_63;
//鏇存柊鍚庣殑鑱氬悎鍊?	
	output reg [cost_width-1:0] new_L0_0;
	output reg [cost_width-1:0] new_L0_1;
	output reg [cost_width-1:0] new_L0_2;
	output reg [cost_width-1:0] new_L0_3;
	output reg [cost_width-1:0] new_L0_4;
	output reg [cost_width-1:0] new_L0_5;
	output reg [cost_width-1:0] new_L0_6;
	output reg [cost_width-1:0] new_L0_7;
	output reg [cost_width-1:0] new_L0_8;
	output reg [cost_width-1:0] new_L0_9;
	output reg [cost_width-1:0] new_L0_10;
	output reg [cost_width-1:0] new_L0_11;
	output reg [cost_width-1:0] new_L0_12;
	output reg [cost_width-1:0] new_L0_13;
	output reg [cost_width-1:0] new_L0_14;
	output reg [cost_width-1:0] new_L0_15;
	output reg [cost_width-1:0] new_L0_16;
	output reg [cost_width-1:0] new_L0_17;
	output reg [cost_width-1:0] new_L0_18;
	output reg [cost_width-1:0] new_L0_19;
	output reg [cost_width-1:0] new_L0_20;
	output reg [cost_width-1:0] new_L0_21;
	output reg [cost_width-1:0] new_L0_22;
	output reg [cost_width-1:0] new_L0_23;
	output reg [cost_width-1:0] new_L0_24;
	output reg [cost_width-1:0] new_L0_25;
	output reg [cost_width-1:0] new_L0_26;
	output reg [cost_width-1:0] new_L0_27;
	output reg [cost_width-1:0] new_L0_28;
	output reg [cost_width-1:0] new_L0_29;
	output reg [cost_width-1:0] new_L0_30;
	output reg [cost_width-1:0] new_L0_31;
	output reg [cost_width-1:0] new_L0_32;
	output reg [cost_width-1:0] new_L0_33;
	output reg [cost_width-1:0] new_L0_34;
	output reg [cost_width-1:0] new_L0_35;
	output reg [cost_width-1:0] new_L0_36;
	output reg [cost_width-1:0] new_L0_37;
	output reg [cost_width-1:0] new_L0_38;
	output reg [cost_width-1:0] new_L0_39;
	output reg [cost_width-1:0] new_L0_40;
	output reg [cost_width-1:0] new_L0_41;
	output reg [cost_width-1:0] new_L0_42;
	output reg [cost_width-1:0] new_L0_43;
	output reg [cost_width-1:0] new_L0_44;
	output reg [cost_width-1:0] new_L0_45;
	output reg [cost_width-1:0] new_L0_46;
	output reg [cost_width-1:0] new_L0_47;
	output reg [cost_width-1:0] new_L0_48;
	output reg [cost_width-1:0] new_L0_49;
	output reg [cost_width-1:0] new_L0_50;
	output reg [cost_width-1:0] new_L0_51;
	output reg [cost_width-1:0] new_L0_52;
	output reg [cost_width-1:0] new_L0_53;
	output reg [cost_width-1:0] new_L0_54;
	output reg [cost_width-1:0] new_L0_55;
	output reg [cost_width-1:0] new_L0_56;
	output reg [cost_width-1:0] new_L0_57;
	output reg [cost_width-1:0] new_L0_58;
	output reg [cost_width-1:0] new_L0_59;
	output reg [cost_width-1:0] new_L0_60;
	output reg [cost_width-1:0] new_L0_61;
	output reg [cost_width-1:0] new_L0_62;
	output reg [cost_width-1:0] new_L0_63;
	
	output reg [cost_width-3:0] new_L135_0;
	output reg [cost_width-3:0] new_L135_1;
	output reg [cost_width-3:0] new_L135_2;
	output reg [cost_width-3:0] new_L135_3;
	output reg [cost_width-3:0] new_L135_4;
	output reg [cost_width-3:0] new_L135_5;
	output reg [cost_width-3:0] new_L135_6;
	output reg [cost_width-3:0] new_L135_7;
	output reg [cost_width-3:0] new_L135_8;
	output reg [cost_width-3:0] new_L135_9;
	output reg [cost_width-3:0] new_L135_10;
	output reg [cost_width-3:0] new_L135_11;
	output reg [cost_width-3:0] new_L135_12;
	output reg [cost_width-3:0] new_L135_13;
	output reg [cost_width-3:0] new_L135_14;
	output reg [cost_width-3:0] new_L135_15;
	output reg [cost_width-3:0] new_L135_16;
	output reg [cost_width-3:0] new_L135_17;
	output reg [cost_width-3:0] new_L135_18;
	output reg [cost_width-3:0] new_L135_19;
	output reg [cost_width-3:0] new_L135_20;
	output reg [cost_width-3:0] new_L135_21;
	output reg [cost_width-3:0] new_L135_22;
	output reg [cost_width-3:0] new_L135_23;
	output reg [cost_width-3:0] new_L135_24;
	output reg [cost_width-3:0] new_L135_25;
	output reg [cost_width-3:0] new_L135_26;
	output reg [cost_width-3:0] new_L135_27;
	output reg [cost_width-3:0] new_L135_28;
	output reg [cost_width-3:0] new_L135_29;
	output reg [cost_width-3:0] new_L135_30;
	output reg [cost_width-3:0] new_L135_31;
	output reg [cost_width-3:0] new_L135_32;
	output reg [cost_width-3:0] new_L135_33;
	output reg [cost_width-3:0] new_L135_34;
	output reg [cost_width-3:0] new_L135_35;
	output reg [cost_width-3:0] new_L135_36;
	output reg [cost_width-3:0] new_L135_37;
	output reg [cost_width-3:0] new_L135_38;
	output reg [cost_width-3:0] new_L135_39;
	output reg [cost_width-3:0] new_L135_40;
	output reg [cost_width-3:0] new_L135_41;
	output reg [cost_width-3:0] new_L135_42;
	output reg [cost_width-3:0] new_L135_43;
	output reg [cost_width-3:0] new_L135_44;
	output reg [cost_width-3:0] new_L135_45;
	output reg [cost_width-3:0] new_L135_46;
	output reg [cost_width-3:0] new_L135_47;
	output reg [cost_width-3:0] new_L135_48;
	output reg [cost_width-3:0] new_L135_49;
	output reg [cost_width-3:0] new_L135_50;
	output reg [cost_width-3:0] new_L135_51;
	output reg [cost_width-3:0] new_L135_52;
	output reg [cost_width-3:0] new_L135_53;
	output reg [cost_width-3:0] new_L135_54;
	output reg [cost_width-3:0] new_L135_55;
	output reg [cost_width-3:0] new_L135_56;
	output reg [cost_width-3:0] new_L135_57;
	output reg [cost_width-3:0] new_L135_58;
	output reg [cost_width-3:0] new_L135_59;
	output reg [cost_width-3:0] new_L135_60;
	output reg [cost_width-3:0] new_L135_61;
	output reg [cost_width-3:0] new_L135_62;
	output reg [cost_width-3:0] new_L135_63;

	output reg en_disp;

	input [63:0] cost_valid;

	wire [cost_width-2:0] min0;
	wire [cost_width-2:0] min1;
	wire [cost_width-2:0] min2;
	wire [cost_width-2:0] min3;
	wire [cost_width-2:0] min4;
	wire [cost_width-2:0] min5;
	wire [cost_width-2:0] min6;
	wire [cost_width-2:0] min7;
	wire [cost_width-2:0] min8;
	wire [cost_width-2:0] min9;
	wire [cost_width-2:0] min10;
	wire [cost_width-2:0] min11;
	wire [cost_width-2:0] min12;
	wire [cost_width-2:0] min13;
	wire [cost_width-2:0] min14;
	wire [cost_width-2:0] min15;
	wire [cost_width-2:0] min16;
	wire [cost_width-2:0] min17;
	wire [cost_width-2:0] min18;
	wire [cost_width-2:0] min19;
	wire [cost_width-2:0] min20;
	wire [cost_width-2:0] min21;
	wire [cost_width-2:0] min22;
	wire [cost_width-2:0] min23;
	wire [cost_width-2:0] min24;
	wire [cost_width-2:0] min25;
	wire [cost_width-2:0] min26;
	wire [cost_width-2:0] min27;
	wire [cost_width-2:0] min28;
	wire [cost_width-2:0] min29;
	wire [cost_width-2:0] min30;
	wire [cost_width-2:0] min31;
	wire [cost_width-2:0] min32;
	wire [cost_width-2:0] min33;
	wire [cost_width-2:0] min34;
	wire [cost_width-2:0] min35;
	wire [cost_width-2:0] min36;
	wire [cost_width-2:0] min37;
	wire [cost_width-2:0] min38;
	wire [cost_width-2:0] min39;
	wire [cost_width-2:0] min40;
	wire [cost_width-2:0] min41;
	wire [cost_width-2:0] min42;
	wire [cost_width-2:0] min43;
	wire [cost_width-2:0] min44;
	wire [cost_width-2:0] min45;
	wire [cost_width-2:0] min46;
	wire [cost_width-2:0] min47;
	wire [cost_width-2:0] min48;
	wire [cost_width-2:0] min49;
	wire [cost_width-2:0] min50;
	wire [cost_width-2:0] min51;
	wire [cost_width-2:0] min52;
	wire [cost_width-2:0] min53;
	wire [cost_width-2:0] min54;
	wire [cost_width-2:0] min55;
	wire [cost_width-2:0] min56;
	wire [cost_width-2:0] min57;
	wire [cost_width-2:0] min58;
	wire [cost_width-2:0] min59;
	wire [cost_width-2:0] min60;
	wire [cost_width-2:0] min61;
	wire [cost_width-2:0] min62;
	wire [cost_width-2:0] min63;

	wire [cost_width-2:0] tmin0;
	wire [cost_width-2:0] tmin1;
	wire [cost_width-2:0] tmin2;
	wire [cost_width-2:0] tmin3;
	wire [cost_width-2:0] tmin4;
	wire [cost_width-2:0] tmin5;
	wire [cost_width-2:0] tmin6;
	wire [cost_width-2:0] tmin7;
	wire [cost_width-2:0] tmin8;
	wire [cost_width-2:0] tmin9;
	wire [cost_width-2:0] tmin10;
	wire [cost_width-2:0] tmin11;
	wire [cost_width-2:0] tmin12;
	wire [cost_width-2:0] tmin13;
	wire [cost_width-2:0] tmin14;
	wire [cost_width-2:0] tmin15;
	wire [cost_width-2:0] tmin16;
	wire [cost_width-2:0] tmin17;
	wire [cost_width-2:0] tmin18;
	wire [cost_width-2:0] tmin19;
	wire [cost_width-2:0] tmin20;
	wire [cost_width-2:0] tmin21;
	wire [cost_width-2:0] tmin22;
	wire [cost_width-2:0] tmin23;
	wire [cost_width-2:0] tmin24;
	wire [cost_width-2:0] tmin25;
	wire [cost_width-2:0] tmin26;
	wire [cost_width-2:0] tmin27;
	wire [cost_width-2:0] tmin28;
	wire [cost_width-2:0] tmin29;
	wire [cost_width-2:0] tmin30;
	wire [cost_width-2:0] tmin31;
	wire [cost_width-2:0] tmin32;
	wire [cost_width-2:0] tmin33;
	wire [cost_width-2:0] tmin34;
	wire [cost_width-2:0] tmin35;
	wire [cost_width-2:0] tmin36;
	wire [cost_width-2:0] tmin37;
	wire [cost_width-2:0] tmin38;
	wire [cost_width-2:0] tmin39;
	wire [cost_width-2:0] tmin40;
	wire [cost_width-2:0] tmin41;
	wire [cost_width-2:0] tmin42;
	wire [cost_width-2:0] tmin43;
	wire [cost_width-2:0] tmin44;
	wire [cost_width-2:0] tmin45;
	wire [cost_width-2:0] tmin46;
	wire [cost_width-2:0] tmin47;
	wire [cost_width-2:0] tmin48;
	wire [cost_width-2:0] tmin49;
	wire [cost_width-2:0] tmin50;
	wire [cost_width-2:0] tmin51;
	wire [cost_width-2:0] tmin52;
	wire [cost_width-2:0] tmin53;
	wire [cost_width-2:0] tmin54;
	wire [cost_width-2:0] tmin55;
	wire [cost_width-2:0] tmin56;
	wire [cost_width-2:0] tmin57;
	wire [cost_width-2:0] tmin58;
	wire [cost_width-2:0] tmin59;
	wire [cost_width-2:0] tmin60;
	wire [cost_width-2:0] tmin61;
	wire [cost_width-2:0] tmin62;
	wire [cost_width-2:0] tmin63;	
	
	wire [cost_width-2:0] kmin0;
	wire [cost_width-2:0] kmin1;
	wire [cost_width-2:0] kmin2;
	wire [cost_width-2:0] kmin3;
	wire [cost_width-2:0] kmin4;
	wire [cost_width-2:0] kmin5;
	wire [cost_width-2:0] kmin6;
	wire [cost_width-2:0] kmin7;
	wire [cost_width-2:0] kmin8;
	wire [cost_width-2:0] kmin9;
	wire [cost_width-2:0] kmin10;
	wire [cost_width-2:0] kmin11;
	wire [cost_width-2:0] kmin12;
	wire [cost_width-2:0] kmin13;
	wire [cost_width-2:0] kmin14;
	wire [cost_width-2:0] kmin15;
	wire [cost_width-2:0] kmin16;
	wire [cost_width-2:0] kmin17;
	wire [cost_width-2:0] kmin18;
	wire [cost_width-2:0] kmin19;
	wire [cost_width-2:0] kmin20;
	wire [cost_width-2:0] kmin21;
	wire [cost_width-2:0] kmin22;
	wire [cost_width-2:0] kmin23;
	wire [cost_width-2:0] kmin24;
	wire [cost_width-2:0] kmin25;
	wire [cost_width-2:0] kmin26;
	wire [cost_width-2:0] kmin27;
	wire [cost_width-2:0] kmin28;
	wire [cost_width-2:0] kmin29;
	wire [cost_width-2:0] kmin30;
	wire [cost_width-2:0] kmin31;
	wire [cost_width-2:0] kmin32;
	wire [cost_width-2:0] kmin33;
	wire [cost_width-2:0] kmin34;
	wire [cost_width-2:0] kmin35;
	wire [cost_width-2:0] kmin36;
	wire [cost_width-2:0] kmin37;
	wire [cost_width-2:0] kmin38;
	wire [cost_width-2:0] kmin39;
	wire [cost_width-2:0] kmin40;
	wire [cost_width-2:0] kmin41;
	wire [cost_width-2:0] kmin42;
	wire [cost_width-2:0] kmin43;
	wire [cost_width-2:0] kmin44;
	wire [cost_width-2:0] kmin45;
	wire [cost_width-2:0] kmin46;
	wire [cost_width-2:0] kmin47;
	wire [cost_width-2:0] kmin48;
	wire [cost_width-2:0] kmin49;
	wire [cost_width-2:0] kmin50;
	wire [cost_width-2:0] kmin51;
	wire [cost_width-2:0] kmin52;
	wire [cost_width-2:0] kmin53;
	wire [cost_width-2:0] kmin54;
	wire [cost_width-2:0] kmin55;
	wire [cost_width-2:0] kmin56;
	wire [cost_width-2:0] kmin57;
	wire [cost_width-2:0] kmin58;
	wire [cost_width-2:0] kmin59;
	wire [cost_width-2:0] kmin60;
	wire [cost_width-2:0] kmin61;
	wire [cost_width-2:0] kmin62;
	wire [cost_width-2:0] kmin63;		
	
	wire [cost_width:0] Lmin0;
	wire [cost_width:0] Lmin1;
	wire [cost_width:0] Lmin2;
	wire [cost_width:0] Lmin3;
	wire [cost_width:0] Lmin4;
	wire [cost_width:0] Lmin5;
	wire [cost_width:0] Lmin6;
	wire [cost_width:0] Lmin7;
	wire [cost_width:0] Lmin8;
	wire [cost_width:0] Lmin9;
	wire [cost_width:0] Lmin10;
	wire [cost_width:0] Lmin11;
	wire [cost_width:0] Lmin12;
	wire [cost_width:0] Lmin13;
	wire [cost_width:0] Lmin14;
	wire [cost_width:0] Lmin15;
	wire [cost_width:0] Lmin16;
	wire [cost_width:0] Lmin17;
	wire [cost_width:0] Lmin18;
	wire [cost_width:0] Lmin19;
	wire [cost_width:0] Lmin20;
	wire [cost_width:0] Lmin21;
	wire [cost_width:0] Lmin22;
	wire [cost_width:0] Lmin23;
	wire [cost_width:0] Lmin24;
	wire [cost_width:0] Lmin25;
	wire [cost_width:0] Lmin26;
	wire [cost_width:0] Lmin27;
	wire [cost_width:0] Lmin28;
	wire [cost_width:0] Lmin29;
	wire [cost_width:0] Lmin30;
	wire [cost_width:0] Lmin31;
	wire [cost_width:0] Lmin32;
	wire [cost_width:0] Lmin33;
	wire [cost_width:0] Lmin34;
	wire [cost_width:0] Lmin35;
	wire [cost_width:0] Lmin36;
	wire [cost_width:0] Lmin37;
	wire [cost_width:0] Lmin38;
	wire [cost_width:0] Lmin39;
	wire [cost_width:0] Lmin40;
	wire [cost_width:0] Lmin41;
	wire [cost_width:0] Lmin42;
	wire [cost_width:0] Lmin43;
	wire [cost_width:0] Lmin44;
	wire [cost_width:0] Lmin45;
	wire [cost_width:0] Lmin46;
	wire [cost_width:0] Lmin47;
	wire [cost_width:0] Lmin48;
	wire [cost_width:0] Lmin49;
	wire [cost_width:0] Lmin50;
	wire [cost_width:0] Lmin51;
	wire [cost_width:0] Lmin52;
	wire [cost_width:0] Lmin53;
	wire [cost_width:0] Lmin54;
	wire [cost_width:0] Lmin55;
	wire [cost_width:0] Lmin56;
	wire [cost_width:0] Lmin57;
	wire [cost_width:0] Lmin58;
	wire [cost_width:0] Lmin59;
	wire [cost_width:0] Lmin60;
	wire [cost_width:0] Lmin61;
	wire [cost_width:0] Lmin62;
	wire [cost_width:0] Lmin63;	
	
	 //鑱氬悎涓姞P1鐨勯偅椤?
	wire [cost_width-3:0]agg135_ran[63:0];
	assign agg135_ran[0] =cost_valid[0]  ? agg135_0  :{(cost_width-2){1'b1}};
	assign agg135_ran[1] =cost_valid[1]  ? agg135_1  :{(cost_width-2){1'b1}};
	assign agg135_ran[2] =cost_valid[2]  ? agg135_2  :{(cost_width-2){1'b1}};
	assign agg135_ran[3] =cost_valid[3]  ? agg135_3  :{(cost_width-2){1'b1}};
	assign agg135_ran[4] =cost_valid[4]  ? agg135_4  :{(cost_width-2){1'b1}};
	assign agg135_ran[5] =cost_valid[5]  ? agg135_5  :{(cost_width-2){1'b1}};
	assign agg135_ran[6] =cost_valid[6]  ? agg135_6  :{(cost_width-2){1'b1}};
	assign agg135_ran[7] =cost_valid[7]  ? agg135_7  :{(cost_width-2){1'b1}};
	assign agg135_ran[8] =cost_valid[8]  ? agg135_8  :{(cost_width-2){1'b1}};
	assign agg135_ran[9] =cost_valid[9]  ? agg135_9  :{(cost_width-2){1'b1}};
	assign agg135_ran[10]=cost_valid[10] ? agg135_10 :{(cost_width-2){1'b1}};
	assign agg135_ran[11]=cost_valid[11] ? agg135_11 :{(cost_width-2){1'b1}};
	assign agg135_ran[12]=cost_valid[12] ? agg135_12 :{(cost_width-2){1'b1}};
	assign agg135_ran[13]=cost_valid[13] ? agg135_13 :{(cost_width-2){1'b1}};
	assign agg135_ran[14]=cost_valid[14] ? agg135_14 :{(cost_width-2){1'b1}};
	assign agg135_ran[15]=cost_valid[15] ? agg135_15 :{(cost_width-2){1'b1}};
	assign agg135_ran[16]=cost_valid[16] ? agg135_16 :{(cost_width-2){1'b1}};
	assign agg135_ran[17]=cost_valid[17] ? agg135_17 :{(cost_width-2){1'b1}};
	assign agg135_ran[18]=cost_valid[18] ? agg135_18 :{(cost_width-2){1'b1}};
	assign agg135_ran[19]=cost_valid[19] ? agg135_19 :{(cost_width-2){1'b1}};
	assign agg135_ran[20]=cost_valid[20] ? agg135_20 :{(cost_width-2){1'b1}};
	assign agg135_ran[21]=cost_valid[21] ? agg135_21 :{(cost_width-2){1'b1}};
	assign agg135_ran[22]=cost_valid[22] ? agg135_22 :{(cost_width-2){1'b1}};
	assign agg135_ran[23]=cost_valid[23] ? agg135_23 :{(cost_width-2){1'b1}};
	assign agg135_ran[24]=cost_valid[24] ? agg135_24 :{(cost_width-2){1'b1}};
	assign agg135_ran[25]=cost_valid[25] ? agg135_25 :{(cost_width-2){1'b1}};
	assign agg135_ran[26]=cost_valid[26] ? agg135_26 :{(cost_width-2){1'b1}};
	assign agg135_ran[27]=cost_valid[27] ? agg135_27 :{(cost_width-2){1'b1}};
	assign agg135_ran[28]=cost_valid[28] ? agg135_28 :{(cost_width-2){1'b1}};
	assign agg135_ran[29]=cost_valid[29] ? agg135_29 :{(cost_width-2){1'b1}};
	assign agg135_ran[30]=cost_valid[30] ? agg135_30 :{(cost_width-2){1'b1}};
	assign agg135_ran[31]=cost_valid[31] ? agg135_31 :{(cost_width-2){1'b1}};
	assign agg135_ran[32]=cost_valid[32] ? agg135_32 :{(cost_width-2){1'b1}};
	assign agg135_ran[33]=cost_valid[33] ? agg135_33 :{(cost_width-2){1'b1}};
	assign agg135_ran[34]=cost_valid[34] ? agg135_34 :{(cost_width-2){1'b1}};
	assign agg135_ran[35]=cost_valid[35] ? agg135_35 :{(cost_width-2){1'b1}};
	assign agg135_ran[36]=cost_valid[36] ? agg135_36 :{(cost_width-2){1'b1}};
	assign agg135_ran[37]=cost_valid[37] ? agg135_37 :{(cost_width-2){1'b1}};
	assign agg135_ran[38]=cost_valid[38] ? agg135_38 :{(cost_width-2){1'b1}};
	assign agg135_ran[39]=cost_valid[39] ? agg135_39 :{(cost_width-2){1'b1}};
	assign agg135_ran[40]=cost_valid[40] ? agg135_40 :{(cost_width-2){1'b1}};
	assign agg135_ran[41]=cost_valid[41] ? agg135_41 :{(cost_width-2){1'b1}};
	assign agg135_ran[42]=cost_valid[42] ? agg135_42 :{(cost_width-2){1'b1}};
	assign agg135_ran[43]=cost_valid[43] ? agg135_43 :{(cost_width-2){1'b1}};
	assign agg135_ran[44]=cost_valid[44] ? agg135_44 :{(cost_width-2){1'b1}};
	assign agg135_ran[45]=cost_valid[45] ? agg135_45 :{(cost_width-2){1'b1}};
	assign agg135_ran[46]=cost_valid[46] ? agg135_46 :{(cost_width-2){1'b1}};
	assign agg135_ran[47]=cost_valid[47] ? agg135_47 :{(cost_width-2){1'b1}};
	assign agg135_ran[48]=cost_valid[48] ? agg135_48 :{(cost_width-2){1'b1}};
	assign agg135_ran[49]=cost_valid[49] ? agg135_49 :{(cost_width-2){1'b1}};
	assign agg135_ran[50]=cost_valid[50] ? agg135_50 :{(cost_width-2){1'b1}};
	assign agg135_ran[51]=cost_valid[51] ? agg135_51 :{(cost_width-2){1'b1}};
	assign agg135_ran[52]=cost_valid[52] ? agg135_52 :{(cost_width-2){1'b1}};
	assign agg135_ran[53]=cost_valid[53] ? agg135_53 :{(cost_width-2){1'b1}};
	assign agg135_ran[54]=cost_valid[54] ? agg135_54 :{(cost_width-2){1'b1}};
	assign agg135_ran[55]=cost_valid[55] ? agg135_55 :{(cost_width-2){1'b1}};
	assign agg135_ran[56]=cost_valid[56] ? agg135_56 :{(cost_width-2){1'b1}};
	assign agg135_ran[57]=cost_valid[57] ? agg135_57 :{(cost_width-2){1'b1}};
	assign agg135_ran[58]=cost_valid[58] ? agg135_58 :{(cost_width-2){1'b1}};
	assign agg135_ran[59]=cost_valid[59] ? agg135_59 :{(cost_width-2){1'b1}};
	assign agg135_ran[60]=cost_valid[60] ? agg135_60 :{(cost_width-2){1'b1}};
	assign agg135_ran[61]=cost_valid[61] ? agg135_61 :{(cost_width-2){1'b1}};
	assign agg135_ran[62]=cost_valid[62] ? agg135_62 :{(cost_width-2){1'b1}};
	assign agg135_ran[63]=cost_valid[63] ? agg135_63 :{(cost_width-2){1'b1}};




	assign min0=agg135_1+P1;
	assign min1=agg135_ran[0]<=agg135_ran[2]?(agg135_ran[0]+P1):(agg135_ran[2]+P1);
	assign min2=agg135_ran[1]<=agg135_ran[3]?(agg135_ran[1]+P1):(agg135_ran[3]+P1);
	assign min3=agg135_ran[2]<=agg135_ran[4]?(agg135_ran[2]+P1):(agg135_ran[4]+P1);
	assign min4=agg135_ran[3]<=agg135_ran[5]?(agg135_ran[3]+P1):(agg135_ran[5]+P1);
	assign min5=agg135_ran[4]<=agg135_ran[6]?(agg135_ran[4]+P1):(agg135_ran[6]+P1);
	assign min6=agg135_ran[5]<=agg135_ran[7]?(agg135_ran[5]+P1):(agg135_ran[7]+P1);
	assign min7=agg135_ran[6]<=agg135_ran[8]?(agg135_ran[6]+P1):(agg135_ran[8]+P1);
	assign min8=agg135_ran[7]<=agg135_ran[9]?(agg135_ran[7]+P1):(agg135_ran[9]+P1);
	assign min9=agg135_ran[8]<=agg135_ran[10]?(agg135_ran[8]+P1):(agg135_ran[10]+P1);
	assign min10=agg135_ran[9]<=agg135_ran[11]?(agg135_ran[9]+P1):(agg135_ran[11]+P1);
	assign min11=agg135_ran[10]<=agg135_ran[12]?(agg135_ran[10]+P1):(agg135_ran[12]+P1);
	assign min12=agg135_ran[11]<=agg135_ran[13]?(agg135_ran[11]+P1):(agg135_ran[13]+P1);
	assign min13=agg135_ran[12]<=agg135_ran[14]?(agg135_ran[12]+P1):(agg135_ran[14]+P1);
	assign min14=agg135_ran[13]<=agg135_ran[15]?(agg135_ran[13]+P1):(agg135_ran[15]+P1);
	assign min15=agg135_ran[14]<=agg135_ran[16]?(agg135_ran[14]+P1):(agg135_ran[16]+P1);
	assign min16=agg135_ran[15]<=agg135_ran[17]?(agg135_ran[15]+P1):(agg135_ran[17]+P1);
	assign min17=agg135_ran[16]<=agg135_ran[18]?(agg135_ran[16]+P1):(agg135_ran[18]+P1);
	assign min18=agg135_ran[17]<=agg135_ran[19]?(agg135_ran[17]+P1):(agg135_ran[19]+P1);
	assign min19=agg135_ran[18]<=agg135_ran[20]?(agg135_ran[18]+P1):(agg135_ran[20]+P1);
	assign min20=agg135_ran[19]<=agg135_ran[21]?(agg135_ran[19]+P1):(agg135_ran[21]+P1);
	assign min21=agg135_ran[20]<=agg135_ran[22]?(agg135_ran[20]+P1):(agg135_ran[22]+P1);
	assign min22=agg135_ran[21]<=agg135_ran[23]?(agg135_ran[21]+P1):(agg135_ran[23]+P1);
	assign min23=agg135_ran[22]<=agg135_ran[24]?(agg135_ran[22]+P1):(agg135_ran[24]+P1);
	assign min24=agg135_ran[23]<=agg135_ran[25]?(agg135_ran[23]+P1):(agg135_ran[25]+P1);
	assign min25=agg135_ran[24]<=agg135_ran[26]?(agg135_ran[24]+P1):(agg135_ran[26]+P1);
	assign min26=agg135_ran[25]<=agg135_ran[27]?(agg135_ran[25]+P1):(agg135_ran[27]+P1);
	assign min27=agg135_ran[26]<=agg135_ran[28]?(agg135_ran[26]+P1):(agg135_ran[28]+P1);
	assign min28=agg135_ran[27]<=agg135_ran[29]?(agg135_ran[27]+P1):(agg135_ran[29]+P1);
	assign min29=agg135_ran[28]<=agg135_ran[30]?(agg135_ran[28]+P1):(agg135_ran[30]+P1);
	assign min30=agg135_ran[29]<=agg135_ran[31]?(agg135_ran[29]+P1):(agg135_ran[31]+P1);
	assign min31=agg135_ran[30]<=agg135_ran[32]?(agg135_ran[30]+P1):(agg135_ran[32]+P1);
	assign min32=agg135_ran[31]<=agg135_ran[33]?(agg135_ran[31]+P1):(agg135_ran[33]+P1);
	assign min33=agg135_ran[32]<=agg135_ran[34]?(agg135_ran[32]+P1):(agg135_ran[34]+P1);
	assign min34=agg135_ran[33]<=agg135_ran[35]?(agg135_ran[33]+P1):(agg135_ran[35]+P1);
	assign min35=agg135_ran[34]<=agg135_ran[36]?(agg135_ran[34]+P1):(agg135_ran[36]+P1);
	assign min36=agg135_ran[35]<=agg135_ran[37]?(agg135_ran[35]+P1):(agg135_ran[37]+P1);
	assign min37=agg135_ran[36]<=agg135_ran[38]?(agg135_ran[36]+P1):(agg135_ran[38]+P1);
	assign min38=agg135_ran[37]<=agg135_ran[39]?(agg135_ran[37]+P1):(agg135_ran[39]+P1);
	assign min39=agg135_ran[38]<=agg135_ran[40]?(agg135_ran[38]+P1):(agg135_ran[40]+P1);
	assign min40=agg135_ran[39]<=agg135_ran[41]?(agg135_ran[39]+P1):(agg135_ran[41]+P1);
	assign min41=agg135_ran[40]<=agg135_ran[42]?(agg135_ran[40]+P1):(agg135_ran[42]+P1);
	assign min42=agg135_ran[41]<=agg135_ran[43]?(agg135_ran[41]+P1):(agg135_ran[43]+P1);
	assign min43=agg135_ran[42]<=agg135_ran[44]?(agg135_ran[42]+P1):(agg135_ran[44]+P1);
	assign min44=agg135_ran[43]<=agg135_ran[45]?(agg135_ran[43]+P1):(agg135_ran[45]+P1);
	assign min45=agg135_ran[44]<=agg135_ran[46]?(agg135_ran[44]+P1):(agg135_ran[46]+P1);
	assign min46=agg135_ran[45]<=agg135_ran[47]?(agg135_ran[45]+P1):(agg135_ran[47]+P1);
	assign min47=agg135_ran[46]<=agg135_ran[48]?(agg135_ran[46]+P1):(agg135_ran[48]+P1);
	assign min48=agg135_ran[47]<=agg135_ran[49]?(agg135_ran[47]+P1):(agg135_ran[49]+P1);
	assign min49=agg135_ran[48]<=agg135_ran[50]?(agg135_ran[48]+P1):(agg135_ran[50]+P1);
	assign min50=agg135_ran[49]<=agg135_ran[51]?(agg135_ran[49]+P1):(agg135_ran[51]+P1);
	assign min51=agg135_ran[50]<=agg135_ran[52]?(agg135_ran[50]+P1):(agg135_ran[52]+P1);
	assign min52=agg135_ran[51]<=agg135_ran[53]?(agg135_ran[51]+P1):(agg135_ran[53]+P1);
	assign min53=agg135_ran[52]<=agg135_ran[54]?(agg135_ran[52]+P1):(agg135_ran[54]+P1);
	assign min54=agg135_ran[53]<=agg135_ran[55]?(agg135_ran[53]+P1):(agg135_ran[55]+P1);
	assign min55=agg135_ran[54]<=agg135_ran[56]?(agg135_ran[54]+P1):(agg135_ran[56]+P1);
	assign min56=agg135_ran[55]<=agg135_ran[57]?(agg135_ran[55]+P1):(agg135_ran[57]+P1);
	assign min57=agg135_ran[56]<=agg135_ran[58]?(agg135_ran[56]+P1):(agg135_ran[58]+P1);
	assign min58=agg135_ran[57]<=agg135_ran[59]?(agg135_ran[57]+P1):(agg135_ran[59]+P1);
	assign min59=agg135_ran[58]<=agg135_ran[60]?(agg135_ran[58]+P1):(agg135_ran[60]+P1);
	assign min60=agg135_ran[59]<=agg135_ran[61]?(agg135_ran[59]+P1):(agg135_ran[61]+P1);
	assign min61=agg135_ran[60]<=agg135_ran[62]?(agg135_ran[60]+P1):(agg135_ran[62]+P1);
	assign min62=agg135_ran[61]<=agg135_ran[63]?(agg135_ran[61]+P1):(agg135_ran[63]+P1);
	assign min63=agg135_ran[62]+P1;
	// assign min31=agg135_30+P1;

	wire  [cost_width-2:0]min_135_P2;

	assign min_135_P2=min_135+P2;

	assign tmin0=min0<=min_135_P2?min0:min_135_P2;
	assign tmin1=min1<=min_135_P2?min1:min_135_P2;
	assign tmin2=min2<=min_135_P2?min2:min_135_P2;
	assign tmin3=min3<=min_135_P2?min3:min_135_P2;
	assign tmin4=min4<=min_135_P2?min4:min_135_P2;
	assign tmin5=min5<=min_135_P2?min5:min_135_P2;
	assign tmin6=min6<=min_135_P2?min6:min_135_P2;
	assign tmin7=min7<=min_135_P2?min7:min_135_P2;
	assign tmin8=min8<=min_135_P2?min8:min_135_P2;
	assign tmin9=min9<=min_135_P2?min9:min_135_P2;
	assign tmin10=min10<=min_135_P2?min10:min_135_P2;
	assign tmin11=min11<=min_135_P2?min11:min_135_P2;
	assign tmin12=min12<=min_135_P2?min12:min_135_P2;
	assign tmin13=min13<=min_135_P2?min13:min_135_P2;
	assign tmin14=min14<=min_135_P2?min14:min_135_P2;
	assign tmin15=min15<=min_135_P2?min15:min_135_P2;
	assign tmin16=min16<=min_135_P2?min16:min_135_P2;
	assign tmin17=min17<=min_135_P2?min17:min_135_P2;
	assign tmin18=min18<=min_135_P2?min18:min_135_P2;
	assign tmin19=min19<=min_135_P2?min19:min_135_P2;
	assign tmin20=min20<=min_135_P2?min20:min_135_P2;
	assign tmin21=min21<=min_135_P2?min21:min_135_P2;
	assign tmin22=min22<=min_135_P2?min22:min_135_P2;
	assign tmin23=min23<=min_135_P2?min23:min_135_P2;
	assign tmin24=min24<=min_135_P2?min24:min_135_P2;
	assign tmin25=min25<=min_135_P2?min25:min_135_P2;
	assign tmin26=min26<=min_135_P2?min26:min_135_P2;
	assign tmin27=min27<=min_135_P2?min27:min_135_P2;
	assign tmin28=min28<=min_135_P2?min28:min_135_P2;
	assign tmin29=min29<=min_135_P2?min29:min_135_P2;
	assign tmin30=min30<=min_135_P2?min30:min_135_P2;
	assign tmin31=min31<=min_135_P2?min31:min_135_P2;
	assign tmin32=min32<=min_135_P2?min32:min_135_P2;
	assign tmin33=min33<=min_135_P2?min33:min_135_P2;
	assign tmin34=min34<=min_135_P2?min34:min_135_P2;
	assign tmin35=min35<=min_135_P2?min35:min_135_P2;
	assign tmin36=min36<=min_135_P2?min36:min_135_P2;
	assign tmin37=min37<=min_135_P2?min37:min_135_P2;
	assign tmin38=min38<=min_135_P2?min38:min_135_P2;
	assign tmin39=min39<=min_135_P2?min39:min_135_P2;
	assign tmin40=min40<=min_135_P2?min40:min_135_P2;
	assign tmin41=min41<=min_135_P2?min41:min_135_P2;
	assign tmin42=min42<=min_135_P2?min42:min_135_P2;
	assign tmin43=min43<=min_135_P2?min43:min_135_P2;
	assign tmin44=min44<=min_135_P2?min44:min_135_P2;
	assign tmin45=min45<=min_135_P2?min45:min_135_P2;
	assign tmin46=min46<=min_135_P2?min46:min_135_P2;
	assign tmin47=min47<=min_135_P2?min47:min_135_P2;
	assign tmin48=min48<=min_135_P2?min48:min_135_P2;
	assign tmin49=min49<=min_135_P2?min49:min_135_P2;
	assign tmin50=min20<=min_135_P2?min50:min_135_P2;
	assign tmin51=min21<=min_135_P2?min51:min_135_P2;
	assign tmin52=min22<=min_135_P2?min52:min_135_P2;
	assign tmin53=min23<=min_135_P2?min53:min_135_P2;
	assign tmin54=min24<=min_135_P2?min54:min_135_P2;
	assign tmin55=min25<=min_135_P2?min55:min_135_P2;
	assign tmin56=min26<=min_135_P2?min56:min_135_P2;
	assign tmin57=min27<=min_135_P2?min57:min_135_P2;
	assign tmin58=min28<=min_135_P2?min58:min_135_P2;
	assign tmin59=min29<=min_135_P2?min59:min_135_P2;
	assign tmin60=min30<=min_135_P2?min60:min_135_P2;
	assign tmin61=min31<=min_135_P2?min61:min_135_P2;
	assign tmin62=min12<=min_135_P2?min62:min_135_P2;
	assign tmin63=min13<=min_135_P2?min63:min_135_P2;

	assign kmin0=tmin0<={1'b0,agg135_0}?tmin0:{1'b0,agg135_0};
	assign kmin1=tmin1<={1'b0,agg135_1}?tmin1:{1'b0,agg135_1};
	assign kmin2=tmin2<={1'b0,agg135_2}?tmin2:{1'b0,agg135_2};
	assign kmin3=tmin3<={1'b0,agg135_3}?tmin3:{1'b0,agg135_3};
	assign kmin4=tmin4<={1'b0,agg135_4}?tmin4:{1'b0,agg135_4};
	assign kmin5=tmin5<={1'b0,agg135_5}?tmin5:{1'b0,agg135_5};
	assign kmin6=tmin6<={1'b0,agg135_6}?tmin6:{1'b0,agg135_6};
	assign kmin7=tmin7<={1'b0,agg135_7}?tmin7:{1'b0,agg135_7};
	assign kmin8=tmin8<={1'b0,agg135_8}?tmin8:{1'b0,agg135_8};
	assign kmin9=tmin9<={1'b0,agg135_9}?tmin9:{1'b0,agg135_9};
	assign kmin10=tmin10<={1'b0,agg135_10}?tmin10:{1'b0,agg135_10};
	assign kmin11=tmin11<={1'b0,agg135_11}?tmin11:{1'b0,agg135_11};
	assign kmin12=tmin12<={1'b0,agg135_12}?tmin12:{1'b0,agg135_12};
	assign kmin13=tmin13<={1'b0,agg135_13}?tmin13:{1'b0,agg135_13};
	assign kmin14=tmin14<={1'b0,agg135_14}?tmin14:{1'b0,agg135_14};
	assign kmin15=tmin15<={1'b0,agg135_15}?tmin15:{1'b0,agg135_15};
	assign kmin16=tmin16<={1'b0,agg135_16}?tmin16:{1'b0,agg135_16};
	assign kmin17=tmin17<={1'b0,agg135_17}?tmin17:{1'b0,agg135_17};
	assign kmin18=tmin18<={1'b0,agg135_18}?tmin18:{1'b0,agg135_18};
	assign kmin19=tmin19<={1'b0,agg135_19}?tmin19:{1'b0,agg135_19};
	assign kmin20=tmin20<={1'b0,agg135_20}?tmin20:{1'b0,agg135_20};
	assign kmin21=tmin21<={1'b0,agg135_21}?tmin21:{1'b0,agg135_21};
	assign kmin22=tmin22<={1'b0,agg135_22}?tmin22:{1'b0,agg135_22};
	assign kmin23=tmin23<={1'b0,agg135_23}?tmin23:{1'b0,agg135_23};
	assign kmin24=tmin24<={1'b0,agg135_24}?tmin24:{1'b0,agg135_24};
	assign kmin25=tmin25<={1'b0,agg135_25}?tmin25:{1'b0,agg135_25};
	assign kmin26=tmin26<={1'b0,agg135_26}?tmin26:{1'b0,agg135_26};
	assign kmin27=tmin27<={1'b0,agg135_27}?tmin27:{1'b0,agg135_27};
	assign kmin28=tmin28<={1'b0,agg135_28}?tmin28:{1'b0,agg135_28};
	assign kmin29=tmin29<={1'b0,agg135_29}?tmin29:{1'b0,agg135_29};
	assign kmin30=tmin30<={1'b0,agg135_30}?tmin30:{1'b0,agg135_30};
	assign kmin31=tmin31<={1'b0,agg135_31}?tmin31:{1'b0,agg135_31};
	assign kmin32=tmin32<={1'b0,agg135_32}?tmin32:{1'b0,agg135_32};
	assign kmin33=tmin33<={1'b0,agg135_33}?tmin33:{1'b0,agg135_33};
	assign kmin34=tmin34<={1'b0,agg135_34}?tmin34:{1'b0,agg135_34};
	assign kmin35=tmin35<={1'b0,agg135_35}?tmin35:{1'b0,agg135_35};
	assign kmin36=tmin36<={1'b0,agg135_36}?tmin36:{1'b0,agg135_36};
	assign kmin37=tmin37<={1'b0,agg135_37}?tmin37:{1'b0,agg135_37};
	assign kmin38=tmin38<={1'b0,agg135_38}?tmin38:{1'b0,agg135_38};
	assign kmin39=tmin39<={1'b0,agg135_39}?tmin39:{1'b0,agg135_39};
	assign kmin40=tmin40<={1'b0,agg135_40}?tmin40:{1'b0,agg135_40};
	assign kmin41=tmin41<={1'b0,agg135_41}?tmin41:{1'b0,agg135_41};
	assign kmin42=tmin42<={1'b0,agg135_42}?tmin42:{1'b0,agg135_42};
	assign kmin43=tmin43<={1'b0,agg135_43}?tmin43:{1'b0,agg135_43};
	assign kmin44=tmin44<={1'b0,agg135_44}?tmin44:{1'b0,agg135_44};
	assign kmin45=tmin45<={1'b0,agg135_45}?tmin45:{1'b0,agg135_45};
	assign kmin46=tmin46<={1'b0,agg135_46}?tmin46:{1'b0,agg135_46};
	assign kmin47=tmin47<={1'b0,agg135_47}?tmin47:{1'b0,agg135_47};
	assign kmin48=tmin48<={1'b0,agg135_48}?tmin48:{1'b0,agg135_48};
	assign kmin49=tmin49<={1'b0,agg135_49}?tmin49:{1'b0,agg135_49};
	assign kmin50=tmin50<={1'b0,agg135_50}?tmin50:{1'b0,agg135_50};
	assign kmin51=tmin51<={1'b0,agg135_51}?tmin51:{1'b0,agg135_51};
	assign kmin52=tmin52<={1'b0,agg135_52}?tmin52:{1'b0,agg135_52};
	assign kmin53=tmin53<={1'b0,agg135_53}?tmin53:{1'b0,agg135_53};
	assign kmin54=tmin54<={1'b0,agg135_54}?tmin54:{1'b0,agg135_54};
	assign kmin55=tmin55<={1'b0,agg135_55}?tmin55:{1'b0,agg135_55};
	assign kmin56=tmin56<={1'b0,agg135_56}?tmin56:{1'b0,agg135_56};
	assign kmin57=tmin57<={1'b0,agg135_57}?tmin57:{1'b0,agg135_57};
	assign kmin58=tmin58<={1'b0,agg135_58}?tmin58:{1'b0,agg135_58};
	assign kmin59=tmin59<={1'b0,agg135_59}?tmin59:{1'b0,agg135_59};
	assign kmin60=tmin60<={1'b0,agg135_60}?tmin60:{1'b0,agg135_60};
	assign kmin61=tmin61<={1'b0,agg135_61}?tmin61:{1'b0,agg135_61};
	assign kmin62=tmin62<={1'b0,agg135_62}?tmin62:{1'b0,agg135_62};
	assign kmin63=tmin63<={1'b0,agg135_63}?tmin63:{1'b0,agg135_63};

	assign Lmin0=kmin0-min_135;
	assign Lmin1=kmin1-min_135;
	assign Lmin2=kmin2-min_135;
	assign Lmin3=kmin3-min_135;
	assign Lmin4=kmin4-min_135;
	assign Lmin5=kmin5-min_135;
	assign Lmin6=kmin6-min_135;
	assign Lmin7=kmin7-min_135;
	assign Lmin8=kmin8-min_135;
	assign Lmin9=kmin9-min_135;
	assign Lmin10=kmin10-min_135;
	assign Lmin11=kmin11-min_135;
	assign Lmin12=kmin12-min_135;
	assign Lmin13=kmin13-min_135;
	assign Lmin14=kmin14-min_135;
	assign Lmin15=kmin15-min_135;
	assign Lmin16=kmin16-min_135;
	assign Lmin17=kmin17-min_135;
	assign Lmin18=kmin18-min_135;
	assign Lmin19=kmin19-min_135;
	assign Lmin20=kmin20-min_135;
	assign Lmin21=kmin21-min_135;
	assign Lmin22=kmin22-min_135;
	assign Lmin23=kmin23-min_135;
	assign Lmin24=kmin24-min_135;
	assign Lmin25=kmin25-min_135;
	assign Lmin26=kmin26-min_135;
	assign Lmin27=kmin27-min_135;
	assign Lmin28=kmin28-min_135;
	assign Lmin29=kmin29-min_135;
	assign Lmin30=kmin30-min_135;
	assign Lmin31=kmin31-min_135;
	assign Lmin32=kmin32-min_135;
	assign Lmin33=kmin33-min_135;
	assign Lmin34=kmin34-min_135;
	assign Lmin35=kmin35-min_135;
	assign Lmin36=kmin36-min_135;
	assign Lmin37=kmin37-min_135;
	assign Lmin38=kmin38-min_135;
	assign Lmin39=kmin39-min_135;
	assign Lmin40=kmin40-min_135;
	assign Lmin41=kmin41-min_135;
	assign Lmin42=kmin42-min_135;
	assign Lmin43=kmin43-min_135;
	assign Lmin44=kmin44-min_135;
	assign Lmin45=kmin45-min_135;
	assign Lmin46=kmin46-min_135;
	assign Lmin47=kmin47-min_135;
	assign Lmin48=kmin48-min_135;
	assign Lmin49=kmin49-min_135;
	assign Lmin50=kmin50-min_135;
	assign Lmin51=kmin51-min_135;
	assign Lmin52=kmin52-min_135;
	assign Lmin53=kmin53-min_135;
	assign Lmin54=kmin54-min_135;
	assign Lmin55=kmin55-min_135;
	assign Lmin56=kmin56-min_135;
	assign Lmin57=kmin57-min_135;
	assign Lmin58=kmin58-min_135;
	assign Lmin59=kmin59-min_135;
	assign Lmin60=kmin60-min_135;
	assign Lmin61=kmin61-min_135;
	assign Lmin62=kmin62-min_135;
	assign Lmin63=kmin63-min_135;

	always@(posedge clk or negedge rst)begin
	if(rst==0)begin
		en_disp<=1'd0;
		new_L0_0<={cost_width{1'b0}};
		new_L0_1<={cost_width{1'b0}};
		new_L0_2<={cost_width{1'b0}};
		new_L0_3<={cost_width{1'b0}};
		new_L0_4<={cost_width{1'b0}};
		new_L0_5<={cost_width{1'b0}};
		new_L0_6<={cost_width{1'b0}};
		new_L0_7<={cost_width{1'b0}};
		new_L0_8<={cost_width{1'b0}};
		new_L0_9<={cost_width{1'b0}};
		new_L0_10<={cost_width{1'b0}};
		new_L0_11<={cost_width{1'b0}};
		new_L0_12<={cost_width{1'b0}};
		new_L0_13<={cost_width{1'b0}};
		new_L0_14<={cost_width{1'b0}};
		new_L0_15<={cost_width{1'b0}};
		new_L0_16<={cost_width{1'b0}};
		new_L0_17<={cost_width{1'b0}};
		new_L0_18<={cost_width{1'b0}};
		new_L0_19<={cost_width{1'b0}};
		new_L0_20<={cost_width{1'b0}};
		new_L0_21<={cost_width{1'b0}};
		new_L0_22<={cost_width{1'b0}};
		new_L0_23<={cost_width{1'b0}};
		new_L0_24<={cost_width{1'b0}};
		new_L0_25<={cost_width{1'b0}};
		new_L0_26<={cost_width{1'b0}};
		new_L0_27<={cost_width{1'b0}};
		new_L0_28<={cost_width{1'b0}};
		new_L0_29<={cost_width{1'b0}};
		new_L0_30<={cost_width{1'b0}};
		new_L0_31<={cost_width{1'b0}};
		new_L0_32<={cost_width{1'b0}};
		new_L0_33<={cost_width{1'b0}};
		new_L0_34<={cost_width{1'b0}};
		new_L0_35<={cost_width{1'b0}};
		new_L0_36<={cost_width{1'b0}};
		new_L0_37<={cost_width{1'b0}};
		new_L0_38<={cost_width{1'b0}};
		new_L0_39<={cost_width{1'b0}};
		new_L0_40<={cost_width{1'b0}};
		new_L0_41<={cost_width{1'b0}};
		new_L0_42<={cost_width{1'b0}};
		new_L0_43<={cost_width{1'b0}};
		new_L0_44<={cost_width{1'b0}};
		new_L0_45<={cost_width{1'b0}};
		new_L0_46<={cost_width{1'b0}};
		new_L0_47<={cost_width{1'b0}};
		new_L0_48<={cost_width{1'b0}};
		new_L0_49<={cost_width{1'b0}};
		new_L0_50<={cost_width{1'b0}};
		new_L0_51<={cost_width{1'b0}};
		new_L0_52<={cost_width{1'b0}};
		new_L0_53<={cost_width{1'b0}};
		new_L0_54<={cost_width{1'b0}};
		new_L0_55<={cost_width{1'b0}};
		new_L0_56<={cost_width{1'b0}};
		new_L0_57<={cost_width{1'b0}};
		new_L0_58<={cost_width{1'b0}};
		new_L0_59<={cost_width{1'b0}};
		new_L0_60<={cost_width{1'b0}};
		new_L0_61<={cost_width{1'b0}};
		new_L0_62<={cost_width{1'b0}};
		new_L0_63<={cost_width{1'b0}};

		new_L135_0<={(cost_width-2){1'b0}};
		new_L135_1<={(cost_width-2){1'b0}};
		new_L135_2<={(cost_width-2){1'b0}};
		new_L135_3<={(cost_width-2){1'b0}};
		new_L135_4<={(cost_width-2){1'b0}};
		new_L135_5<={(cost_width-2){1'b0}};
		new_L135_6<={(cost_width-2){1'b0}};
		new_L135_7<={(cost_width-2){1'b0}};
		new_L135_8<={(cost_width-2){1'b0}};
		new_L135_9<={(cost_width-2){1'b0}};
		new_L135_10<={(cost_width-2){1'b0}};
		new_L135_11<={(cost_width-2){1'b0}};
		new_L135_12<={(cost_width-2){1'b0}};
		new_L135_13<={(cost_width-2){1'b0}};
		new_L135_14<={(cost_width-2){1'b0}};
		new_L135_15<={(cost_width-2){1'b0}};
		new_L135_16<={(cost_width-2){1'b0}};
		new_L135_17<={(cost_width-2){1'b0}};
		new_L135_18<={(cost_width-2){1'b0}};
		new_L135_19<={(cost_width-2){1'b0}};
		new_L135_20<={(cost_width-2){1'b0}};
		new_L135_21<={(cost_width-2){1'b0}};
		new_L135_22<={(cost_width-2){1'b0}};
		new_L135_23<={(cost_width-2){1'b0}};
		new_L135_24<={(cost_width-2){1'b0}};
		new_L135_25<={(cost_width-2){1'b0}};
		new_L135_26<={(cost_width-2){1'b0}};
		new_L135_27<={(cost_width-2){1'b0}};
		new_L135_28<={(cost_width-2){1'b0}};
		new_L135_29<={(cost_width-2){1'b0}};
		new_L135_30<={(cost_width-2){1'b0}};
		new_L135_31<={(cost_width-2){1'b0}};
		new_L135_32<={(cost_width-2){1'b0}};
		new_L135_33<={(cost_width-2){1'b0}};
		new_L135_34<={(cost_width-2){1'b0}};
		new_L135_35<={(cost_width-2){1'b0}};
		new_L135_36<={(cost_width-2){1'b0}};
		new_L135_37<={(cost_width-2){1'b0}};
		new_L135_38<={(cost_width-2){1'b0}};
		new_L135_39<={(cost_width-2){1'b0}};
		new_L135_40<={(cost_width-2){1'b0}};
		new_L135_41<={(cost_width-2){1'b0}};
		new_L135_42<={(cost_width-2){1'b0}};
		new_L135_43<={(cost_width-2){1'b0}};
		new_L135_44<={(cost_width-2){1'b0}};
		new_L135_45<={(cost_width-2){1'b0}};
		new_L135_46<={(cost_width-2){1'b0}};
		new_L135_47<={(cost_width-2){1'b0}};
		new_L135_48<={(cost_width-2){1'b0}};
		new_L135_49<={(cost_width-2){1'b0}};
		new_L135_50<={(cost_width-2){1'b0}};
		new_L135_51<={(cost_width-2){1'b0}};
		new_L135_52<={(cost_width-2){1'b0}};
		new_L135_53<={(cost_width-2){1'b0}};
		new_L135_54<={(cost_width-2){1'b0}};
		new_L135_55<={(cost_width-2){1'b0}};
		new_L135_56<={(cost_width-2){1'b0}};
		new_L135_57<={(cost_width-2){1'b0}};
		new_L135_58<={(cost_width-2){1'b0}};
		new_L135_59<={(cost_width-2){1'b0}};
		new_L135_60<={(cost_width-2){1'b0}};
		new_L135_61<={(cost_width-2){1'b0}};
		new_L135_62<={(cost_width-2){1'b0}};
		new_L135_63<={(cost_width-2){1'b0}};
	end
	else if(clken) begin
		if(rst0==0)begin
			en_disp<=1'd0;
			new_L0_0<={cost_width{1'b0}};
			new_L0_1<={cost_width{1'b0}};
			new_L0_2<={cost_width{1'b0}};
			new_L0_3<={cost_width{1'b0}};
			new_L0_4<={cost_width{1'b0}};
			new_L0_5<={cost_width{1'b0}};
			new_L0_6<={cost_width{1'b0}};
			new_L0_7<={cost_width{1'b0}};
			new_L0_8<={cost_width{1'b0}};
			new_L0_9<={cost_width{1'b0}};
			new_L0_10<={cost_width{1'b0}};
			new_L0_11<={cost_width{1'b0}};
			new_L0_12<={cost_width{1'b0}};
			new_L0_13<={cost_width{1'b0}};
			new_L0_14<={cost_width{1'b0}};
			new_L0_15<={cost_width{1'b0}};
			new_L0_16<={cost_width{1'b0}};
			new_L0_17<={cost_width{1'b0}};
			new_L0_18<={cost_width{1'b0}};
			new_L0_19<={cost_width{1'b0}};
			new_L0_20<={cost_width{1'b0}};
			new_L0_21<={cost_width{1'b0}};
			new_L0_22<={cost_width{1'b0}};
			new_L0_23<={cost_width{1'b0}};
			new_L0_24<={cost_width{1'b0}};
			new_L0_25<={cost_width{1'b0}};
			new_L0_26<={cost_width{1'b0}};
			new_L0_27<={cost_width{1'b0}};
			new_L0_28<={cost_width{1'b0}};
			new_L0_29<={cost_width{1'b0}};
			new_L0_30<={cost_width{1'b0}};
			new_L0_31<={cost_width{1'b0}};
			new_L0_32<={cost_width{1'b0}};
			new_L0_33<={cost_width{1'b0}};
			new_L0_34<={cost_width{1'b0}};
			new_L0_35<={cost_width{1'b0}};
			new_L0_36<={cost_width{1'b0}};
			new_L0_37<={cost_width{1'b0}};
			new_L0_38<={cost_width{1'b0}};
			new_L0_39<={cost_width{1'b0}};
			new_L0_40<={cost_width{1'b0}};
			new_L0_41<={cost_width{1'b0}};
			new_L0_42<={cost_width{1'b0}};
			new_L0_43<={cost_width{1'b0}};
			new_L0_44<={cost_width{1'b0}};
			new_L0_45<={cost_width{1'b0}};
			new_L0_46<={cost_width{1'b0}};
			new_L0_47<={cost_width{1'b0}};
			new_L0_48<={cost_width{1'b0}};
			new_L0_49<={cost_width{1'b0}};
			new_L0_50<={cost_width{1'b0}};
			new_L0_51<={cost_width{1'b0}};
			new_L0_52<={cost_width{1'b0}};
			new_L0_53<={cost_width{1'b0}};
			new_L0_54<={cost_width{1'b0}};
			new_L0_55<={cost_width{1'b0}};
			new_L0_56<={cost_width{1'b0}};
			new_L0_57<={cost_width{1'b0}};
			new_L0_58<={cost_width{1'b0}};
			new_L0_59<={cost_width{1'b0}};
			new_L0_60<={cost_width{1'b0}};
			new_L0_61<={cost_width{1'b0}};
			new_L0_62<={cost_width{1'b0}};
			new_L0_63<={cost_width{1'b0}};

			new_L135_0<={(cost_width-2){1'b0}};
			new_L135_1<={(cost_width-2){1'b0}};
			new_L135_2<={(cost_width-2){1'b0}};
			new_L135_3<={(cost_width-2){1'b0}};
			new_L135_4<={(cost_width-2){1'b0}};
			new_L135_5<={(cost_width-2){1'b0}};
			new_L135_6<={(cost_width-2){1'b0}};
			new_L135_7<={(cost_width-2){1'b0}};
			new_L135_8<={(cost_width-2){1'b0}};
			new_L135_9<={(cost_width-2){1'b0}};
			new_L135_10<={(cost_width-2){1'b0}};
			new_L135_11<={(cost_width-2){1'b0}};
			new_L135_12<={(cost_width-2){1'b0}};
			new_L135_13<={(cost_width-2){1'b0}};
			new_L135_14<={(cost_width-2){1'b0}};
			new_L135_15<={(cost_width-2){1'b0}};
			new_L135_16<={(cost_width-2){1'b0}};
			new_L135_17<={(cost_width-2){1'b0}};
			new_L135_18<={(cost_width-2){1'b0}};
			new_L135_19<={(cost_width-2){1'b0}};
			new_L135_20<={(cost_width-2){1'b0}};
			new_L135_21<={(cost_width-2){1'b0}};
			new_L135_22<={(cost_width-2){1'b0}};
			new_L135_23<={(cost_width-2){1'b0}};
			new_L135_24<={(cost_width-2){1'b0}};
			new_L135_25<={(cost_width-2){1'b0}};
			new_L135_26<={(cost_width-2){1'b0}};
			new_L135_27<={(cost_width-2){1'b0}};
			new_L135_28<={(cost_width-2){1'b0}};
			new_L135_29<={(cost_width-2){1'b0}};
			new_L135_30<={(cost_width-2){1'b0}};
			new_L135_31<={(cost_width-2){1'b0}};
			new_L135_32<={(cost_width-2){1'b0}};
			new_L135_33<={(cost_width-2){1'b0}};
			new_L135_34<={(cost_width-2){1'b0}};
			new_L135_35<={(cost_width-2){1'b0}};
			new_L135_36<={(cost_width-2){1'b0}};
			new_L135_37<={(cost_width-2){1'b0}};
			new_L135_38<={(cost_width-2){1'b0}};
			new_L135_39<={(cost_width-2){1'b0}};
			new_L135_40<={(cost_width-2){1'b0}};
			new_L135_41<={(cost_width-2){1'b0}};
			new_L135_42<={(cost_width-2){1'b0}};
			new_L135_43<={(cost_width-2){1'b0}};
			new_L135_44<={(cost_width-2){1'b0}};
			new_L135_45<={(cost_width-2){1'b0}};
			new_L135_46<={(cost_width-2){1'b0}};
			new_L135_47<={(cost_width-2){1'b0}};
			new_L135_48<={(cost_width-2){1'b0}};
			new_L135_49<={(cost_width-2){1'b0}};
			new_L135_50<={(cost_width-2){1'b0}};
			new_L135_51<={(cost_width-2){1'b0}};
			new_L135_52<={(cost_width-2){1'b0}};
			new_L135_53<={(cost_width-2){1'b0}};
			new_L135_54<={(cost_width-2){1'b0}};
			new_L135_55<={(cost_width-2){1'b0}};
			new_L135_56<={(cost_width-2){1'b0}};
			new_L135_57<={(cost_width-2){1'b0}};
			new_L135_58<={(cost_width-2){1'b0}};
			new_L135_59<={(cost_width-2){1'b0}};
			new_L135_60<={(cost_width-2){1'b0}};
			new_L135_61<={(cost_width-2){1'b0}};
			new_L135_62<={(cost_width-2){1'b0}};
			new_L135_63<={(cost_width-2){1'b0}};
		end
		else if(en_agg3==1)begin
			en_disp<=1;
			if(en_first==1)begin
				new_L0_0<=L0_0;
				new_L0_1<=L0_1;
				new_L0_2<=L0_2;
				new_L0_3<=L0_3;
				new_L0_4<=L0_4;
				new_L0_5<=L0_5;
				new_L0_6<=L0_6;
				new_L0_7<=L0_7;
				new_L0_8<=L0_8;
				new_L0_9<=L0_9;
				new_L0_10<=L0_10;
				new_L0_11<=L0_11;
				new_L0_12<=L0_12;
				new_L0_13<=L0_13;
				new_L0_14<=L0_14;
				new_L0_15<=L0_15;
				new_L0_16<=L0_16;
				new_L0_17<=L0_17;
				new_L0_18<=L0_18;
				new_L0_19<=L0_19;
				new_L0_20<=L0_20;
				new_L0_21<=L0_21;
				new_L0_22<=L0_22;
				new_L0_23<=L0_23;
				new_L0_24<=L0_24;
				new_L0_25<=L0_25;
				new_L0_26<=L0_26;
				new_L0_27<=L0_27;
				new_L0_28<=L0_28;
				new_L0_29<=L0_29;
				new_L0_30<=L0_30;
				new_L0_31<=L0_31;
				new_L0_32<=L0_32;
				new_L0_33<=L0_33;
				new_L0_34<=L0_34;
				new_L0_35<=L0_35;
				new_L0_36<=L0_36;
				new_L0_37<=L0_37;
				new_L0_38<=L0_38;
				new_L0_39<=L0_39;
				new_L0_40<=L0_40;
				new_L0_41<=L0_41;
				new_L0_42<=L0_42;
				new_L0_43<=L0_43;
				new_L0_44<=L0_44;
				new_L0_45<=L0_45;
				new_L0_46<=L0_46;
				new_L0_47<=L0_47;
				new_L0_48<=L0_48;
				new_L0_49<=L0_49;
				new_L0_50<=L0_50;
				new_L0_51<=L0_51;
				new_L0_52<=L0_52;
				new_L0_53<=L0_53;
				new_L0_54<=L0_54;
				new_L0_55<=L0_55;
				new_L0_56<=L0_56;
				new_L0_57<=L0_57;
				new_L0_58<=L0_58;
				new_L0_59<=L0_59;
				new_L0_60<=L0_60;
				new_L0_61<=L0_61;
				new_L0_62<=L0_62;
				new_L0_63<=L0_63;

				new_L135_0<=L135_0;
				new_L135_1<=L135_1;
				new_L135_2<=L135_2;
				new_L135_3<=L135_3;
				new_L135_4<=L135_4;
				new_L135_5<=L135_5;
				new_L135_6<=L135_6;
				new_L135_7<=L135_7;
				new_L135_8<=L135_8;
				new_L135_9<=L135_9;
				new_L135_10<=L135_10;
				new_L135_11<=L135_11;
				new_L135_12<=L135_12;
				new_L135_13<=L135_13;
				new_L135_14<=L135_14;
				new_L135_15<=L135_15;
				new_L135_16<=L135_16;
				new_L135_17<=L135_17;
				new_L135_18<=L135_18;
				new_L135_19<=L135_19;
				new_L135_20<=L135_20;
				new_L135_21<=L135_21;
				new_L135_22<=L135_22;
				new_L135_23<=L135_23;
				new_L135_24<=L135_24;
				new_L135_25<=L135_25;
				new_L135_26<=L135_26;
				new_L135_27<=L135_27;
				new_L135_28<=L135_28;
				new_L135_29<=L135_29;
				new_L135_30<=L135_30;
				new_L135_31<=L135_31;
				new_L135_32<=L135_32;
				new_L135_33<=L135_33;
				new_L135_34<=L135_34;
				new_L135_35<=L135_35;
				new_L135_36<=L135_36;
				new_L135_37<=L135_37;
				new_L135_38<=L135_38;
				new_L135_39<=L135_39;
				new_L135_40<=L135_40;
				new_L135_41<=L135_41;
				new_L135_42<=L135_42;
				new_L135_43<=L135_43;
				new_L135_44<=L135_44;
				new_L135_45<=L135_45;
				new_L135_46<=L135_46;
				new_L135_47<=L135_47;
				new_L135_48<=L135_48;
				new_L135_49<=L135_49;
				new_L135_50<=L135_50;
				new_L135_51<=L135_51;
				new_L135_52<=L135_52;
				new_L135_53<=L135_53;
				new_L135_54<=L135_54;
				new_L135_55<=L135_55;
				new_L135_56<=L135_56;
				new_L135_57<=L135_57;
				new_L135_58<=L135_58;
				new_L135_59<=L135_59;
				new_L135_60<=L135_60;
				new_L135_61<=L135_61;
				new_L135_62<=L135_62;
				new_L135_63<=L135_63;
			end
			else begin
				new_L0_0<=L0_0;
				new_L0_1<=L0_1;
				new_L0_2<=L0_2;
				new_L0_3<=L0_3;
				new_L0_4<=L0_4;
				new_L0_5<=L0_5;
				new_L0_6<=L0_6;
				new_L0_7<=L0_7;
				new_L0_8<=L0_8;
				new_L0_9<=L0_9;
				new_L0_10<=L0_10;
				new_L0_11<=L0_11;
				new_L0_12<=L0_12;
				new_L0_13<=L0_13;
				new_L0_14<=L0_14;
				new_L0_15<=L0_15;
				new_L0_16<=L0_16;
				new_L0_17<=L0_17;
				new_L0_18<=L0_18;
				new_L0_19<=L0_19;
				new_L0_20<=L0_20;
				new_L0_21<=L0_21;
				new_L0_22<=L0_22;
				new_L0_23<=L0_23;
				new_L0_24<=L0_24;
				new_L0_25<=L0_25;
				new_L0_26<=L0_26;
				new_L0_27<=L0_27;
				new_L0_28<=L0_28;
				new_L0_29<=L0_29;
				new_L0_30<=L0_30;
				new_L0_31<=L0_31;
				new_L0_32<=L0_32;
				new_L0_33<=L0_33;
				new_L0_34<=L0_34;
				new_L0_35<=L0_35;
				new_L0_36<=L0_36;
				new_L0_37<=L0_37;
				new_L0_38<=L0_38;
				new_L0_39<=L0_39;
				new_L0_40<=L0_40;
				new_L0_41<=L0_41;
				new_L0_42<=L0_42;
				new_L0_43<=L0_43;
				new_L0_44<=L0_44;
				new_L0_45<=L0_45;
				new_L0_46<=L0_46;
				new_L0_47<=L0_47;
				new_L0_48<=L0_48;
				new_L0_49<=L0_49;
				new_L0_50<=L0_50;
				new_L0_51<=L0_51;
				new_L0_52<=L0_52;
				new_L0_53<=L0_53;
				new_L0_54<=L0_54;
				new_L0_55<=L0_55;
				new_L0_56<=L0_56;
				new_L0_57<=L0_57;
				new_L0_58<=L0_58;
				new_L0_59<=L0_59;
				new_L0_60<=L0_60;
				new_L0_61<=L0_61;
				new_L0_62<=L0_62;
				new_L0_63<=L0_63;

				new_L135_0<=L135_0+Lmin0;
				new_L135_1<=L135_1+Lmin1;
				new_L135_2<=L135_2+Lmin2;
				new_L135_3<=L135_3+Lmin3;
				new_L135_4<=L135_4+Lmin4;
				new_L135_5<=L135_5+Lmin5;
				new_L135_6<=L135_6+Lmin6;
				new_L135_7<=L135_7+Lmin7;
				new_L135_8<=L135_8+Lmin8;
				new_L135_9<=L135_9+Lmin9;
				new_L135_10<=L135_10+Lmin10;
				new_L135_11<=L135_11+Lmin11;
				new_L135_12<=L135_12+Lmin12;
				new_L135_13<=L135_13+Lmin13;
				new_L135_14<=L135_14+Lmin14;
				new_L135_15<=L135_15+Lmin15;
				new_L135_16<=L135_16+Lmin16;
				new_L135_17<=L135_17+Lmin17;
				new_L135_18<=L135_18+Lmin18;
				new_L135_19<=L135_19+Lmin19;
				new_L135_20<=L135_20+Lmin20;
				new_L135_21<=L135_21+Lmin21;
				new_L135_22<=L135_22+Lmin22;
				new_L135_23<=L135_23+Lmin23;
				new_L135_24<=L135_24+Lmin24;
				new_L135_25<=L135_25+Lmin25;
				new_L135_26<=L135_26+Lmin26;
				new_L135_27<=L135_27+Lmin27;
				new_L135_28<=L135_28+Lmin28;
				new_L135_29<=L135_29+Lmin29;
				new_L135_30<=L135_30+Lmin30;
				new_L135_31<=L135_31+Lmin31;
				new_L135_32<=L135_32+Lmin32;
				new_L135_33<=L135_33+Lmin33;
				new_L135_34<=L135_34+Lmin34;
				new_L135_35<=L135_35+Lmin35;
				new_L135_36<=L135_36+Lmin36;
				new_L135_37<=L135_37+Lmin37;
				new_L135_38<=L135_38+Lmin38;
				new_L135_39<=L135_39+Lmin39;
				new_L135_40<=L135_40+Lmin40;
				new_L135_41<=L135_41+Lmin41;
				new_L135_42<=L135_42+Lmin42;
				new_L135_43<=L135_43+Lmin43;
				new_L135_44<=L135_44+Lmin44;
				new_L135_45<=L135_45+Lmin45;
				new_L135_46<=L135_46+Lmin46;
				new_L135_47<=L135_47+Lmin47;
				new_L135_48<=L135_48+Lmin48;
				new_L135_49<=L135_49+Lmin49;
				new_L135_50<=L135_50+Lmin50;
				new_L135_51<=L135_51+Lmin51;
				new_L135_52<=L135_52+Lmin52;
				new_L135_53<=L135_53+Lmin53;
				new_L135_54<=L135_54+Lmin54;
				new_L135_55<=L135_55+Lmin55;
				new_L135_56<=L135_56+Lmin56;
				new_L135_57<=L135_57+Lmin57;
				new_L135_58<=L135_58+Lmin58;
				new_L135_59<=L135_59+Lmin59;
				new_L135_60<=L135_60+Lmin60;
				new_L135_61<=L135_61+Lmin61;	
				new_L135_62<=L135_62+Lmin62;
				new_L135_63<=L135_63+Lmin63;	
			end
		end
	end
	end
endmodule 
