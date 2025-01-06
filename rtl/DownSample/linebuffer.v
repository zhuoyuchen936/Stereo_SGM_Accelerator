//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/08/10 01:35:53
// Design Name: 
// Module Name: linebuffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module linebuffer
#(parameter WIDTH = 9,
 parameter AWIDTH = 11
)
(
    clk,
    rst,
    clken,
    valid_in,
    valid_in_b,

    width,
    height,

    din,

    dout00,
    dout01,
    dout10,
    dout11,
    
    cnt_col,
    cnt_row

   // valid

    );
    input clk, rst, clken,valid_in,valid_in_b;
    input [AWIDTH-1:0] width,height;
    input [WIDTH-1:0] din;

    output reg [WIDTH-1:0] dout00,dout10;
    output [WIDTH-1:0] dout01,dout11;
    output reg [AWIDTH-1:0] cnt_col, cnt_row;



////////////////// Index /////////////////////
always @(posedge clk or negedge rst) begin
    if(!rst)begin
        cnt_col <= 0;
        cnt_row <= 0;
    end
    else if(clken&valid_in)begin
        if(cnt_col == width - 1) begin
            cnt_col <= 'd0;
            if(cnt_row == height -1) cnt_row <= 'd0;
            else cnt_row <= cnt_row +11'd1;
        end
        else begin
            cnt_col <= cnt_col + 11'd1;
            cnt_row <= cnt_row;
        end
    end
    else begin
        cnt_col <= cnt_col;
        cnt_row <= cnt_row;
    end
end
/////////////SRAM Control Signal////////////////////
wire    wr_en;
wire  rd_en;
wire    [AWIDTH-1:0] wr_addr,rd_addr;
assign  wr_en = clken&valid_in;
assign  rd_en = (cnt_row == 11'd0&&cnt_col <= width-1)? 1'b0:valid_in_b;
//assign  valid = cnt_row != 0;



SRAM_Control unit_SRAM_Control (
    clk,
    rst,
    clken,
    width,
    valid_in,

    rd_en,
    wr_en,
    wr_addr,
    rd_addr
);

wire [WIDTH-1:0] q,d;
assign q = din;
wire [WIDTH-1:0] q_ram,d_ram;
assign q_ram=q;
assign d=d_ram[WIDTH-1:0];
generate
    if (WIDTH == 8) begin : gen_1920x8
        sram_2048x8_dp RAM2048x8(
            .clk_a(clk),
            .addr_a(wr_addr),
            .din_a(q_ram),
            .ce_a(1'b0),
            .wr_en_a(!wr_en),
            .dout_a(),

            .clk_b(clk),
            .addr_b(rd_addr),
            .din_b(8'd0),
            .ce_b(1'b0),
            .wr_en_b(1'b1),
            .dout_b(d_ram)
        );
    end else if (WIDTH == 16) begin : gen_1920x16
        sram_1920x16_dp_bit_en RAM1920x10(
            .clk_a(clk),
            .addr_a(wr_addr),
            .din_a(q_ram),
            .ce_a(1'b0),
            .wr_en_a(!wr_en),
            .bit_en_a({16{!wr_en}}),
            .dout_a(),

            .clk_b(clk),
            .addr_b(rd_addr),
            .din_b(16'd0),
            .ce_b(1'b0),
            .wr_en_b(1'b1),
            .bit_en_b(16'd0),
            .dout_b(d_ram)
        );
    end else begin
        
    end
endgenerate



assign dout01 = d;
assign dout11 = q;


always @(posedge clk or negedge rst) begin
    if(!rst)begin
        dout00 <= 'd0;
        dout10 <= 'd0;
    end
    else if(clken&valid_in)begin
        dout00 <= dout01;
        dout10 <= dout11;
    end
    
    else begin
        dout00 <= dout00;
        dout10 <= dout10;
    end
end
 
endmodule

