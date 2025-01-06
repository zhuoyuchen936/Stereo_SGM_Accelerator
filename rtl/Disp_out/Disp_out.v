



module Disp_out(
        wr_clk,
        wr_rstn,
        rd_clk,
        rd_rstn,
        
        width,
        height,
        vacancy,
        valid_in,
        data_in,
        data_out,
        hsync,
        vsync,
        valid,
        out_hs,
        out_vs,
        change_valid,
        H_SYNC,
        H_BACK, 
        H_VALID,
        H_TOTAL,
        V_SYNC, 
        V_TOTAL

);
parameter   WIDTH=8;
parameter   AWIDTH = 11;
parameter   CWIDTH = 11;
parameter   DEPTH = 2**AWIDTH-1;
input wr_clk,wr_rstn,rd_clk,rd_rstn;
input vacancy;
input valid_in;
input [10:0] width,height;
input [WIDTH-1:0] data_in;
input [10:0] H_SYNC,H_BACK,H_VALID,H_TOTAL,V_SYNC,V_TOTAL;
output[WIDTH-1:0] data_out;
output hsync,vsync;
output valid,change_valid;
output out_hs;
output reg out_vs;
wire rd_en;
wire ram_we_n;
wire [AWIDTH-1:0] ram_waddr;
wire [CWIDTH-1:0] push_word_count;
wire [AWIDTH-1:0] ram_raddr;

