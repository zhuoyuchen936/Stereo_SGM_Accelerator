//----------------------------------------------------------------------------
// Copyright (c)    : 1998-2011 by Synopsys, Inc. All Rights Reserved.
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// Cell model definitions.
//----------------------------------------------------------------------------
`ifdef VIRAGE_TIMESCALE_1PS
 `timescale 1 ps / 1 ps
`else 
  `ifdef VIRAGE_TIMESCALE_10PS
    `timescale 1 ns / 10 ps
  `else
    `ifdef VIRAGE_TIMESCALE_100PS
       `timescale 1 ns / 100 ps
     `else
       `ifdef VIRAGE_TIMESCALE_1NS
          `timescale 1 ns / 1 ns
       `else
          `timescale 1 ns / 1 ps
       `endif
     `endif
  `endif
`endif
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_AN2_1
//      Description : 2-Input AND
//      Equation    : X=A1&A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 13:36:57
//

`celldefine
module VIRL_SDN_AN2_1 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect
      // Gate-level description.
      assign X = A1 & A2;

   `endprotect
endmodule
`endcelldefine
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_BUF_1
//      Description : Non-inverting buffer
//      Equation    : X=A
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:20:06
//
`celldefine
module VIRL_SDN_BUF_1 (X, A);
   output X;
   input  A;

   `protect

      // Gate-level description.
      assign X = A;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_EO2_4
