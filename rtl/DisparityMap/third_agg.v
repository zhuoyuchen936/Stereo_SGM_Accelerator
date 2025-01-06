//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 2020/05/25 23:09:53
// Uptade Date: 2020/07/19 10:24:10
// Design Name: DongPingcheng
// Module Name: third_agg
// Project Name: SGM
// 
//////////////////////////////////////////////////////////////////////////////////	
module third_agg(
	clk,
	rst,
	clken,
	//input en,
	change,
	valid_2,
	valid_3,
	cost0_0,
	cost0_1,
	cost0_2,
	cost0_3,
	cost0_4,
	cost0_5,
	cost0_6,
	cost0_7,
	cost0_8,
	cost0_9,
	cost0_10,
	cost0_11,
	cost0_12,
	cost0_13,
	cost0_14,
	cost0_15,
	cost0_16,
	cost0_17,
	cost0_18,
	cost0_19,
	cost0_20,
	cost0_21,
	cost0_22,
	cost0_23,
	cost0_24,
	cost0_25,
	cost0_26,
	cost0_27,
	cost0_28,
	cost0_29,
	cost0_30,
	cost0_31,

	cost0_32,
	cost0_33,
	cost0_34,
	cost0_35,
	cost0_36,
	cost0_37,
	cost0_38,
	cost0_39,
	cost0_40,
	cost0_41,
	cost0_42,
	cost0_43,
	cost0_44,
	cost0_45,
	cost0_46,
	cost0_47,
	cost0_48,
	cost0_49,
	cost0_50,
	cost0_51,
	cost0_52,
	cost0_53,
	cost0_54,
	cost0_55,
	cost0_56,
	cost0_57,
	cost0_58,
	cost0_59,
	cost0_60,
	cost0_61,
	cost0_62,
	cost0_63,
	

	cost135_0,
	cost135_1,
	cost135_2,
	cost135_3,
	cost135_4,
	cost135_5,
	cost135_6,
	cost135_7,
	cost135_8,
	cost135_9,
	cost135_10,
	cost135_11,
	cost135_12,
	cost135_13,
	cost135_14,
	cost135_15,
	cost135_16,
	cost135_17,
	cost135_18,
	cost135_19,
	cost135_20,
	cost135_21,
	cost135_22,
	cost135_23,
	cost135_24,
	cost135_25,
	cost135_26,
	cost135_27,
	cost135_28,
	cost135_29,
	cost135_30,
	cost135_31,

	cost135_32,
	cost135_33,
	cost135_34,
	cost135_35,
	cost135_36,
	cost135_37,
	cost135_38,
	cost135_39,
	cost135_40,
	cost135_41,
	cost135_42,
	cost135_43,
	cost135_44,
	cost135_45,
	cost135_46,
	cost135_47,
	cost135_48,
	cost135_49,
	cost135_50,
	cost135_51,
	cost135_52,
	cost135_53,
	cost135_54,
	cost135_55,
	cost135_56,
	cost135_57,
	cost135_58,
	cost135_59,
	cost135_60,
	cost135_61,
	cost135_62,
	cost135_63,
	
	agg3_0_0,
	agg3_0_1,
	agg3_0_2,
	agg3_0_3,
	agg3_0_4,
	agg3_0_5,
	agg3_0_6,
	agg3_0_7,
	agg3_0_8,
	agg3_0_9,
	agg3_0_10,
	agg3_0_11,
	agg3_0_12,
	agg3_0_13,
	agg3_0_14,
	agg3_0_15,
	agg3_0_16,
	agg3_0_17,
	agg3_0_18,
	agg3_0_19,
	agg3_0_20,
	agg3_0_21,
	agg3_0_22,
	agg3_0_23,
	agg3_0_24,
	agg3_0_25,
	agg3_0_26,
	agg3_0_27,
	agg3_0_28,
	agg3_0_29,
	agg3_0_30,
	agg3_0_31,
	agg3_0_32,
	agg3_0_33,
	agg3_0_34,
	agg3_0_35,
	agg3_0_36,
	agg3_0_37,
	agg3_0_38,
	agg3_0_39,
	agg3_0_40,
	agg3_0_41,
	agg3_0_42,
	agg3_0_43,
	agg3_0_44,
	agg3_0_45,
	agg3_0_46,
	agg3_0_47,
	agg3_0_48,
	agg3_0_49,
	agg3_0_50,
	agg3_0_51,
	agg3_0_52,
	agg3_0_53,
	agg3_0_54,
	agg3_0_55,
	agg3_0_56,
	agg3_0_57,
	agg3_0_58,
	agg3_0_59,
	agg3_0_60,
	agg3_0_61,
	agg3_0_62,
	agg3_0_63,	

	agg3_135_0,
	agg3_135_1,
	agg3_135_2,
	agg3_135_3,
	agg3_135_4,
	agg3_135_5,
	agg3_135_6,
	agg3_135_7,
	agg3_135_8,
	agg3_135_9,
	agg3_135_10,
	agg3_135_11,
	agg3_135_12,
	agg3_135_13,
	agg3_135_14,
	agg3_135_15,
	agg3_135_16,
	agg3_135_17,
	agg3_135_18,
	agg3_135_19,
	agg3_135_20,
	agg3_135_21,
	agg3_135_22,
	agg3_135_23,
	agg3_135_24,
	agg3_135_25,
	agg3_135_26,
	agg3_135_27,
	agg3_135_28,
	agg3_135_29,
	agg3_135_30,
	agg3_135_31,
	agg3_135_32,
	agg3_135_33,
	agg3_135_34,
	agg3_135_35,
	agg3_135_36,
	agg3_135_37,
	agg3_135_38,
	agg3_135_39,
	agg3_135_40,
	agg3_135_41,
	agg3_135_42,
	agg3_135_43,
	agg3_135_44,
	agg3_135_45,
	agg3_135_46,
	agg3_135_47,
	agg3_135_48,
	agg3_135_49,
	agg3_135_50,
	agg3_135_51,
	agg3_135_52,
	agg3_135_53,
	agg3_135_54,
	agg3_135_55,
	agg3_135_56,
	agg3_135_57,
	agg3_135_58,
	agg3_135_59,
	agg3_135_60,
	agg3_135_61,
	agg3_135_62,
	agg3_135_63,		
	//output reg en0,
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
	L135_63
);
parameter cost_width=9;

