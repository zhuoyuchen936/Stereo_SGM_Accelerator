// **********************************************************
// * Author : 
// * Email : 
// * Create time : 
// * Last modified : 
// *
// * Filename : sram_1936x11_dp_bit_en.v
// * Description : v1.0
// * Copyright (c) : FvChip 2023. All rights reserved.
// **********************************************************
`include "define_ctrl_sram.v"

module sram_1936x11_dp_bit_en
(
    input clk_a,                          // Clock input
    input [11-1:0] addr_a,      // Group A address input
    input [11-1:0] din_a,       // Group A data input
    input ce_a,                      // Group A chip enable input (low-active)
    input wr_en_a,                      // Group A write enable input (low-active)
    input [11-1:0] bit_en_a,    // Group A bit enable input (low-active)
    output [11-1:0] dout_a, // Group A data output

    input clk_b,                          // Clock input
    input [11-1:0] addr_b,      // Group B address input
    input [11-1:0] din_b,       // Group B data input
    input ce_b,                      // Group B chip enable input (low-active)
    input wr_en_b,                      // Group B write enable input (low-active)
    input [11-1:0] bit_en_b,    // Group B bit enable input (low-active)
    output [11-1:0] dout_b  // Group B data output
);

`ifdef SRAM_MOD
    //Sram mod
    sram_mod_dp_bit_en #(
        .ADDR_WIDTH     (11), // address width parameter
        .DATA_WIDTH     (11), // data width parameter
        .ADDR_SPACE     (1936)  // address space parameter
    ) u_sram_mod_sp_bit_en
    (
        .clk_a          (clk_a      ),
        .addr_a         (addr_a     ),
        .din_a          (din_a      ),
        .ce_a           (ce_a       ),
        .wr_en_a        (wr_en_a    ),
        .bit_en_a       (bit_en_a   ),
        .dout_a         (dout_a     ),
        .clk_b          (clk_b      ),
        .addr_b         (addr_b     ),
        .din_b          (din_b      ),
        .ce_b           (ce_b       ),
        .wr_en_b        (wr_en_b    ),
        .bit_en_b       (bit_en_b   ),
        .dout_b         (dout_b     )
    );

`elsif SRAM_TSMC40
    //Sram generated by memory complier
    RF2P_1936x11 inst_1936x11(
       .AA(addr_a),
       .D(din_a),
       .BWEB(bit_en_a),
       .WEB(wr_en_a),
       .CLKW(clk_a),
       .AB(addr_b),                         // prot a read_addr
       .REB(!wr_en_b),
       .CLKR(clk_a),
    
       .PD(1'b0),
    
       .AMA(11'd0),                          // port b write addr
       .DM(11'd0),
       .BWEBM(11'd0),
       .WEBM(1'b0),
       .AMB(11'd0),
       .REBM(1'b0),
       .BIST(1'b0),
    
       .Q(dout_b)
       );
   
`endif 





endmodule
