
module LR_check (
    clk,
    clken,
    rst,
    en,
    valid,
    range,
    //SRAM
    wr_en,
    rd_en,
    wr_addr_R,
    rd_addr_R,
    wr_addr_L,
    rd_addr_L,

    q_R,//8 bit 
    q_L,
    disp//10 bit 
);
//parameter bit_len = 8'd7;
parameter DWIDTH = 7, AWIDTH = 8;

input  clk,clken,rst,en;
input  [DWIDTH-1:0] q_R,q_L;
input  [8:0] range;
output [AWIDTH-1:0] wr_addr_R,wr_addr_L,rd_addr_R,rd_addr_L; 
output reg valid;
output reg [DWIDTH+1:0] disp;
output  wr_en, rd_en;




//rdaddress must be larger than the AWIDTH
reg [AWIDTH-1:0] wraddress_L, wraddress_R;
reg [AWIDTH:0] rdaddress_L, rdaddress_R;
reg [AWIDTH:0] tempaddress_L;
reg [DWIDTH-1:0] temp_L;
reg [9:0] cnt;


assign wr_en = (en && clken)?1'd0:1'd1;
assign rd_en = (clken && en && cnt > (range+19))?1'd0:1'd1;

assign wr_addr_R = wraddress_R[AWIDTH-1:0];
assign wr_addr_L = wraddress_L[AWIDTH-1:0];
assign rd_addr_R = rdaddress_R[AWIDTH-1:0];
assign rd_addr_L = rdaddress_L[AWIDTH-1:0];

always @(posedge clk or negedge rst) begin
    if(!rst)begin
        wraddress_R<=0;
	    wraddress_L<=0;
        cnt <= 0; 
        valid <= 0;         
    end
    else if(clken && en)begin
        wraddress_R <= wraddress_R + 1;
        wraddress_L <= wraddress_L + 1;
        if(cnt == (range+22))begin
            cnt <= (range+22);
            valid <= 1;    
        end
        else begin
            cnt <= cnt + 1;
        end
    end
end

always @(posedge clk or negedge rst) begin
    if(!rst)begin
        rdaddress_L<=0;         
    end
    else begin
	//Pingpong process 
        if(cnt > (range+19) && clken && en)begin
		    if(rdaddress_L == 511)begin
	            	rdaddress_L <= 0;
		    end
		    else begin
       		    	rdaddress_L <= rdaddress_L + 1;             
	  	    end   	    
        end    
    end
end

wire [DWIDTH:0] q_L_add = {2'b0,q_L[DWIDTH-1:1]};
//rdaddress_L must be changed synchronously so it is combinational logic
always@(*)begin
    if(!rst)rdaddress_R = 0;
    else begin
	    if((tempaddress_L - q_L_add)<0) rdaddress_R = 511 + tempaddress_L - {2'd0,q_L[DWIDTH-1:1]};
        else rdaddress_R = tempaddress_L - {2'd0,q_L[DWIDTH-1:1]}; 
    end
end

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        tempaddress_L <= 0;
		temp_L <= 0;
    end
    else if(clken && en)begin
	    tempaddress_L <= rdaddress_L;
	    temp_L <= q_L;
    end  
end

always @(posedge clk or negedge rst) begin
    if(!rst)begin
        disp <= 0;
    end
    else if(clken && en)begin
	//disp[15]=occlusion 0-255 1-0
	//disp[16]=dismatch 0-255 1-0
	

       if(temp_L[DWIDTH-1:1] <= q_R[DWIDTH-1:1] +3 && q_R[DWIDTH-1:1] <= temp_L[DWIDTH-1:1] + 3) disp <= {2'b00,temp_L};// valid:00 occlusion=dismatch=white
      else if(temp_L[DWIDTH-1:1] < q_R[DWIDTH-1:1]) disp <= {2'b10,temp_L};//only occlusion is wrong
      else disp <= {2'b01,temp_L};//only mismatch is wrong
    end
end
endmodule