input clk;
input rst;
input clken;
input change;
input valid_2;
output reg valid_3;

input [cost_width-1:0] cost0_0;
input [cost_width-1:0] cost0_1;
input [cost_width-1:0] cost0_2;
input [cost_width-1:0] cost0_3;
input [cost_width-1:0] cost0_4;
input [cost_width-1:0] cost0_5;
input [cost_width-1:0] cost0_6;
input [cost_width-1:0] cost0_7;
input [cost_width-1:0] cost0_8;
input [cost_width-1:0] cost0_9;
input [cost_width-1:0] cost0_10;
input [cost_width-1:0] cost0_11;
input [cost_width-1:0] cost0_12;
input [cost_width-1:0] cost0_13;
input [cost_width-1:0] cost0_14;
input [cost_width-1:0] cost0_15;
input [cost_width-1:0] cost0_16;
input [cost_width-1:0] cost0_17;
input [cost_width-1:0] cost0_18;
input [cost_width-1:0] cost0_19;
input [cost_width-1:0] cost0_20;
input [cost_width-1:0] cost0_21;
input [cost_width-1:0] cost0_22;
input [cost_width-1:0] cost0_23;
input [cost_width-1:0] cost0_24;
input [cost_width-1:0] cost0_25;
input [cost_width-1:0] cost0_26;
input [cost_width-1:0] cost0_27;
input [cost_width-1:0] cost0_28;
input [cost_width-1:0] cost0_29;
input [cost_width-1:0] cost0_30;
input [cost_width-1:0] cost0_31;

input [cost_width-1:0] cost0_32;
input [cost_width-1:0] cost0_33;
input [cost_width-1:0] cost0_34;
input [cost_width-1:0] cost0_35;
input [cost_width-1:0] cost0_36;
input [cost_width-1:0] cost0_37;
input [cost_width-1:0] cost0_38;
input [cost_width-1:0] cost0_39;
input [cost_width-1:0] cost0_40;
input [cost_width-1:0] cost0_41;
input [cost_width-1:0] cost0_42;
input [cost_width-1:0] cost0_43;
input [cost_width-1:0] cost0_44;
input [cost_width-1:0] cost0_45;
input [cost_width-1:0] cost0_46;
input [cost_width-1:0] cost0_47;
input [cost_width-1:0] cost0_48;
input [cost_width-1:0] cost0_49;
input [cost_width-1:0] cost0_50;
input [cost_width-1:0] cost0_51;
input [cost_width-1:0] cost0_52;
input [cost_width-1:0] cost0_53;
input [cost_width-1:0] cost0_54;
input [cost_width-1:0] cost0_55;
input [cost_width-1:0] cost0_56;
input [cost_width-1:0] cost0_57;
input [cost_width-1:0] cost0_58;
input [cost_width-1:0] cost0_59;
input [cost_width-1:0] cost0_60;
input [cost_width-1:0] cost0_61;
input [cost_width-1:0] cost0_62;
input [cost_width-1:0] cost0_63;


input [cost_width-3:0] cost135_0;
input [cost_width-3:0] cost135_1;
input [cost_width-3:0] cost135_2;
input [cost_width-3:0] cost135_3;
input [cost_width-3:0] cost135_4;
input [cost_width-3:0] cost135_5;
input [cost_width-3:0] cost135_6;
input [cost_width-3:0] cost135_7;
input [cost_width-3:0] cost135_8;
input [cost_width-3:0] cost135_9;
input [cost_width-3:0] cost135_10;
input [cost_width-3:0] cost135_11;
input [cost_width-3:0] cost135_12;
input [cost_width-3:0] cost135_13;
input [cost_width-3:0] cost135_14;
input [cost_width-3:0] cost135_15;
input [cost_width-3:0] cost135_16;
input [cost_width-3:0] cost135_17;
input [cost_width-3:0] cost135_18;
input [cost_width-3:0] cost135_19;
input [cost_width-3:0] cost135_20;
input [cost_width-3:0] cost135_21;
input [cost_width-3:0] cost135_22;
input [cost_width-3:0] cost135_23;
input [cost_width-3:0] cost135_24;
input [cost_width-3:0] cost135_25;
input [cost_width-3:0] cost135_26;
input [cost_width-3:0] cost135_27;
input [cost_width-3:0] cost135_28;
input [cost_width-3:0] cost135_29;
input [cost_width-3:0] cost135_30;
input [cost_width-3:0] cost135_31;

