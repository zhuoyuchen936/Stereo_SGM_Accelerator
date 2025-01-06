module ipsxe_floating_point_register_v1_0 #(parameter N = 64) (
    input i_clk,
    input i_aclken,
    input i_rst_n,
    input [N-1:0] i_d,
    output reg [N-1:0] o_q
);

always @(posedge i_clk or negedge i_rst_n) begin: blk_reg
    if (!i_rst_n)
        o_q <= {N{1'b0}};
    else if (i_aclken)
        o_q <= i_d;
    else
        o_q <= o_q;
end

endmodule
