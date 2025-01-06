module SRAM_control_MedianDisp(
	clk,
 	rst,
	clken,
	width,
    en2,
	//SRAM
	wr_en_1,
	wr_en_2,
	rd_en,
	wr_addr,
	rd_addr,
 	valid_1,
 	valid_2
);
	parameter DWIDTH = 32;
	parameter AWIDTH = 11;
	input  clk, rst, clken;
	input  [10:0] width;
    input  en2;
	output reg valid_1,valid_2;
    output reg  [AWIDTH-1:0] wr_addr, rd_addr;
    output wr_en_1,wr_en_2;
    output rd_en;
	// reg  [AWIDTH-1:0]cnt_1,cnt_2,cnt_3;
	reg  [AWIDTH-1:0]rd_flag_1,rd_flag_2;
	
    assign wr_en_1 = clken?1'd0:1'd1;
	assign wr_en_2 = en2?1'd0:1'd1;

	wire rd_en_1,rd_en_2;
	assign rd_en_1 = (clken && (rd_flag_1 == width - 1))?1'd0:1'd1;
	assign rd_en_2 = (en2 && (rd_flag_2 == width - 1))?1'd0:1'd1;
    assign rd_en = rd_en_1;
    //Controlling write and read signals
    //Left
    always@(posedge clk or negedge rst)begin
		if(!rst)begin
			wr_addr<=0;
			rd_addr<=0;
			rd_flag_1<=0;
			rd_flag_2<=0;
			valid_1<=1'd0;
			valid_2<=1'd0;
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
                               //Read
			if(!rd_en_1)begin
				valid_1<=1;
				if(rd_addr == width - 1)rd_addr <= 0;
				else rd_addr <= rd_addr + 1;
			end
            if(!rd_en_2)begin
				valid_2<=1;		
			end
        end
		else begin
			wr_addr<=wr_addr;
			rd_addr<=rd_addr;
			rd_flag_1<=rd_flag_1;
			rd_flag_2<=rd_flag_2;
			valid_1<=valid_1;
			valid_2<=valid_2;
		end
	end
    endmodule