input [cost_width-3:0] cost135_32;
input [cost_width-3:0] cost135_33;
input [cost_width-3:0] cost135_34;
input [cost_width-3:0] cost135_35;
input [cost_width-3:0] cost135_36;
input [cost_width-3:0] cost135_37;
input [cost_width-3:0] cost135_38;
input [cost_width-3:0] cost135_39;
input [cost_width-3:0] cost135_40;
input [cost_width-3:0] cost135_41;
input [cost_width-3:0] cost135_42;
input [cost_width-3:0] cost135_43;
input [cost_width-3:0] cost135_44;
input [cost_width-3:0] cost135_45;
input [cost_width-3:0] cost135_46;
input [cost_width-3:0] cost135_47;
input [cost_width-3:0] cost135_48;
input [cost_width-3:0] cost135_49;
input [cost_width-3:0] cost135_50;
input [cost_width-3:0] cost135_51;
input [cost_width-3:0] cost135_52;
input [cost_width-3:0] cost135_53;
input [cost_width-3:0] cost135_54;
input [cost_width-3:0] cost135_55;
input [cost_width-3:0] cost135_56;
input [cost_width-3:0] cost135_57;
input [cost_width-3:0] cost135_58;
input [cost_width-3:0] cost135_59;
input [cost_width-3:0] cost135_60;
input [cost_width-3:0] cost135_61;
input [cost_width-3:0] cost135_62;
input [cost_width-3:0] cost135_63;

input [cost_width-1:0] agg3_0_0;
input [cost_width-1:0] agg3_0_1;
input [cost_width-1:0] agg3_0_2;
input [cost_width-1:0] agg3_0_3;
input [cost_width-1:0] agg3_0_4;
input [cost_width-1:0] agg3_0_5;
input [cost_width-1:0] agg3_0_6;
input [cost_width-1:0] agg3_0_7;
input [cost_width-1:0] agg3_0_8;
input [cost_width-1:0] agg3_0_9;
input [cost_width-1:0] agg3_0_10;
input [cost_width-1:0] agg3_0_11;
input [cost_width-1:0] agg3_0_12;
input [cost_width-1:0] agg3_0_13;
input [cost_width-1:0] agg3_0_14;
input [cost_width-1:0] agg3_0_15;
input [cost_width-1:0] agg3_0_16;
input [cost_width-1:0] agg3_0_17;
input [cost_width-1:0] agg3_0_18;
input [cost_width-1:0] agg3_0_19;
input [cost_width-1:0] agg3_0_20;
input [cost_width-1:0] agg3_0_21;
input [cost_width-1:0] agg3_0_22;
input [cost_width-1:0] agg3_0_23;
input [cost_width-1:0] agg3_0_24;
input [cost_width-1:0] agg3_0_25;
input [cost_width-1:0] agg3_0_26;
input [cost_width-1:0] agg3_0_27;
input [cost_width-1:0] agg3_0_28;
input [cost_width-1:0] agg3_0_29;
input [cost_width-1:0] agg3_0_30;
input [cost_width-1:0] agg3_0_31;
input [cost_width-1:0] agg3_0_32;
input [cost_width-1:0] agg3_0_33;
input [cost_width-1:0] agg3_0_34;
input [cost_width-1:0] agg3_0_35;
input [cost_width-1:0] agg3_0_36;
input [cost_width-1:0] agg3_0_37;
input [cost_width-1:0] agg3_0_38;
input [cost_width-1:0] agg3_0_39;
input [cost_width-1:0] agg3_0_40;
input [cost_width-1:0] agg3_0_41;
input [cost_width-1:0] agg3_0_42;
input [cost_width-1:0] agg3_0_43;
input [cost_width-1:0] agg3_0_44;
input [cost_width-1:0] agg3_0_45;
input [cost_width-1:0] agg3_0_46;
input [cost_width-1:0] agg3_0_47;
input [cost_width-1:0] agg3_0_48;
input [cost_width-1:0] agg3_0_49;
input [cost_width-1:0] agg3_0_50;
input [cost_width-1:0] agg3_0_51;
input [cost_width-1:0] agg3_0_52;
input [cost_width-1:0] agg3_0_53;
input [cost_width-1:0] agg3_0_54;
input [cost_width-1:0] agg3_0_55;
input [cost_width-1:0] agg3_0_56;
input [cost_width-1:0] agg3_0_57;
input [cost_width-1:0] agg3_0_58;
input [cost_width-1:0] agg3_0_59;
input [cost_width-1:0] agg3_0_60;
input [cost_width-1:0] agg3_0_61;
input [cost_width-1:0] agg3_0_62;
input [cost_width-1:0] agg3_0_63;

