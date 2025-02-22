// **********************************************************
// * Author : 
// * Email : 
// * Create time : 
// * Last modified : 
// *
// * Filename : sram_270x80_dp_bit_en.v
// * Description : v1.0
// * Copyright (c) : FvChip 2023. All rights reserved.
// **********************************************************
`include "define_ctrl_sram.v"

module sram_270x80_dp_bit_en
(
    input clk_a,                          // Clock input
    input [9-1:0] addr_a,      // Group A address input
    input [80-1:0] din_a,       // Group A data input
    input ce_a,                      // Group A chip enable input (low-active)
    input wr_en_a,                      // Group A write enable input (low-active)
    input [80-1:0] bit_en_a,    // Group A bit enable input (low-active)
    output [80-1:0] dout_a, // Group A data output

    input clk_b,                          // Clock input
    input [9-1:0] addr_b,      // Group B address input
    input [80-1:0] din_b,       // Group B data input
    input ce_b,                      // Group B chip enable input (low-active)
    input wr_en_b,                      // Group B write enable input (low-active)
    input [80-1:0] bit_en_b,    // Group B bit enable input (low-active)
    output [80-1:0] dout_b  // Group B data output
);

`ifdef SRAM_MOD
    //Sram mod
    sram_mod_dp_bit_en #(
        .ADDR_WIDTH     (9), // address width parameter
        .DATA_WIDTH     (80), // data width parameter
        .ADDR_SPACE     (270)  // address space parameter
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

`elsif SRAM_HL40
    //Sram generated by memory complier
    SRAMDP_288x80_BE u_sramdp_288x80_be(
        .CLKA(clk_a), 
        .QA(dout_a),
        .ADRA(addr_a), 
        .DA(din_a), 
        .WEA(~wr_en_a), 
        .WEMA(~bit_en_a), 
        .CLKB(clk_b), 
        .QB(dout_b), 
        .ADRB(addr_b), 
        .DB('b0), 
        .WEB(~wr_en_b), 
        .WEMB(~bit_en_b), 
        .MEA(~ce_a), 
        .MEB(~ce_b), 
        .RMEA(1'b0), 
        .RMEB(1'b0), 
        .RMA(4'b0), 
        .RMB(4'b0), 
        .LS(1'b0), 
        .TADRA(9'b0), 
        .TADRB(9'b0), 
        //test port
        .DFTCLKEN(1'b0), 
        .DFTMASK(1'b0), 
        .TCLKA(1'b0), 
        .TCLKB(1'b0), 
        .BISTEA(1'b0), 
        .BISTEB(1'b0), 
        .TWEMA(1'b0), 
        .TWEMB(1'b0),

        .TDA(4'b0), 
        .TWEA(1'b0), 
        .TMEA(1'b0), 
        .TCLKEA(1'b0), 
        .TEST1A(1'b0), 
        .CDA(4'b0), 
        .CAPTA(1'b0), 
        .PIPEMEA(1'b0), 
        .TPIPEMEA(1'b0), 
        .STICKYA(1'b0), 
        .SI_QA(1'b0), 
        .SI_DA(1'b0), 
        .SE_QA(1'b0), 
        .SE_INA(1'b0), 
        .SI_CNTRA(1'b0), 
        .TDB(4'b0), 
        .TWEB(1'b0), 
        .TMEB(1'b0), 
        .TCLKEB(1'b0), 
        .TEST1B(1'b0), 
        .CDB(4'b0), 
        .CAPTB(1'b0), 
        .PIPEMEB(1'b0), 
        .TPIPEMEB(1'b0), 
        .STICKYB(1'b0), 
        .SI_QB(1'b0), 
        .SI_DB(1'b0), 
        .SE_QB(1'b0), 
        .SE_INB(1'b0), 
        .SI_CNTRB(1'b0),

        .QPA(), 
        .SO_QA(), 
        .SO_DA(), 
        .SO_CNTRA(), 
        .QPB(), 
        .SO_QB(), 
        .SO_DB(), 
        .SO_CNTRB()
        
        
    );

`endif 





endmodule