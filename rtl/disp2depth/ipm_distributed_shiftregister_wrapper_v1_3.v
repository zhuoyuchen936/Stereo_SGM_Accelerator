//////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2014 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TO PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
module ipm_distributed_shiftregister_wrapper_v1_3 #(parameter FIXED_DEPTH = 1, DATA_WIDTH = 1) (
    input clk,
    input rst,
    input i_aclken,
    input [DATA_WIDTH-1:0] din,
    output [DATA_WIDTH-1:0] dout
);

generate
if (FIXED_DEPTH == 1) begin
    ipsxe_floating_point_register_v1_0 #(DATA_WIDTH) u_reg (
        .i_clk(clk), // input clock
        .i_aclken(i_aclken), // input clock enable
        .i_rst_n(~rst), // input reset
        .i_d(din),
        .o_q(dout)
    );
end else begin
    wire [FIXED_DEPTH*DATA_WIDTH-1:0] out_delay;
    ipsxe_floating_point_register_v1_0 #(FIXED_DEPTH*DATA_WIDTH) u_reg (
        .i_clk(clk), // input clock
        .i_aclken(i_aclken), // input clock enable
        .i_rst_n(~rst), // input reset
        .i_d({out_delay[(FIXED_DEPTH-1)*DATA_WIDTH-1:0], din}),
        .o_q(out_delay)
    );
    assign dout = out_delay[FIXED_DEPTH*DATA_WIDTH-1-:DATA_WIDTH];
end
endgenerate
endmodule