input [cost_width-3:0] agg3_135_0;
input [cost_width-3:0] agg3_135_1;
input [cost_width-3:0] agg3_135_2;
input [cost_width-3:0] agg3_135_3;
input [cost_width-3:0] agg3_135_4;
input [cost_width-3:0] agg3_135_5;
input [cost_width-3:0] agg3_135_6;
input [cost_width-3:0] agg3_135_7;
input [cost_width-3:0] agg3_135_8;
input [cost_width-3:0] agg3_135_9;
input [cost_width-3:0] agg3_135_10;
input [cost_width-3:0] agg3_135_11;
input [cost_width-3:0] agg3_135_12;
input [cost_width-3:0] agg3_135_13;
input [cost_width-3:0] agg3_135_14;
input [cost_width-3:0] agg3_135_15;
input [cost_width-3:0] agg3_135_16;
input [cost_width-3:0] agg3_135_17;
input [cost_width-3:0] agg3_135_18;
input [cost_width-3:0] agg3_135_19;
input [cost_width-3:0] agg3_135_20;
input [cost_width-3:0] agg3_135_21;
input [cost_width-3:0] agg3_135_22;
input [cost_width-3:0] agg3_135_23;
input [cost_width-3:0] agg3_135_24;
input [cost_width-3:0] agg3_135_25;
input [cost_width-3:0] agg3_135_26;
input [cost_width-3:0] agg3_135_27;
input [cost_width-3:0] agg3_135_28;
input [cost_width-3:0] agg3_135_29;
input [cost_width-3:0] agg3_135_30;
input [cost_width-3:0] agg3_135_31;
input [cost_width-3:0] agg3_135_32;
input [cost_width-3:0] agg3_135_33;
input [cost_width-3:0] agg3_135_34;
input [cost_width-3:0] agg3_135_35;
input [cost_width-3:0] agg3_135_36;
input [cost_width-3:0] agg3_135_37;
input [cost_width-3:0] agg3_135_38;
input [cost_width-3:0] agg3_135_39;
input [cost_width-3:0] agg3_135_40;
input [cost_width-3:0] agg3_135_41;
input [cost_width-3:0] agg3_135_42;
input [cost_width-3:0] agg3_135_43;
input [cost_width-3:0] agg3_135_44;
input [cost_width-3:0] agg3_135_45;
input [cost_width-3:0] agg3_135_46;
input [cost_width-3:0] agg3_135_47;
input [cost_width-3:0] agg3_135_48;
input [cost_width-3:0] agg3_135_49;
input [cost_width-3:0] agg3_135_50;
input [cost_width-3:0] agg3_135_51;
input [cost_width-3:0] agg3_135_52;
input [cost_width-3:0] agg3_135_53;
input [cost_width-3:0] agg3_135_54;
input [cost_width-3:0] agg3_135_55;
input [cost_width-3:0] agg3_135_56;
input [cost_width-3:0] agg3_135_57;
input [cost_width-3:0] agg3_135_58;
input [cost_width-3:0] agg3_135_59;
input [cost_width-3:0] agg3_135_60;
input [cost_width-3:0] agg3_135_61;
input [cost_width-3:0] agg3_135_62;
input [cost_width-3:0] agg3_135_63;

output reg [cost_width-1:0] L0_0;
output reg [cost_width-1:0] L0_1;
output reg [cost_width-1:0] L0_2;
output reg [cost_width-1:0] L0_3;
output reg [cost_width-1:0] L0_4;
output reg [cost_width-1:0] L0_5;
output reg [cost_width-1:0] L0_6;
output reg [cost_width-1:0] L0_7;
output reg [cost_width-1:0] L0_8;
output reg [cost_width-1:0] L0_9;
output reg [cost_width-1:0] L0_10;
output reg [cost_width-1:0] L0_11;
output reg [cost_width-1:0] L0_12;
output reg [cost_width-1:0] L0_13;
output reg [cost_width-1:0] L0_14;
output reg [cost_width-1:0] L0_15;
output reg [cost_width-1:0] L0_16;
output reg [cost_width-1:0] L0_17;
output reg [cost_width-1:0] L0_18;
output reg [cost_width-1:0] L0_19;
output reg [cost_width-1:0] L0_20;
output reg [cost_width-1:0] L0_21;
output reg [cost_width-1:0] L0_22;
output reg [cost_width-1:0] L0_23;
output reg [cost_width-1:0] L0_24;
output reg [cost_width-1:0] L0_25;
output reg [cost_width-1:0] L0_26;
output reg [cost_width-1:0] L0_27;
output reg [cost_width-1:0] L0_28;
output reg [cost_width-1:0] L0_29;
output reg [cost_width-1:0] L0_30;
output reg [cost_width-1:0] L0_31;

