// **********************************************************
// * Author : 
// * Email : 
// * Create time : 
// * Last modified : 
// *
// * Filename : sram_1920x48_dp_bit_en.v
// * Description : v1.0
// * Copyright (c) : FvChip 2023. All rights reserved.
// **********************************************************
`include "define_ctrl_sram.v"

module sram_1920x48_dp_bit_en
(
    input clk_a,                          // Clock input
    input [11-1:0] addr_a,      // Group A address input
    input [48-1:0] din_a,       // Group A data input
    input ce_a,                      // Group A chip enable input (low-active)
    input wr_en_a,                      // Group A write enable input (low-active)
    input [48-1:0] bit_en_a,    // Group A bit enable input (low-active)
    output [48-1:0] dout_a, // Group A data output

    input clk_b,                          // Clock input
    input [11-1:0] addr_b,      // Group B address input
    input [48-1:0] din_b,       // Group B data input
    input ce_b,                      // Group B chip enable input (low-active)
    input wr_en_b,                      // Group B write enable input (low-active)
    input [48-1:0] bit_en_b,    // Group B bit enable input (low-active)
    output [48-1:0] dout_b  // Group B data output
);

`ifdef SRAM_MOD
    //Sram mod
    sram_mod_dp_bit_en #(
        .ADDR_WIDTH     (11), // address width parameter
        .DATA_WIDTH     (48), // data width parameter
        .ADDR_SPACE     (1920)  // address space parameter
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
SRAMDP_1952x48_BE u_SRAMDP_1952x48_BE(
    /*input          */   .CLKA         (clk_a     ),    //CLOCK A
    /*output [d:0]   */   .QA           (          ),    //Data_out A
    /*input  [a:0]   */   .ADRA         (addr_a    ),    //ADDR A
    /*input  [d:0]   */   .DA           (din_a     ),    //Data_in A
    /*input  [d:0]   */   .WEMA         (~bit_en_a ),    //bit_enable
    /*input          */   .WEA          (!wr_en_a     ),    //Write enable, high active
    /*input          */   .CLKB         (clk_b     ),    //CLOCK B
    /*output [d:0]   */   .QB           (dout_b    ),    //Data_out B
    /*input  [a:0]   */   .ADRB         (addr_b    ),    //ADDR B
    /*input  [d:0]   */   .DB           (          ),    //Data_in B
    /*input  [d:0]   */   .WEMB         (          ),    //bit_enable

    /*input          */   .WEB          (!wr_en_b ),    //Write enable, high active
    /*input          */   .MEA          (!ce_a  ),    //Memory enable, high active
    /*input          */   .MEB          (!ce_b  ),    //Memory enable, high active
    /*input          */   .RMEA         (1'b0      ),    //Read-Write Margin Enable set to 1'b0
    /*input          */   .RMEB         (1'b0      ),    //Read-Write Margin Enable set to 1'b0
    /*input  [3:0]   */   .RMA          (4'b0      ),
    /*input  [3:0]   */   .RMB          (4'b0      ),
    /*input          */   .LS           (1'b0      ),
    //test port
    /*input          */   .DFTCLKEN     (1'b0         ),
    /*input          */   .DFTMASK      (1'b0         ),
    /*input          */   .TCLKEA       (1'b0         ),
    /*input          */   .TCLKEB       (1'b0         ),
    /*input          */   .BISTEA       (1'b0         ),
    /*input          */   .BISTEB       (1'b0         ),
    /*input          */   .TWEMA        (1'b0       ),    //bit_enable
    /*input          */   .TWEMB        (1'b0       ),    //bit_enable
    /*input  [a:0]   */   .TADRA        (11'b0         ),
    /*input  [3:0]   */   .TDA          (4'b0         ),
    /*input          */   .TWEA         (1'b0         ),
    /*input          */   .TMEA         (1'b0         ),
    /*input          */   .TCLKA        (1'b0         ),
    /*input          */   .TEST1A       (1'b0         ),
    /*input  [3:0]   */   .CDA          (4'b0         ),
    /*input          */   .CAPTA        (1'b0         ),
    /*input          */   .PIPEMEA      (1'b0         ),
    /*input          */   .TPIPEMEA     (1'b0         ),
    /*input          */   .STICKYA      (1'b0         ),
    /*input          */   .SI_QA        (1'b0         ),
    /*input          */   .SI_DA        (1'b0         ),
    /*input          */   .SE_QA        (1'b0         ),
    /*input          */   .SE_INA       (1'b0         ),
    /*input          */   .SI_CNTRA     (1'b0         ),
    /*input  [a:0]   */   .TADRB        (11'b0         ),
    /*input  [3:0]   */   .TDB          (4'b0         ),
    /*input          */   .TWEB         (1'b0         ),
    /*input          */   .TMEB         (1'b0         ),
    /*input          */   .TCLKB        (1'b0         ),
    /*input          */   .TEST1B       (1'b0         ),
    /*input  [3:0]   */   .CDB          (4'b0         ),
    /*input          */   .CAPTB        (1'b0         ),
    /*input          */   .PIPEMEB      (1'b0         ),
    /*input          */   .TPIPEMEB     (1'b0         ),
    /*input          */   .STICKYB      (1'b0         ),
    /*input          */   .SI_QB        (1'b0         ),
    /*input          */   .SI_DB        (1'b0         ),
    /*input          */   .SE_QB        (1'b0         ),
    /*input          */   .SE_INB       (1'b0         ),
    /*input          */   .SI_CNTRB     (1'b0         ),
    /*output  [d:0]  */   .QPA          (          ),
    /*output         */   .SO_QA        (          ),
    /*output         */   .SO_DA        (          ),
    /*output         */   .SO_CNTRA     (          ),
    /*output  [d:0]  */   .QPB          (          ),
    /*output         */   .SO_QB        (          ),
    /*output         */   .SO_DB        (          ),
    /*output         */   .SO_CNTRB     (          )
); 

    //Sram generated by memory complier
 //  RF2P_1920x24 inst_1920x24_1(
 //  .AA(addr_a),
 //  .D(din_a[23:0]),
 //  .BWEB(bit_en_a[23:0]),
 //  .WEB(wr_en_a),
 //  .CLKW(clk_a),
 //  .AB(addr_b),                         // prot a read_addr
 //  .REB(!wr_en_b),
 //  .CLKR(clk_a),

 //  .PD(1'b0),

 //  .AMA(11'd0),                          // port b write addr
 //  .DM(24'd0),
 //  .BWEBM(24'd0),
 //  .WEBM(1'b0),
 //  .AMB(11'd0),
 //  .REBM(1'b0),
 //  .BIST(1'b0),

 //  .Q(dout_b[23:0])
 //  );
 //  RF2P_1920x24 inst_1920x24_2(
 //  .AA(addr_a),
 //  .D(din_a[47:24]),
 //  .BWEB(bit_en_a[47:24]),
 //  .WEB(wr_en_a),
 //  .CLKW(clk_a),
 //  .AB(addr_b),                         // prot a read_addr
 //  .REB(!wr_en_b),
 //  .CLKR(clk_a),

 //  .PD(1'b0),

 //  .AMA(11'd0),                          // port b write addr
 //  .DM(24'd0),
 //  .BWEBM(24'd0),
 //  .WEBM(1'b0),
 //  .AMB(11'd0),
 //  .REBM(1'b0),
 //  .BIST(1'b0),

 //  .Q(dout_b[47:24])
 //  );
`endif 





endmodule