//      Description : 2-Input exclusive OR
//      Equation    : X=A1^A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:46:38
//
`celldefine
module VIRL_SDN_EO2_4 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect
      // Gate-level description.
      assign X = A1^A2;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_EO3_4
//      Description : 3-Input exclusive OR
//      Equation    : X=(A1^A2)^A3
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 15:47:52
//
`celldefine
module VIRL_SDN_EO3_4 (X, A1, A2, A3);
   output X;
   input  A1;
   input  A2;
   input  A3;

   `protect

      // Gate-level description.
      assign X = A1^A2^A3;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_INV_0P5
//      Description : Inverter
//      Equation    : X=!A
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 16:10:37
//
`celldefine
module VIRL_SDN_INV_0P5 (X, A);
   output X;
   input  A;

   `protect

      // Gate-level description.
      assign X = ~A;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_MUX2_1
//      Description : 2-1 multiplexer
//      Equation    : X=(S&D1)|(!S&D0)
//      Version     : 1.1.2.2
//      Created     : 2003/11/07 20:31:33
//
`celldefine
module VIRL_SDN_MUX2_1 (X, D0, D1, S);
   output X;
   input  D0;
   input  D1;
   input  S;

   reg X;

   `protect

         // Gate-level description.
       always @( D0 or D1 or S ) begin
          if ( (S^S) !== 1'b0 ) 
            X = 1'bx;
          else if ( S == 1'b0 )
            X = D0;
          else if ( S == 1'b1 )
            X = D1;
       end

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_OR2_1
//      Description : 2-Input OR
//      Equation    : X=A1|A2
//      Version     : 1.1.2.1
//      Created     : 2003/05/12 17:18:13
//
`celldefine
module VIRL_SDN_OR2_1 (X, A1, A2);
   output X;
   input  A1;
   input  A2;

   `protect

      // Gate-level description.
      assign X = A1|A2;

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_MSDPRB_1
//      Description : D-Flip Flop w/scan, pos-edge triggered, lo-async-clear
//      Equation    : iq,iqn=ff(clocked_on=CK,next_state=(!SE&D)|(SE&SI),clear=!RD):Q=iq:QN=iqn
//      Version     : 1.1.2.1
//      Created     : 2003/05/13 06:12:40
//
`celldefine
module VIRL_SDN_MSDPRB_1 (Q, CK, D, SI, SE, RD);
   output Q;
   input  CK;
   input  D;
   input  SI;
   input  SE;
   input  RD;

   `protect
      reg notifier;
      wire shcheck1CKRDlh, shcheck2CKRDlh, shcheckCKDlh, shcheck0CKSElh, shcheck1CKSElh, shcheck0CKSIlh, shcheck0CKRDlh, shcheck1CKSIlh;

      `ifdef negativeTimingCheck
         wire SE_delayed;
         wire D_delayed;
         wire CK_delayed;
         wire SI_delayed;
      `else
         buf(SE_delayed,SE);
         buf(D_delayed,D);
         buf(CK_delayed,CK);
         buf(SI_delayed,SI);
      `endif

   reg Q, QN;

    always @(posedge CK )
    begin
      if (CK === 1'bx)
      begin
        Q <= 1'bx;
        QN <= 1'bx;
      end
      else if ( CK === 1'b1 && RD === 1'b1 )
      begin
        Q <= QN;
      end
    end
    always @( RD )
    begin
      if ( RD === 1'b0 )
      begin
        Q <= 1'b0;
        QN <= 1'b0;
      end
      else if ( RD === 1'bx )
      begin
        Q <= 1'bx;
        QN <= 1'bx;
      end
    end

wire QN1;
   assign QN1 = (SE===1'b0)?D:(SE===1'b1)?SI:1'bx;

      not _i0 (CKN,CK);
      and _i1 (clk_rd,CKN,RD);

    always @( posedge clk_rd or QN1) begin
     if ( clk_rd === 1'b1 )
      begin
           QN <= QN1;
      end
    end


   `endprotect
endmodule
`endcelldefine
//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_MSRRB_1
//      Description : D-Flip Flop w/o scan, pos-edge triggered, lo-async-clear
//      Equation    : iq,(clocked_on=CK,next_state=D,clear=!RD):Q=iq:
//      Version     : 1.1.2.1
//      Created     : 2011/06/15 06:12:40
//
`celldefine
module VIRL_SDN_MSRRB_1 (Q, CK, D, RD);
output Q;
input CK, D, RD;

   `protect
     wire D_delayed, CK_delayed, _n1, INV_CK, QN;

     buf Ibuf0 (D_delayed, D);
     buf Ibuf1 (CK_delayed, CK);
     not _i1 (_n1, RD);
     not _i2 (INV_CK, CK_delayed);

     snps_lat_r _i3 (QN, 1'b0, _n1, INV_CK, D_delayed);
     snps_lat_r _i4 (Q, 1'b0, _n1, CK_delayed, QN);

   `endprotect
endmodule
`endcelldefine

//----------------------------------------------------------------------
//      Cell        : VIRL_SDN_LDNRB_1
//      Description : D-Negative Latch
//      Version     : 1.1.2.1
//      Created     : 2003/05/13 06:12:40
//
`celldefine
module VIRL_SDN_LDNRB_1 (Q, CK, D) ;
   output Q;
   input  CK;
   input  D;

   `protect
      `ifdef negativeTimingCheck
         wire D_delayed;
         wire CK_delayed;
      `else
         buf(D_delayed,D);
         buf(CK_delayed,CK);
      `endif
    
    reg QN;
    buf (Q, QN);

    always @( CK or D ) begin
      if ( CK === 1'b0)
      begin
        QN <= D;
      end
    end

   `endprotect
endmodule
`endcelldefine

//------------------------------------------------------------------------------
//      Cell        : VIRL_SDN_PWR_BUF
//      Description : Non-inverting buffer with power pins
//      Equation    : X=A
//      Version     : 1.1.1
//      Created     : 2011/02/17 15:20:06
//
`celldefine
module VIRL_SDN_PWR_BUF (X, A, VDD, VSS);
   output X;
   input  A, VDD, VSS;

   `protect

      // Gate-level description.
      assign X = A;

   `endprotect
endmodule
`endcelldefine

// -----------------------------------------------------------------------------
//      Cell        : VIRL_SDN_PWR_INV
//      Description : Inverter with power pins
//      Equation    : X=!A
//      Version     : 1.1.1
//      Created     : 2011/02/17 16:20:06
//
`celldefine
module VIRL_SDN_PWR_INV (X, A, VDD, VSS);
   output X;
   input  A, VDD, VSS;

   `protect

      // Gate-level description.
      assign X = ~A;

   `endprotect
endmodule
`endcelldefine

// -----------------------------------------------------------------------------
//      Cell        : VIRL_SDN_PWR_AN2
//      Description : 2-Input AND with power pins
//      Equation    : X=A1&A2
//      Version     : 1.1.1
//      Created     : 2011/02/17 17:36:57
//

`celldefine
module VIRL_SDN_PWR_AN2 (X, A1, A2, VDD, VSS);
   output X;
   input  A1;
   input  A2;
   input  VDD;
   input  VSS;

   `protect
      // Gate-level description.
      assign X = A1 & A2;

   `endprotect
endmodule
`endcelldefine

//------------------------------------------------------------------------------
//      Cell        : VIRL_SDN_PWR_SWITCH
//      Description : power switch
//      Equation    : X=A1&A1
//      Version     : 1.1.1
//      Created     : 2011/02/17 17:20:06
//
`celldefine
 //pclp switch_inout VDDIN VDDOUT
 //pclp switch_standby !PON||!PGOOD
 module VIRL_SDN_PWR_SWITCH (PON, PGOOD, VDDIN, VDDOUT, VSS);
 input PGOOD, PON, VDDIN, VSS;
 output VDDOUT;
        and _i0 (VDDOUT, PGOOD, PON);
 endmodule
`endcelldefine

//------------------------------------------------------------------------------

// FUNCTION: Positive edge-triggered D flip-flop
primitive virl_p_ff  (Q, D, CP,notifier);
   output Q;  reg    Q;
   input  D, CP,notifier;

   table
      //  D   CP   notifier :   Qt  :   Qt+1
          1   (01)    ?     :   ?   :   1;  // clocked data
          0   (01)    ?     :   ?   :   0;
          1   (x1)    ?     :   1   :   1;  // reducing pessimism
          0   (x1)    ?     :   0   :   0;
          1   (0x)    ?     :   1   :   x;
          0   (0x)    ?     :   0   :   x;
          ?   (1x)    ?     :   ?   :   x;  // no change on falling edge
          ?   (?0)    ?     :   ?   :   -;

          *    ?      ?     :   ?   :   -;  // ignore edges on data
          ?    ?      *     :   ?   :   x;
   endtable
endprimitive

// FUNCTION: Positive edge-triggered D flip-flop w/ active-high reset
primitive virl_p_ffr  (Q, D, CP, R, notifier);
   output Q;  reg    Q;
   input  D, CP, R, notifier;

   table
      //  D   CP     R notifier :   Qt  :   Qt+1
          1   (01)   0    ?     :   ?   :   1;  // clocked data
          0   (01)   0    ?     :   ?   :   0;

          0   (01)   x    ?     :   ?   :   x;  // pessimism
          0    ?     x    ?     :   0   :   x;  // pessimism

          1    0     x    ?     :   0   :   x;  // pessimism
          1    x   (?x)   ?     :   0   :   x;  // pessimism
          1    1   (?x)   ?     :   0   :   x;  // pessimism

          x    0     x    ?     :   0   :   x;  // pessimism
          x    x   (?x)   ?     :   0   :   x;  // pessimism
          x    1   (?x)   ?     :   0   :   x;  // pessimism

          1   (x1)   0    ?     :   1   :   1;  // reducing pessimism
          0   (x1)   0    ?     :   0   :   0;
          1   (0x)   0    ?     :   1   :   x;
          0   (0x)   0    ?     :   0   :   x;

          ?   ?      1    ?     :   ?   :   0;  // asynchronous clear

          ?   (?0)   ?    ?     :   ?   :   -;  // ignore falling clock
          ?   (1x)   ?    ?     :   ?   :   x;  // ignore falling clock
          *    ?     ?    ?     :   ?   :   -;  // ignore the edges on data

          ?    ?   (?0)   ?     :   ?   :   -;  // ignore the edges on clear

          ?    ?     ?    *     :   ?   :   x;
    endtable
endprimitive

primitive snps_lat_r (q, set,rst, ck, d);
output q; reg q;
input set,rst, ck, d;
table
// set rst ck  d : q-: q+
    0   0   0  ? : ? : -; // hold

    1   0   0  ? : ? : 1; // set
    1   0   ?  1 : ? : 1;
    ?   0   ?  1 : 1 : 1;
    ?   0   0  ? : 1 : 1;

    0   1   0  ? : ? : 0; // reset
    0   1   ?  0 : ? : 0;
    0   ?   ?  0 : 0 : 0;
    0   ?   0  ? : 0 : 0;

    ?   0   1  1 : ? : 1; // capture
    0   ?   1  0 : ? : 0;
endtable
endprimitive