output reg [cost_width-1:0] L0_32;
output reg [cost_width-1:0] L0_33;
output reg [cost_width-1:0] L0_34;
output reg [cost_width-1:0] L0_35;
output reg [cost_width-1:0] L0_36;
output reg [cost_width-1:0] L0_37;
output reg [cost_width-1:0] L0_38;
output reg [cost_width-1:0] L0_39;
output reg [cost_width-1:0] L0_40;
output reg [cost_width-1:0] L0_41;
output reg [cost_width-1:0] L0_42;
output reg [cost_width-1:0] L0_43;
output reg [cost_width-1:0] L0_44;
output reg [cost_width-1:0] L0_45;
output reg [cost_width-1:0] L0_46;
output reg [cost_width-1:0] L0_47;
output reg [cost_width-1:0] L0_48;
output reg [cost_width-1:0] L0_49;
output reg [cost_width-1:0] L0_50;
output reg [cost_width-1:0] L0_51;
output reg [cost_width-1:0] L0_52;
output reg [cost_width-1:0] L0_53;
output reg [cost_width-1:0] L0_54;
output reg [cost_width-1:0] L0_55;
output reg [cost_width-1:0] L0_56;
output reg [cost_width-1:0] L0_57;
output reg [cost_width-1:0] L0_58;
output reg [cost_width-1:0] L0_59;
output reg [cost_width-1:0] L0_60;
output reg [cost_width-1:0] L0_61;
output reg [cost_width-1:0] L0_62;
output reg [cost_width-1:0] L0_63;


output reg [cost_width-3:0]  L135_0;
output reg [cost_width-3:0]  L135_1;
output reg [cost_width-3:0]  L135_2;
output reg [cost_width-3:0]  L135_3;
output reg [cost_width-3:0]  L135_4;
output reg [cost_width-3:0]  L135_5;
output reg [cost_width-3:0]  L135_6;
output reg [cost_width-3:0]  L135_7;
output reg [cost_width-3:0]  L135_8;
output reg [cost_width-3:0]  L135_9;
output reg [cost_width-3:0]  L135_10;
output reg [cost_width-3:0]  L135_11;
output reg [cost_width-3:0]  L135_12;
output reg [cost_width-3:0]  L135_13;
output reg [cost_width-3:0]  L135_14;
output reg [cost_width-3:0]  L135_15;
output reg [cost_width-3:0]  L135_16;
output reg [cost_width-3:0]  L135_17;
output reg [cost_width-3:0]  L135_18;
output reg [cost_width-3:0]  L135_19;
output reg [cost_width-3:0]  L135_20;
output reg [cost_width-3:0]  L135_21;
output reg [cost_width-3:0]  L135_22;
output reg [cost_width-3:0]  L135_23;
output reg [cost_width-3:0]  L135_24;
output reg [cost_width-3:0]  L135_25;
output reg [cost_width-3:0]  L135_26;
output reg [cost_width-3:0]  L135_27;
output reg [cost_width-3:0]  L135_28;
output reg [cost_width-3:0]  L135_29;
output reg [cost_width-3:0]  L135_30;
output reg [cost_width-3:0]  L135_31;

