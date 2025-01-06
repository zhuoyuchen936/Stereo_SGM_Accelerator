module Disp_out_Top(
        wr_clk,
        wr_rstn,
        rd_clk,
        rd_rstn,
        
        width,
        height,
        width_new,
        height_new,
        vacancy,
        valid_in,
        cut_h,
        cut_w,
        data_in,
        data_out,
        hsync,
        vsync,
        out_hs,
        out_vs,
        valid
);
parameter WIDTH=8;
input wr_clk,wr_rstn,rd_clk,rd_rstn;
input vacancy;
input valid_in;
input [1:0] cut_h,cut_w;
input [10:0] width,height,width_new,height_new;
input [WIDTH-1:0] data_in;
output[WIDTH-1:0] data_out;
output hsync,vsync;
output valid;
output out_hs;
output out_vs;

wire [10:0] H_SYNC,H_BACK,H_VALID,H_TOTAL;
wire [10:0] V_SYNC,V_TOTAL;
wire change_valid;
reg [7:0] cut_th_h;
always @ (*) begin
    case(cut_h)
      2'b00    : cut_th_h = 8'd0; 		
      2'b01    : cut_th_h = 8'd50; 		
      2'b10    : cut_th_h = 8'd100; 		
      default  : cut_th_h = 8'd0; 		
    endcase
  end
reg [7:0] cut_th_w;
always @ (*) begin
    case(cut_w)
      2'b00    : cut_th_w = 8'd0; 		
      2'b01    : cut_th_w = 8'd50; 		
      2'b10    : cut_th_w = 8'd100; 		
      default  : cut_th_w = 8'd0; 		
    endcase
  end
wire [10:0] height_cut;
wire [10:0] width_cut;
assign height_cut=height-cut_th_h;
assign width_cut=width-cut_th_w;

    reg [10:0] height_dly, width_dly;
    always@(posedge rd_clk or negedge rd_rstn)begin
        if(!rd_rstn)begin
            height_dly <= 11'd1080;
            width_dly <= 11'd1920;
        end
        else if(change_valid) begin
            height_dly <= (height_cut<height_new)? height_cut:height_new;
            width_dly <= (width_cut<width_new)?width_cut:width_new;
        end

        else begin
            height_dly <= height_dly;
            width_dly <= width_dly;
        end
    end
Disp_out#(WIDTH) Disp_out_inst(
        .wr_clk(wr_clk),
        .wr_rstn(wr_rstn),
        .rd_clk(rd_clk),
        .rd_rstn(rd_rstn),
        

        .vacancy(vacancy),
        .valid_in(valid_in),
        .data_in(data_in),
        .data_out(data_out),
        .hsync(hsync),
        .vsync(vsync),
        .out_hs(out_hs),
        .out_vs(out_vs),
        .valid(valid),
        .change_valid(change_valid),
        .H_SYNC(H_SYNC),
        .H_BACK(H_BACK),
        .H_VALID(H_VALID),
        .H_TOTAL(H_TOTAL),
        .V_SYNC(V_SYNC), 
        .V_TOTAL(V_TOTAL)
);
LUT_para LUT_para_inst(
    .height(height_dly),
    .width(width_dly),
    .H_SYNC(H_SYNC),
    .H_BACK(H_BACK),
    .H_VALID(H_VALID),
    .H_TOTAL(H_TOTAL),
    .V_SYNC(V_SYNC), 
    .V_TOTAL(V_TOTAL)
    );
endmodule