DWC_mipi_csi2_host_bcm07
#(
      .DEPTH            ( DEPTH       )
    , .ADDR_WIDTH       ( AWIDTH       )
    , .COUNT_WIDTH      ( CWIDTH       )   //Bus width to report the number of words in the fifo
    , .PUSH_AE_LVL      ( 1                           )
    , .PUSH_AF_LVL      ( 1                           )
    , .POP_AE_LVL       ( 1                           )
    , .POP_AF_LVL       ( 1                           )
    , .ERR_MODE         ( 1                           )
    // Selects the number of synchronization stages used for clock domain crossing.  
    // All stages capture the data on the rising edge of the clock. 
    , .PUSH_SYNC        ( 2 )
    , .POP_SYNC         ( 2 )
    , .EARLY_PUSH_STAT  ( 0                           )
    , .EARLY_POP_STAT   ( 0                           )
)
 UUT(
      .clk_push         ( wr_clk           )              // input   Push domain clk input
    , .rst_push_n       ( wr_rstn           )              // input   Push domain active low async reset
    
    , .init_push_n      ( 1'b1              )              // input   Push domain active low sync reset
    , .push_req_n       ( ~vacancy           )              // input   Push domain active high push reqest
    , .push_empty       (                   )              // output  Push domain Empty status flag
    , .push_ae          (                   )              // output  Push domain Almost Empty status flag
    , .push_hf          (                   )              // output  Push domain Half full status flag
    , .push_af          (                   )              // output  Push domain Almost full status flag
    , .push_full        (                   )              // output  Push domain Full status flag
    , .push_error       (                   )              // output  Push domain Error status flag
    , .push_word_count  ( push_word_count   )              // output  Push domain word count
    , .we_n             ( ram_we_n          )              // output  Push domain active low RAM write enable
    , .wr_addr          ( ram_waddr         )              // output  Push domain RAM write address

    , .clk_pop          ( rd_clk            )              // input   Pop domain clk input
    , .rst_pop_n        ( rd_rstn             )              // input   Pop domain active low async reset
    , .init_pop_n       ( 1'b1              )              // input   Pop domain active low sync reset
    , .pop_req_n        ( ~rd_en             )              // input   Pop domain active high pop request
    , .pop_empty        (                   )              // output  Pop domain Empty status flag
    , .pop_ae           (                   )              // output  Pop domain Almost Empty status flag
    , .pop_hf           (                   )              // output  Pop domain Half full status flag
    , .pop_af           (                   )              // output  Pop domain Almost full status flag
    , .pop_full         (                   )              // output  Pop domain Full status flag
    , .pop_word_count   (                   )              // output  Pop domain Error status flag
    , .pop_error        (                   )              // output  Pop domain word count
    , .rd_addr          ( ram_raddr         )              // output  Pop domain RAM read address
);


// sram_8192x8_2prf u_dpram_8192x8
// (
//     .clk_w  (  wr_clk     ),     // input            // Clock input
//     .addr_w (  ram_waddr    ),     // input [13-1:0]   // Write address input
//     .din_w  (      data_in    ),     // input [8-1:0]    // Write data input
//     .ce_w   (  1'b0         ),     // input            // Write chip enable input (low-active)
//     .en_w   (  ram_we_n     ),     // input            // Write enable input (low-active)
//     .clk_r  (  rd_clk     ),     // input            // Clock input
//     .addr_r (  ram_raddr    ),     // input [13-1:0]   // Read address input
//     .ce_r   (  1'b0         ),     // input            // Read chip enable input (low-active)
//     .en_r   ( ~rd_en      ),     // input            // Read enable input (low-active)
//     .dout_r (      data_out    )      // output [8-1:0]   // Read data output
// );

generate
    if (WIDTH == 8) begin : gen_2048x8
        sram_2048x8_dp u_dpram_2048x8 (
            .clk_a(wr_clk),  
            .addr_a(ram_waddr),
            .din_a(data_in),
            .ce_a(1'b0),
            .wr_en_a(ram_we_n),
            .dout_a(),

            .clk_b(rd_clk),
            .addr_b(ram_raddr),
            .din_b(8'd0),
            .ce_b(1'b0),
            .wr_en_b(1'b1),
            .dout_b(data_out)
        );
    end else if (WIDTH == 16) begin : gen_2048x16
        sram_2048x16_dp u_dpram_2048x16 (
            .clk_a(wr_clk),  
            .addr_a(ram_waddr),
            .din_a(data_in),
            .ce_a(1'b0),
            .wr_en_a(ram_we_n),
            .dout_a(),

            .clk_b(rd_clk),
            .addr_b(ram_raddr),
            .din_b(16'd0),
            .ce_b(1'b0),
            .wr_en_b(1'b1),
            .dout_b(data_out)
        );
    end else begin
        
    end
endgenerate



reg [10:0]cnt_hs;
reg [10:0]cnt_vs;

wire valid_full;
assign valid_full=(push_word_count>=H_VALID)? 1'b1:1'b0;//more than (width number) data in fifo, begin to count
reg valid_full_r,valid_full_rr;

always @(posedge rd_clk or negedge rd_rstn) begin
    if (!rd_rstn)begin
        valid_full_r<=0;
        valid_full_rr<=0;
    end
    else begin
        valid_full_r<=valid_full;
        valid_full_rr<=valid_full_r;
    end
end
//from wr_clk to rd_clk
reg hs_valid;
always @(posedge rd_clk or negedge rd_rstn) begin
    if (!rd_rstn)begin
       hs_valid<= 0; 
    end
    else if((!hs_valid)&&valid_full_rr) begin
        hs_valid<=1;
    end
    else if(hs_valid&&(cnt_hs==H_TOTAL-11'd1)&&(!valid_full_rr))begin
        hs_valid<=0;
    end
    else
        hs_valid<=hs_valid;
end
//enable when valid_full, disable when finish the period and not valid_full
always @(posedge rd_clk or negedge rd_rstn) begin
    if(!rd_rstn)
        cnt_hs<=11'd0;
    else if(valid_in & hs_valid)begin
       if(cnt_hs ==  H_TOTAL - 11'd1)
        cnt_hs<=11'd0; 
        else
        cnt_hs<=cnt_hs+11'd1;
    end
    else
        cnt_hs<=cnt_hs;
end
assign  hsync = (hs_valid&cnt_hs  <=  H_SYNC - 1'd1) ? 1'b1 : 1'b0  ;
always @(posedge rd_clk or negedge rd_rstn) begin
    if(!rd_rstn)
        cnt_vs<=11'd0;
    else if(cnt_hs == H_TOTAL -1)begin
        if(cnt_vs == V_TOTAL - 1) 
            cnt_vs<=11'd0;
        else 
            cnt_vs<=cnt_vs+11'd1;
    end
    else 
        cnt_vs<=cnt_vs;   
end
//cnt of hs and vs
reg vs_trigger;
always @(posedge rd_clk or negedge rd_rstn) begin
    if(!rd_rstn)
        vs_trigger<=1;
    else if((cnt_vs==0)&&(hs_valid)&&(cnt_hs==V_SYNC-1))
        vs_trigger<=0;
    else if((cnt_vs==V_TOTAL-1)&&(!vs_trigger)&&(cnt_hs==H_TOTAL-1))
        vs_trigger<=1;
    else
        vs_trigger<=vs_trigger;
end
//trigger once when frame begin
assign  vsync = (hs_valid&vs_trigger) ? 1'b1 : 1'b0  ;
assign  valid = ((cnt_hs >= H_SYNC + H_BACK)
                     && (cnt_hs < H_SYNC + H_BACK  + H_VALID)
                     )       
                     ? 1'b1 : 1'b0;
assign  rd_en = ((cnt_hs >= H_SYNC + H_BACK-11'd1)
                     && (cnt_hs < H_SYNC + H_BACK  + H_VALID-11'd1))       
                     ? 1'b1 : 1'b0;
assign change_valid=vs_trigger;
assign out_hs=valid;
always @(posedge rd_clk or negedge rd_rstn) begin
    if(!rd_rstn)
        out_vs<=0;
    else if((cnt_vs==0)&&(cnt_hs==H_SYNC + H_BACK-1))
        out_vs<=1;
    else if((cnt_vs==V_TOTAL-1)&&(out_vs)&&(cnt_hs==H_SYNC + H_BACK  + H_VALID-1))
        out_vs<=0;
    else
        out_vs<=out_vs;
end
endmodule