output reg [cost_width-3:0] L135_32;
output reg [cost_width-3:0] L135_33;
output reg [cost_width-3:0] L135_34;
output reg [cost_width-3:0] L135_35;
output reg [cost_width-3:0] L135_36;
output reg [cost_width-3:0] L135_37;
output reg [cost_width-3:0] L135_38;
output reg [cost_width-3:0] L135_39;
output reg [cost_width-3:0] L135_40;
output reg [cost_width-3:0] L135_41;
output reg [cost_width-3:0] L135_42;
output reg [cost_width-3:0] L135_43;
output reg [cost_width-3:0] L135_44;
output reg [cost_width-3:0] L135_45;
output reg [cost_width-3:0] L135_46;
output reg [cost_width-3:0] L135_47;
output reg [cost_width-3:0] L135_48;
output reg [cost_width-3:0] L135_49;
output reg [cost_width-3:0] L135_50;
output reg [cost_width-3:0] L135_51;
output reg [cost_width-3:0] L135_52;
output reg [cost_width-3:0] L135_53;
output reg [cost_width-3:0] L135_54;
output reg [cost_width-3:0] L135_55;
output reg [cost_width-3:0] L135_56;
output reg [cost_width-3:0] L135_57;
output reg [cost_width-3:0] L135_58;
output reg [cost_width-3:0] L135_59;
output reg [cost_width-3:0] L135_60;
output reg [cost_width-3:0] L135_61;
output reg [cost_width-3:0] L135_62;
output reg [cost_width-3:0] L135_63;

	always@(posedge clk or negedge rst)begin
   		if(!rst)begin
   			valid_3<=0;
   		end
   		else begin
   		if(clken)begin
   			valid_3<=valid_2;
   		end
   		else begin
   			valid_3<=valid_3;
   		end
    end
    
    end
	always@(posedge clk or negedge rst)begin
		if(rst==0)begin
			L0_0<={cost_width{1'b0}};
			L0_1<={cost_width{1'b0}};
			L0_2<={cost_width{1'b0}};
			L0_3<={cost_width{1'b0}};
			L0_4<={cost_width{1'b0}};
			L0_5<={cost_width{1'b0}};
			L0_6<={cost_width{1'b0}};
			L0_7<={cost_width{1'b0}};
			L0_8<={cost_width{1'b0}};
			L0_9<={cost_width{1'b0}};
			L0_10<={cost_width{1'b0}};
			L0_11<={cost_width{1'b0}};
			L0_12<={cost_width{1'b0}};
			L0_13<={cost_width{1'b0}};
			L0_14<={cost_width{1'b0}};
			L0_15<={cost_width{1'b0}};
			L0_16<={cost_width{1'b0}};
			L0_17<={cost_width{1'b0}};
			L0_18<={cost_width{1'b0}};
			L0_19<={cost_width{1'b0}};
			L0_20<={cost_width{1'b0}};
			L0_21<={cost_width{1'b0}};
			L0_22<={cost_width{1'b0}};
			L0_23<={cost_width{1'b0}};
			L0_24<={cost_width{1'b0}};
			L0_25<={cost_width{1'b0}};
			L0_26<={cost_width{1'b0}};
			L0_27<={cost_width{1'b0}};
			L0_28<={cost_width{1'b0}};
			L0_29<={cost_width{1'b0}};
			L0_30<={cost_width{1'b0}};
			L0_31<={cost_width{1'b0}};

			L0_32<={(cost_width-2){1'b0}};
			L0_33<={(cost_width-2){1'b0}};
			L0_34<={(cost_width-2){1'b0}};
			L0_35<={(cost_width-2){1'b0}};
			L0_36<={(cost_width-2){1'b0}};
			L0_37<={(cost_width-2){1'b0}};
			L0_38<={(cost_width-2){1'b0}};
			L0_39<={(cost_width-2){1'b0}};
			L0_40<={(cost_width-2){1'b0}};
			L0_41<={(cost_width-2){1'b0}};
			L0_42<={(cost_width-2){1'b0}};
			L0_43<={(cost_width-2){1'b0}};
			L0_44<={(cost_width-2){1'b0}};
			L0_45<={(cost_width-2){1'b0}};
			L0_46<={(cost_width-2){1'b0}};
			L0_47<={(cost_width-2){1'b0}};
			L0_48<={(cost_width-2){1'b0}};
			L0_49<={(cost_width-2){1'b0}};
			L0_50<={(cost_width-2){1'b0}};
			L0_51<={(cost_width-2){1'b0}};
			L0_52<={(cost_width-2){1'b0}};
			L0_53<={(cost_width-2){1'b0}};
			L0_54<={(cost_width-2){1'b0}};
			L0_55<={(cost_width-2){1'b0}};
			L0_56<={(cost_width-2){1'b0}};
			L0_57<={(cost_width-2){1'b0}};
			L0_58<={(cost_width-2){1'b0}};
			L0_59<={(cost_width-2){1'b0}};
			L0_60<={(cost_width-2){1'b0}};
			L0_61<={(cost_width-2){1'b0}};
			L0_62<={(cost_width-2){1'b0}};
			L0_63<={(cost_width-2){1'b0}};
			
			L135_0<={(cost_width-2){1'b0}};
			L135_1<={(cost_width-2){1'b0}};
			L135_2<={(cost_width-2){1'b0}};
			L135_3<={(cost_width-2){1'b0}};
			L135_4<={(cost_width-2){1'b0}};
			L135_5<={(cost_width-2){1'b0}};
			L135_6<={(cost_width-2){1'b0}};
			L135_7<={(cost_width-2){1'b0}};
			L135_8<={(cost_width-2){1'b0}};
			L135_9<={(cost_width-2){1'b0}};
			L135_10<={(cost_width-2){1'b0}};
			L135_11<={(cost_width-2){1'b0}};
			L135_12<={(cost_width-2){1'b0}};
			L135_13<={(cost_width-2){1'b0}};
			L135_14<={(cost_width-2){1'b0}};
			L135_15<={(cost_width-2){1'b0}};
			L135_16<={(cost_width-2){1'b0}};
			L135_17<={(cost_width-2){1'b0}};
			L135_18<={(cost_width-2){1'b0}};
			L135_19<={(cost_width-2){1'b0}};
			L135_20<={(cost_width-2){1'b0}};
			L135_21<={(cost_width-2){1'b0}};
			L135_22<={(cost_width-2){1'b0}};
			L135_23<={(cost_width-2){1'b0}};
			L135_24<={(cost_width-2){1'b0}};
			L135_25<={(cost_width-2){1'b0}};
			L135_26<={(cost_width-2){1'b0}};
			L135_27<={(cost_width-2){1'b0}};
			L135_28<={(cost_width-2){1'b0}};
			L135_29<={(cost_width-2){1'b0}};
			L135_30<={(cost_width-2){1'b0}};
			L135_31<={(cost_width-2){1'b0}};

			L135_32<={(cost_width-2){1'b0}};
			L135_33<={(cost_width-2){1'b0}};
			L135_34<={(cost_width-2){1'b0}};
			L135_35<={(cost_width-2){1'b0}};
			L135_36<={(cost_width-2){1'b0}};
			L135_37<={(cost_width-2){1'b0}};
			L135_38<={(cost_width-2){1'b0}};
			L135_39<={(cost_width-2){1'b0}};
			L135_40<={(cost_width-2){1'b0}};
			L135_41<={(cost_width-2){1'b0}};
			L135_42<={(cost_width-2){1'b0}};
			L135_43<={(cost_width-2){1'b0}};
			L135_44<={(cost_width-2){1'b0}};
			L135_45<={(cost_width-2){1'b0}};
			L135_46<={(cost_width-2){1'b0}};
			L135_47<={(cost_width-2){1'b0}};
			L135_48<={(cost_width-2){1'b0}};
			L135_49<={(cost_width-2){1'b0}};
			L135_50<={(cost_width-2){1'b0}};
			L135_51<={(cost_width-2){1'b0}};
			L135_52<={(cost_width-2){1'b0}};
			L135_53<={(cost_width-2){1'b0}};
			L135_54<={(cost_width-2){1'b0}};
			L135_55<={(cost_width-2){1'b0}};
			L135_56<={(cost_width-2){1'b0}};
			L135_57<={(cost_width-2){1'b0}};
			L135_58<={(cost_width-2){1'b0}};
			L135_59<={(cost_width-2){1'b0}};
			L135_60<={(cost_width-2){1'b0}};
			L135_61<={(cost_width-2){1'b0}};
			L135_62<={(cost_width-2){1'b0}};
			L135_63<={(cost_width-2){1'b0}};
		end
		else if(clken)begin
			if(change==0)begin
				L0_0<=cost0_0;
				L0_1<=cost0_1;
				L0_2<=cost0_2;
				L0_3<=cost0_3;
				L0_4<=cost0_4;
				L0_5<=cost0_5;
				L0_6<=cost0_6;
				L0_7<=cost0_7;
				L0_8<=cost0_8;
				L0_9<=cost0_9;
				L0_10<=cost0_10;
				L0_11<=cost0_11;
				L0_12<=cost0_12;
				L0_13<=cost0_13;
				L0_14<=cost0_14;
				L0_15<=cost0_15;
				L0_16<=cost0_16;
				L0_17<=cost0_17;
				L0_18<=cost0_18;
				L0_19<=cost0_19;
				L0_20<=cost0_20;
				L0_21<=cost0_21;
				L0_22<=cost0_22;
				L0_23<=cost0_23;
				L0_24<=cost0_24;
				L0_25<=cost0_25;
				L0_26<=cost0_26;
				L0_27<=cost0_27;
				L0_28<=cost0_28;
				L0_29<=cost0_29;
				L0_30<=cost0_30;
				L0_31<=cost0_31;
	
				L0_32<=cost0_32;
				L0_33<=cost0_33;
				L0_34<=cost0_34;
				L0_35<=cost0_35;
				L0_36<=cost0_36;
				L0_37<=cost0_37;
				L0_38<=cost0_38;
				L0_39<=cost0_39;
				L0_40<=cost0_40;
				L0_41<=cost0_41;
				L0_42<=cost0_42;
				L0_43<=cost0_43;
				L0_44<=cost0_44;
				L0_45<=cost0_45;
				L0_46<=cost0_46;
				L0_47<=cost0_47;
				L0_48<=cost0_48;
				L0_49<=cost0_49;
				L0_50<=cost0_50;
				L0_51<=cost0_51;
				L0_52<=cost0_52;
				L0_53<=cost0_53;
				L0_54<=cost0_54;
				L0_55<=cost0_55;
				L0_56<=cost0_56;
				L0_57<=cost0_57;
				L0_58<=cost0_58;
				L0_59<=cost0_59;
				L0_60<=cost0_60;
				L0_61<=cost0_61;
				L0_62<=cost0_62;
				L0_63<=cost0_63;
	
				L135_0<=cost135_0;
				L135_1<=cost135_1;
				L135_2<=cost135_2;
				L135_3<=cost135_3;
				L135_4<=cost135_4;
				L135_5<=cost135_5;
				L135_6<=cost135_6;
				L135_7<=cost135_7;
				L135_8<=cost135_8;
				L135_9<=cost135_9;
				L135_10<=cost135_10;
				L135_11<=cost135_11;
				L135_12<=cost135_12;
				L135_13<=cost135_13;
				L135_14<=cost135_14;
				L135_15<=cost135_15;
				L135_16<=cost135_16;
				L135_17<=cost135_17;
				L135_18<=cost135_18;
				L135_19<=cost135_19;
				L135_20<=cost135_20;
				L135_21<=cost135_21;
				L135_22<=cost135_22;
				L135_23<=cost135_23;
				L135_24<=cost135_24;
				L135_25<=cost135_25;
				L135_26<=cost135_26;
				L135_27<=cost135_27;
				L135_28<=cost135_28;
				L135_29<=cost135_29;
				L135_30<=cost135_30;
				L135_31<=cost135_31;
	
				L135_32<=cost135_32;
				L135_33<=cost135_33;
				L135_34<=cost135_34;
				L135_35<=cost135_35;
				L135_36<=cost135_36;
				L135_37<=cost135_37;
				L135_38<=cost135_38;
				L135_39<=cost135_39;
				L135_40<=cost135_40;
				L135_41<=cost135_41;
				L135_42<=cost135_42;
				L135_43<=cost135_43;
				L135_44<=cost135_44;
				L135_45<=cost135_45;
				L135_46<=cost135_46;
				L135_47<=cost135_47;
				L135_48<=cost135_48;
				L135_49<=cost135_49;
				L135_50<=cost135_50;
				L135_51<=cost135_51;
				L135_52<=cost135_52;
				L135_53<=cost135_53;
				L135_54<=cost135_54;
				L135_55<=cost135_55;
				L135_56<=cost135_56;
				L135_57<=cost135_57;
				L135_58<=cost135_58;
				L135_59<=cost135_59;
				L135_60<=cost135_60;
				L135_61<=cost135_61;
				L135_62<=cost135_62;
				L135_63<=cost135_63;
			end
			else begin
				L0_0<=agg3_0_0;
				L0_1<=agg3_0_1;
				L0_2<=agg3_0_2;
				L0_3<=agg3_0_3;
				L0_4<=agg3_0_4;
				L0_5<=agg3_0_5;
				L0_6<=agg3_0_6;
				L0_7<=agg3_0_7;
				L0_8<=agg3_0_8;
				L0_9<=agg3_0_9;
				L0_10<=agg3_0_10;
				L0_11<=agg3_0_11;
				L0_12<=agg3_0_12;
				L0_13<=agg3_0_13;
				L0_14<=agg3_0_14;
				L0_15<=agg3_0_15;
				L0_16<=agg3_0_16;
				L0_17<=agg3_0_17;
				L0_18<=agg3_0_18;
				L0_19<=agg3_0_19;
				L0_20<=agg3_0_20;
				L0_21<=agg3_0_21;
				L0_22<=agg3_0_22;
				L0_23<=agg3_0_23;
				L0_24<=agg3_0_24;
				L0_25<=agg3_0_25;
				L0_26<=agg3_0_26;
				L0_27<=agg3_0_27;
				L0_28<=agg3_0_28;
				L0_29<=agg3_0_29;
				L0_30<=agg3_0_30;
				L0_31<=agg3_0_31;
				L0_32<=agg3_0_32;
				L0_33<=agg3_0_33;
				L0_34<=agg3_0_34;
				L0_35<=agg3_0_35;
				L0_36<=agg3_0_36;
				L0_37<=agg3_0_37;
				L0_38<=agg3_0_38;
				L0_39<=agg3_0_39;
				L0_40<=agg3_0_40;
				L0_41<=agg3_0_41;
				L0_42<=agg3_0_42;
				L0_43<=agg3_0_43;
				L0_44<=agg3_0_44;
				L0_45<=agg3_0_45;
				L0_46<=agg3_0_46;
				L0_47<=agg3_0_47;
				L0_48<=agg3_0_48;
				L0_49<=agg3_0_49;
				L0_50<=agg3_0_50;
				L0_51<=agg3_0_51;
				L0_52<=agg3_0_52;
				L0_53<=agg3_0_53;
				L0_54<=agg3_0_54;
				L0_55<=agg3_0_55;
				L0_56<=agg3_0_56;
				L0_57<=agg3_0_57;
				L0_58<=agg3_0_58;
				L0_59<=agg3_0_59;
				L0_60<=agg3_0_60;
				L0_61<=agg3_0_61;
				L0_62<=agg3_0_62;
				L0_63<=agg3_0_63;

				L135_0<=agg3_135_0;
				L135_1<=agg3_135_1;
				L135_2<=agg3_135_2;
				L135_3<=agg3_135_3;
				L135_4<=agg3_135_4;
				L135_5<=agg3_135_5;
				L135_6<=agg3_135_6;
				L135_7<=agg3_135_7;
				L135_8<=agg3_135_8;
				L135_9<=agg3_135_9;
				L135_10<=agg3_135_10;
				L135_11<=agg3_135_11;
				L135_12<=agg3_135_12;
				L135_13<=agg3_135_13;
				L135_14<=agg3_135_14;
				L135_15<=agg3_135_15;
				L135_16<=agg3_135_16;
				L135_17<=agg3_135_17;
				L135_18<=agg3_135_18;
				L135_19<=agg3_135_19;
				L135_20<=agg3_135_20;
				L135_21<=agg3_135_21;
				L135_22<=agg3_135_22;
				L135_23<=agg3_135_23;
				L135_24<=agg3_135_24;
				L135_25<=agg3_135_25;
				L135_26<=agg3_135_26;
				L135_27<=agg3_135_27;
				L135_28<=agg3_135_28;
				L135_29<=agg3_135_29;
				L135_30<=agg3_135_30;
				L135_31<=agg3_135_31;
				L135_32<=agg3_135_32;
				L135_33<=agg3_135_33;
				L135_34<=agg3_135_34;
				L135_35<=agg3_135_35;
				L135_36<=agg3_135_36;
				L135_37<=agg3_135_37;
				L135_38<=agg3_135_38;
				L135_39<=agg3_135_39;
				L135_40<=agg3_135_40;
				L135_41<=agg3_135_41;
				L135_42<=agg3_135_42;
				L135_43<=agg3_135_43;
				L135_44<=agg3_135_44;
				L135_45<=agg3_135_45;
				L135_46<=agg3_135_46;
				L135_47<=agg3_135_47;
				L135_48<=agg3_135_48;
				L135_49<=agg3_135_49;
				L135_50<=agg3_135_50;
				L135_51<=agg3_135_51;
				L135_52<=agg3_135_52;
				L135_53<=agg3_135_53;
				L135_54<=agg3_135_54;
				L135_55<=agg3_135_55;
				L135_56<=agg3_135_56;
				L135_57<=agg3_135_57;
				L135_58<=agg3_135_58;
				L135_59<=agg3_135_59;
				L135_60<=agg3_135_60;
				L135_61<=agg3_135_61;
				L135_62<=agg3_135_62;
				L135_63<=agg3_135_63;				
			end
		end
	end

endmodule 
