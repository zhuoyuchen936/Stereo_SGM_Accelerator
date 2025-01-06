/*
 * @Author: PingchengDong 
 * @Date: 2021-03-19 23:34:33 
 * @Last Modified by:   PingchengDong 
 * @Last Modified time: 2021-03-19 23:34:33 
 */

module agg2 (
	clk,
	rst,
	clken,
	en_first,
    P1,
    P2,
	agg0_0,
	agg0_1,
	agg0_2,
	agg0_3,
	agg0_4,
	agg0_5,
	agg0_6,
	agg0_7,
	agg0_8,
	agg0_9,
	agg0_10,
	agg0_11,
	agg0_12,
	agg0_13,
	agg0_14,
	agg0_15,
	agg0_16,
	agg0_17,
	agg0_18,
	agg0_19,
	agg0_20,
	agg0_21,
	agg0_22,
	agg0_23,
	agg0_24,
	agg0_25,
	agg0_26,
	agg0_27,
	agg0_28,
	agg0_29,
	agg0_30,
	agg0_31,
	agg0_32,
	agg0_33,
	agg0_34,
	agg0_35,
	agg0_36,
	agg0_37,
	agg0_38,
	agg0_39,
	agg0_40,
	agg0_41,
	agg0_42,
	agg0_43,
	agg0_44,
	agg0_45,
	agg0_46,
	agg0_47,
	agg0_48,
	agg0_49,
	agg0_50,
	agg0_51,
	agg0_52,
	agg0_53,
	agg0_54,
	agg0_55,
	agg0_56,
	agg0_57,
	agg0_58,
	agg0_59,
	agg0_60,
	agg0_61,
	agg0_62,
	agg0_63,

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

	min_0_in,
	//output reg en0,
	min_135,
	min_0_out,
	
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

	cost_valid

);

	parameter cost_width = 9;
	input clk;
	input rst;
	input clken;
	input en_first;
    input [8:0]P1;
    input [8:0]P2;
	input [cost_width-1:0] agg0_0;
	input [cost_width-1:0] agg0_1;
	input [cost_width-1:0] agg0_2;
	input [cost_width-1:0] agg0_3;
	input [cost_width-1:0] agg0_4;
	input [cost_width-1:0] agg0_5;
	input [cost_width-1:0] agg0_6;
	input [cost_width-1:0] agg0_7;
	input [cost_width-1:0] agg0_8;
	input [cost_width-1:0] agg0_9;
	input [cost_width-1:0] agg0_10;
	input [cost_width-1:0] agg0_11;
	input [cost_width-1:0] agg0_12;
	input [cost_width-1:0] agg0_13;
	input [cost_width-1:0] agg0_14;
	input [cost_width-1:0] agg0_15;
	input [cost_width-1:0] agg0_16;
	input [cost_width-1:0] agg0_17;
	input [cost_width-1:0] agg0_18;
	input [cost_width-1:0] agg0_19;
	input [cost_width-1:0] agg0_20;
	input [cost_width-1:0] agg0_21;
	input [cost_width-1:0] agg0_22;
	input [cost_width-1:0] agg0_23;
	input [cost_width-1:0] agg0_24;
	input [cost_width-1:0] agg0_25;
	input [cost_width-1:0] agg0_26;
	input [cost_width-1:0] agg0_27;
	input [cost_width-1:0] agg0_28;
	input [cost_width-1:0] agg0_29;
	input [cost_width-1:0] agg0_30;
	input [cost_width-1:0] agg0_31;
	input [cost_width-1:0] agg0_32;
	input [cost_width-1:0] agg0_33;
	input [cost_width-1:0] agg0_34;
	input [cost_width-1:0] agg0_35;
	input [cost_width-1:0] agg0_36;
	input [cost_width-1:0] agg0_37;
	input [cost_width-1:0] agg0_38;
	input [cost_width-1:0] agg0_39;
	input [cost_width-1:0] agg0_40;
	input [cost_width-1:0] agg0_41;
	input [cost_width-1:0] agg0_42;
	input [cost_width-1:0] agg0_43;
	input [cost_width-1:0] agg0_44;
	input [cost_width-1:0] agg0_45;
	input [cost_width-1:0] agg0_46;
	input [cost_width-1:0] agg0_47;
	input [cost_width-1:0] agg0_48;
	input [cost_width-1:0] agg0_49;
	input [cost_width-1:0] agg0_50;
	input [cost_width-1:0] agg0_51;
	input [cost_width-1:0] agg0_52;
	input [cost_width-1:0] agg0_53;
	input [cost_width-1:0] agg0_54;
	input [cost_width-1:0] agg0_55;
	input [cost_width-1:0] agg0_56;
	input [cost_width-1:0] agg0_57;
	input [cost_width-1:0] agg0_58;
	input [cost_width-1:0] agg0_59;
	input [cost_width-1:0] agg0_60;
	input [cost_width-1:0] agg0_61;
	input [cost_width-1:0] agg0_62;
	input [cost_width-1:0] agg0_63;

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

	input [cost_width-1:0] min_0_in;
	//output reg en0,
	output reg [cost_width-3:0] min_135;
	output reg [cost_width-1:0] min_0_out;
	
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

	output reg [cost_width-3:0] L135_0;
	output reg [cost_width-3:0] L135_1;
	output reg [cost_width-3:0] L135_2;
	output reg [cost_width-3:0] L135_3;
	output reg [cost_width-3:0] L135_4;
	output reg [cost_width-3:0] L135_5;
	output reg [cost_width-3:0] L135_6;
	output reg [cost_width-3:0] L135_7;
	output reg [cost_width-3:0] L135_8;
	output reg [cost_width-3:0] L135_9;
	output reg [cost_width-3:0] L135_10;
	output reg [cost_width-3:0] L135_11;
	output reg [cost_width-3:0] L135_12;
	output reg [cost_width-3:0] L135_13;
	output reg [cost_width-3:0] L135_14;
	output reg [cost_width-3:0] L135_15;
	output reg [cost_width-3:0] L135_16;
	output reg [cost_width-3:0] L135_17;
	output reg [cost_width-3:0] L135_18;
	output reg [cost_width-3:0] L135_19;
	output reg [cost_width-3:0] L135_20;
	output reg [cost_width-3:0] L135_21;
	output reg [cost_width-3:0] L135_22;
	output reg [cost_width-3:0] L135_23;
	output reg [cost_width-3:0] L135_24;
	output reg [cost_width-3:0] L135_25;
	output reg [cost_width-3:0] L135_26;
	output reg [cost_width-3:0] L135_27;
	output reg [cost_width-3:0] L135_28;
	output reg [cost_width-3:0] L135_29;
	output reg [cost_width-3:0] L135_30;
	output reg [cost_width-3:0] L135_31;
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

	input [63:0]cost_valid;

	wire [cost_width:0] min0;
	wire [cost_width:0] min1;
	wire [cost_width:0] min2;
	wire [cost_width:0] min3;
	wire [cost_width:0] min4;
	wire [cost_width:0] min5;
	wire [cost_width:0] min6;
	wire [cost_width:0] min7;
	wire [cost_width:0] min8;
	wire [cost_width:0] min9;
	wire [cost_width:0] min10;
	wire [cost_width:0] min11;
	wire [cost_width:0] min12;
	wire [cost_width:0] min13;
	wire [cost_width:0] min14;
	wire [cost_width:0] min15;
	wire [cost_width:0] min16;
	wire [cost_width:0] min17;
	wire [cost_width:0] min18;
	wire [cost_width:0] min19;
	wire [cost_width:0] min20;
	wire [cost_width:0] min21;
	wire [cost_width:0] min22;
	wire [cost_width:0] min23;
	wire [cost_width:0] min24;
	wire [cost_width:0] min25;
	wire [cost_width:0] min26;
	wire [cost_width:0] min27;
	wire [cost_width:0] min28;
	wire [cost_width:0] min29;
	wire [cost_width:0] min30;
	wire [cost_width:0] min31;
	wire [cost_width:0] min32;
	wire [cost_width:0] min33;
	wire [cost_width:0] min34;
	wire [cost_width:0] min35;
	wire [cost_width:0] min36;
	wire [cost_width:0] min37;
	wire [cost_width:0] min38;
	wire [cost_width:0] min39;
	wire [cost_width:0] min40;
	wire [cost_width:0] min41;
	wire [cost_width:0] min42;
	wire [cost_width:0] min43;
	wire [cost_width:0] min44;
	wire [cost_width:0] min45;
	wire [cost_width:0] min46;
	wire [cost_width:0] min47;
	wire [cost_width:0] min48;
	wire [cost_width:0] min49;
	wire [cost_width:0] min50;
	wire [cost_width:0] min51;
	wire [cost_width:0] min52;
	wire [cost_width:0] min53;
	wire [cost_width:0] min54;
	wire [cost_width:0] min55;
	wire [cost_width:0] min56;
	wire [cost_width:0] min57;
	wire [cost_width:0] min58;
	wire [cost_width:0] min59;
	wire [cost_width:0] min60;
	wire [cost_width:0] min61;
	wire [cost_width:0] min62;
	wire [cost_width:0] min63;

	wire [cost_width:0] tmin0;
	wire [cost_width:0] tmin1;
	wire [cost_width:0] tmin2;
	wire [cost_width:0] tmin3;
	wire [cost_width:0] tmin4;
	wire [cost_width:0] tmin5;
	wire [cost_width:0] tmin6;
	wire [cost_width:0] tmin7;
	wire [cost_width:0] tmin8;
	wire [cost_width:0] tmin9;
	wire [cost_width:0] tmin10;
	wire [cost_width:0] tmin11;
	wire [cost_width:0] tmin12;
	wire [cost_width:0] tmin13;
	wire [cost_width:0] tmin14;
	wire [cost_width:0] tmin15;
	wire [cost_width:0] tmin16;
	wire [cost_width:0] tmin17;
	wire [cost_width:0] tmin18;
	wire [cost_width:0] tmin19;
	wire [cost_width:0] tmin20;
	wire [cost_width:0] tmin21;
	wire [cost_width:0] tmin22;
	wire [cost_width:0] tmin23;
	wire [cost_width:0] tmin24;
	wire [cost_width:0] tmin25;
	wire [cost_width:0] tmin26;
	wire [cost_width:0] tmin27;
	wire [cost_width:0] tmin28;
	wire [cost_width:0] tmin29;
	wire [cost_width:0] tmin30;
	wire [cost_width:0] tmin31;
	wire [cost_width:0] tmin32;
	wire [cost_width:0] tmin33;
	wire [cost_width:0] tmin34;
	wire [cost_width:0] tmin35;
	wire [cost_width:0] tmin36;
	wire [cost_width:0] tmin37;
	wire [cost_width:0] tmin38;
	wire [cost_width:0] tmin39;
	wire [cost_width:0] tmin40;
	wire [cost_width:0] tmin41;
	wire [cost_width:0] tmin42;
	wire [cost_width:0] tmin43;
	wire [cost_width:0] tmin44;
	wire [cost_width:0] tmin45;
	wire [cost_width:0] tmin46;
	wire [cost_width:0] tmin47;
	wire [cost_width:0] tmin48;
	wire [cost_width:0] tmin49;
	wire [cost_width:0] tmin50;
	wire [cost_width:0] tmin51;
	wire [cost_width:0] tmin52;
	wire [cost_width:0] tmin53;
	wire [cost_width:0] tmin54;
	wire [cost_width:0] tmin55;
	wire [cost_width:0] tmin56;
	wire [cost_width:0] tmin57;
	wire [cost_width:0] tmin58;
	wire [cost_width:0] tmin59;
	wire [cost_width:0] tmin60;
	wire [cost_width:0] tmin61;
	wire [cost_width:0] tmin62;
	wire [cost_width:0] tmin63;	
	
	wire [cost_width:0] kmin0;
	wire [cost_width:0] kmin1;
	wire [cost_width:0] kmin2;
	wire [cost_width:0] kmin3;
	wire [cost_width:0] kmin4;
	wire [cost_width:0] kmin5;
	wire [cost_width:0] kmin6;
	wire [cost_width:0] kmin7;
	wire [cost_width:0] kmin8;
	wire [cost_width:0] kmin9;
	wire [cost_width:0] kmin10;
	wire [cost_width:0] kmin11;
	wire [cost_width:0] kmin12;
	wire [cost_width:0] kmin13;
	wire [cost_width:0] kmin14;
	wire [cost_width:0] kmin15;
	wire [cost_width:0] kmin16;
	wire [cost_width:0] kmin17;
	wire [cost_width:0] kmin18;
	wire [cost_width:0] kmin19;
	wire [cost_width:0] kmin20;
	wire [cost_width:0] kmin21;
	wire [cost_width:0] kmin22;
	wire [cost_width:0] kmin23;
	wire [cost_width:0] kmin24;
	wire [cost_width:0] kmin25;
	wire [cost_width:0] kmin26;
	wire [cost_width:0] kmin27;
	wire [cost_width:0] kmin28;
	wire [cost_width:0] kmin29;
	wire [cost_width:0] kmin30;
	wire [cost_width:0] kmin31;
	wire [cost_width:0] kmin32;
	wire [cost_width:0] kmin33;
	wire [cost_width:0] kmin34;
	wire [cost_width:0] kmin35;
	wire [cost_width:0] kmin36;
	wire [cost_width:0] kmin37;
	wire [cost_width:0] kmin38;
	wire [cost_width:0] kmin39;
	wire [cost_width:0] kmin40;
	wire [cost_width:0] kmin41;
	wire [cost_width:0] kmin42;
	wire [cost_width:0] kmin43;
	wire [cost_width:0] kmin44;
	wire [cost_width:0] kmin45;
	wire [cost_width:0] kmin46;
	wire [cost_width:0] kmin47;
	wire [cost_width:0] kmin48;
	wire [cost_width:0] kmin49;
	wire [cost_width:0] kmin50;
	wire [cost_width:0] kmin51;
	wire [cost_width:0] kmin52;
	wire [cost_width:0] kmin53;
	wire [cost_width:0] kmin54;
	wire [cost_width:0] kmin55;
	wire [cost_width:0] kmin56;
	wire [cost_width:0] kmin57;
	wire [cost_width:0] kmin58;
	wire [cost_width:0] kmin59;
	wire [cost_width:0] kmin60;
	wire [cost_width:0] kmin61;
	wire [cost_width:0] kmin62;
	wire [cost_width:0] kmin63;		
	
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


	wire [cost_width-1:0]agg0_ran[63:0];
	assign agg0_ran[0] =cost_valid[0]  ? agg0_0  :{cost_width{1'b1}};
	assign agg0_ran[1] =cost_valid[1]  ? agg0_1  :{cost_width{1'b1}};
	assign agg0_ran[2] =cost_valid[2]  ? agg0_2  :{cost_width{1'b1}};
	assign agg0_ran[3] =cost_valid[3]  ? agg0_3  :{cost_width{1'b1}};
	assign agg0_ran[4] =cost_valid[4]  ? agg0_4  :{cost_width{1'b1}};
	assign agg0_ran[5] =cost_valid[5]  ? agg0_5  :{cost_width{1'b1}};
	assign agg0_ran[6] =cost_valid[6]  ? agg0_6  :{cost_width{1'b1}};
	assign agg0_ran[7] =cost_valid[7]  ? agg0_7  :{cost_width{1'b1}};
	assign agg0_ran[8] =cost_valid[8]  ? agg0_8  :{cost_width{1'b1}};
	assign agg0_ran[9] =cost_valid[9]  ? agg0_9  :{cost_width{1'b1}};
	assign agg0_ran[10]=cost_valid[10] ? agg0_10 :{cost_width{1'b1}};
	assign agg0_ran[11]=cost_valid[11] ? agg0_11 :{cost_width{1'b1}};
	assign agg0_ran[12]=cost_valid[12] ? agg0_12 :{cost_width{1'b1}};
	assign agg0_ran[13]=cost_valid[13] ? agg0_13 :{cost_width{1'b1}};
	assign agg0_ran[14]=cost_valid[14] ? agg0_14 :{cost_width{1'b1}};
	assign agg0_ran[15]=cost_valid[15] ? agg0_15 :{cost_width{1'b1}};
	assign agg0_ran[16]=cost_valid[16] ? agg0_16 :{cost_width{1'b1}};
	assign agg0_ran[17]=cost_valid[17] ? agg0_17 :{cost_width{1'b1}};
	assign agg0_ran[18]=cost_valid[18] ? agg0_18 :{cost_width{1'b1}};
	assign agg0_ran[19]=cost_valid[19] ? agg0_19 :{cost_width{1'b1}};
	assign agg0_ran[20]=cost_valid[20] ? agg0_20 :{cost_width{1'b1}};
	assign agg0_ran[21]=cost_valid[21] ? agg0_21 :{cost_width{1'b1}};
	assign agg0_ran[22]=cost_valid[22] ? agg0_22 :{cost_width{1'b1}};
	assign agg0_ran[23]=cost_valid[23] ? agg0_23 :{cost_width{1'b1}};
	assign agg0_ran[24]=cost_valid[24] ? agg0_24 :{cost_width{1'b1}};
	assign agg0_ran[25]=cost_valid[25] ? agg0_25 :{cost_width{1'b1}};
	assign agg0_ran[26]=cost_valid[26] ? agg0_26 :{cost_width{1'b1}};
	assign agg0_ran[27]=cost_valid[27] ? agg0_27 :{cost_width{1'b1}};
	assign agg0_ran[28]=cost_valid[28] ? agg0_28 :{cost_width{1'b1}};
	assign agg0_ran[29]=cost_valid[29] ? agg0_29 :{cost_width{1'b1}};
	assign agg0_ran[30]=cost_valid[30] ? agg0_30 :{cost_width{1'b1}};
	assign agg0_ran[31]=cost_valid[31] ? agg0_31 :{cost_width{1'b1}};
	assign agg0_ran[32]=cost_valid[32] ? agg0_32 :{cost_width{1'b1}};
	assign agg0_ran[33]=cost_valid[33] ? agg0_33 :{cost_width{1'b1}};
	assign agg0_ran[34]=cost_valid[34] ? agg0_34 :{cost_width{1'b1}};
	assign agg0_ran[35]=cost_valid[35] ? agg0_35 :{cost_width{1'b1}};
	assign agg0_ran[36]=cost_valid[36] ? agg0_36 :{cost_width{1'b1}};
	assign agg0_ran[37]=cost_valid[37] ? agg0_37 :{cost_width{1'b1}};
	assign agg0_ran[38]=cost_valid[38] ? agg0_38 :{cost_width{1'b1}};
	assign agg0_ran[39]=cost_valid[39] ? agg0_39 :{cost_width{1'b1}};
	assign agg0_ran[40]=cost_valid[40] ? agg0_40 :{cost_width{1'b1}};
	assign agg0_ran[41]=cost_valid[41] ? agg0_41 :{cost_width{1'b1}};
	assign agg0_ran[42]=cost_valid[42] ? agg0_42 :{cost_width{1'b1}};
	assign agg0_ran[43]=cost_valid[43] ? agg0_43 :{cost_width{1'b1}};
	assign agg0_ran[44]=cost_valid[44] ? agg0_44 :{cost_width{1'b1}};
	assign agg0_ran[45]=cost_valid[45] ? agg0_45 :{cost_width{1'b1}};
	assign agg0_ran[46]=cost_valid[46] ? agg0_46 :{cost_width{1'b1}};
	assign agg0_ran[47]=cost_valid[47] ? agg0_47 :{cost_width{1'b1}};
	assign agg0_ran[48]=cost_valid[48] ? agg0_48 :{cost_width{1'b1}};
	assign agg0_ran[49]=cost_valid[49] ? agg0_49 :{cost_width{1'b1}};
	assign agg0_ran[50]=cost_valid[50] ? agg0_50 :{cost_width{1'b1}};
	assign agg0_ran[51]=cost_valid[51] ? agg0_51 :{cost_width{1'b1}};
	assign agg0_ran[52]=cost_valid[52] ? agg0_52 :{cost_width{1'b1}};
	assign agg0_ran[53]=cost_valid[53] ? agg0_53 :{cost_width{1'b1}};
	assign agg0_ran[54]=cost_valid[54] ? agg0_54 :{cost_width{1'b1}};
	assign agg0_ran[55]=cost_valid[55] ? agg0_55 :{cost_width{1'b1}};
	assign agg0_ran[56]=cost_valid[56] ? agg0_56 :{cost_width{1'b1}};
	assign agg0_ran[57]=cost_valid[57] ? agg0_57 :{cost_width{1'b1}};
	assign agg0_ran[58]=cost_valid[58] ? agg0_58 :{cost_width{1'b1}};
	assign agg0_ran[59]=cost_valid[59] ? agg0_59 :{cost_width{1'b1}};
	assign agg0_ran[60]=cost_valid[60] ? agg0_60 :{cost_width{1'b1}};
	assign agg0_ran[61]=cost_valid[61] ? agg0_61 :{cost_width{1'b1}};
	assign agg0_ran[62]=cost_valid[62] ? agg0_62 :{cost_width{1'b1}};
	assign agg0_ran[63]=cost_valid[63] ? agg0_63 :{cost_width{1'b1}};

	assign min0=agg0_ran[1]+P1;
	assign min1=agg0_ran[0][cost_width-1:2]<=agg0_ran[2][cost_width-1:2]?(agg0_ran[0]+P1):(agg0_ran[2]+P1);
	assign min2=agg0_ran[1][cost_width-1:2]<=agg0_ran[3][cost_width-1:2]?(agg0_ran[1]+P1):(agg0_ran[3]+P1);
	assign min3=agg0_ran[2][cost_width-1:2]<=agg0_ran[4][cost_width-1:2]?(agg0_ran[2]+P1):(agg0_ran[4]+P1);
	assign min4=agg0_ran[3][cost_width-1:2]<=agg0_ran[5][cost_width-1:2]?(agg0_ran[3]+P1):(agg0_ran[5]+P1);
	assign min5=agg0_ran[4][cost_width-1:2]<=agg0_ran[6][cost_width-1:2]?(agg0_ran[4]+P1):(agg0_ran[6]+P1);
	assign min6=agg0_ran[5][cost_width-1:2]<=agg0_ran[7][cost_width-1:2]?(agg0_ran[5]+P1):(agg0_ran[7]+P1);
	assign min7=agg0_ran[6][cost_width-1:2]<=agg0_ran[8][cost_width-1:2]?(agg0_ran[6]+P1):(agg0_ran[8]+P1);
	assign min8=agg0_ran[7][cost_width-1:2]<=agg0_ran[9][cost_width-1:2]?(agg0_ran[7]+P1):(agg0_ran[9]+P1);
	assign min9=agg0_ran[8][cost_width-1:2]<=agg0_ran[10][cost_width-1:2]?(agg0_ran[8]+P1):(agg0_ran[10]+P1);
	assign min10=agg0_ran[9][cost_width-1:2]<=agg0_ran[11][cost_width-1:2]?(agg0_ran[9]+P1):(agg0_ran[11]+P1);
	assign min11=agg0_ran[10][cost_width-1:2]<=agg0_ran[12][cost_width-1:2]?(agg0_ran[10]+P1):(agg0_ran[12]+P1);
	assign min12=agg0_ran[11][cost_width-1:2]<=agg0_ran[13][cost_width-1:2]?(agg0_ran[11]+P1):(agg0_ran[13]+P1);
	assign min13=agg0_ran[12][cost_width-1:2]<=agg0_ran[14][cost_width-1:2]?(agg0_ran[12]+P1):(agg0_ran[14]+P1);
	assign min14=agg0_ran[13][cost_width-1:2]<=agg0_ran[15][cost_width-1:2]?(agg0_ran[13]+P1):(agg0_ran[15]+P1);
	assign min15=agg0_ran[14][cost_width-1:2]<=agg0_ran[16][cost_width-1:2]?(agg0_ran[14]+P1):(agg0_ran[16]+P1);
	assign min16=agg0_ran[15][cost_width-1:2]<=agg0_ran[17][cost_width-1:2]?(agg0_ran[15]+P1):(agg0_ran[17]+P1);
	assign min17=agg0_ran[16][cost_width-1:2]<=agg0_ran[18][cost_width-1:2]?(agg0_ran[16]+P1):(agg0_ran[18]+P1);
	assign min18=agg0_ran[17][cost_width-1:2]<=agg0_ran[19][cost_width-1:2]?(agg0_ran[17]+P1):(agg0_ran[19]+P1);
	assign min19=agg0_ran[18][cost_width-1:2]<=agg0_ran[20][cost_width-1:2]?(agg0_ran[18]+P1):(agg0_ran[20]+P1);
	assign min20=agg0_ran[19][cost_width-1:2]<=agg0_ran[21][cost_width-1:2]?(agg0_ran[19]+P1):(agg0_ran[21]+P1);
	assign min21=agg0_ran[20][cost_width-1:2]<=agg0_ran[22][cost_width-1:2]?(agg0_ran[20]+P1):(agg0_ran[22]+P1);
	assign min22=agg0_ran[21][cost_width-1:2]<=agg0_ran[23][cost_width-1:2]?(agg0_ran[21]+P1):(agg0_ran[23]+P1);
	assign min23=agg0_ran[22][cost_width-1:2]<=agg0_ran[24][cost_width-1:2]?(agg0_ran[22]+P1):(agg0_ran[24]+P1);
	assign min24=agg0_ran[23][cost_width-1:2]<=agg0_ran[25][cost_width-1:2]?(agg0_ran[23]+P1):(agg0_ran[25]+P1);
	assign min25=agg0_ran[24][cost_width-1:2]<=agg0_ran[26][cost_width-1:2]?(agg0_ran[24]+P1):(agg0_ran[26]+P1);
	assign min26=agg0_ran[25][cost_width-1:2]<=agg0_ran[27][cost_width-1:2]?(agg0_ran[25]+P1):(agg0_ran[27]+P1);
	assign min27=agg0_ran[26][cost_width-1:2]<=agg0_ran[28][cost_width-1:2]?(agg0_ran[26]+P1):(agg0_ran[28]+P1);
	assign min28=agg0_ran[27][cost_width-1:2]<=agg0_ran[29][cost_width-1:2]?(agg0_ran[27]+P1):(agg0_ran[29]+P1);
	assign min29=agg0_ran[28][cost_width-1:2]<=agg0_ran[30][cost_width-1:2]?(agg0_ran[28]+P1):(agg0_ran[30]+P1);
	assign min30=agg0_ran[29][cost_width-1:2]<=agg0_ran[31][cost_width-1:2]?(agg0_ran[29]+P1):(agg0_ran[31]+P1);
	assign min31=agg0_ran[30][cost_width-1:2]<=agg0_ran[32][cost_width-1:2]?(agg0_ran[30]+P1):(agg0_ran[32]+P1);
	assign min32=agg0_ran[31][cost_width-1:2]<=agg0_ran[33][cost_width-1:2]?(agg0_ran[31]+P1):(agg0_ran[33]+P1);
	assign min33=agg0_ran[32][cost_width-1:2]<=agg0_ran[34][cost_width-1:2]?(agg0_ran[32]+P1):(agg0_ran[34]+P1);
	assign min34=agg0_ran[33][cost_width-1:2]<=agg0_ran[35][cost_width-1:2]?(agg0_ran[33]+P1):(agg0_ran[35]+P1);
	assign min35=agg0_ran[34][cost_width-1:2]<=agg0_ran[36][cost_width-1:2]?(agg0_ran[34]+P1):(agg0_ran[36]+P1);
	assign min36=agg0_ran[35][cost_width-1:2]<=agg0_ran[37][cost_width-1:2]?(agg0_ran[35]+P1):(agg0_ran[37]+P1);
	assign min37=agg0_ran[36][cost_width-1:2]<=agg0_ran[38][cost_width-1:2]?(agg0_ran[36]+P1):(agg0_ran[38]+P1);
	assign min38=agg0_ran[37][cost_width-1:2]<=agg0_ran[39][cost_width-1:2]?(agg0_ran[37]+P1):(agg0_ran[39]+P1);
	assign min39=agg0_ran[38][cost_width-1:2]<=agg0_ran[40][cost_width-1:2]?(agg0_ran[38]+P1):(agg0_ran[40]+P1);
	assign min40=agg0_ran[39][cost_width-1:2]<=agg0_ran[41][cost_width-1:2]?(agg0_ran[39]+P1):(agg0_ran[41]+P1);
	assign min41=agg0_ran[40][cost_width-1:2]<=agg0_ran[42][cost_width-1:2]?(agg0_ran[40]+P1):(agg0_ran[42]+P1);
	assign min42=agg0_ran[41][cost_width-1:2]<=agg0_ran[43][cost_width-1:2]?(agg0_ran[41]+P1):(agg0_ran[43]+P1);
	assign min43=agg0_ran[42][cost_width-1:2]<=agg0_ran[44][cost_width-1:2]?(agg0_ran[42]+P1):(agg0_ran[44]+P1);
	assign min44=agg0_ran[43][cost_width-1:2]<=agg0_ran[45][cost_width-1:2]?(agg0_ran[43]+P1):(agg0_ran[45]+P1);
	assign min45=agg0_ran[44][cost_width-1:2]<=agg0_ran[46][cost_width-1:2]?(agg0_ran[44]+P1):(agg0_ran[46]+P1);
	assign min46=agg0_ran[45][cost_width-1:2]<=agg0_ran[47][cost_width-1:2]?(agg0_ran[45]+P1):(agg0_ran[47]+P1);
	assign min47=agg0_ran[46][cost_width-1:2]<=agg0_ran[48][cost_width-1:2]?(agg0_ran[46]+P1):(agg0_ran[48]+P1);
	assign min48=agg0_ran[47][cost_width-1:2]<=agg0_ran[49][cost_width-1:2]?(agg0_ran[47]+P1):(agg0_ran[49]+P1);
	assign min49=agg0_ran[48][cost_width-1:2]<=agg0_ran[50][cost_width-1:2]?(agg0_ran[48]+P1):(agg0_ran[50]+P1);
	assign min50=agg0_ran[49][cost_width-1:2]<=agg0_ran[51][cost_width-1:2]?(agg0_ran[49]+P1):(agg0_ran[51]+P1);
	assign min51=agg0_ran[50][cost_width-1:2]<=agg0_ran[52][cost_width-1:2]?(agg0_ran[50]+P1):(agg0_ran[52]+P1);
	assign min52=agg0_ran[51][cost_width-1:2]<=agg0_ran[53][cost_width-1:2]?(agg0_ran[51]+P1):(agg0_ran[53]+P1);
	assign min53=agg0_ran[52][cost_width-1:2]<=agg0_ran[54][cost_width-1:2]?(agg0_ran[52]+P1):(agg0_ran[54]+P1);
	assign min54=agg0_ran[53][cost_width-1:2]<=agg0_ran[55][cost_width-1:2]?(agg0_ran[53]+P1):(agg0_ran[55]+P1);
	assign min55=agg0_ran[54][cost_width-1:2]<=agg0_ran[56][cost_width-1:2]?(agg0_ran[54]+P1):(agg0_ran[56]+P1);
	assign min56=agg0_ran[55][cost_width-1:2]<=agg0_ran[57][cost_width-1:2]?(agg0_ran[55]+P1):(agg0_ran[57]+P1);
	assign min57=agg0_ran[56][cost_width-1:2]<=agg0_ran[58][cost_width-1:2]?(agg0_ran[56]+P1):(agg0_ran[58]+P1);
	assign min58=agg0_ran[57][cost_width-1:2]<=agg0_ran[59][cost_width-1:2]?(agg0_ran[57]+P1):(agg0_ran[59]+P1);
	assign min59=agg0_ran[58][cost_width-1:2]<=agg0_ran[60][cost_width-1:2]?(agg0_ran[58]+P1):(agg0_ran[60]+P1);
	assign min60=agg0_ran[59][cost_width-1:2]<=agg0_ran[61][cost_width-1:2]?(agg0_ran[59]+P1):(agg0_ran[61]+P1);
	assign min61=agg0_ran[60][cost_width-1:2]<=agg0_ran[62][cost_width-1:2]?(agg0_ran[60]+P1):(agg0_ran[62]+P1);
	assign min62=agg0_ran[61][cost_width-1:2]<=agg0_ran[63][cost_width-1:2]?(agg0_ran[61]+P1):(agg0_ran[63]+P1);
	assign min63=agg0_ran[62]+P1;
	
	
	wire [cost_width:0]min_0_P2;
	// assign min_0_P2=(min_0_in<<2)+P2;
	assign min_0_P2=min_0_in+P2;
	assign tmin0=min0[cost_width:2]<=min_0_P2[cost_width:2]?min0:min_0_P2;
	assign tmin1=min1[cost_width:2]<=min_0_P2[cost_width:2]?min1:min_0_P2;
	assign tmin2=min2[cost_width:2]<=min_0_P2[cost_width:2]?min2:min_0_P2;
	assign tmin3=min3[cost_width:2]<=min_0_P2[cost_width:2]?min3:min_0_P2;
	assign tmin4=min4[cost_width:2]<=min_0_P2[cost_width:2]?min4:min_0_P2;
	assign tmin5=min5[cost_width:2]<=min_0_P2[cost_width:2]?min5:min_0_P2;
	assign tmin6=min6[cost_width:2]<=min_0_P2[cost_width:2]?min6:min_0_P2;
	assign tmin7=min7[cost_width:2]<=min_0_P2[cost_width:2]?min7:min_0_P2;
	assign tmin8=min8[cost_width:2]<=min_0_P2[cost_width:2]?min8:min_0_P2;
	assign tmin9=min9[cost_width:2]<=min_0_P2[cost_width:2]?min9:min_0_P2;
	assign tmin10=min10[cost_width:2]<=min_0_P2[cost_width:2]?min10:min_0_P2;
	assign tmin11=min11[cost_width:2]<=min_0_P2[cost_width:2]?min11:min_0_P2;
	assign tmin12=min12[cost_width:2]<=min_0_P2[cost_width:2]?min12:min_0_P2;
	assign tmin13=min13[cost_width:2]<=min_0_P2[cost_width:2]?min13:min_0_P2;
	assign tmin14=min14[cost_width:2]<=min_0_P2[cost_width:2]?min14:min_0_P2;
	assign tmin15=min15[cost_width:2]<=min_0_P2[cost_width:2]?min15:min_0_P2;
	assign tmin16=min16[cost_width:2]<=min_0_P2[cost_width:2]?min16:min_0_P2;
	assign tmin17=min17[cost_width:2]<=min_0_P2[cost_width:2]?min17:min_0_P2;
	assign tmin18=min18[cost_width:2]<=min_0_P2[cost_width:2]?min18:min_0_P2;
	assign tmin19=min19[cost_width:2]<=min_0_P2[cost_width:2]?min19:min_0_P2;
	assign tmin20=min20[cost_width:2]<=min_0_P2[cost_width:2]?min20:min_0_P2;
	assign tmin21=min21[cost_width:2]<=min_0_P2[cost_width:2]?min21:min_0_P2;
	assign tmin22=min22[cost_width:2]<=min_0_P2[cost_width:2]?min22:min_0_P2;
	assign tmin23=min23[cost_width:2]<=min_0_P2[cost_width:2]?min23:min_0_P2;
	assign tmin24=min24[cost_width:2]<=min_0_P2[cost_width:2]?min24:min_0_P2;
	assign tmin25=min25[cost_width:2]<=min_0_P2[cost_width:2]?min25:min_0_P2;
	assign tmin26=min26[cost_width:2]<=min_0_P2[cost_width:2]?min26:min_0_P2;
	assign tmin27=min27[cost_width:2]<=min_0_P2[cost_width:2]?min27:min_0_P2;
	assign tmin28=min28[cost_width:2]<=min_0_P2[cost_width:2]?min28:min_0_P2;
	assign tmin29=min29[cost_width:2]<=min_0_P2[cost_width:2]?min29:min_0_P2;
	assign tmin30=min30[cost_width:2]<=min_0_P2[cost_width:2]?min30:min_0_P2;
	assign tmin31=min31[cost_width:2]<=min_0_P2[cost_width:2]?min31:min_0_P2;
	assign tmin32=min32[cost_width:2]<=min_0_P2[cost_width:2]?min32:min_0_P2;
	assign tmin33=min33[cost_width:2]<=min_0_P2[cost_width:2]?min33:min_0_P2;
	assign tmin34=min34[cost_width:2]<=min_0_P2[cost_width:2]?min34:min_0_P2;
	assign tmin35=min35[cost_width:2]<=min_0_P2[cost_width:2]?min35:min_0_P2;
	assign tmin36=min36[cost_width:2]<=min_0_P2[cost_width:2]?min36:min_0_P2;
	assign tmin37=min37[cost_width:2]<=min_0_P2[cost_width:2]?min37:min_0_P2;
	assign tmin38=min38[cost_width:2]<=min_0_P2[cost_width:2]?min38:min_0_P2;
	assign tmin39=min39[cost_width:2]<=min_0_P2[cost_width:2]?min39:min_0_P2;
	assign tmin40=min40[cost_width:2]<=min_0_P2[cost_width:2]?min40:min_0_P2;
	assign tmin41=min41[cost_width:2]<=min_0_P2[cost_width:2]?min41:min_0_P2;
	assign tmin42=min42[cost_width:2]<=min_0_P2[cost_width:2]?min42:min_0_P2;
	assign tmin43=min43[cost_width:2]<=min_0_P2[cost_width:2]?min43:min_0_P2;
	assign tmin44=min44[cost_width:2]<=min_0_P2[cost_width:2]?min44:min_0_P2;
	assign tmin45=min45[cost_width:2]<=min_0_P2[cost_width:2]?min45:min_0_P2;
	assign tmin46=min46[cost_width:2]<=min_0_P2[cost_width:2]?min46:min_0_P2;
	assign tmin47=min47[cost_width:2]<=min_0_P2[cost_width:2]?min47:min_0_P2;
	assign tmin48=min48[cost_width:2]<=min_0_P2[cost_width:2]?min48:min_0_P2;
	assign tmin49=min49[cost_width:2]<=min_0_P2[cost_width:2]?min49:min_0_P2;
	assign tmin50=min50[cost_width:2]<=min_0_P2[cost_width:2]?min50:min_0_P2;
	assign tmin51=min51[cost_width:2]<=min_0_P2[cost_width:2]?min51:min_0_P2;
	assign tmin52=min52[cost_width:2]<=min_0_P2[cost_width:2]?min52:min_0_P2;
	assign tmin53=min53[cost_width:2]<=min_0_P2[cost_width:2]?min53:min_0_P2;
	assign tmin54=min54[cost_width:2]<=min_0_P2[cost_width:2]?min54:min_0_P2;
	assign tmin55=min55[cost_width:2]<=min_0_P2[cost_width:2]?min55:min_0_P2;
	assign tmin56=min56[cost_width:2]<=min_0_P2[cost_width:2]?min56:min_0_P2;
	assign tmin57=min57[cost_width:2]<=min_0_P2[cost_width:2]?min57:min_0_P2;
	assign tmin58=min58[cost_width:2]<=min_0_P2[cost_width:2]?min58:min_0_P2;
	assign tmin59=min59[cost_width:2]<=min_0_P2[cost_width:2]?min59:min_0_P2;
	assign tmin60=min60[cost_width:2]<=min_0_P2[cost_width:2]?min60:min_0_P2;
	assign tmin61=min61[cost_width:2]<=min_0_P2[cost_width:2]?min61:min_0_P2;
	assign tmin62=min62[cost_width:2]<=min_0_P2[cost_width:2]?min62:min_0_P2;
	assign tmin63=min63[cost_width:2]<=min_0_P2[cost_width:2]?min63:min_0_P2;

	assign kmin0=tmin0[cost_width:2]<={1'b0,agg0_0[cost_width-1:2]}?tmin0:{1'b0,agg0_0};
	assign kmin1=tmin1[cost_width:2]<={1'b0,agg0_1[cost_width-1:2]}?tmin1:{1'b0,agg0_1};
	assign kmin2=tmin2[cost_width:2]<={1'b0,agg0_2[cost_width-1:2]}?tmin2:{1'b0,agg0_2};
	assign kmin3=tmin3[cost_width:2]<={1'b0,agg0_3[cost_width-1:2]}?tmin3:{1'b0,agg0_3};
	assign kmin4=tmin4[cost_width:2]<={1'b0,agg0_4[cost_width-1:2]}?tmin4:{1'b0,agg0_4};
	assign kmin5=tmin5[cost_width:2]<={1'b0,agg0_5[cost_width-1:2]}?tmin5:{1'b0,agg0_5};
	assign kmin6=tmin6[cost_width:2]<={1'b0,agg0_6[cost_width-1:2]}?tmin6:{1'b0,agg0_6};
	assign kmin7=tmin7[cost_width:2]<={1'b0,agg0_7[cost_width-1:2]}?tmin7:{1'b0,agg0_7};
	assign kmin8=tmin8[cost_width:2]<={1'b0,agg0_8[cost_width-1:2]}?tmin8:{1'b0,agg0_8};
	assign kmin9=tmin9[cost_width:2]<={1'b0,agg0_9[cost_width-1:2]}?tmin9:{1'b0,agg0_9};
	assign kmin10=tmin10[cost_width:2]<={1'b0,agg0_10[cost_width-1:2]}?tmin10:{1'b0,agg0_10};
	assign kmin11=tmin11[cost_width:2]<={1'b0,agg0_11[cost_width-1:2]}?tmin11:{1'b0,agg0_11};
	assign kmin12=tmin12[cost_width:2]<={1'b0,agg0_12[cost_width-1:2]}?tmin12:{1'b0,agg0_12};
	assign kmin13=tmin13[cost_width:2]<={1'b0,agg0_13[cost_width-1:2]}?tmin13:{1'b0,agg0_13};
	assign kmin14=tmin14[cost_width:2]<={1'b0,agg0_14[cost_width-1:2]}?tmin14:{1'b0,agg0_14};
	assign kmin15=tmin15[cost_width:2]<={1'b0,agg0_15[cost_width-1:2]}?tmin15:{1'b0,agg0_15};
	assign kmin16=tmin16[cost_width:2]<={1'b0,agg0_16[cost_width-1:2]}?tmin16:{1'b0,agg0_16};
	assign kmin17=tmin17[cost_width:2]<={1'b0,agg0_17[cost_width-1:2]}?tmin17:{1'b0,agg0_17};
	assign kmin18=tmin18[cost_width:2]<={1'b0,agg0_18[cost_width-1:2]}?tmin18:{1'b0,agg0_18};
	assign kmin19=tmin19[cost_width:2]<={1'b0,agg0_19[cost_width-1:2]}?tmin19:{1'b0,agg0_19};
	assign kmin20=tmin20[cost_width:2]<={1'b0,agg0_20[cost_width-1:2]}?tmin20:{1'b0,agg0_20};
	assign kmin21=tmin21[cost_width:2]<={1'b0,agg0_21[cost_width-1:2]}?tmin21:{1'b0,agg0_21};
	assign kmin22=tmin22[cost_width:2]<={1'b0,agg0_22[cost_width-1:2]}?tmin22:{1'b0,agg0_22};
	assign kmin23=tmin23[cost_width:2]<={1'b0,agg0_23[cost_width-1:2]}?tmin23:{1'b0,agg0_23};
	assign kmin24=tmin24[cost_width:2]<={1'b0,agg0_24[cost_width-1:2]}?tmin24:{1'b0,agg0_24};
	assign kmin25=tmin25[cost_width:2]<={1'b0,agg0_25[cost_width-1:2]}?tmin25:{1'b0,agg0_25};
	assign kmin26=tmin26[cost_width:2]<={1'b0,agg0_26[cost_width-1:2]}?tmin26:{1'b0,agg0_26};
	assign kmin27=tmin27[cost_width:2]<={1'b0,agg0_27[cost_width-1:2]}?tmin27:{1'b0,agg0_27};
	assign kmin28=tmin28[cost_width:2]<={1'b0,agg0_28[cost_width-1:2]}?tmin28:{1'b0,agg0_28};
	assign kmin29=tmin29[cost_width:2]<={1'b0,agg0_29[cost_width-1:2]}?tmin29:{1'b0,agg0_29};
	assign kmin30=tmin30[cost_width:2]<={1'b0,agg0_30[cost_width-1:2]}?tmin30:{1'b0,agg0_30};
	assign kmin31=tmin31[cost_width:2]<={1'b0,agg0_31[cost_width-1:2]}?tmin31:{1'b0,agg0_31};
	assign kmin32=tmin32[cost_width:2]<={1'b0,agg0_32[cost_width-1:2]}?tmin32:{1'b0,agg0_32};
	assign kmin33=tmin33[cost_width:2]<={1'b0,agg0_33[cost_width-1:2]}?tmin33:{1'b0,agg0_33};
	assign kmin34=tmin34[cost_width:2]<={1'b0,agg0_34[cost_width-1:2]}?tmin34:{1'b0,agg0_34};
	assign kmin35=tmin35[cost_width:2]<={1'b0,agg0_35[cost_width-1:2]}?tmin35:{1'b0,agg0_35};
	assign kmin36=tmin36[cost_width:2]<={1'b0,agg0_36[cost_width-1:2]}?tmin36:{1'b0,agg0_36};
	assign kmin37=tmin37[cost_width:2]<={1'b0,agg0_37[cost_width-1:2]}?tmin37:{1'b0,agg0_37};
	assign kmin38=tmin38[cost_width:2]<={1'b0,agg0_38[cost_width-1:2]}?tmin38:{1'b0,agg0_38};
	assign kmin39=tmin39[cost_width:2]<={1'b0,agg0_39[cost_width-1:2]}?tmin39:{1'b0,agg0_39};
	assign kmin40=tmin40[cost_width:2]<={1'b0,agg0_40[cost_width-1:2]}?tmin40:{1'b0,agg0_40};
	assign kmin41=tmin41[cost_width:2]<={1'b0,agg0_41[cost_width-1:2]}?tmin41:{1'b0,agg0_41};
	assign kmin42=tmin42[cost_width:2]<={1'b0,agg0_42[cost_width-1:2]}?tmin42:{1'b0,agg0_42};
	assign kmin43=tmin43[cost_width:2]<={1'b0,agg0_43[cost_width-1:2]}?tmin43:{1'b0,agg0_43};
	assign kmin44=tmin44[cost_width:2]<={1'b0,agg0_44[cost_width-1:2]}?tmin44:{1'b0,agg0_44};
	assign kmin45=tmin45[cost_width:2]<={1'b0,agg0_45[cost_width-1:2]}?tmin45:{1'b0,agg0_45};
	assign kmin46=tmin46[cost_width:2]<={1'b0,agg0_46[cost_width-1:2]}?tmin46:{1'b0,agg0_46};
	assign kmin47=tmin47[cost_width:2]<={1'b0,agg0_47[cost_width-1:2]}?tmin47:{1'b0,agg0_47};
	assign kmin48=tmin48[cost_width:2]<={1'b0,agg0_48[cost_width-1:2]}?tmin48:{1'b0,agg0_48};
	assign kmin49=tmin49[cost_width:2]<={1'b0,agg0_49[cost_width-1:2]}?tmin49:{1'b0,agg0_49};
	assign kmin50=tmin50[cost_width:2]<={1'b0,agg0_50[cost_width-1:2]}?tmin50:{1'b0,agg0_50};
	assign kmin51=tmin51[cost_width:2]<={1'b0,agg0_51[cost_width-1:2]}?tmin51:{1'b0,agg0_51};
	assign kmin52=tmin52[cost_width:2]<={1'b0,agg0_52[cost_width-1:2]}?tmin52:{1'b0,agg0_52};
	assign kmin53=tmin53[cost_width:2]<={1'b0,agg0_53[cost_width-1:2]}?tmin53:{1'b0,agg0_53};
	assign kmin54=tmin54[cost_width:2]<={1'b0,agg0_54[cost_width-1:2]}?tmin54:{1'b0,agg0_54};
	assign kmin55=tmin55[cost_width:2]<={1'b0,agg0_55[cost_width-1:2]}?tmin55:{1'b0,agg0_55};
	assign kmin56=tmin56[cost_width:2]<={1'b0,agg0_56[cost_width-1:2]}?tmin56:{1'b0,agg0_56};
	assign kmin57=tmin57[cost_width:2]<={1'b0,agg0_57[cost_width-1:2]}?tmin57:{1'b0,agg0_57};
	assign kmin58=tmin58[cost_width:2]<={1'b0,agg0_58[cost_width-1:2]}?tmin58:{1'b0,agg0_58};
	assign kmin59=tmin59[cost_width:2]<={1'b0,agg0_59[cost_width-1:2]}?tmin59:{1'b0,agg0_59};
	assign kmin60=tmin60[cost_width:2]<={1'b0,agg0_60[cost_width-1:2]}?tmin60:{1'b0,agg0_60};
	assign kmin61=tmin61[cost_width:2]<={1'b0,agg0_61[cost_width-1:2]}?tmin61:{1'b0,agg0_61};
	assign kmin62=tmin62[cost_width:2]<={1'b0,agg0_62[cost_width-1:2]}?tmin62:{1'b0,agg0_62};
	assign kmin63=tmin63[cost_width:2]<={1'b0,agg0_63[cost_width-1:2]}?tmin63:{1'b0,agg0_63};

	assign Lmin0=kmin0-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin1=kmin1-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin2=kmin2-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin3=kmin3-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin4=kmin4-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin5=kmin5-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin6=kmin6-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin7=kmin7-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin8=kmin8-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin9=kmin9-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin10=kmin10-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin11=kmin11-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin12=kmin12-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin13=kmin13-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin14=kmin14-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin15=kmin15-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin16=kmin16-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin17=kmin17-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin18=kmin18-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin19=kmin19-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin20=kmin20-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin21=kmin21-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin22=kmin22-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin23=kmin23-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin24=kmin24-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin25=kmin25-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin26=kmin26-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin27=kmin27-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin28=kmin28-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin29=kmin29-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin30=kmin30-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin31=kmin31-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin32=kmin32-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin33=kmin33-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin34=kmin34-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin35=kmin35-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin36=kmin36-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin37=kmin37-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin38=kmin38-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin39=kmin39-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin40=kmin40-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin41=kmin41-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin42=kmin42-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin43=kmin43-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin44=kmin44-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin45=kmin45-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin46=kmin46-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin47=kmin47-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin48=kmin48-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin49=kmin49-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin50=kmin50-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin51=kmin51-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin52=kmin52-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin53=kmin53-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin54=kmin54-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin55=kmin55-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin56=kmin56-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin57=kmin57-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin58=kmin58-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin59=kmin59-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin60=kmin60-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin61=kmin61-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin62=kmin62-{1'b0,min_0_in[(cost_width-1):2],2'b0};
	assign Lmin63=kmin63-{1'b0,min_0_in[(cost_width-1):2],2'b0};


	wire [cost_width-3:0] temp135_1;
	 wire [cost_width-3:0] temp135_2[1:0];
	 wire [cost_width-3:0] temp135_3[3:0];
	 wire [cost_width-3:0] temp135_4[7:0];
	 wire [cost_width-3:0] temp135_5[15:0];
	 wire [cost_width-3:0] temp135_6[31:0];
	wire [cost_width-3:0] temp135_7[63:0];


	assign temp135_7[0] =cost_valid[0]   ? cost135_0 :{(cost_width-2){1'b1}};
	assign temp135_7[1] =cost_valid[1]   ? cost135_1 :{(cost_width-2){1'b1}};
	assign temp135_7[2] =cost_valid[2]   ? cost135_2 :{(cost_width-2){1'b1}};
	assign temp135_7[3] =cost_valid[3]   ? cost135_3 :{(cost_width-2){1'b1}};
	assign temp135_7[4] =cost_valid[4]   ? cost135_4 :{(cost_width-2){1'b1}};
	assign temp135_7[5] =cost_valid[5]   ? cost135_5 :{(cost_width-2){1'b1}};
	assign temp135_7[6] =cost_valid[6]   ? cost135_6 :{(cost_width-2){1'b1}};
	assign temp135_7[7] =cost_valid[7]   ? cost135_7 :{(cost_width-2){1'b1}};
	assign temp135_7[8] =cost_valid[8]   ? cost135_8 :{(cost_width-2){1'b1}};
	assign temp135_7[9] =cost_valid[9]   ? cost135_9 :{(cost_width-2){1'b1}};
	assign temp135_7[10]=cost_valid[10]  ? cost135_10:{(cost_width-2){1'b1}};
	assign temp135_7[11]=cost_valid[11]  ? cost135_11:{(cost_width-2){1'b1}};
	assign temp135_7[12]=cost_valid[12]  ? cost135_12:{(cost_width-2){1'b1}};
	assign temp135_7[13]=cost_valid[13]  ? cost135_13:{(cost_width-2){1'b1}};
	assign temp135_7[14]=cost_valid[14]  ? cost135_14:{(cost_width-2){1'b1}};
	assign temp135_7[15]=cost_valid[15]  ? cost135_15:{(cost_width-2){1'b1}};
	assign temp135_7[16]=cost_valid[16]  ? cost135_16:{(cost_width-2){1'b1}};
	assign temp135_7[17]=cost_valid[17]  ? cost135_17:{(cost_width-2){1'b1}};
	assign temp135_7[18]=cost_valid[18]  ? cost135_18:{(cost_width-2){1'b1}};
	assign temp135_7[19]=cost_valid[19]  ? cost135_19:{(cost_width-2){1'b1}};
	assign temp135_7[20]=cost_valid[20]  ? cost135_20:{(cost_width-2){1'b1}};
	assign temp135_7[21]=cost_valid[21]  ? cost135_21:{(cost_width-2){1'b1}};
	assign temp135_7[22]=cost_valid[22]  ? cost135_22:{(cost_width-2){1'b1}};
	assign temp135_7[23]=cost_valid[23]  ? cost135_23:{(cost_width-2){1'b1}};
	assign temp135_7[24]=cost_valid[24]  ? cost135_24:{(cost_width-2){1'b1}};
	assign temp135_7[25]=cost_valid[25]  ? cost135_25:{(cost_width-2){1'b1}};
	assign temp135_7[26]=cost_valid[26]  ? cost135_26:{(cost_width-2){1'b1}};
	assign temp135_7[27]=cost_valid[27]  ? cost135_27:{(cost_width-2){1'b1}};
	assign temp135_7[28]=cost_valid[28]  ? cost135_28:{(cost_width-2){1'b1}};
	assign temp135_7[29]=cost_valid[29]  ? cost135_29:{(cost_width-2){1'b1}};
	assign temp135_7[30]=cost_valid[30]  ? cost135_30:{(cost_width-2){1'b1}};
	assign temp135_7[31]=cost_valid[31]  ? cost135_31:{(cost_width-2){1'b1}};
	assign temp135_7[32]=cost_valid[32]  ? cost135_32:{(cost_width-2){1'b1}};
	assign temp135_7[33]=cost_valid[33]  ? cost135_33:{(cost_width-2){1'b1}};
	assign temp135_7[34]=cost_valid[34]  ? cost135_34:{(cost_width-2){1'b1}};
	assign temp135_7[35]=cost_valid[35]  ? cost135_35:{(cost_width-2){1'b1}};
	assign temp135_7[36]=cost_valid[36]  ? cost135_36:{(cost_width-2){1'b1}};
	assign temp135_7[37]=cost_valid[37]  ? cost135_37:{(cost_width-2){1'b1}};
	assign temp135_7[38]=cost_valid[38]  ? cost135_38:{(cost_width-2){1'b1}};
	assign temp135_7[39]=cost_valid[39]  ? cost135_39:{(cost_width-2){1'b1}};
	assign temp135_7[40]=cost_valid[40]  ? cost135_40:{(cost_width-2){1'b1}};
	assign temp135_7[41]=cost_valid[41]  ? cost135_41:{(cost_width-2){1'b1}};
	assign temp135_7[42]=cost_valid[42]  ? cost135_42:{(cost_width-2){1'b1}};
	assign temp135_7[43]=cost_valid[43]  ? cost135_43:{(cost_width-2){1'b1}};
	assign temp135_7[44]=cost_valid[44]  ? cost135_44:{(cost_width-2){1'b1}};
	assign temp135_7[45]=cost_valid[45]  ? cost135_45:{(cost_width-2){1'b1}};
	assign temp135_7[46]=cost_valid[46]  ? cost135_46:{(cost_width-2){1'b1}};
	assign temp135_7[47]=cost_valid[47]  ? cost135_47:{(cost_width-2){1'b1}};
	assign temp135_7[48]=cost_valid[48]  ? cost135_48:{(cost_width-2){1'b1}};
	assign temp135_7[49]=cost_valid[49]  ? cost135_49:{(cost_width-2){1'b1}};
	assign temp135_7[50]=cost_valid[50]  ? cost135_50:{(cost_width-2){1'b1}};
	assign temp135_7[51]=cost_valid[51]  ? cost135_51:{(cost_width-2){1'b1}};
	assign temp135_7[52]=cost_valid[52]  ? cost135_52:{(cost_width-2){1'b1}};
	assign temp135_7[53]=cost_valid[53]  ? cost135_53:{(cost_width-2){1'b1}};
	assign temp135_7[54]=cost_valid[54]  ? cost135_54:{(cost_width-2){1'b1}};
	assign temp135_7[55]=cost_valid[55]  ? cost135_55:{(cost_width-2){1'b1}};
	assign temp135_7[56]=cost_valid[56]  ? cost135_56:{(cost_width-2){1'b1}};
	assign temp135_7[57]=cost_valid[57]  ? cost135_57:{(cost_width-2){1'b1}};
	assign temp135_7[58]=cost_valid[58]  ? cost135_58:{(cost_width-2){1'b1}};
	assign temp135_7[59]=cost_valid[59]  ? cost135_59:{(cost_width-2){1'b1}};
	assign temp135_7[60]=cost_valid[60]  ? cost135_60:{(cost_width-2){1'b1}};
	assign temp135_7[61]=cost_valid[61]  ? cost135_61:{(cost_width-2){1'b1}};
	assign temp135_7[62]=cost_valid[62]  ? cost135_62:{(cost_width-2){1'b1}};
	assign temp135_7[63]=cost_valid[63]  ? cost135_63:{(cost_width-2){1'b1}};

	 genvar j;
	 generate for(j=0;j<32;j=j+1) begin: CompareLoop6
	 		assign temp135_6[j]=temp135_7[j*2] <= temp135_7[j*2+1] ? temp135_7[j*2] : temp135_7[j*2+1];
	 	end
	 endgenerate
	 genvar i;
	 generate for(i=0;i<16;i=i+1) begin: CompareLoop5
	 		assign temp135_5[i]=temp135_6[i*2] <= temp135_6[i*2+1] ? temp135_6[i*2] : temp135_6[i*2+1];
	 	end
	 endgenerate

	
	 assign temp135_4[0]=temp135_5[0]<=temp135_5[1] ?temp135_5[0]:temp135_5[1];
	 assign temp135_4[1]=temp135_5[2]<=temp135_5[3] ?temp135_5[2]:temp135_5[3];
	 assign temp135_4[2]=temp135_5[4]<=temp135_5[5] ?temp135_5[4]:temp135_5[5];
	 assign temp135_4[3]=temp135_5[6]<=temp135_5[7] ?temp135_5[6]:temp135_5[7];
	 assign temp135_4[4]=temp135_5[8]<=temp135_5[9] ?temp135_5[8]:temp135_5[9];
	 assign temp135_4[5]=temp135_5[10]<=temp135_5[11] ?temp135_5[10]:temp135_5[11];
	 assign temp135_4[6]=temp135_5[12]<=temp135_5[13] ?temp135_5[12]:temp135_5[13];
	 assign temp135_4[7]=temp135_5[14]<=temp135_5[15] ?temp135_5[14]:temp135_5[15];
	
	 assign temp135_3[0]=temp135_4[0]<=temp135_4[1] ?temp135_4[0]:temp135_4[1];
	 assign temp135_3[1]=temp135_4[2]<=temp135_4[3] ?temp135_4[2]:temp135_4[3];
	 assign temp135_3[2]=temp135_4[4]<=temp135_4[5] ?temp135_4[4]:temp135_4[5];
	 assign temp135_3[3]=temp135_4[6]<=temp135_4[7] ?temp135_4[6]:temp135_4[7];
	
	 assign temp135_2[0]=temp135_3[0]<=temp135_3[1] ?temp135_3[0]:temp135_3[1];
	 assign temp135_2[1]=temp135_3[2]<=temp135_3[3] ?temp135_3[2]:temp135_3[3];
	
	 
     assign temp135_1=temp135_2[0]<=temp135_2[1] ?temp135_2[0]:temp135_2[1];
	
//    wire line_add [(cost_width-3):0];
//	wire [63:0] line  [(cost_width-3):0];
//	wire [63:0] line_sel[(cost_width-3):0];
//	wire [63:0] line_com[(cost_width-3):1];
//
//	
//	genvar i;
//	generate for(i=0;i<(cost_width-2);i=i+1) begin: line_loop
//		assign line[(cost_width-3)-i] = {temp135_7[0][i], temp135_7[1][i], temp135_7[2][i], temp135_7[3][i], temp135_7[4][i], temp135_7[5][i], temp135_7[6][i], temp135_7[7][i],
//							temp135_7[8][i], temp135_7[9][i], temp135_7[10][i],temp135_7[11][i],temp135_7[12][i],temp135_7[13][i],temp135_7[14][i],temp135_7[15][i],
//							temp135_7[16][i],temp135_7[17][i],temp135_7[18][i],temp135_7[19][i],temp135_7[20][i],temp135_7[21][i],temp135_7[22][i],temp135_7[23][i],
//							temp135_7[24][i],temp135_7[25][i],temp135_7[26][i],temp135_7[27][i],temp135_7[28][i],temp135_7[29][i],temp135_7[30][i],temp135_7[31][i],
//							temp135_7[32][i],temp135_7[33][i],temp135_7[34][i],temp135_7[35][i],temp135_7[36][i],temp135_7[37][i],temp135_7[38][i],temp135_7[39][i],
//							temp135_7[40][i],temp135_7[41][i],temp135_7[42][i],temp135_7[43][i],temp135_7[44][i],temp135_7[45][i],temp135_7[46][i],temp135_7[47][i],
//							temp135_7[48][i],temp135_7[49][i],temp135_7[50][i],temp135_7[51][i],temp135_7[52][i],temp135_7[53][i],temp135_7[54][i],temp135_7[55][i],
//							temp135_7[56][i],temp135_7[57][i],temp135_7[58][i],temp135_7[59][i],temp135_7[60][i],temp135_7[61][i],temp135_7[62][i],temp135_7[63][i]};
//	end
//	endgenerate
//
//	assign line_add[0]= & line[0];
//	assign line_sel[0]=(line_add[0] ) ? ~line[0]:line[0];

//	genvar j;
//	generate for(i=1;i<(cost_width-2);i=i+1) begin: loop135
//	    assign line_com[i] = line_sel[i-1] | line[i];
//	    assign line_add[i]= & line_com[i];
//	    assign line_sel[i]=(line_add[i] ) ? line_sel[i-1]:line_com[i];
//	
//	end
//	endgenerate
//
//	always @(*) begin
//		if(!line_sel[(cost_width-3)][63]) begin
//			temp135_1=temp135_7[0];
//		end
//		else if (!line_sel[(cost_width-3)][62])begin
//			temp135_1=temp135_7[1];
//		end
//		else if (!line_sel[(cost_width-3)][61])begin
//			temp135_1=temp135_7[2];
//		end
//		else if (!line_sel[(cost_width-3)][60])begin
//			temp135_1=temp135_7[3];
//		end
//		else if (!line_sel[(cost_width-3)][59])begin
//			temp135_1=temp135_7[4];
//		end
//		else if (!line_sel[(cost_width-3)][58])begin
//			temp135_1=temp135_7[5];
//		end
//		else if (!line_sel[(cost_width-3)][57])begin
//			temp135_1=temp135_7[6];
//		end
//		else if (!line_sel[(cost_width-3)][56])begin
//			temp135_1=temp135_7[7];
//		end
//		else if (!line_sel[(cost_width-3)][55])begin
//			temp135_1=temp135_7[8];
//		end
//		else if (!line_sel[(cost_width-3)][54])begin
//			temp135_1=temp135_7[9];
//		end
//		else if (!line_sel[(cost_width-3)][53])begin
//			temp135_1=temp135_7[10];
//		end
//		else if (!line_sel[(cost_width-3)][52])begin
//			temp135_1=temp135_7[11];
//		end
//		else if (!line_sel[(cost_width-3)][51])begin
//			temp135_1=temp135_7[12];
//		end
//		else if (!line_sel[(cost_width-3)][50])begin
//			temp135_1=temp135_7[13];
//		end
//		else if (!line_sel[(cost_width-3)][49])begin
//			temp135_1=temp135_7[14];
//		end
//		else if (!line_sel[(cost_width-3)][48])begin
//			temp135_1=temp135_7[15];
//		end
//		else if (!line_sel[(cost_width-3)][47])begin
//			temp135_1=temp135_7[16];
//		end
//		else if (!line_sel[(cost_width-3)][46])begin
//			temp135_1=temp135_7[17];
//		end
//		else if (!line_sel[(cost_width-3)][45])begin
//			temp135_1=temp135_7[18];
//		end
//		else if (!line_sel[(cost_width-3)][44])begin
//			temp135_1=temp135_7[19];
//		end
//		else if (!line_sel[(cost_width-3)][43])begin
//			temp135_1=temp135_7[20];
//		end
//		else if (!line_sel[(cost_width-3)][42])begin
//			temp135_1=temp135_7[21];
//		end	
//		else if (!line_sel[(cost_width-3)][41])begin
//			temp135_1=temp135_7[22];
//		end
//		else if (!line_sel[(cost_width-3)][40])begin
//			temp135_1=temp135_7[23];
//		end
//		else if (!line_sel[(cost_width-3)][39])begin
//			temp135_1=temp135_7[24];
//		end
//		else if (!line_sel[(cost_width-3)][38])begin
//			temp135_1=temp135_7[25];
//		end
//		else if (!line_sel[(cost_width-3)][37])begin
//			temp135_1=temp135_7[26];
//		end
//		else if (!line_sel[(cost_width-3)][36])begin
//			temp135_1=temp135_7[27];
//		end
//		else if (!line_sel[(cost_width-3)][35])begin
//			temp135_1=temp135_7[28];
//		end
//		else if (!line_sel[(cost_width-3)][34])begin
//			temp135_1=temp135_7[29];
//		end
//		else if (!line_sel[(cost_width-3)][33])begin
//			temp135_1=temp135_7[30];
//		end
//		else if (!line_sel[(cost_width-3)][32])begin
//			temp135_1=temp135_7[31];
//		end
//		else if (!line_sel[(cost_width-3)][31])begin
//			temp135_1=temp135_7[32];
//		end
//		else if (!line_sel[(cost_width-3)][30])begin
//			temp135_1=temp135_7[33];
//		end
//		else if (!line_sel[(cost_width-3)][29])begin
//			temp135_1=temp135_7[34];
//		end
//		else if (!line_sel[(cost_width-3)][28])begin
//			temp135_1=temp135_7[35];
//		end
//		else if (!line_sel[(cost_width-3)][27])begin
//			temp135_1=temp135_7[36];
//		end
//		else if (!line_sel[(cost_width-3)][26])begin
//			temp135_1=temp135_7[37];
//		end
//		else if (!line_sel[(cost_width-3)][25])begin
//			temp135_1=temp135_7[38];
//		end
//		else if (!line_sel[(cost_width-3)][24])begin
//			temp135_1=temp135_7[39];
//		end
//		else if (!line_sel[(cost_width-3)][23])begin
//			temp135_1=temp135_7[40];
//		end
//		else if (!line_sel[(cost_width-3)][22])begin
//			temp135_1=temp135_7[41];
//		end
//		else if (!line_sel[(cost_width-3)][21])begin
//			temp135_1=temp135_7[42];
//		end	
//		else if (!line_sel[(cost_width-3)][20])begin
//			temp135_1=temp135_7[43];
//		end
//		else if (!line_sel[(cost_width-3)][19])begin
//			temp135_1=temp135_7[44];
//		end
//		else if (!line_sel[(cost_width-3)][18])begin
//			temp135_1=temp135_7[45];
//		end
//		else if (!line_sel[(cost_width-3)][17])begin
//			temp135_1=temp135_7[46];
//		end
//		else if (!line_sel[(cost_width-3)][16])begin
//			temp135_1=temp135_7[47];
//		end
//		else if (!line_sel[(cost_width-3)][15])begin
//			temp135_1=temp135_7[48];
//		end
//		else if (!line_sel[(cost_width-3)][14])begin
//			temp135_1=temp135_7[49];
//		end
//		else if (!line_sel[(cost_width-3)][13])begin
//			temp135_1=temp135_7[50];
//		end
//		else if (!line_sel[(cost_width-3)][12])begin
//			temp135_1=temp135_7[51];
//		end
//		else if (!line_sel[(cost_width-3)][11])begin
//			temp135_1=temp135_7[52];
//		end
//		else if (!line_sel[(cost_width-3)][10])begin
//			temp135_1=temp135_7[53];
//		end
//		else if (!line_sel[(cost_width-3)][9])begin
//			temp135_1=temp135_7[54];
//		end
//		else if (!line_sel[(cost_width-3)][8])begin
//			temp135_1=temp135_7[55];
//		end
//		else if (!line_sel[(cost_width-3)][7])begin
//			temp135_1=temp135_7[56];
//		end
//		else if (!line_sel[(cost_width-3)][6])begin
//			temp135_1=temp135_7[57];
//		end
//		else if (!line_sel[(cost_width-3)][5])begin
//			temp135_1=temp135_7[58];
//		end
//		else if (!line_sel[(cost_width-3)][4])begin
//			temp135_1=temp135_7[59];
//		end
//		else if (!line_sel[(cost_width-3)][3])begin
//			temp135_1=temp135_7[60];
//		end
//		else if (!line_sel[(cost_width-3)][2])begin
//			temp135_1=temp135_7[61];
//		end
//		else if (!line_sel[(cost_width-3)][1])begin
//			temp135_1=temp135_7[62];
//		end
//		else if (!line_sel[(cost_width-3)][0])begin
//			temp135_1=temp135_7[63];
//		end
//		else begin
//			temp135_1=temp135_7[0];
//		end	
//	end

	wire [cost_width:0] agg0_result[63:0];

	assign agg0_result[0] =cost0_0+Lmin0;
	assign agg0_result[1] =cost0_1+Lmin1;
	assign agg0_result[2] =cost0_2+Lmin2;
	assign agg0_result[3] =cost0_3+Lmin3;
	assign agg0_result[4] =cost0_4+Lmin4;
	assign agg0_result[5] =cost0_5+Lmin5;
	assign agg0_result[6] =cost0_6+Lmin6;
	assign agg0_result[7] =cost0_7+Lmin7;
	assign agg0_result[8] =cost0_8+Lmin8;
	assign agg0_result[9] =cost0_9+Lmin9;
	assign agg0_result[10] =cost0_10+Lmin10;
	assign agg0_result[11] =cost0_11+Lmin11;
	assign agg0_result[12] =cost0_12+Lmin12;
	assign agg0_result[13] =cost0_13+Lmin13;
	assign agg0_result[14] =cost0_14+Lmin14;
	assign agg0_result[15] =cost0_15+Lmin15;
	assign agg0_result[16] =cost0_16+Lmin16;
	assign agg0_result[17] =cost0_17+Lmin17;
	assign agg0_result[18] =cost0_18+Lmin18;
	assign agg0_result[19] =cost0_19+Lmin19;
	assign agg0_result[20] =cost0_20+Lmin20;
	assign agg0_result[21] =cost0_21+Lmin21;
	assign agg0_result[22] =cost0_22+Lmin22;
	assign agg0_result[23] =cost0_23+Lmin23;
	assign agg0_result[24] =cost0_24+Lmin24;
	assign agg0_result[25] =cost0_25+Lmin25;
	assign agg0_result[26] =cost0_26+Lmin26;
	assign agg0_result[27] =cost0_27+Lmin27;
	assign agg0_result[28] =cost0_28+Lmin28;
	assign agg0_result[29] =cost0_29+Lmin29;
	assign agg0_result[30] =cost0_30+Lmin30;
	assign agg0_result[31] =cost0_31+Lmin31;
	assign agg0_result[32] =cost0_32+Lmin32;
	assign agg0_result[33] =cost0_33+Lmin33;
	assign agg0_result[34] =cost0_34+Lmin34;
	assign agg0_result[35] =cost0_35+Lmin35;
	assign agg0_result[36] =cost0_36+Lmin36;
	assign agg0_result[37] =cost0_37+Lmin37;
	assign agg0_result[38] =cost0_38+Lmin38;
	assign agg0_result[39] =cost0_39+Lmin39;
	assign agg0_result[40] =cost0_40+Lmin40;
	assign agg0_result[41] =cost0_41+Lmin41;
	assign agg0_result[42] =cost0_42+Lmin42;
	assign agg0_result[43] =cost0_43+Lmin43;
	assign agg0_result[44] =cost0_44+Lmin44;
	assign agg0_result[45] =cost0_45+Lmin45;
	assign agg0_result[46] =cost0_46+Lmin46;
	assign agg0_result[47] =cost0_47+Lmin47;
	assign agg0_result[48] =cost0_48+Lmin48;
	assign agg0_result[49] =cost0_49+Lmin49;
	assign agg0_result[50] =cost0_50+Lmin50;
	assign agg0_result[51] =cost0_51+Lmin51;
	assign agg0_result[52] =cost0_52+Lmin52;
	assign agg0_result[53] =cost0_53+Lmin53;
	assign agg0_result[54] =cost0_54+Lmin54;
	assign agg0_result[55] =cost0_55+Lmin55;
	assign agg0_result[56] =cost0_56+Lmin56;
	assign agg0_result[57] =cost0_57+Lmin57;
	assign agg0_result[58] =cost0_58+Lmin58;
	assign agg0_result[59] =cost0_59+Lmin59;
	assign agg0_result[60] =cost0_60+Lmin60;
	assign agg0_result[61] =cost0_61+Lmin61;	
	assign agg0_result[62] =cost0_62+Lmin62;
	assign agg0_result[63] =cost0_63+Lmin63;	

	wire [cost_width-1:0] temp0_1;
	 wire [cost_width-1:0] temp0_2[1:0];
	 wire [cost_width-1:0] temp0_3[3:0];
	 wire [cost_width-1:0] temp0_4[7:0];
	 wire [cost_width-1:0] temp0_5[15:0];
	 wire [cost_width-1:0] temp0_6[31:0];
	wire [cost_width-1:0] temp0_7[63:0];

	assign temp0_7[0] =cost_valid[0]   ? agg0_result[0][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[1] =cost_valid[1]   ? agg0_result[1][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[2] =cost_valid[2]   ? agg0_result[2][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[3] =cost_valid[3]   ? agg0_result[3][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[4] =cost_valid[4]   ? agg0_result[4][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[5] =cost_valid[5]   ? agg0_result[5][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[6] =cost_valid[6]   ? agg0_result[6][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[7] =cost_valid[7]   ? agg0_result[7][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[8] =cost_valid[8]   ? agg0_result[8][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[9] =cost_valid[9]   ? agg0_result[9][cost_width-1:0] :{cost_width{1'b1}};
	assign temp0_7[10]=cost_valid[10]  ? agg0_result[10][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[11]=cost_valid[11]  ? agg0_result[11][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[12]=cost_valid[12]  ? agg0_result[12][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[13]=cost_valid[13]  ? agg0_result[13][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[14]=cost_valid[14]  ? agg0_result[14][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[15]=cost_valid[15]  ? agg0_result[15][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[16]=cost_valid[16]  ? agg0_result[16][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[17]=cost_valid[17]  ? agg0_result[17][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[18]=cost_valid[18]  ? agg0_result[18][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[19]=cost_valid[19]  ? agg0_result[19][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[20]=cost_valid[20]  ? agg0_result[20][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[21]=cost_valid[21]  ? agg0_result[21][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[22]=cost_valid[22]  ? agg0_result[22][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[23]=cost_valid[23]  ? agg0_result[23][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[24]=cost_valid[24]  ? agg0_result[24][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[25]=cost_valid[25]  ? agg0_result[25][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[26]=cost_valid[26]  ? agg0_result[26][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[27]=cost_valid[27]  ? agg0_result[27][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[28]=cost_valid[28]  ? agg0_result[28][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[29]=cost_valid[29]  ? agg0_result[29][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[30]=cost_valid[30]  ? agg0_result[30][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[31]=cost_valid[31]  ? agg0_result[31][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[32]=cost_valid[32]  ? agg0_result[32][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[33]=cost_valid[33]  ? agg0_result[33][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[34]=cost_valid[34]  ? agg0_result[34][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[35]=cost_valid[35]  ? agg0_result[35][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[36]=cost_valid[36]  ? agg0_result[36][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[37]=cost_valid[37]  ? agg0_result[37][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[38]=cost_valid[38]  ? agg0_result[38][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[39]=cost_valid[39]  ? agg0_result[39][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[40]=cost_valid[40]  ? agg0_result[40][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[41]=cost_valid[41]  ? agg0_result[41][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[42]=cost_valid[42]  ? agg0_result[42][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[43]=cost_valid[43]  ? agg0_result[43][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[44]=cost_valid[44]  ? agg0_result[44][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[45]=cost_valid[45]  ? agg0_result[45][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[46]=cost_valid[46]  ? agg0_result[46][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[47]=cost_valid[47]  ? agg0_result[47][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[48]=cost_valid[48]  ? agg0_result[48][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[49]=cost_valid[49]  ? agg0_result[49][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[50]=cost_valid[50]  ? agg0_result[50][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[51]=cost_valid[51]  ? agg0_result[51][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[52]=cost_valid[52]  ? agg0_result[52][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[53]=cost_valid[53]  ? agg0_result[53][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[54]=cost_valid[54]  ? agg0_result[54][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[55]=cost_valid[55]  ? agg0_result[55][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[56]=cost_valid[56]  ? agg0_result[56][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[57]=cost_valid[57]  ? agg0_result[57][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[58]=cost_valid[58]  ? agg0_result[58][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[59]=cost_valid[59]  ? agg0_result[59][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[60]=cost_valid[60]  ? agg0_result[60][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[61]=cost_valid[61]  ? agg0_result[61][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[62]=cost_valid[62]  ? agg0_result[62][cost_width-1:0]:{cost_width{1'b1}};
	assign temp0_7[63]=cost_valid[63]  ? agg0_result[63][cost_width-1:0]:{cost_width{1'b1}};

	 genvar k;
	 generate for(k=0;k<32;k=k+1) begin: CompareLoop6_0
	 		assign temp0_6[k]=temp0_7[k*2][cost_width-1:2] <= temp0_7[k*2+1][cost_width-1:2] ? temp0_7[k*2] : temp0_7[k*2+1];
	 	end
	 endgenerate
	 genvar m;
	 generate for(m=0;m<16;m=m+1) begin: CompareLoop5_0
	 		assign temp0_5[m]=temp0_6[m*2][cost_width-1:2] <= temp0_6[m*2+1][cost_width-1:2] ? temp0_6[m*2] : temp0_6[m*2+1];
	 	end
	 endgenerate
	
	assign temp0_4[0]=temp0_5[0][cost_width-1:2]<=temp0_5[1][cost_width-1:2] ?temp0_5[0]:temp0_5[1];
	assign temp0_4[1]=temp0_5[2][cost_width-1:2]<=temp0_5[3][cost_width-1:2] ?temp0_5[2]:temp0_5[3];
	assign temp0_4[2]=temp0_5[4][cost_width-1:2]<=temp0_5[5][cost_width-1:2] ?temp0_5[4]:temp0_5[5];
	assign temp0_4[3]=temp0_5[6][cost_width-1:2]<=temp0_5[7][cost_width-1:2] ?temp0_5[6]:temp0_5[7];
	assign temp0_4[4]=temp0_5[8][cost_width-1:2]<=temp0_5[9][cost_width-1:2] ?temp0_5[8]:temp0_5[9];
	assign temp0_4[5]=temp0_5[10][cost_width-1:2]<=temp0_5[11][cost_width-1:2] ?temp0_5[10]:temp0_5[11];
	assign temp0_4[6]=temp0_5[12][cost_width-1:2]<=temp0_5[13][cost_width-1:2] ?temp0_5[12]:temp0_5[13];
	assign temp0_4[7]=temp0_5[14][cost_width-1:2]<=temp0_5[15][cost_width-1:2] ?temp0_5[14]:temp0_5[15];
	
	assign temp0_3[0]=temp0_4[0][cost_width-1:2]<=temp0_4[1][cost_width-1:2] ?temp0_4[0]:temp0_4[1];
	assign temp0_3[1]=temp0_4[2][cost_width-1:2]<=temp0_4[3][cost_width-1:2] ?temp0_4[2]:temp0_4[3];
	assign temp0_3[2]=temp0_4[4][cost_width-1:2]<=temp0_4[5][cost_width-1:2] ?temp0_4[4]:temp0_4[5];
	assign temp0_3[3]=temp0_4[6][cost_width-1:2]<=temp0_4[7][cost_width-1:2] ?temp0_4[6]:temp0_4[7];
	
	assign temp0_2[0]=temp0_3[0][cost_width-1:2]<=temp0_3[1][cost_width-1:2] ?temp0_3[0]:temp0_3[1];
	assign temp0_2[1]=temp0_3[2][cost_width-1:2]<=temp0_3[3][cost_width-1:2] ?temp0_3[2]:temp0_3[3];
	
	assign temp0_1=temp0_2[0][cost_width-1:2]<=temp0_2[1][cost_width-1:2] ?temp0_2[0]:temp0_2[1];

//    wire line0_add [(cost_width-3):0];
//	wire [63:0] line0  [(cost_width-3):0];
//	wire [63:0] line0_sel[(cost_width-3):0];
//	wire [63:0] line0_com[(cost_width-3):1];
//
//	
//	genvar k;
//	generate for(k=0;k<(cost_width-2);k=k+1) begin: line0_loop
//		assign line0[(cost_width-3)-k] = {temp0_7[0][k+2], temp0_7[1][k+2], temp0_7[2][k+2], temp0_7[3][k+2], temp0_7[4][k+2], temp0_7[5][k+2], temp0_7[6][k+2], temp0_7[7][k+2],
//							 temp0_7[8][k+2], temp0_7[9][k+2], temp0_7[10][k+2],temp0_7[11][k+2],temp0_7[12][k+2],temp0_7[13][k+2],temp0_7[14][k+2],temp0_7[15][k+2],
//							 temp0_7[16][k+2],temp0_7[17][k+2],temp0_7[18][k+2],temp0_7[19][k+2],temp0_7[20][k+2],temp0_7[21][k+2],temp0_7[22][k+2],temp0_7[23][k+2],
//							 temp0_7[24][k+2],temp0_7[25][k+2],temp0_7[26][k+2],temp0_7[27][k+2],temp0_7[28][k+2],temp0_7[29][k+2],temp0_7[30][k+2],temp0_7[31][k+2],
//							 temp0_7[32][k+2],temp0_7[33][k+2],temp0_7[34][k+2],temp0_7[35][k+2],temp0_7[36][k+2],temp0_7[37][k+2],temp0_7[38][k+2],temp0_7[39][k+2],
//							 temp0_7[40][k+2],temp0_7[41][k+2],temp0_7[42][k+2],temp0_7[43][k+2],temp0_7[44][k+2],temp0_7[45][k+2],temp0_7[46][k+2],temp0_7[47][k+2],
//							 temp0_7[48][k+2],temp0_7[49][k+2],temp0_7[50][k+2],temp0_7[51][k+2],temp0_7[52][k+2],temp0_7[53][k+2],temp0_7[54][k+2],temp0_7[55][k+2],
//							 temp0_7[56][k+2],temp0_7[57][k+2],temp0_7[58][k+2],temp0_7[59][k+2],temp0_7[60][k+2],temp0_7[61][k+2],temp0_7[62][k+2],temp0_7[63][k+2]};
//	end
//	endgenerate
//
//	assign line0_add[0]= & line0[0];
//	assign line0_sel[0]=(line0_add[0] ) ? ~line0[0]:line0[0];
//
//	genvar m;
//	generate for(m=1;m<(cost_width-2);m=m+1) begin: loop0
//	    assign line0_com[m] = line0_sel[m-1] | line0[m];
//	    assign line0_add[m]= & line0_com[m];
//	    assign line0_sel[m]=(line0_add[m] ) ? line0_sel[m-1]:line0_com[m];
//	
//	end
//	endgenerate
//
//	always @(*) begin
//		if(!line0_sel[(cost_width-3)][63]) begin
//			temp0_1=temp0_7[0];
//		end
//		else if (!line0_sel[(cost_width-3)][62])begin
//			temp0_1=temp0_7[1];
//		end
//		else if (!line0_sel[(cost_width-3)][61])begin
//			temp0_1=temp0_7[2];
//		end
//		else if (!line0_sel[(cost_width-3)][60])begin
//			temp0_1=temp0_7[3];
//		end
//		else if (!line0_sel[(cost_width-3)][59])begin
//			temp0_1=temp0_7[4];
//		end
//		else if (!line0_sel[(cost_width-3)][58])begin
//			temp0_1=temp0_7[5];
//		end
//		else if (!line0_sel[(cost_width-3)][57])begin
//			temp0_1=temp0_7[6];
//		end
//		else if (!line0_sel[(cost_width-3)][56])begin
//			temp0_1=temp0_7[7];
//		end
//		else if (!line0_sel[(cost_width-3)][55])begin
//			temp0_1=temp0_7[8];
//		end
//		else if (!line0_sel[(cost_width-3)][54])begin
//			temp0_1=temp0_7[9];
//		end
//		else if (!line0_sel[(cost_width-3)][53])begin
//			temp0_1=temp0_7[10];
//		end
//		else if (!line0_sel[(cost_width-3)][52])begin
//			temp0_1=temp0_7[11];
//		end
//		else if (!line0_sel[(cost_width-3)][51])begin
//			temp0_1=temp0_7[12];
//		end
//		else if (!line0_sel[(cost_width-3)][50])begin
//			temp0_1=temp0_7[13];
//		end
//		else if (!line0_sel[(cost_width-3)][49])begin
//			temp0_1=temp0_7[14];
//		end
//		else if (!line0_sel[(cost_width-3)][48])begin
//			temp0_1=temp0_7[15];
//		end
//		else if (!line0_sel[(cost_width-3)][47])begin
//			temp0_1=temp0_7[16];
//		end
//		else if (!line0_sel[(cost_width-3)][46])begin
//			temp0_1=temp0_7[17];
//		end
//		else if (!line0_sel[(cost_width-3)][45])begin
//			temp0_1=temp0_7[18];
//		end
//		else if (!line0_sel[(cost_width-3)][44])begin
//			temp0_1=temp0_7[19];
//		end
//		else if (!line0_sel[(cost_width-3)][43])begin
//			temp0_1=temp0_7[20];
//		end
//		else if (!line0_sel[(cost_width-3)][42])begin
//			temp0_1=temp0_7[21];
//		end	
//		else if (!line0_sel[(cost_width-3)][41])begin
//			temp0_1=temp0_7[22];
//		end
//		else if (!line0_sel[(cost_width-3)][40])begin
//			temp0_1=temp0_7[23];
//		end
//		else if (!line0_sel[(cost_width-3)][39])begin
//			temp0_1=temp0_7[24];
//		end
//		else if (!line0_sel[(cost_width-3)][38])begin
//			temp0_1=temp0_7[25];
//		end
//		else if (!line0_sel[(cost_width-3)][37])begin
//			temp0_1=temp0_7[26];
//		end
//		else if (!line0_sel[(cost_width-3)][36])begin
//			temp0_1=temp0_7[27];
//		end
//		else if (!line0_sel[(cost_width-3)][35])begin
//			temp0_1=temp0_7[28];
//		end
//		else if (!line0_sel[(cost_width-3)][34])begin
//			temp0_1=temp0_7[29];
//		end
//		else if (!line0_sel[(cost_width-3)][33])begin
//			temp0_1=temp0_7[30];
//		end
//		else if (!line0_sel[(cost_width-3)][32])begin
//			temp0_1=temp0_7[31];
//		end
//		else if (!line0_sel[(cost_width-3)][31])begin
//			temp0_1=temp0_7[32];
//		end
//		else if (!line0_sel[(cost_width-3)][30])begin
//			temp0_1=temp0_7[33];
//		end
//		else if (!line0_sel[(cost_width-3)][29])begin
//			temp0_1=temp0_7[34];
//		end
//		else if (!line0_sel[(cost_width-3)][28])begin
//			temp0_1=temp0_7[35];
//		end
//		else if (!line0_sel[(cost_width-3)][27])begin
//			temp0_1=temp0_7[36];
//		end
//		else if (!line0_sel[(cost_width-3)][26])begin
//			temp0_1=temp0_7[37];
//		end
//		else if (!line0_sel[(cost_width-3)][25])begin
//			temp0_1=temp0_7[38];
//		end
//		else if (!line0_sel[(cost_width-3)][24])begin
//			temp0_1=temp0_7[39];
//		end
//		else if (!line0_sel[(cost_width-3)][23])begin
//			temp0_1=temp0_7[40];
//		end
//		else if (!line0_sel[(cost_width-3)][22])begin
//			temp0_1=temp0_7[41];
//		end
//		else if (!line0_sel[(cost_width-3)][21])begin
//			temp0_1=temp0_7[42];
//		end	
//		else if (!line0_sel[(cost_width-3)][20])begin
//			temp0_1=temp0_7[43];
//		end
//		else if (!line0_sel[(cost_width-3)][19])begin
//			temp0_1=temp0_7[44];
//		end
//		else if (!line0_sel[(cost_width-3)][18])begin
//			temp0_1=temp0_7[45];
//		end
//		else if (!line0_sel[(cost_width-3)][17])begin
//			temp0_1=temp0_7[46];
//		end
//		else if (!line0_sel[(cost_width-3)][16])begin
//			temp0_1=temp0_7[47];
//		end
//		else if (!line0_sel[(cost_width-3)][15])begin
//			temp0_1=temp0_7[48];
//		end
//		else if (!line0_sel[(cost_width-3)][14])begin
//			temp0_1=temp0_7[49];
//		end
//		else if (!line0_sel[(cost_width-3)][13])begin
//			temp0_1=temp0_7[50];
//		end
//		else if (!line0_sel[(cost_width-3)][12])begin
//			temp0_1=temp0_7[51];
//		end
//		else if (!line0_sel[(cost_width-3)][11])begin
//			temp0_1=temp0_7[52];
//		end
//		else if (!line0_sel[(cost_width-3)][10])begin
//			temp0_1=temp0_7[53];
//		end
//		else if (!line0_sel[(cost_width-3)][9])begin
//			temp0_1=temp0_7[54];
//		end
//		else if (!line0_sel[(cost_width-3)][8])begin
//			temp0_1=temp0_7[55];
//		end
//		else if (!line0_sel[(cost_width-3)][7])begin
//			temp0_1=temp0_7[56];
//		end
//		else if (!line0_sel[(cost_width-3)][6])begin
//			temp0_1=temp0_7[57];
//		end
//		else if (!line0_sel[(cost_width-3)][5])begin
//			temp0_1=temp0_7[58];
//		end
//		else if (!line0_sel[(cost_width-3)][4])begin
//			temp0_1=temp0_7[59];
//		end
//		else if (!line0_sel[(cost_width-3)][3])begin
//			temp0_1=temp0_7[60];
//		end
//		else if (!line0_sel[(cost_width-3)][2])begin
//			temp0_1=temp0_7[61];
//		end
//		else if (!line0_sel[(cost_width-3)][1])begin
//			temp0_1=temp0_7[62];
//		end
//		else if (!line0_sel[(cost_width-3)][0])begin
//			temp0_1=temp0_7[63];
//		end
//		else begin
//			temp0_1=temp0_7[0];
//		end	
//	end
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
	  L0_32<={cost_width{1'b0}};
	  L0_33<={cost_width{1'b0}};
	  L0_34<={cost_width{1'b0}};
	  L0_35<={cost_width{1'b0}};
	  L0_36<={cost_width{1'b0}};
	  L0_37<={cost_width{1'b0}};
	  L0_38<={cost_width{1'b0}};
	  L0_39<={cost_width{1'b0}};
	  L0_40<={cost_width{1'b0}};
	  L0_41<={cost_width{1'b0}};
	  L0_42<={cost_width{1'b0}};
	  L0_43<={cost_width{1'b0}};
	  L0_44<={cost_width{1'b0}};
	  L0_45<={cost_width{1'b0}};
	  L0_46<={cost_width{1'b0}};
	  L0_47<={cost_width{1'b0}};
	  L0_48<={cost_width{1'b0}};
	  L0_49<={cost_width{1'b0}};
	  L0_50<={cost_width{1'b0}};
	  L0_51<={cost_width{1'b0}};
	  L0_52<={cost_width{1'b0}};
	  L0_53<={cost_width{1'b0}};
	  L0_54<={cost_width{1'b0}};
	  L0_55<={cost_width{1'b0}};
	  L0_56<={cost_width{1'b0}};
	  L0_57<={cost_width{1'b0}};
	  L0_58<={cost_width{1'b0}};
	  L0_59<={cost_width{1'b0}};
	  L0_60<={cost_width{1'b0}};
	  L0_61<={cost_width{1'b0}};
	  L0_62<={cost_width{1'b0}};
	  L0_63<={cost_width{1'b0}};

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
     min_135<={(cost_width-2){1'b0}};
	  min_0_out<={cost_width{1'b0}};
	end
	else if(clken) begin
		//The first pixel(No aggregation of 0°)
		if(en_first==1)begin
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
			min_135<=temp135_1;
			min_0_out<={cost_width{1'b0}};
		end
		else begin
			//0
			L0_0<=agg0_result[0];
			L0_1<=agg0_result[1];
			L0_2<=agg0_result[2];
			L0_3<=agg0_result[3];
			L0_4<=agg0_result[4];
			L0_5<=agg0_result[5];
			L0_6<=agg0_result[6];
			L0_7<=agg0_result[7];
			L0_8<=agg0_result[8];
			L0_9<=agg0_result[9];
			L0_10<=agg0_result[10];
			L0_11<=agg0_result[11];
			L0_12<=agg0_result[12];
			L0_13<=agg0_result[13];
			L0_14<=agg0_result[14];
			L0_15<=agg0_result[15];
			L0_16<=agg0_result[16];
			L0_17<=agg0_result[17];
			L0_18<=agg0_result[18];
			L0_19<=agg0_result[19];
			L0_20<=agg0_result[20];
			L0_21<=agg0_result[21];
			L0_22<=agg0_result[22];
			L0_23<=agg0_result[23];
			L0_24<=agg0_result[24];
			L0_25<=agg0_result[25];
			L0_26<=agg0_result[26];
			L0_27<=agg0_result[27];
			L0_28<=agg0_result[28];
			L0_29<=agg0_result[29];
			L0_30<=agg0_result[30];
			L0_31<=agg0_result[31];
			L0_32<=agg0_result[32];
			L0_33<=agg0_result[33];
			L0_34<=agg0_result[34];
			L0_35<=agg0_result[35];
			L0_36<=agg0_result[36];
			L0_37<=agg0_result[37];
			L0_38<=agg0_result[38];
			L0_39<=agg0_result[39];
			L0_40<=agg0_result[40];
			L0_41<=agg0_result[41];
			L0_42<=agg0_result[42];
			L0_43<=agg0_result[43];
			L0_44<=agg0_result[44];
			L0_45<=agg0_result[45];
			L0_46<=agg0_result[46];
			L0_47<=agg0_result[47];
			L0_48<=agg0_result[48];
			L0_49<=agg0_result[49];
			L0_50<=agg0_result[50];
			L0_51<=agg0_result[51];
			L0_52<=agg0_result[52];
			L0_53<=agg0_result[53];
			L0_54<=agg0_result[54];
			L0_55<=agg0_result[55];
			L0_56<=agg0_result[56];
			L0_57<=agg0_result[57];
			L0_58<=agg0_result[58];
			L0_59<=agg0_result[59];
			L0_60<=agg0_result[60];
			L0_61<=agg0_result[61];	
			L0_62<=agg0_result[62];
			L0_63<=agg0_result[63];		
			//135=
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
			
			min_135<=temp135_1;
			min_0_out<=temp0_1;
		end
	end
end

endmodule 
