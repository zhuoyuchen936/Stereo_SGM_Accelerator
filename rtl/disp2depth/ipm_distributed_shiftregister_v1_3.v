//////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2014 PANGO MICROSYSTEMS, INC
// ALL RIGHTS REVERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TO PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
//////////////////////////////////////////////////////////////////////////////
//
// Library:
// Filename:ipm_distributed_shiftregister_v1_3.v
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

module ipm_distributed_shiftregister_v1_3
     #(
      parameter  FIXED_DEPTH            = 16              ,    //range:1-1024
      parameter  VARIABLE_MAX_DEPTH     = 16              ,    //range:1-1024
      parameter  DATA_WIDTH             = 16                   //data width      range:1-256

     )
     (
      din ,
      clk ,
      i_aclken,
      rst ,
      dout
     );

localparam  DEPTH       = FIXED_DEPTH;

localparam  ADDR_WIDTH  = (DEPTH<=16 ) ? 4 :
                          (DEPTH<=32 ) ? 5 :
                          (DEPTH<=64 ) ? 6 :
                          (DEPTH<=128) ? 7 :
                          (DEPTH<=256) ? 8 :
                          (DEPTH<=512) ? 9 : 10;

//***********************************************************IO******************************
input   wire  [DATA_WIDTH-1:0]      din        ;
input   wire                        clk        ;
input   wire                        i_aclken   ;
input   wire                        rst        ;
output  wire  [DATA_WIDTH-1:0]      dout       ;
//*******************************************************************************************
reg           [ADDR_WIDTH-1:0]      wr_addr    ;
reg           [ADDR_WIDTH-1:0]      rd_addr    ;

wire                                asyn_rst   ;

assign  asyn_rst  = rst;

        always @(posedge clk or posedge asyn_rst) begin
            if (asyn_rst)
                wr_addr <= 0;
            else if (i_aclken)
                wr_addr <= wr_addr+1;
        end

always @(*) begin
    rd_addr = (wr_addr+2**ADDR_WIDTH-DEPTH);
end

//********************************************************* SDP INST **************************************************
ipm_distributed_sdpram_v1_2
 #(
   .ADDR_WIDTH      (ADDR_WIDTH )   ,
   .DATA_WIDTH      (DATA_WIDTH )   ,
   .INIT_FILE       ("NONE"     )   ,
   .FILE_FORMAT     ("BIN"      )
  ) u_ipm_distributed_sdpram
  (
   .wr_data         (din        )   ,
   .wr_addr         (wr_addr    )   ,
   .rd_addr         (rd_addr    )   ,
   .wr_clk          (clk        )   ,
   .wr_en           (i_aclken   )   ,
   .rd_data         (dout       )
  );
endmodule