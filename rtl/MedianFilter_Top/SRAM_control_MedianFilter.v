
module SRAM_control_MedianFilter(
	clk,
 	rst,
	clken,
	width,
    en2,
    en3,
    en4,
    en5,
    en6,
    en7,
    en8,
    en9,
    en10,
	//SRAM
	wr_en_1,
	wr_en_2,
	wr_en_3,
	wr_en_4,
	wr_en_5,
	wr_en_6,
	wr_en_7,
	wr_en_8,
	wr_en_9,
	wr_en_10,
	rd_en,
	wr_addr,
	rd_addr,
 	valid_1,
 	valid_2,
 	valid_3,
 	valid_4,
 	valid_5,
 	valid_6,
 	valid_7,
 	valid_8,
 	valid_9,
 	valid_10
);
	parameter DWIDTH = 70;
	parameter AWIDTH = 11;
	//parameter width = 1920;
	input  clk, rst, clken;
	input  [10:0] width;
    input  en2, en3, en4, en5;
    input  en6, en7, en8, en9, en10;
	output reg valid_1,valid_2,valid_3,valid_4;
	output reg valid_5,valid_6,valid_7,valid_8;
	output reg valid_9,valid_10;
    output reg  [AWIDTH-1:0] wr_addr, rd_addr;
    output wr_en_1,wr_en_2,wr_en_3,wr_en_4;
    output wr_en_5,wr_en_6,wr_en_7,wr_en_8;
    output wr_en_9,wr_en_10;
    output rd_en;
	reg  [AWIDTH-1:0]rd_flag_1,rd_flag_2,rd_flag_3,rd_flag_4;
	reg  [AWIDTH-1:0]rd_flag_5,rd_flag_6,rd_flag_7,rd_flag_8;
	reg  [AWIDTH-1:0]rd_flag_9,rd_flag_10;
    assign wr_en_1 = clken?1'd0:1'd1;
	assign wr_en_2 = en2?1'd0:1'd1;
	assign wr_en_3 = en3?1'd0:1'd1;
	assign wr_en_4 = en4?1'd0:1'd1;
	assign wr_en_5 = en5?1'd0:1'd1;
	assign wr_en_6 = en6?1'd0:1'd1;
	assign wr_en_7 = en7?1'd0:1'd1;
	assign wr_en_8 = en8?1'd0:1'd1;
	assign wr_en_9 = en9?1'd0:1'd1;
	assign wr_en_10 = en10?1'd0:1'd1;

	wire rd_en_1,rd_en_2,rd_en_3,rd_en_4;
	wire rd_en_5,rd_en_6,rd_en_7,rd_en_8;
	wire rd_en_9,rd_en_10;
	assign rd_en_1 = (clken && (rd_flag_1 == width - 1))?1'd0:1'd1;
	assign rd_en_2 = (en2 && (rd_flag_2 == width - 1))?1'd0:1'd1;
	assign rd_en_3 = (en3 && (rd_flag_3 == width - 1))?1'd0:1'd1;
	assign rd_en_4 = (en4 && (rd_flag_4 == width - 1))?1'd0:1'd1;
	assign rd_en_5 = (en5 && (rd_flag_5 == width - 1))?1'd0:1'd1;
	assign rd_en_6 = (en6 && (rd_flag_6 == width - 1))?1'd0:1'd1;
	assign rd_en_7 = (en7 && (rd_flag_7 == width - 1))?1'd0:1'd1;
	assign rd_en_8 = (en8 && (rd_flag_8 == width - 1))?1'd0:1'd1;
	assign rd_en_9 = (en9 && (rd_flag_9 == width - 1))?1'd0:1'd1;
	assign rd_en_10 = (en10 && (rd_flag_10 == width - 1))?1'd0:1'd1;
    assign rd_en = rd_en_1;
    //Controlling write and read signals
    //Left
    always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_addr<=0;
			rd_addr<=0;
			rd_flag_1<=0;
			rd_flag_2<=0;
			rd_flag_3<=0;
			rd_flag_4<=0;
			rd_flag_5<=0;
			rd_flag_6<=0;
			rd_flag_7<=0;
			rd_flag_8<=0;
			rd_flag_9<=0;
			rd_flag_10<=0;
			valid_1<=1'd0;
			valid_2<=1'd0;
			valid_3<=1'd0;
			valid_4<=1'd0;
			valid_5<=1'd0;
			valid_6<=1'd0;
			valid_7<=1'd0;
			valid_8<=1'd0;
			valid_9<=1'd0;
			valid_10<=1'd0;
		end
		else if(clken)begin
		//Write
            if(!wr_en_1)begin
				if(wr_addr == width - 1)wr_addr <= 0;
				else wr_addr <= wr_addr + 1;
				if(rd_flag_1 == width - 1)begin
					rd_flag_1 <= width - 1;
				end
				else rd_flag_1 <= rd_flag_1 + 1;
			end
            if(!wr_en_2)begin
                if(rd_flag_2 == width - 1)begin
					rd_flag_2 <= width - 1;
				end
				else rd_flag_2 <= rd_flag_2 + 1;
            end
            if(!wr_en_3)begin
                if(rd_flag_3 == width - 1)begin
					rd_flag_3 <= width - 1;
				end
				else rd_flag_3 <= rd_flag_3 + 1;
            end 
            if(!wr_en_4)begin
                if(rd_flag_4 == width - 1)begin
					rd_flag_4 <= width - 1;
				end
				else rd_flag_4 <= rd_flag_4 + 1;
            end
            if(!wr_en_5)begin
                if(rd_flag_5 == width - 1)begin
					rd_flag_5 <= width - 1;
				end
				else rd_flag_5 <= rd_flag_5 + 1;
            end
            if(!wr_en_6)begin
                if(rd_flag_6 == width - 1)begin
					rd_flag_6 <= width - 1;
				end
				else rd_flag_6 <= rd_flag_6 + 1;
            end 
            if(!wr_en_7)begin
                if(rd_flag_7 == width - 1)begin
					rd_flag_7 <= width - 1;
				end
				else rd_flag_7 <= rd_flag_7 + 1;
            end
            if(!wr_en_8)begin
                if(rd_flag_8 == width - 1)begin
					rd_flag_8 <= width - 1;
				end
				else rd_flag_8 <= rd_flag_8 + 1;
            end
            if(!wr_en_9)begin
                if(rd_flag_9 == width - 1)begin
					rd_flag_9 <= width - 1;
				end
				else rd_flag_9 <= rd_flag_9 + 1;
            end 
            if(!wr_en_10)begin
                if(rd_flag_10 == width - 1)begin
					rd_flag_10 <= width - 1;
				end
				else rd_flag_10 <= rd_flag_10 + 1;
            end
        //Read
			if(!rd_en_1)begin
				valid_1<=1;
				if(rd_addr == width - 1)rd_addr <= 0;
				else rd_addr <= rd_addr + 1;
			end
            if(!rd_en_2)begin
				valid_2<=1;
			
			end
            if(!rd_en_3)begin
				valid_3<=1;
			end
            if(!rd_en_4)begin
				valid_4<=1;
            end
            if(!rd_en_5)begin
				valid_5<=1;
			
			end
            if(!rd_en_6)begin
				valid_6<=1;
			end
            if(!rd_en_7)begin
				valid_7<=1;
            end
            if(!rd_en_8)begin
				valid_8<=1;
			
			end
            if(!rd_en_9)begin
				valid_9<=1;
			end
            if(!rd_en_10)begin
				valid_10<=1;
            end
		end
		else begin
			wr_addr<=wr_addr;
			rd_addr<=rd_addr;
			rd_flag_1<=rd_flag_1;
			rd_flag_2<=rd_flag_2;
			rd_flag_3<=rd_flag_3;
			rd_flag_4<=rd_flag_4;
			rd_flag_5<=rd_flag_5;
			rd_flag_6<=rd_flag_6;
			rd_flag_7<=rd_flag_7;
			rd_flag_8<=rd_flag_8;
			rd_flag_9<=rd_flag_9;
			rd_flag_10<=rd_flag_10;
			valid_1<=valid_1;
			valid_2<=valid_2;
			valid_3<=valid_3;
			valid_4<=valid_4;
			valid_5<=valid_5;
			valid_6<=valid_6;
			valid_7<=valid_7;
			valid_8<=valid_8;
			valid_9<=valid_9;
			valid_10<=valid_10;
		end
	end
    endmodule
