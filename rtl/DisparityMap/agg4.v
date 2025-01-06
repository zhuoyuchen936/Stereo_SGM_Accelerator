/*
 * @Author: PingchengDong 
 * @Date: 2021-03-19 23:34:57 
 * @Last Modified by:   PingchengDong 
 * @Last Modified time: 2021-03-19 23:34:57 
 */

module agg4 (
    clk,
	rst0,
	rst,
	clken,
	en_agg4,
	en_first,
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
	en_agg3
);

	parameter cost_width = 9;
	input clk;
	input rst0;
	input rst;
	input clken;
	input en_agg4;
	input en_first;
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
	output reg en_agg3;
	always@(posedge clk or negedge rst)begin
		if(rst ==0)begin
			en_agg3<=1'd0;
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
				en_agg3<=1'd0;
				
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
			else if(en_agg4==1)begin
				en_agg3<=1'd1;

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
		end
	end
endmodule 
