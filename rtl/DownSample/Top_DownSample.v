//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Guan Xinyu
// 
// Create Date: 2023/08/10 01:15:46
// Design Name: 
// Module Name: Top_DownSample
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////


module Top_DownSample
#(parameter DWIDTH = 8, parameter AWIDTH = 11, parameter EXTEND = 17)
(
    clk,
    rst,
    clk_en,
    valid_in,
    data_in,
    height,
    width,

    height_new,
    width_new,

    cut_h,
    cut_w,
    
    data_out,
    valid_out,
    vacancy
    );

    input clk, rst, clk_en, valid_in;
    input [AWIDTH-1:0] height,width,height_new,width_new;
    input [DWIDTH-1:0] data_in;
    input [1:0] cut_h,cut_w;
    
    output reg [DWIDTH-1:0] data_out;
//   output valid_out,vacancy;
    output valid_out;
    output vacancy;
//////////////////  Line Buffer  ////////////////////////
    wire [DWIDTH-1:0] a00,a01,a10,a11;
    wire [AWIDTH-1:0] cnt_col,cnt_row;
   //wire valid_linebuffer;
   wire full;

    reg [10:0] height_dly, width_dly;
    reg [1:0] cut_w_dly;
    reg [1:0] cut_h_dly;

reg [AWIDTH-1:0] cnt_col_cut,cnt_row_cut;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        cnt_col_cut <= 0;
        cnt_row_cut <= 0;
    end
    else if(valid_in&clk_en)begin
        if(cnt_col_cut == width - 1) begin
            cnt_col_cut <= 'd0;
            if(cnt_row_cut == height -1) cnt_row_cut <= 'd0;
            else cnt_row_cut <= cnt_row_cut +11'd1;
        end
        else begin
            cnt_col_cut <= cnt_col_cut + 11'd1;
            cnt_row_cut <= cnt_row_cut;
        end
    end
    else begin
        cnt_col_cut <= cnt_col_cut;
        cnt_row_cut <= cnt_row_cut;
    end
end
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            height_dly <= 11'd1080;
            width_dly <= 11'd1920;
            cut_w_dly<=2'b00;
            cut_h_dly<=2'b00;
        end
        else if((cnt_col_cut==0)&&(cnt_row_cut==0)) begin
            height_dly <= height_new;
            width_dly <= width_new;
            cut_w_dly<=cut_w;
            cut_h_dly<=cut_h;
        end
        else begin
            height_dly <= height_dly;
            width_dly <= width_dly;
            cut_w_dly<=cut_w_dly;
            cut_h_dly<=cut_h_dly;
        end
    end
reg [7:0] cut_th_h;
always @ (*) begin
    case(cut_h_dly)
      2'b00    : cut_th_h = 8'd0; 		
      2'b01    : cut_th_h = 8'd50; 		
      2'b10    : cut_th_h = 8'd100; 		
      default  : cut_th_h = 8'd0; 		
    endcase
  end
reg [7:0] cut_th_w;
always @ (*) begin
    case(cut_w_dly)
      2'b00    : cut_th_w = 8'd0; 		
      2'b01    : cut_th_w = 8'd50; 		
      2'b10    : cut_th_w = 8'd100; 		
      default  : cut_th_w = 8'd0; 		
    endcase
  end
wire valid_h,valid_w;
wire valid_cut;
assign valid_w=(cnt_col_cut<cut_th_w)?1'b0:1'b1;
assign valid_h=(cnt_row_cut<cut_th_h)?1'b0:1'b1;
assign valid_cut=valid_h&valid_w;


wire valid_w_b;
wire valid_cut_b;
assign valid_w_b=(cut_w_dly==2'b00)?1'b1:(!((cnt_col_cut<cut_th_w-1)||(cnt_col_cut==width-1)));
assign valid_cut_b=valid_h&valid_w_b;


wire [AWIDTH-1:0] width_cut;
wire [AWIDTH-1:0] height_cut;
assign width_cut = width-cut_th_w;
assign height_cut= height-cut_th_h;

    linebuffer 
    #(DWIDTH,AWIDTH)
    unit_linebuffer (
        .clk        (clk),
        .rst        (rst),
        .clken      (clk_en),
        .valid_in   (valid_cut),
        .valid_in_b   (valid_cut_b),

        .width      (width_cut),
        .height     (height_cut),

        .din        (data_in),

        .dout00     (a00),
        .dout01     (a01),
        .dout10     (a10),
        .dout11     (a11),
        
        .cnt_col    (cnt_col),
        .cnt_row    (cnt_row)

       // .valid      (valid_linebuffer)

    );

    /////////////////// Resolution Calculation /////////////////////    
    wire [AWIDTH+EXTEND-1:0] resolution_width;
    wire [AWIDTH+EXTEND-1:0] resolution_height;
    LUT_resolution inst_resolution (
        .height1            (height),
        .width1             (width),

        .height2            (height_dly),
        .width2             (width_dly),

        .cut_h(cut_h_dly),
        .cut_w(cut_w_dly),

        .resolution_height  (resolution_height),
        .resolution_width   (resolution_width)
    );

//////////////////// Map the Index ///////////////////
    wire [AWIDTH+EXTEND-1:0] index_col_new,index_row_new;


   wire valid_in_indexmap = valid_cut;
   wire vacancy1;
   //wire valid_Index_Map, vacancy;
   //
   //
   //

    Index_Map 
    #(AWIDTH,EXTEND)
    unit_Index_Map 
(
    .clk            (clk),
    .clken          (clk_en),
    .rst            (rst),
    .valid_in       (valid_in_indexmap),
    .width          (width_cut),
    .height         (height_cut),
    .cnt_col        (cnt_col),
    .cnt_row        (cnt_row),
    .resolution_width (resolution_width),//AWIDTH+EXTEND-1:
    .resolution_height (resolution_height),

    .index_col_new  (index_col_new),
    .index_row_new  (index_row_new),
    .vacancy        (vacancy1),
    .valid()
);


////////////////////// PE unit /////////////////////
wire [DWIDTH-1:0] data_out1;

////////////////////// PE unit /////////////////////

wire [AWIDTH+EXTEND-1:0] index_col_origin,index_row_origin;
assign index_col_origin={cnt_col-1,{EXTEND{1'b0}}};
assign index_row_origin={cnt_row-1,{EXTEND{1'b0}}};

PE_Bilinear 
#(AWIDTH,EXTEND,DWIDTH)
unit_PE_bilinear(
    .a00        (a00),
    .a01        (a01),
    .a10        (a10),
    .a11        (a11),

    .index_row  (index_row_new),
    .index_col  (index_col_new),
    
    .index_row_origin  (index_row_origin),
    .index_col_origin  (index_col_origin),
    

    .b          (data_out1)
);

//assign valid_out = valid_Index_Map;



always @(posedge clk or negedge rst) begin
    if(!rst)begin
        data_out<=0;
    end
    else if(clk_en&valid_in)begin
        data_out<=(cnt_row=='d0)? data_in:(vacancy1? data_out1 : 'bx);
    end
    else begin
        data_out<=data_out;
    end
end
reg vacancy2;
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        vacancy2<=0;
    end
    else if(valid_in)begin
        vacancy2<=vacancy1&clk_en&valid_cut;
    end
    else begin
        vacancy2<=vacancy2;
    end
end
assign valid_out=  valid_in; 
assign vacancy=vacancy2;
endmodule

