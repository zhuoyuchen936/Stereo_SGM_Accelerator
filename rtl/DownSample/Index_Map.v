//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Guan Xinyu
// 
// Create Date: 2023/08/10 04:09:24
// Design Name: SGM downsample
// Module Name: Index_Map

//////////////////////////////////////////////////////////////////////////////////


module Index_Map
#(parameter AWIDTH = 11,parameter EXTEND = 30)
(
    clk,
    clken,
    rst,
    valid_in,
    
    width,
    height,

    cnt_col,
    cnt_row,
    resolution_height,
    resolution_width,

    index_col_new,
    index_row_new,
    valid,
    vacancy

    );
    input clk,clken,rst,valid_in;
    input [AWIDTH-1:0] cnt_col,cnt_row,width,height;
    input [AWIDTH+EXTEND-1:0] resolution_height,resolution_width;
    output reg [AWIDTH+EXTEND-1:0] index_col_new,index_row_new;
    output valid,vacancy;

    assign valid = valid_in;

    wire [AWIDTH+EXTEND-1:0] index_col_11;
    wire [AWIDTH+EXTEND-1:0] index_row_11;

    assign index_col_11 = {cnt_col,{EXTEND{1'b0}}};
    assign index_row_11 = {cnt_row,{EXTEND{1'b0}}};
    
    wire [AWIDTH+EXTEND-1:0] index_col_00;
    wire [AWIDTH+EXTEND-1:0] index_row_00;
    assign index_col_00 = {cnt_col-'b1,{EXTEND{1'b0}}};
    assign index_row_00 = {cnt_row-'b1,{EXTEND{1'b0}}};



  always @(posedge clk or negedge rst) begin
    if(!rst)begin
        index_col_new <= 0;
    end
    else if(clken&&valid_in)begin
        if(cnt_col == width-1)begin
            index_col_new <= 0;
        end         
        else begin
            if((index_col_00<=index_col_new && index_col_11>=index_col_new)||(index_col_11=='d0)) index_col_new <= index_col_new + resolution_width;
            else index_col_new <= index_col_new;                       
        end
    end
    else begin
        index_col_new <= index_col_new;
    end
  end

  always @(posedge clk or negedge rst) begin
    if(!rst)begin
        index_row_new <= 0;
    end
    else if(clken&&valid_in)begin
        if(cnt_col == width-1)begin
            if(cnt_row == height - 1) index_row_new <= 0;
            else if(index_row_11>=index_row_new) index_row_new <= index_row_new + resolution_height;
            else index_row_new <= index_row_new;
        end         
        else begin
            index_row_new <= index_row_new;                      
        end
    end
    else begin
        index_row_new <= index_row_new;
    end
  end
    
    assign vacancy =( ((index_col_11>=index_col_new)&&(index_col_00<=index_col_new)||(index_col_11=='d0))&&
        (((index_row_00<=index_row_new)&&(index_row_11>=index_row_new))||(index_row_11=='d0)))? 1'b1:1'b0;

endmodule

