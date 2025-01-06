//****************************************************************************** */
//*                                                                              */
//*STATEMENT OF USE                                                              */
//*                                                                              */
//*This information contains confidential and proprietary information of TSMC.   */
//*No part of this information may be reproduced, transmitted, transcribed,      */
//*stored in a retrieval system, or translated into any human or computer        */
//*language, in any form or by any means, electronic, mechanical, magnetic,      */
//*optical, chemical, manual, or otherwise, without the prior written permission */
//*of TSMC. This information was prepared for informational purpose and is for   */
//*use by TSMC's customers only. TSMC reserves the right to make changes in the  */
//*information at any time and without notice.                                   */
//*                                                                              */
//****************************************************************************** */
//*                                                                              */
//*      Usage Limitation: PLEASE READ CAREFULLY FOR CORRECT USAGE               */
//*                                                                              */
//* The model doesn't support the control enable, data and address signals       */
//* transition at positive clock edge.                                           */
//* Please have some timing delays between control/data/address and clock signals*/
//* to ensure the correct behavior.                                              */
//*                                                                              */
//* Please be careful when using non 2^n  memory.                                */
//* In a non-fully decoded array, a write cycle to a nonexistent address location*/
//* does not change the memory array contents and output remains the same.       */
//* In a non-fully decoded array, a read cycle to a nonexistent address location */
//* does not change the memory array contents but the output becomes unknown.    */
//*                                                                              */
//* In the verilog model, the behavior of unknown clock will corrupt the         */
//* memory data and make output unknown regardless of CEB signal.  But in the    */
//* silicon, the unknown clock at CEB high, the memory and output data will be   */
//* held. The verilog model behavior is more conservative in this condition.     */
//*                                                                              */
//* The model doesn't identify physical column and row address                   */
//*                                                                              */
//* The verilog model provides UNIT_DELAY mode for the fast function simulation. */
//* All timing values in the specification are not checked in the UNIT_DELAY mode*/
//* simulation.                                                                  */
//*                                                                              */
//* The critical contention timings, tcc, is not checked in the UNIT_DELAY mode  */
//* simulation.  If addresses of read and write operations are the same and the  */
//* real time of the positive edge of CLKA and CLKB are identical the same,      */
//* it will be treated as a read/write port contention.                          */ 
//*                                                                              */
//* Please use the verilog simulator version with $recrem timing check support.  */
//* Some earlier simulator versions might support $recovery only, not $recrem.   */
//*                                                                              */
//****************************************************************************** */
//*      Macro Usage       : (+define[MACRO] for Verilog compiliers)             */
//* +UNIT_DELAY : Enable fast function simulation.                              */
//* +no_warning : Disable all runtime warnings message from this model.          */
//* +TSMC_INITIALIZE_MEM : Initialize the memory data in verilog format.         */
//* +TSMC_INITIALIZE_FAULT : Initialize the memory fault data in verilog format. */
//* +TSMC_NO_TESTPINS_WARNING : Disable the wrong test pins connection error     */
//*                             message if necessary.                            */
//****************************************************************************** */
//*        Compiler Version : TSMC MEMORY COMPILER tsn40lp2prf_2007.11.00.b1.130a */
//*        Memory Type      : TSMC 40nm Low Power Two Port Register File */
//*                           with BIST Interface */
//*        Library Name     : ts6n40lpa1920x18m4s (user specify : RF2P_1920x18) */
//*        Library Version  : 130a */
//*        Generated Time   : 2023/07/19, 05:45:26 */
//*************************************************************************** ** */
 
`resetall
`celldefine

`timescale 1ns/1ps
`delay_mode_path

`suppress_faults
`enable_portfaults

`ifdef UNIT_DELAY
`define SRAM_DELAY 0.010
`endif


module RF2P_1920x18
  (AA,
  D,
  BWEB,
  WEB,CLKW,
  AB,
  REB,CLKR,PD,
  AMA,
  DM,
  BWEBM,
  WEBM,
  AMB,
  REBM,BIST,
  Q);

// Parameter declarations
parameter  N = 18;
parameter  W = 1920;
parameter  M = 11;
parameter  PD_cycle = 8;

// Input-Output declarations
   input [M-1:0] AA;                // Address write bus
   input [N-1:0] D;                 // Date input bus
   input [N-1:0] BWEB;              // BW data input bus
   input         WEB;               // Active-low Write enable
   input         CLKW;              // Clock A
   input [M-1:0] AB;                // Address read bus 
   input         REB;               // Active-low Read enable
   input         CLKR;              // Clock B
   input         PD;                // Active-high Power Down

   input [M-1:0] AMA;               // Address write bus 
   input [N-1:0] DM;                // Date input bus  
   input [N-1:0] BWEBM;             // BW data input bus
   input         WEBM;              // Active-low Write enable
   input [M-1:0] AMB;               // Address read bus 
   input         REBM;              // Active-low Read enable 
   input         BIST;
   output [N-1:0] Q;                 // Data output bus

`ifdef no_warning
parameter MES_ALL = "OFF";
`else
parameter MES_ALL = "ON";
`endif

`ifdef TSMC_INITIALIZE_MEM
  parameter cdeFileInit  = "RF2P_1920x18_initial.cde";
`endif
`ifdef TSMC_INITIALIZE_FAULT
   parameter cdeFileFault = "RF2P_1920x18_fault.cde";
`endif

// Registers
reg [N-1:0] DL;

reg [N-1:0] BWEBL;
reg [N-1:0] bBWEBL;

reg [M-1:0] AAL;
reg [M-1:0] ABL;

reg WEBL;
reg REBL;
wire [N-1:0] QL;

reg valid_ckr, valid_ckw;
reg valid_wea;
reg valid_reb;
reg valid_aa;
reg valid_ab;
reg valid_pd;
reg valid_contention;
reg valid_d17, valid_d16, valid_d15, valid_d14, valid_d13, valid_d12, valid_d11, valid_d10, valid_d9, valid_d8, valid_d7, valid_d6, valid_d5, valid_d4, valid_d3, valid_d2, valid_d1, valid_d0;
reg valid_bw17, valid_bw16, valid_bw15, valid_bw14, valid_bw13, valid_bw12, valid_bw11, valid_bw10, valid_bw9, valid_bw8, valid_bw7, valid_bw6, valid_bw5, valid_bw4, valid_bw3, valid_bw2, valid_bw1, valid_bw0;
reg valid_bist;

integer clk_count;

reg EN;
reg RDA, RDB;

reg RCLKW,RCLKR;

wire [N-1:0] bBWEB;

wire [N-1:0] bD;

wire [M-1:0] bAA;
wire [M-1:0] bAB;

wire bWEB;
wire bREB;
wire bCLKW,bCLKR;
wire bPD;


reg [N-1:0] bQ;
wire [N-1:0] bbQ;

wire [N-1:0] bBWEBM;
wire [N-1:0] bDM;
wire [M-1:0] bAMA;
wire [M-1:0] bAMB;
wire bWEBM;
wire bREBM;
wire bBIST;
wire NOBIST;

integer i;
 
// Address Inputs
buf sAA0 (bAA[0], AA[0]);
buf sAB0 (bAB[0], AB[0]);
buf sAA1 (bAA[1], AA[1]);
buf sAB1 (bAB[1], AB[1]);
buf sAA2 (bAA[2], AA[2]);
buf sAB2 (bAB[2], AB[2]);
buf sAA3 (bAA[3], AA[3]);
buf sAB3 (bAB[3], AB[3]);
buf sAA4 (bAA[4], AA[4]);
buf sAB4 (bAB[4], AB[4]);
buf sAA5 (bAA[5], AA[5]);
buf sAB5 (bAB[5], AB[5]);
buf sAA6 (bAA[6], AA[6]);
buf sAB6 (bAB[6], AB[6]);
buf sAA7 (bAA[7], AA[7]);
buf sAB7 (bAB[7], AB[7]);
buf sAA8 (bAA[8], AA[8]);
buf sAB8 (bAB[8], AB[8]);
buf sAA9 (bAA[9], AA[9]);
buf sAB9 (bAB[9], AB[9]);
buf sAA10 (bAA[10], AA[10]);
buf sAB10 (bAB[10], AB[10]);

buf sAMA0 (bAMA[0], AMA[0]);
buf sAMB0 (bAMB[0], AMB[0]);
buf sAMA1 (bAMA[1], AMA[1]);
buf sAMB1 (bAMB[1], AMB[1]);
buf sAMA2 (bAMA[2], AMA[2]);
buf sAMB2 (bAMB[2], AMB[2]);
buf sAMA3 (bAMA[3], AMA[3]);
buf sAMB3 (bAMB[3], AMB[3]);
buf sAMA4 (bAMA[4], AMA[4]);
buf sAMB4 (bAMB[4], AMB[4]);
buf sAMA5 (bAMA[5], AMA[5]);
buf sAMB5 (bAMB[5], AMB[5]);
buf sAMA6 (bAMA[6], AMA[6]);
buf sAMB6 (bAMB[6], AMB[6]);
buf sAMA7 (bAMA[7], AMA[7]);
buf sAMB7 (bAMB[7], AMB[7]);
buf sAMA8 (bAMA[8], AMA[8]);
buf sAMB8 (bAMB[8], AMB[8]);
buf sAMA9 (bAMA[9], AMA[9]);
buf sAMB9 (bAMB[9], AMB[9]);
buf sAMA10 (bAMA[10], AMA[10]);
buf sAMB10 (bAMB[10], AMB[10]);

// Bit Write/Data Inputs 
buf sD0 (bD[0], D[0]);
buf sBWEB0 (bBWEB[0], BWEB[0]);
buf sD1 (bD[1], D[1]);
buf sBWEB1 (bBWEB[1], BWEB[1]);
buf sD2 (bD[2], D[2]);
buf sBWEB2 (bBWEB[2], BWEB[2]);
buf sD3 (bD[3], D[3]);
buf sBWEB3 (bBWEB[3], BWEB[3]);
buf sD4 (bD[4], D[4]);
buf sBWEB4 (bBWEB[4], BWEB[4]);
buf sD5 (bD[5], D[5]);
buf sBWEB5 (bBWEB[5], BWEB[5]);
buf sD6 (bD[6], D[6]);
buf sBWEB6 (bBWEB[6], BWEB[6]);
buf sD7 (bD[7], D[7]);
buf sBWEB7 (bBWEB[7], BWEB[7]);
buf sD8 (bD[8], D[8]);
buf sBWEB8 (bBWEB[8], BWEB[8]);
buf sD9 (bD[9], D[9]);
buf sBWEB9 (bBWEB[9], BWEB[9]);
buf sD10 (bD[10], D[10]);
buf sBWEB10 (bBWEB[10], BWEB[10]);
buf sD11 (bD[11], D[11]);
buf sBWEB11 (bBWEB[11], BWEB[11]);
buf sD12 (bD[12], D[12]);
buf sBWEB12 (bBWEB[12], BWEB[12]);
buf sD13 (bD[13], D[13]);
buf sBWEB13 (bBWEB[13], BWEB[13]);
buf sD14 (bD[14], D[14]);
buf sBWEB14 (bBWEB[14], BWEB[14]);
buf sD15 (bD[15], D[15]);
buf sBWEB15 (bBWEB[15], BWEB[15]);
buf sD16 (bD[16], D[16]);
buf sBWEB16 (bBWEB[16], BWEB[16]);
buf sD17 (bD[17], D[17]);
buf sBWEB17 (bBWEB[17], BWEB[17]);

buf sDM0 (bDM[0], DM[0]);
buf sBWEBM0 (bBWEBM[0], BWEBM[0]);
buf sDM1 (bDM[1], DM[1]);
buf sBWEBM1 (bBWEBM[1], BWEBM[1]);
buf sDM2 (bDM[2], DM[2]);
buf sBWEBM2 (bBWEBM[2], BWEBM[2]);
buf sDM3 (bDM[3], DM[3]);
buf sBWEBM3 (bBWEBM[3], BWEBM[3]);
buf sDM4 (bDM[4], DM[4]);
buf sBWEBM4 (bBWEBM[4], BWEBM[4]);
buf sDM5 (bDM[5], DM[5]);
buf sBWEBM5 (bBWEBM[5], BWEBM[5]);
buf sDM6 (bDM[6], DM[6]);
buf sBWEBM6 (bBWEBM[6], BWEBM[6]);
buf sDM7 (bDM[7], DM[7]);
buf sBWEBM7 (bBWEBM[7], BWEBM[7]);
buf sDM8 (bDM[8], DM[8]);
buf sBWEBM8 (bBWEBM[8], BWEBM[8]);
buf sDM9 (bDM[9], DM[9]);
buf sBWEBM9 (bBWEBM[9], BWEBM[9]);
buf sDM10 (bDM[10], DM[10]);
buf sBWEBM10 (bBWEBM[10], BWEBM[10]);
buf sDM11 (bDM[11], DM[11]);
buf sBWEBM11 (bBWEBM[11], BWEBM[11]);
buf sDM12 (bDM[12], DM[12]);
buf sBWEBM12 (bBWEBM[12], BWEBM[12]);
buf sDM13 (bDM[13], DM[13]);
buf sBWEBM13 (bBWEBM[13], BWEBM[13]);
buf sDM14 (bDM[14], DM[14]);
buf sBWEBM14 (bBWEBM[14], BWEBM[14]);
buf sDM15 (bDM[15], DM[15]);
buf sBWEBM15 (bBWEBM[15], BWEBM[15]);
buf sDM16 (bDM[16], DM[16]);
buf sBWEBM16 (bBWEBM[16], BWEBM[16]);
buf sDM17 (bDM[17], DM[17]);
buf sBWEBM17 (bBWEBM[17], BWEBM[17]);

// Input Controls
buf sWEB (bWEB, WEB);
buf sREB (bREB, REB);
buf sPD (bPD, PD);

buf sCLKW (bCLKW, CLKW);
buf sCLKR (bCLKR, CLKR);

buf sWE (WE, !bWEB);
buf sRE (RE, !bREB);

buf sWEBM (bWEBM, WEBM);
buf sREBM (bREBM, REBM);
buf sBIST (bBIST, BIST);


// Output Data
buf sQ0 (Q[0], bbQ[0]);
buf sQ1 (Q[1], bbQ[1]);
buf sQ2 (Q[2], bbQ[2]);
buf sQ3 (Q[3], bbQ[3]);
buf sQ4 (Q[4], bbQ[4]);
buf sQ5 (Q[5], bbQ[5]);
buf sQ6 (Q[6], bbQ[6]);
buf sQ7 (Q[7], bbQ[7]);
buf sQ8 (Q[8], bbQ[8]);
buf sQ9 (Q[9], bbQ[9]);
buf sQ10 (Q[10], bbQ[10]);
buf sQ11 (Q[11], bbQ[11]);
buf sQ12 (Q[12], bbQ[12]);
buf sQ13 (Q[13], bbQ[13]);
buf sQ14 (Q[14], bbQ[14]);
buf sQ15 (Q[15], bbQ[15]);
buf sQ16 (Q[16], bbQ[16]);
buf sQ17 (Q[17], bbQ[17]);

assign bbQ=bQ;

buf sNOBIST (NOBIST, !bBIST);
and sANOBIST (ANOBIST, !bWEB, !bBIST);
and sBNOBIST (BNOBIST, !bREB, !bBIST);

and sABIST (ABIST, !bWEBM, bBIST);
and sBBIST (BBIST, !bREBM, bBIST);

wire AeqB, BeqA;
wire AbeforeB, BbeforeA;

real CLKR_time, CLKW_time;
 
wire CLK_same;   
assign CLK_same = ((CLKR_time == CLKW_time)?1'b1:1'b0);

`ifdef UNIT_DELAY
wire AeqBL;
assign AeqBL = ( (AAL == ABL) ) ? 1'b1:1'b0;
`else

assign AeqB = ( ((bAA == bAB) && CLK_same && !bBIST) || ((AAL == bAB) && !CLK_same && !bBIST) || ((bAMA == bAMB) && CLK_same && bBIST) || ((AAL == bAMB) && !CLK_same && bBIST)) ? 1'b1:1'b0;
assign BeqA = ( ((bAB == bAA) && CLK_same && !bBIST) || ((ABL == bAA) && !CLK_same && !bBIST) || ((bAMB == bAMA) && CLK_same && bBIST) || ((ABL == bAMA) && !CLK_same && bBIST)) ? 1'b1:1'b0;

assign AbeforeB = (((!bWEB && !bREB && CLK_same && !bBIST) || (!WEBL && !bREB && !CLK_same && !bBIST) || (!bWEBM && !bREBM && CLK_same && bBIST) || (!WEBL && !bREBM && !CLK_same && bBIST )) && AeqB) ? 1'b1:1'b0;

assign BbeforeA = (((!bREB && !bWEB && CLK_same && !bBIST) || (!REBL && !bWEB && !CLK_same && !bBIST) || (!bREBM && !bWEBM && CLK_same && bBIST) || (!REBL && !bWEBM && !CLK_same && bBIST )) && BeqA) ? 1'b1:1'b0;

`endif

`ifdef UNIT_DELAY
parameter pdx = 1.2526690*8;
`else
specify

   specparam PATHPULSE$CLKR$Q = ( 0, 0.001 );
   specparam PATHPULSE$PD$Q = ( 0, 0.001 );


specparam
tCKL = 0.3208606,
tCKH = 0.2505332,
tWCYC = 1.2526690,
tRCYC = 1.4294490,
tCC = 0.889,
pdx = 1.2526690*8,

tAAS = 0.3218171,
tAAH = 0.0000000,
tABS = 0.3215423,
tABH = 0.0000000,
tDS = 0.2333959,
tDH = 0.0000000,
tWS = 0.2357960,
tWH = 0.0000000,
tRS= 0.2360375,
tREH = 0.0000000,
tBWS = 0.2061789,
tBWH = 0.0000000,

tAMAS = 0.3234593,
tAMAH = 0.0000000,
tAMBS = 0.3238319,
tAMBH = 0.0000000,
tDMS = 0.2354487,
tDMH = 0.0000000,
tWMS = 0.2405524,
tWMH = 0.0000000,
tRMS = 0.2407226,
tRMH = 0.0000000,
tBWMS = 0.2127661,
tBWMH = 0.0000000,
tBISTS= 1.003,
tBISTH = 0.000,

tCD = 0.9126478,
tHOLD = 0.5477732;

  $recrem (posedge CLKW, posedge CLKR &&& AbeforeB, tCC, 0, valid_contention);
  $recrem (posedge CLKR, posedge CLKW &&& BbeforeA, tCC, 0, valid_contention);

  $setuphold (posedge WEB &&& NOBIST, posedge PD, 0, tWCYC, valid_pd);
  $setuphold (posedge REB &&& NOBIST, posedge PD, 0, tWCYC, valid_pd);
  $setuphold (posedge WEBM &&& BIST, posedge PD, 0, tWCYC, valid_pd);
  $setuphold (posedge REBM &&& BIST, posedge PD, 0, tWCYC, valid_pd);

  $setuphold (negedge WEB &&& NOBIST, negedge PD, pdx, 0, valid_pd);
  $setuphold (negedge REB &&& NOBIST, negedge PD, pdx, 0, valid_pd);
  $setuphold (negedge WEBM &&& BIST, negedge PD, pdx, 0, valid_pd);
  $setuphold (negedge REBM &&& BIST, negedge PD, pdx, 0, valid_pd);

  $setuphold (posedge CLKW &&& ABIST, posedge AMA[0], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[0], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[0], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[0], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[0], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[0], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[0], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[0], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[1], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[1], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[1], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[1], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[1], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[1], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[1], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[1], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[2], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[2], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[2], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[2], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[2], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[2], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[2], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[2], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[3], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[3], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[3], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[3], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[3], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[3], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[3], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[3], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[4], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[4], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[4], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[4], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[4], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[4], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[4], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[4], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[5], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[5], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[5], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[5], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[5], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[5], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[5], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[5], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[6], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[6], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[6], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[6], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[6], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[6], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[6], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[6], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[7], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[7], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[7], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[7], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[7], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[7], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[7], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[7], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[8], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[8], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[8], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[8], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[8], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[8], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[8], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[8], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[9], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[9], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[9], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[9], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[9], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[9], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[9], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[9], tABS, tABH, valid_ab);
  $setuphold (posedge CLKW &&& ABIST, posedge AMA[10], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKW &&& ABIST, negedge AMA[10], tAMAS, tAMAH, valid_aa);
  $setuphold (posedge CLKR &&& BBIST, posedge AMB[10], tAMBS, tAMBH, valid_ab);
  $setuphold (posedge CLKR &&& BBIST, negedge AMB[10], tAMBS, tAMBH, valid_ab);
 
  $setuphold (posedge CLKW &&& ANOBIST, posedge AA[10], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKW &&& ANOBIST, negedge AA[10], tAAS, tAAH, valid_aa);
  $setuphold (posedge CLKR &&& BNOBIST, posedge AB[10], tABS, tABH, valid_ab);
  $setuphold (posedge CLKR &&& BNOBIST, negedge AB[10], tABS, tABH, valid_ab);

  $setuphold (posedge CLKW &&& ANOBIST, posedge D[0], tDS, tDH, valid_d0);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[0], tDS, tDH, valid_d0);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[0], tDMS, tDMH, valid_d0);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[0], tDMS, tDMH, valid_d0);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[0], tBWS, tBWH, valid_bw0);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[0], tBWS, tBWH, valid_bw0);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[0], tBWMS, tBWMH, valid_bw0);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[0], tBWMS, tBWMH, valid_bw0);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[1], tDS, tDH, valid_d1);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[1], tDS, tDH, valid_d1);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[1], tDMS, tDMH, valid_d1);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[1], tDMS, tDMH, valid_d1);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[1], tBWS, tBWH, valid_bw1);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[1], tBWS, tBWH, valid_bw1);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[1], tBWMS, tBWMH, valid_bw1);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[1], tBWMS, tBWMH, valid_bw1);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[2], tDS, tDH, valid_d2);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[2], tDS, tDH, valid_d2);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[2], tDMS, tDMH, valid_d2);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[2], tDMS, tDMH, valid_d2);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[2], tBWS, tBWH, valid_bw2);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[2], tBWS, tBWH, valid_bw2);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[2], tBWMS, tBWMH, valid_bw2);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[2], tBWMS, tBWMH, valid_bw2);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[3], tDS, tDH, valid_d3);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[3], tDS, tDH, valid_d3);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[3], tDMS, tDMH, valid_d3);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[3], tDMS, tDMH, valid_d3);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[3], tBWS, tBWH, valid_bw3);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[3], tBWS, tBWH, valid_bw3);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[3], tBWMS, tBWMH, valid_bw3);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[3], tBWMS, tBWMH, valid_bw3);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[4], tDS, tDH, valid_d4);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[4], tDS, tDH, valid_d4);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[4], tDMS, tDMH, valid_d4);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[4], tDMS, tDMH, valid_d4);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[4], tBWS, tBWH, valid_bw4);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[4], tBWS, tBWH, valid_bw4);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[4], tBWMS, tBWMH, valid_bw4);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[4], tBWMS, tBWMH, valid_bw4);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[5], tDS, tDH, valid_d5);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[5], tDS, tDH, valid_d5);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[5], tDMS, tDMH, valid_d5);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[5], tDMS, tDMH, valid_d5);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[5], tBWS, tBWH, valid_bw5);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[5], tBWS, tBWH, valid_bw5);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[5], tBWMS, tBWMH, valid_bw5);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[5], tBWMS, tBWMH, valid_bw5);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[6], tDS, tDH, valid_d6);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[6], tDS, tDH, valid_d6);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[6], tDMS, tDMH, valid_d6);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[6], tDMS, tDMH, valid_d6);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[6], tBWS, tBWH, valid_bw6);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[6], tBWS, tBWH, valid_bw6);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[6], tBWMS, tBWMH, valid_bw6);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[6], tBWMS, tBWMH, valid_bw6);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[7], tDS, tDH, valid_d7);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[7], tDS, tDH, valid_d7);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[7], tDMS, tDMH, valid_d7);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[7], tDMS, tDMH, valid_d7);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[7], tBWS, tBWH, valid_bw7);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[7], tBWS, tBWH, valid_bw7);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[7], tBWMS, tBWMH, valid_bw7);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[7], tBWMS, tBWMH, valid_bw7);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[8], tDS, tDH, valid_d8);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[8], tDS, tDH, valid_d8);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[8], tDMS, tDMH, valid_d8);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[8], tDMS, tDMH, valid_d8);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[8], tBWS, tBWH, valid_bw8);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[8], tBWS, tBWH, valid_bw8);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[8], tBWMS, tBWMH, valid_bw8);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[8], tBWMS, tBWMH, valid_bw8);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[9], tDS, tDH, valid_d9);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[9], tDS, tDH, valid_d9);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[9], tDMS, tDMH, valid_d9);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[9], tDMS, tDMH, valid_d9);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[9], tBWS, tBWH, valid_bw9);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[9], tBWS, tBWH, valid_bw9);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[9], tBWMS, tBWMH, valid_bw9);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[9], tBWMS, tBWMH, valid_bw9);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[10], tDS, tDH, valid_d10);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[10], tDS, tDH, valid_d10);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[10], tDMS, tDMH, valid_d10);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[10], tDMS, tDMH, valid_d10);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[10], tBWS, tBWH, valid_bw10);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[10], tBWS, tBWH, valid_bw10);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[10], tBWMS, tBWMH, valid_bw10);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[10], tBWMS, tBWMH, valid_bw10);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[11], tDS, tDH, valid_d11);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[11], tDS, tDH, valid_d11);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[11], tDMS, tDMH, valid_d11);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[11], tDMS, tDMH, valid_d11);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[11], tBWS, tBWH, valid_bw11);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[11], tBWS, tBWH, valid_bw11);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[11], tBWMS, tBWMH, valid_bw11);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[11], tBWMS, tBWMH, valid_bw11);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[12], tDS, tDH, valid_d12);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[12], tDS, tDH, valid_d12);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[12], tDMS, tDMH, valid_d12);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[12], tDMS, tDMH, valid_d12);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[12], tBWS, tBWH, valid_bw12);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[12], tBWS, tBWH, valid_bw12);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[12], tBWMS, tBWMH, valid_bw12);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[12], tBWMS, tBWMH, valid_bw12);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[13], tDS, tDH, valid_d13);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[13], tDS, tDH, valid_d13);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[13], tDMS, tDMH, valid_d13);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[13], tDMS, tDMH, valid_d13);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[13], tBWS, tBWH, valid_bw13);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[13], tBWS, tBWH, valid_bw13);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[13], tBWMS, tBWMH, valid_bw13);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[13], tBWMS, tBWMH, valid_bw13);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[14], tDS, tDH, valid_d14);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[14], tDS, tDH, valid_d14);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[14], tDMS, tDMH, valid_d14);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[14], tDMS, tDMH, valid_d14);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[14], tBWS, tBWH, valid_bw14);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[14], tBWS, tBWH, valid_bw14);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[14], tBWMS, tBWMH, valid_bw14);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[14], tBWMS, tBWMH, valid_bw14);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[15], tDS, tDH, valid_d15);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[15], tDS, tDH, valid_d15);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[15], tDMS, tDMH, valid_d15);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[15], tDMS, tDMH, valid_d15);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[15], tBWS, tBWH, valid_bw15);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[15], tBWS, tBWH, valid_bw15);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[15], tBWMS, tBWMH, valid_bw15);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[15], tBWMS, tBWMH, valid_bw15);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[16], tDS, tDH, valid_d16);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[16], tDS, tDH, valid_d16);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[16], tDMS, tDMH, valid_d16);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[16], tDMS, tDMH, valid_d16);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[16], tBWS, tBWH, valid_bw16);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[16], tBWS, tBWH, valid_bw16);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[16], tBWMS, tBWMH, valid_bw16);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[16], tBWMS, tBWMH, valid_bw16);
  $setuphold (posedge CLKW &&& ANOBIST, posedge D[17], tDS, tDH, valid_d17);
  $setuphold (posedge CLKW &&& ANOBIST, negedge D[17], tDS, tDH, valid_d17);

  $setuphold (posedge CLKW &&& ABIST, posedge DM[17], tDMS, tDMH, valid_d17);
  $setuphold (posedge CLKW &&& ABIST, negedge DM[17], tDMS, tDMH, valid_d17);

  $setuphold (posedge CLKW &&& ANOBIST, posedge BWEB[17], tBWS, tBWH, valid_bw17);
  $setuphold (posedge CLKW &&& ANOBIST, negedge BWEB[17], tBWS, tBWH, valid_bw17);

  $setuphold (posedge CLKW &&& ABIST, posedge BWEBM[17], tBWMS, tBWMH, valid_bw17);
  $setuphold (posedge CLKW &&& ABIST, negedge BWEBM[17], tBWMS, tBWMH, valid_bw17);

  $setuphold (posedge CLKW &&& NOBIST, posedge WEB, tWS, tWH, valid_wea);
  $setuphold (posedge CLKW &&& NOBIST, negedge WEB, tWS, tWH, valid_wea);
  $setuphold (posedge CLKR &&& NOBIST, posedge REB, tRS, tREH, valid_reb);
  $setuphold (posedge CLKR &&& NOBIST, negedge REB, tRS, tREH, valid_reb);
 
  $setuphold (posedge CLKW &&& BIST, posedge WEBM, tWMS, tWMH, valid_wea);
  $setuphold (posedge CLKW &&& BIST, negedge WEBM, tWMS, tWMH, valid_wea);
  $setuphold (posedge CLKR &&& BIST, posedge REBM, tRMS, tRMH, valid_reb);
  $setuphold (posedge CLKR &&& BIST, negedge REBM, tRMS, tRMH, valid_reb);
 
  $setuphold (posedge CLKW, posedge BIST, tBISTS, tBISTH, valid_bist);
  $setuphold (posedge CLKW, negedge BIST, tBISTS, tBISTH, valid_bist);
  $setuphold (posedge CLKR, posedge BIST, tBISTS, tBISTH, valid_bist);
  $setuphold (posedge CLKR, negedge BIST, tBISTS, tBISTH, valid_bist);
 
  $width (negedge CLKW, tCKL, 0, valid_ckw);
  $width (posedge CLKW, tCKH, 0, valid_ckw);
  $width (negedge CLKR, tCKL, 0, valid_ckr);
  $width (posedge CLKR, tCKH, 0, valid_ckr);
  $period (posedge CLKW, tWCYC, valid_ckw);
  $period (negedge CLKW, tWCYC, valid_ckw);
  $period (posedge CLKR, tRCYC, valid_ckr);
  $period (negedge CLKR, tRCYC, valid_ckr);

 if (!PD & !REB & !BIST)(posedge CLKR => (Q[0] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[0] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[1] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[1] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[2] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[2] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[3] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[3] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[4] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[4] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[5] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[5] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[6] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[6] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[7] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[7] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[8] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[8] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[9] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[9] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[10] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[10] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[11] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[11] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[12] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[12] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[13] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[13] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[14] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[14] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[15] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[15] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[16] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[16] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REB & !BIST)(posedge CLKR => (Q[17] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);
 if (!PD & !REBM & BIST)(posedge CLKR => (Q[17] : 1'bx)) = (tCD,tCD,tHOLD,tCD,tHOLD,tCD);


 (posedge PD => (Q[0] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[1] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[2] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[3] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[4] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[5] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[6] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[7] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[8] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[9] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[10] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[11] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[12] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[13] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[14] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[15] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[16] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);
 (posedge PD => (Q[17] +: 1'bx)) =  (0.0,tCD,0.0,0.0,0.0,tCD);

endspecify
`endif

initial
begin
  assign EN = 1;
  clk_count = 0;
  RDB = 1'b0;
  BWEBL =  {N{1'b1}};
end

 `ifdef TSMC_INITIALIZE_MEM
initial
   begin 
     #0.01  $readmemh(cdeFileInit, MX.mem, 0, W-1);
   end
`endif //  `ifdef TSMC_INITIALIZE_MEM
   
`ifdef TSMC_INITIALIZE_FAULT
initial
   begin
     $readmemh(cdeFileFault, MX.mem_fault, 0, W-1);
   end
`endif //  `ifdef TSMC_INITIALIZE_FAULT

always @(posedge CLKR) CLKR_time = $realtime;
always @(posedge CLKW) CLKW_time = $realtime;

always @(bBIST)
   if (bBIST === 1'bx && !PD)
   begin
      if( MES_ALL=="ON" && $realtime != 0)
         $display("\nWarning %m BIST unknown, Core Unknown at %t. >>", $realtime);
      #0;
      AAL <= {M{1'bx}};
      BWEBL <= {N{1'b0}};
      bQ = #0.001 {N{1'bx}};
   end

always @(bCLKW)
  begin
   if (bCLKW === 1'bx && !PD)
   begin
      if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m CLKW unknown at %t. >>", $realtime);
      #0;
      AAL <= {M{1'bx}};
      BWEBL <= {N{1'b0}};
   end
   else if (bCLKW === 1'b1 && RCLKW === 1'b0)
   begin
      if (!bBIST)
      begin                             // begin if (!bBIST)
         WEBL = bWEB;
         AAL = bAA;
         if (bWEB === 1'bx && !bPD && !bBIST)
             begin
	        if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WEB unknown at %t. >>", $realtime);
	        #0;
                AAL <= {M{1'bx}};
	        BWEBL <= {N{1'b0}};
              end
         else if (^bAA === 1'bx && bWEB === 1'b0 && !bPD && !bBIST)
             begin
	        if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WRITE AA unknown at %t. >>", $realtime);
	        #0;
                AAL <= {M{1'bx}};
	        BWEBL <= {N{1'b0}};
              end
         else begin
         if (bWEB !== 1'b1) DL = bD;
         if (bWEB !== 1'b1 && bPD === 1'b0) 
         begin                         // begin if (bWEB !== 1'b1) 
            bBWEBL = bBWEB;
            for (i = 0; i < N; i = i + 1) 
            begin                      // begin for...
               if (!bBWEB[i] && !bWEB) BWEBL[i] = 1'b0;
               if ((bWEB===1'bx) || (bBWEB[i] ===1'bx))
               begin
                  BWEBL[i] = 1'b0; 
                  DL[i] = 1'bx;
               end                     // end if (((...
            end                        // end for (
         end
         if (bWEB !== 1'b1 && (bPD !== 1'b0 || clk_count == 1))
         begin
            if( MES_ALL=="ON" && $realtime != 0)
            $display ("\nWarning! In Power Down, %m:",
                   "\n\t Time %t, Core Unknown.", $realtime);
            AAL <= {M{1'bx}};
            BWEBL <= {N{1'b0}};
         end
        end
      end

      if (bBIST)
      begin                             // begin if (!bBIST)
         WEBL = bWEBM;
         AAL = bAMA; 
         if (bWEBM === 1'bx && !bPD && bBIST)
             begin
	        if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WEBM unknown at %t. >>", $realtime);
	        #0;
                AAL <= {M{1'bx}};
	        BWEBL <= {N{1'b0}};
              end
         else if (^bAMA === 1'bx && bWEBM === 1'b0 && !bPD && bBIST)
             begin
	        if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m WRITE AMA unknown at %t. >>", $realtime);
	        #0;
                AAL <= {M{1'bx}};
	        BWEBL <= {N{1'b0}};
              end
         else begin
         if (bWEBM !== 1'b1) DL = bDM;
         if (bWEBM !== 1'b1 && bPD === 1'b0) 
         begin                         // begin if (bWEBM !== 1'b1)
            bBWEBL = bBWEBM;
            for (i = 0; i < N; i = i + 1) 
            begin                      // begin for...   
               if (!bBWEBM[i] && !bWEBM) BWEBL[i] = 1'b0;
               if ((bWEBM===1'bx) || (bBWEBM[i] ===1'bx))
               begin                   // if (((...
                  BWEBL[i] = 1'b0; 
                  DL[i] = 1'bx;   
               end                     // end if (((...  
            end                        // end for (   
         end    
        if (bWEBM !== 1'b1 && (bPD !== 1'b0 || clk_count == 1))
        begin
            if( MES_ALL=="ON" && $realtime != 0)
            $display ("\nWarning! In Power Down, %m:",
                   "\n\t Time %t, Core Unknown.", $realtime);
            AAL <= {M{1'bx}};
            BWEBL <= {N{1'b0}};
        end
      end
    end
   end
   RCLKW = bCLKW;
  end // always @ (bCLKW)


always @(bCLKR)
  begin
   if (bCLKR === 1'bx && !PD)
   begin
      if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m CLKR unknown at %t.>>", $realtime);
      #0;
      bQ = #0.001 {N{1'bx}};
   end
   else if (bCLKR === 1'b1 && RCLKR === 1'b0)
   begin
      if (!bBIST) REBL = bREB;
      if (bREB === 1'bx && !bBIST && !bPD)
         begin
           if( MES_ALL=="ON" && $realtime != 0)
              $display("\nWarning %m REB unknown at %t.>>", $realtime);
              bQ = #0.001 {N{1'bx}};
         end
      else if (^bAB === 1'bx && bREB === 1'b0 && !bBIST && !bPD)
         begin
           if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m READ AB unknown at %t. >>", $realtime);
	      #0;
              bQ = #0.001 {N{1'bx}};
         end
      else begin
      if (!bBIST && bREB !== 1'b1 && (bPD !== 1'b0 || clk_count == 1))
         begin
            if( MES_ALL=="ON" && $realtime != 0)
            $display ("\nWarning! In Power Down, %m:",
                   "\n\t Time %t, outputs set to unknown.", $realtime);
         end
      if (!bBIST && !bREB && !bPD && clk_count == 0) 
      begin
         ABL = bAB;
         RDB = #0 ~RDB;
      end
      end

      if (bBIST) REBL = bREBM;
      if (bREBM === 1'bx && bBIST && !bPD)
         begin
           if( MES_ALL=="ON" && $realtime != 0)
              $display("\nWarning %m REBM unknown at %t.>>", $realtime);
              bQ = #0.001 {N{1'bx}};
         end
      else if (^bAMB === 1'bx && bREBM === 1'b0 && bBIST && !bPD)
         begin
           if( MES_ALL=="ON" && $realtime != 0) $display("\nWarning %m READ AMB unknown at %t. >>", $realtime);
	      #0;
              bQ = #0.001 {N{1'bx}};
         end
      else begin
      if (bBIST && bREBM !== 1'b1 && (bPD !== 1'b0 || clk_count == 1))
         begin
            if( MES_ALL=="ON" && $realtime != 0)
            $display ("\nWarning! In Power Down, %m:",
                   "\n\t Time %t, outputs set to unknown.", $realtime);
         end
      if (bBIST && !bREBM && !bPD && clk_count == 0)
      begin                             // begin if (!bBIST)
         ABL = bAMB;
         RDB = #0 ~RDB;
      end
      end
   end
   RCLKR = bCLKR;
  end


always @(RDB or QL) 
   begin
     if (!bPD && clk_count == 0) 
`ifdef UNIT_DELAY
       begin
          #(`SRAM_DELAY);
          bQ = QL;

          if (AeqBL && !WEBL && !REBL && CLK_same) 
	    begin
               if( MES_ALL=="ON" && $realtime != 0)
		 $display("\nWarning %m READ/WRITE contention. If BWEB enables, Outputs set to unknown at %t. >>", $realtime);
	       for (i=0; i<N; i=i+1)
		 begin
                    if(!bBWEBL[i] || bBWEBL[i]===1'bx)
                      begin
                         bQ[i] <= 1'bx;
		      end
		 end
	    end // if (AeqBL && !WEBL && !REBL && CLK_same)
`else
       begin
          bQ = {N{1'bx}};
          #0.001  bQ = QL;
`endif
       end // if (!bPD && clk_count == 0)
   end // always @ (RDB or QL)

always @(bPD or AMA[0] or BIST) begin
  if (bPD === 1'b1 && AMA[0] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[0] or BIST) begin
  if (bPD === 1'b1 && AMB[0] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[1] or BIST) begin
  if (bPD === 1'b1 && AMA[1] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[1] or BIST) begin
  if (bPD === 1'b1 && AMB[1] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[2] or BIST) begin
  if (bPD === 1'b1 && AMA[2] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[2] or BIST) begin
  if (bPD === 1'b1 && AMB[2] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[3] or BIST) begin
  if (bPD === 1'b1 && AMA[3] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[3] or BIST) begin
  if (bPD === 1'b1 && AMB[3] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[4] or BIST) begin
  if (bPD === 1'b1 && AMA[4] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[4] or BIST) begin
  if (bPD === 1'b1 && AMB[4] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[5] or BIST) begin
  if (bPD === 1'b1 && AMA[5] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[5] or BIST) begin
  if (bPD === 1'b1 && AMB[5] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[6] or BIST) begin
  if (bPD === 1'b1 && AMA[6] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[6] or BIST) begin
  if (bPD === 1'b1 && AMB[6] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[7] or BIST) begin
  if (bPD === 1'b1 && AMA[7] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[7] or BIST) begin
  if (bPD === 1'b1 && AMB[7] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[8] or BIST) begin
  if (bPD === 1'b1 && AMA[8] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[8] or BIST) begin
  if (bPD === 1'b1 && AMB[8] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[9] or BIST) begin
  if (bPD === 1'b1 && AMA[9] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[9] or BIST) begin
  if (bPD === 1'b1 && AMB[9] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMA[10] or BIST) begin
  if (bPD === 1'b1 && AMA[10] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMA[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AMB[10] or BIST) begin
  if (bPD === 1'b1 && AMB[10] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AMB[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end

always @(bPD or DM[0] or BIST) begin
  if (bPD === 1'b1 && DM[0] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[0] or BIST) begin
  if (bPD === 1'b1 && BWEBM[0] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[1] or BIST) begin
  if (bPD === 1'b1 && DM[1] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[1] or BIST) begin
  if (bPD === 1'b1 && BWEBM[1] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[2] or BIST) begin
  if (bPD === 1'b1 && DM[2] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[2] or BIST) begin
  if (bPD === 1'b1 && BWEBM[2] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[3] or BIST) begin
  if (bPD === 1'b1 && DM[3] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[3] or BIST) begin
  if (bPD === 1'b1 && BWEBM[3] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[4] or BIST) begin
  if (bPD === 1'b1 && DM[4] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[4] or BIST) begin
  if (bPD === 1'b1 && BWEBM[4] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[5] or BIST) begin
  if (bPD === 1'b1 && DM[5] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[5] or BIST) begin
  if (bPD === 1'b1 && BWEBM[5] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[6] or BIST) begin
  if (bPD === 1'b1 && DM[6] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[6] or BIST) begin
  if (bPD === 1'b1 && BWEBM[6] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[7] or BIST) begin
  if (bPD === 1'b1 && DM[7] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[7] or BIST) begin
  if (bPD === 1'b1 && BWEBM[7] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[8] or BIST) begin
  if (bPD === 1'b1 && DM[8] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[8] or BIST) begin
  if (bPD === 1'b1 && BWEBM[8] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[9] or BIST) begin
  if (bPD === 1'b1 && DM[9] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[9] or BIST) begin
  if (bPD === 1'b1 && BWEBM[9] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[10] or BIST) begin
  if (bPD === 1'b1 && DM[10] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[10] or BIST) begin
  if (bPD === 1'b1 && BWEBM[10] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[11] or BIST) begin
  if (bPD === 1'b1 && DM[11] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[11] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[11] or BIST) begin
  if (bPD === 1'b1 && BWEBM[11] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[11] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[12] or BIST) begin
  if (bPD === 1'b1 && DM[12] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[12] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[12] or BIST) begin
  if (bPD === 1'b1 && BWEBM[12] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[12] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[13] or BIST) begin
  if (bPD === 1'b1 && DM[13] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[13] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[13] or BIST) begin
  if (bPD === 1'b1 && BWEBM[13] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[13] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[14] or BIST) begin
  if (bPD === 1'b1 && DM[14] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[14] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[14] or BIST) begin
  if (bPD === 1'b1 && BWEBM[14] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[14] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[15] or BIST) begin
  if (bPD === 1'b1 && DM[15] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[15] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[15] or BIST) begin
  if (bPD === 1'b1 && BWEBM[15] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[15] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[16] or BIST) begin
  if (bPD === 1'b1 && DM[16] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[16] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[16] or BIST) begin
  if (bPD === 1'b1 && BWEBM[16] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[16] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or DM[17] or BIST) begin
  if (bPD === 1'b1 && DM[17] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input DM[17] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEBM[17] or BIST) begin
  if (bPD === 1'b1 && BWEBM[17] === 1'bz && bBIST !== 1'b0) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEBM[17] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end

always @(bPD or AA[0] or BIST) begin
  if (bPD === 1'b1 && AA[0] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[0] or BIST) begin
  if (bPD === 1'b1 && AB[0] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[1] or BIST) begin
  if (bPD === 1'b1 && AA[1] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[1] or BIST) begin
  if (bPD === 1'b1 && AB[1] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[2] or BIST) begin
  if (bPD === 1'b1 && AA[2] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[2] or BIST) begin
  if (bPD === 1'b1 && AB[2] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[3] or BIST) begin
  if (bPD === 1'b1 && AA[3] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[3] or BIST) begin
  if (bPD === 1'b1 && AB[3] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[4] or BIST) begin
  if (bPD === 1'b1 && AA[4] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[4] or BIST) begin
  if (bPD === 1'b1 && AB[4] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[5] or BIST) begin
  if (bPD === 1'b1 && AA[5] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[5] or BIST) begin
  if (bPD === 1'b1 && AB[5] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[6] or BIST) begin
  if (bPD === 1'b1 && AA[6] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[6] or BIST) begin
  if (bPD === 1'b1 && AB[6] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[7] or BIST) begin
  if (bPD === 1'b1 && AA[7] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[7] or BIST) begin
  if (bPD === 1'b1 && AB[7] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[8] or BIST) begin
  if (bPD === 1'b1 && AA[8] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[8] or BIST) begin
  if (bPD === 1'b1 && AB[8] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[9] or BIST) begin
  if (bPD === 1'b1 && AA[9] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[9] or BIST) begin
  if (bPD === 1'b1 && AB[9] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AA[10] or BIST) begin
  if (bPD === 1'b1 && AA[10] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AA[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or AB[10] or BIST) begin
  if (bPD === 1'b1 && AB[10] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input AB[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end

always @(bPD or D[0] or BIST) begin
  if (bPD === 1'b1 && D[0] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[0] or BIST) begin
  if (bPD === 1'b1 && BWEB[0] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[0] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[1] or BIST) begin
  if (bPD === 1'b1 && D[1] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[1] or BIST) begin
  if (bPD === 1'b1 && BWEB[1] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[1] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[2] or BIST) begin
  if (bPD === 1'b1 && D[2] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[2] or BIST) begin
  if (bPD === 1'b1 && BWEB[2] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[2] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[3] or BIST) begin
  if (bPD === 1'b1 && D[3] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[3] or BIST) begin
  if (bPD === 1'b1 && BWEB[3] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[3] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[4] or BIST) begin
  if (bPD === 1'b1 && D[4] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[4] or BIST) begin
  if (bPD === 1'b1 && BWEB[4] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[4] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[5] or BIST) begin
  if (bPD === 1'b1 && D[5] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[5] or BIST) begin
  if (bPD === 1'b1 && BWEB[5] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[5] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[6] or BIST) begin
  if (bPD === 1'b1 && D[6] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[6] or BIST) begin
  if (bPD === 1'b1 && BWEB[6] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[6] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[7] or BIST) begin
  if (bPD === 1'b1 && D[7] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[7] or BIST) begin
  if (bPD === 1'b1 && BWEB[7] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[7] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[8] or BIST) begin
  if (bPD === 1'b1 && D[8] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[8] or BIST) begin
  if (bPD === 1'b1 && BWEB[8] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[8] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[9] or BIST) begin
  if (bPD === 1'b1 && D[9] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[9] or BIST) begin
  if (bPD === 1'b1 && BWEB[9] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[9] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[10] or BIST) begin
  if (bPD === 1'b1 && D[10] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[10] or BIST) begin
  if (bPD === 1'b1 && BWEB[10] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[10] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[11] or BIST) begin
  if (bPD === 1'b1 && D[11] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[11] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[11] or BIST) begin
  if (bPD === 1'b1 && BWEB[11] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[11] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[12] or BIST) begin
  if (bPD === 1'b1 && D[12] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[12] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[12] or BIST) begin
  if (bPD === 1'b1 && BWEB[12] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[12] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[13] or BIST) begin
  if (bPD === 1'b1 && D[13] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[13] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[13] or BIST) begin
  if (bPD === 1'b1 && BWEB[13] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[13] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[14] or BIST) begin
  if (bPD === 1'b1 && D[14] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[14] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[14] or BIST) begin
  if (bPD === 1'b1 && BWEB[14] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[14] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[15] or BIST) begin
  if (bPD === 1'b1 && D[15] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[15] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[15] or BIST) begin
  if (bPD === 1'b1 && BWEB[15] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[15] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[16] or BIST) begin
  if (bPD === 1'b1 && D[16] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[16] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[16] or BIST) begin
  if (bPD === 1'b1 && BWEB[16] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[16] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or D[17] or BIST) begin
  if (bPD === 1'b1 && D[17] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input D[17] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or BWEB[17] or BIST) begin
  if (bPD === 1'b1 && BWEB[17] === 1'bz && bBIST !== 1'b1) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input BWEB[17] high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end

always @(bPD or CLKR) begin
  if (bPD === 1'b1 && CLKR === 1'bz) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input CLKR high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end
always @(bPD or CLKW) begin
  if (bPD === 1'b1 && CLKW === 1'bz) begin
    if(MES_ALL=="ON" && $realtime != 0) 
    begin
      $display("\nWarning %m input CLKW high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
    end
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    DL = {N{1'bx}};
`ifdef UNIT_DELAY
    #(`SRAM_DELAY);
`endif
    bQ = #0 {N{1'bx}};
  end
end

always @(bPD or bREB or bWEB)
   begin
     if (!bBIST)
     begin
       if (bPD === 1'b1 && (bREB === 1'b1 && bWEB === 1'b1)) 
      begin
         clk_count = 1;
         bQ = #0 {N{1'bx}};
         #0.001;  
         bQ = #0 {N{1'b0}};
      end
      else if (bPD === 1'b0 && (bREB === 1'b1 && bWEB === 1'b1) && clk_count ===1)
      begin
         bQ = #0 {N{1'bx}};
         #(pdx);
         clk_count = 0;
      end
     end
   end

always @(bPD or bREBM or bWEBM)
   begin
     if (bBIST)
     begin
       if (bPD === 1'b1 && (bREBM === 1'b1 && bWEBM === 1'b1)) 
      begin
         clk_count = 1;
         bQ = #0 {N{1'bx}};
         #0.001;  
         bQ = #0 {N{1'b0}};
      end
      else if (bPD === 1'b0 && (bREBM === 1'b1 && bWEBM === 1'b1) && clk_count ===1)
      begin
         bQ = #0 {N{1'bx}};
         #(pdx);
         clk_count = 0;
      end
     end
   end

always @(bPD)
   begin
      if (bPD === 1'bx && $realtime != 0) begin
            $display("\nWarning %m input PD unknown during Power Down Mode, Core Unknown at %t.>>", $realtime);
          AAL = {M{1'bx}};
          BWEBL = {N{1'b0}};
          DL = {N{1'bx}};
          bQ = #0 {N{1'bx}};
      end
   end

always @(posedge bPD or bREB or bWEB or BIST)
   begin
     if (bBIST === 1'b0 || bBIST === 1'bx)
     begin
      if (bPD === 1'b1 && (bREB !== 1'b1 || REBL !== 1'b1 || bWEB !== 1'b1 || WEBL !== 1'b1))
      begin
          if ($realtime != 0)
            $display("\nWarning %m Invalid Power Down Sequence, Core Unknown at %t. >>", $realtime);
          if (BIST === 1'bx && $realtime != 0)
            $display("\nWarning %m input BIST unknown during Power Down Mode, Core Unknown at %t.>>", $realtime);
          if (BIST === 1'bz && $realtime != 0)
            $display("\nWarning %m input BIST high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
          AAL = {M{1'bx}};
          BWEBL = {N{1'b0}};
          DL = {N{1'bx}};
          bQ = #0 {N{1'bx}};
      end
     end
   end

always @(posedge bPD or bREBM or bWEBM or BIST)
   begin
     if (bBIST === 1'b1 || bBIST === 1'bx)
     begin
      if (bPD === 1'b1 && (bREBM !== 1'b1 || REBL !== 1'b1 || bWEBM !== 1'b1 || WEBL !== 1'b1))
      begin
          if ($realtime != 0)
            $display("\nWarning %m Invalid Power Down Sequence, Core Unknown at %t. >>", $realtime);
          if (BIST === 1'bx && $realtime != 0)
            $display("\nWarning %m input BIST unknown during Power Down Mode, Core Unknown at %t.>>", $realtime);
          if (BIST === 1'bz && $realtime != 0)
            $display("\nWarning %m input BIST high-Z during Power Down Mode, Core Unknown at %t.>>", $realtime);
          AAL = {M{1'bx}};
          BWEBL = {N{1'b0}};
          DL = {N{1'bx}};
          bQ = #0 {N{1'bx}};
      end
     end
   end

always @(negedge bPD)
   begin
     if (bBIST === 1'b0 || bBIST === 1'bx)
     begin
      if (bPD === 1'b0 && (bREB !== 1'b1 || bWEB !== 1'b1))
      begin
          if ($realtime != 0)
            $display("\nWarning %m Invalid Wake Up Sequence, Core Unknown at %t. >>", $realtime);
          AAL = {M{1'bx}};
          BWEBL = {N{1'b0}};
          DL = {N{1'bx}};
          bQ = #0 {N{1'bx}};
      end
     end
   end

always @(negedge bPD)
   begin
     if (bBIST === 1'b1 || bBIST === 1'bx)
     begin
      if (bPD === 1'b0 && (bREBM !== 1'b1 || bWEBM !== 1'b1))
      begin
          if ($realtime != 0)
            $display("\nWarning %m Invalid Wake Up Sequence, Core Unknown at %t. >>", $realtime);
          AAL = {M{1'bx}};
          BWEBL = {N{1'b0}};
          DL = {N{1'bx}};
          bQ = #0 {N{1'bx}};
      end
     end
   end


always @(BWEBL) BWEBL = #0.01 {N{1'b1}};
 
`ifdef UNIT_DELAY
always @(posedge AeqBL) begin
   if (!WEBL && !REBL && CLK_same && AeqBL) 
     begin
        if( MES_ALL=="ON" && $realtime != 0)
	  $display("\nWarning %m READ/WRITE contention. If BWEB enables, outputs set to unknown at %t. >>", $realtime);
        #(`SRAM_DELAY);
        #0.001;
	for (i=0; i<N; i=i+1)
	  begin
             if(!bBWEBL[i] || bBWEBL[i]===1'bx)
               begin
                  bQ[i] <= 1'bx;
	       end
	  end
     end // if (!WEBL && !REBL && CLK_same)

end // always @ (posedge AeqBL)
`else
always @(valid_bist)
   begin
    AAL = {M{1'bx}};
    BWEBL = {N{1'b0}};
    bQ = {N{1'bx}};
end
always @(valid_aa)
   begin
      AAL = {M{1'bx}};
      BWEBL = {N{1'b0}};
   end

always @(valid_ab)
   begin
      #0;
      bQ = #0.001 {N{1'bx}};
   end

always @(valid_contention)
   begin
      #0.003;
	for (i=0; i<N; i=i+1)
	  begin
	     if(!bBWEB[i] || !BWEBL[i] || (bBWEB[i]===1'bx) || (BWEBL[i]===1'bx))
	       bQ[i] = 1'bx;
         end
   end

always @(valid_ckr)
   begin
      #0;
      bQ = #0.001 {N{1'bx}};
   end
 
always @(valid_ckw)
   begin
      AAL = {M{1'bx}};
      BWEBL = {N{1'b0}};
   end

always @(valid_d0)
   begin
      #0;
      DL[0] = 1'bx;
      BWEBL[0] = 1'b0;
   end

always @(valid_bw0)
   begin
      #0;
      DL[0] = 1'bx;
      BWEBL[0] = 1'b0;
   end

always @(valid_d1)
   begin
      #0;
      DL[1] = 1'bx;
      BWEBL[1] = 1'b0;
   end

always @(valid_bw1)
   begin
      #0;
      DL[1] = 1'bx;
      BWEBL[1] = 1'b0;
   end

always @(valid_d2)
   begin
      #0;
      DL[2] = 1'bx;
      BWEBL[2] = 1'b0;
   end

always @(valid_bw2)
   begin
      #0;
      DL[2] = 1'bx;
      BWEBL[2] = 1'b0;
   end

always @(valid_d3)
   begin
      #0;
      DL[3] = 1'bx;
      BWEBL[3] = 1'b0;
   end

always @(valid_bw3)
   begin
      #0;
      DL[3] = 1'bx;
      BWEBL[3] = 1'b0;
   end

always @(valid_d4)
   begin
      #0;
      DL[4] = 1'bx;
      BWEBL[4] = 1'b0;
   end

always @(valid_bw4)
   begin
      #0;
      DL[4] = 1'bx;
      BWEBL[4] = 1'b0;
   end

always @(valid_d5)
   begin
      #0;
      DL[5] = 1'bx;
      BWEBL[5] = 1'b0;
   end

always @(valid_bw5)
   begin
      #0;
      DL[5] = 1'bx;
      BWEBL[5] = 1'b0;
   end

always @(valid_d6)
   begin
      #0;
      DL[6] = 1'bx;
      BWEBL[6] = 1'b0;
   end

always @(valid_bw6)
   begin
      #0;
      DL[6] = 1'bx;
      BWEBL[6] = 1'b0;
   end

always @(valid_d7)
   begin
      #0;
      DL[7] = 1'bx;
      BWEBL[7] = 1'b0;
   end

always @(valid_bw7)
   begin
      #0;
      DL[7] = 1'bx;
      BWEBL[7] = 1'b0;
   end

always @(valid_d8)
   begin
      #0;
      DL[8] = 1'bx;
      BWEBL[8] = 1'b0;
   end

always @(valid_bw8)
   begin
      #0;
      DL[8] = 1'bx;
      BWEBL[8] = 1'b0;
   end

always @(valid_d9)
   begin
      #0;
      DL[9] = 1'bx;
      BWEBL[9] = 1'b0;
   end

always @(valid_bw9)
   begin
      #0;
      DL[9] = 1'bx;
      BWEBL[9] = 1'b0;
   end

always @(valid_d10)
   begin
      #0;
      DL[10] = 1'bx;
      BWEBL[10] = 1'b0;
   end

always @(valid_bw10)
   begin
      #0;
      DL[10] = 1'bx;
      BWEBL[10] = 1'b0;
   end

always @(valid_d11)
   begin
      #0;
      DL[11] = 1'bx;
      BWEBL[11] = 1'b0;
   end

always @(valid_bw11)
   begin
      #0;
      DL[11] = 1'bx;
      BWEBL[11] = 1'b0;
   end

always @(valid_d12)
   begin
      #0;
      DL[12] = 1'bx;
      BWEBL[12] = 1'b0;
   end

always @(valid_bw12)
   begin
      #0;
      DL[12] = 1'bx;
      BWEBL[12] = 1'b0;
   end

always @(valid_d13)
   begin
      #0;
      DL[13] = 1'bx;
      BWEBL[13] = 1'b0;
   end

always @(valid_bw13)
   begin
      #0;
      DL[13] = 1'bx;
      BWEBL[13] = 1'b0;
   end

always @(valid_d14)
   begin
      #0;
      DL[14] = 1'bx;
      BWEBL[14] = 1'b0;
   end

always @(valid_bw14)
   begin
      #0;
      DL[14] = 1'bx;
      BWEBL[14] = 1'b0;
   end

always @(valid_d15)
   begin
      #0;
      DL[15] = 1'bx;
      BWEBL[15] = 1'b0;
   end

always @(valid_bw15)
   begin
      #0;
      DL[15] = 1'bx;
      BWEBL[15] = 1'b0;
   end

always @(valid_d16)
   begin
      #0;
      DL[16] = 1'bx;
      BWEBL[16] = 1'b0;
   end

always @(valid_bw16)
   begin
      #0;
      DL[16] = 1'bx;
      BWEBL[16] = 1'b0;
   end

always @(valid_d17)
   begin
      #0;
      DL[17] = 1'bx;
      BWEBL[17] = 1'b0;
   end

always @(valid_bw17)
   begin
      #0;
      DL[17] = 1'bx;
      BWEBL[17] = 1'b0;
   end

 
always @(valid_wea)
   begin
      AAL = {M{1'bx}};
      BWEBL = {N{1'b0}};
   end
 
always @(valid_reb)
   begin
      #0;
      bQ = #0.001 {N{1'bx}};
   end
`endif

RF2P_1920x18_Int_Array #(1,1,W,N,M,MES_ALL) MX (.D({DL}),.BW({BWEBL}),
         .AW({AAL}),.EN(EN),.RDB(RDB),.AR({ABL}),.Q({QL}));
 
endmodule

`disable_portfaults
`nosuppress_faults
`endcelldefine

/*
   The module ports are parameterizable vectors.
*/

module RF2P_1920x18_Int_Array (D, BW, AW, EN, RDB, AR, Q);
parameter Nread = 2;   // Number of Read Ports
parameter Nwrite = 2;  // Number of Write Ports
parameter Nword = 2;   // Number of Words
parameter Ndata = 1;   // Number of Data Bits / Word
parameter Naddr = 1;   // Number of Address Bits / Word
parameter MES_ALL = "ON";
parameter dly = 0.000;
// Cannot define inputs/outputs as memories
input  [Ndata*Nwrite-1:0] D;  // Data Word(s)
input  [Ndata*Nwrite-1:0] BW; // Negative Bit Write Enable
input  [Naddr*Nwrite-1:0] AW; // Write Address(es)
input  EN;                    // Positive Write Enable
input  RDB;                   // Read Toggle
input  [Naddr*Nread-1:0] AR;  // Read Address(es)
output [Ndata*Nread-1:0] Q;   // Output Data Word(s)
reg    [Ndata*Nread-1:0] Q;
reg [Ndata-1:0] mem [Nword-1:0];
reg [Ndata-1:0] mem_fault [Nword-1:0];
reg chgmem;            // Toggled when write to mem
reg [Nwrite-1:0] wwe;  // Positive Word Write Enable for each Port
reg we;                // Positive Write Enable for all Ports
integer waddr[Nwrite-1:0]; // Write Address for each Enabled Port
integer address;       // Current address
reg [Naddr-1:0] abuf;  // Address of current port
reg [Ndata-1:0] dbuf;  // Data for current port
reg [Ndata-1:0] bwbuf; // Bit Write enable for current port
reg dup;               // Is the address a duplicate?
integer log;           // Log file descriptor
integer ip, ip2, ib, iw, iwb; // Vector indices


initial
   begin
   $timeformat (-9, 2, " ns", 9);
   if (log[0] === 1'bx)
      log = 1;
   chgmem = 1'b0;
   end


always @(D or BW or AW or EN)
   begin: WRITE //{
   if (EN !== 1'b0)
      begin //{ Possible write
      we = 1'b0;
      // Mark any write enabled ports & get write addresses
      for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
         begin //{
         ib = ip * Ndata;
         iw = ib + Ndata;
         while (ib < iw && BW[ib] === 1'b1)
            ib = ib + 1;
         if (ib == iw)
            wwe[ip] = 1'b0;
         else
            begin //{ ip write enabled
            iw = ip * Naddr;
            for (ib = 0 ; ib < Naddr ; ib = ib + 1)
               begin //{
               abuf[ib] = AW[iw+ib];
               if (abuf[ib] !== 1'b0 && abuf[ib] !== 1'b1)
                  ib = Naddr;
               end //}
            if (ib == Naddr)
               begin //{
               if (abuf < Nword)
                  begin //{ Valid address
                  waddr[ip] = abuf;
                  wwe[ip] = 1'b1;
                  if (we == 1'b0)
                     begin
                     chgmem = ~chgmem;
                     we = EN;
                     end
                  end //}
               else
                  begin //{ Out of range address
                  wwe[ip] = 1'b0;
                  if( MES_ALL=="ON" && $realtime != 0)
                       $fdisplay (log,
                             "\nWarning! Int_Array instance, %m:",
                             "\n\t Port %0d", ip,
                             " write address x'%0h'", abuf,
                             " out of range at time %t.", $realtime,
                             "\n\t Port %0d data not written to memory.", ip);
                  end //}
               end //}
            else
               begin //{ unknown write address
               if( MES_ALL=="ON" && $realtime != 0)
                    $fdisplay (log,
                          "\nWarning! Int_Array instance, %m:",
                          "\n\t Port %0d", ip,
                          " write address unknown at time %t.", $realtime,
                          "\n\t Entire memory set to unknown.");
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  dbuf[ib] = 1'bx;
               for (iw = 0 ; iw < Nword ; iw = iw + 1)
                  mem[iw] = dbuf;
               chgmem = ~chgmem;
               disable WRITE;
               end //}
            end //} ip write enabled
         end //} for ip
      if (we === 1'b1)
         begin //{ active write enable
         for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
            begin //{
            if (wwe[ip])
               begin //{ write enabled bits of write port ip
               address = waddr[ip];
               dbuf = mem[address];
               iw = ip * Ndata;
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  begin //{
                  iwb = iw + ib;
                  if (BW[iwb] === 1'b0)
                     dbuf[ib] = D[iwb];
                  else if (BW[iwb] !== 1'b1)
                     dbuf[ib] = 1'bx;
                  end //}
               // Check other ports for same address &
               // common write enable bits active
               dup = 0;
               for (ip2 = ip + 1 ; ip2 < Nwrite ; ip2 = ip2 + 1)
                  begin //{
                  if (wwe[ip2] && address == waddr[ip2])
                     begin //{
                     // initialize bwbuf if first dup
                     if (!dup)
                        begin
                        for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                           bwbuf[ib] = BW[iw+ib];
                        dup = 1;
                        end
                     iw = ip2 * Ndata;
                     for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                        begin //{
                        iwb = iw + ib;
                        // New: Always set X if BW X
                        if (BW[iwb] === 1'b0)
                           begin //{
                           if (bwbuf[ib] !== 1'b1)
                              begin
                              if (D[iwb] !== dbuf[ib])
                                 dbuf[ib] = 1'bx;
                              end
                           else
                              begin
                              dbuf[ib] = D[iwb];
                              bwbuf[ib] = 1'b0;
                              end
                           end //}
                        else if (BW[iwb] !== 1'b1)
                           begin
                           dbuf[ib] = 1'bx;
                           bwbuf[ib] = 1'bx;
                           end
                        end //} for each bit
                        wwe[ip2] = 1'b0;
                     end //} Port ip2 address matches port ip
                  end //} for each port beyond ip (ip2=ip+1)
               // Write dbuf to memory
               mem[address] = dbuf;
               end //} wwe[ip] - write port ip enabled
            end //} for each write port ip
         end //} active write enable
      else if (we !== 1'b0)
         begin //{ unknown write enable
         for (ip = 0 ; ip < Nwrite ; ip = ip + 1)
            begin //{
            if (wwe[ip])
               begin //{ write X to enabled bits of write port ip
               address = waddr[ip];
               dbuf = mem[address];
               iw = ip * Ndata;
               for (ib = 0 ; ib < Ndata ; ib = ib + 1)
                  begin //{ 
                 if (BW[iw+ib] !== 1'b1)
                     dbuf[ib] = 1'bx;
                  end //} 
               mem[address] = dbuf;
               if( MES_ALL=="ON" && $realtime != 0)
                    $fdisplay (log,
                          "\nWarning! Int_Array instance, %m:",
                          "\n\t Enable pin unknown at time %t.", $realtime,
                          "\n\t Enabled bits at port %0d", ip,
                          " write address x'%0h' set unknown.", address);
               end //} wwe[ip] - write port ip enabled
            end //} for each write port ip
         end //} unknown write enable
      end //} possible write (EN != 0)
   end //} always @(D or BW or AW or EN)


// Read memory
always @(RDB or AR)
   begin //{
   for (ip = 0 ; ip < Nread ; ip = ip + 1)
      begin //{
      iw = ip * Naddr;
      for (ib = 0 ; ib < Naddr ; ib = ib + 1)
         begin
         abuf[ib] = AR[iw+ib];
         if (abuf[ib] !== 0 && abuf[ib] !== 1)
            ib = Naddr;
         end
      iw = ip * Ndata;
      if (ib == Naddr && abuf < Nword)
         begin //{ Read valid address
`ifdef TSMC_INITIALIZE_FAULT
         dbuf = mem[abuf] ^ mem_fault[abuf];
`else
         dbuf = mem[abuf];
`endif
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            begin
            if (Q[iw+ib] == dbuf[ib])
                Q[iw+ib] <= #(dly) dbuf[ib];
            else
                begin
                Q[iw+ib] <= #(dly) dbuf[ib];
//                Q[iw+ib] <= dbuf[ib];
                end // else
            end // for
         end //} valid address
      else
         begin //{ Invalid address
         if( MES_ALL=="ON" && $realtime != 0)
               $fwrite (log, "\nWarning! Int_Array instance, %m:",
                       "\n\t Port %0d read address", ip);
         if (ib > Naddr)
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " unknown");
         end
         else
         begin
         if( MES_ALL=="ON" && $realtime != 0)
            $fwrite (log, " x'%0h' out of range", abuf);
         end
         if( MES_ALL=="ON" && $realtime != 0)
            $fdisplay (log,
                    " at time %t.", $realtime,
                    "\n\t Port %0d outputs set to unknown.", ip);
         for (ib = 0 ; ib < Ndata ; ib = ib + 1)
            Q[iw+ib] <= #(dly) 1'bx;
         end //} invalid address
      end //} for each read port ip
   end //} always @(chgmem or AR)


// Task for loading contents of a memory
task load;   //{ USAGE: initial inst.load ("file_name");
   input [256*8:1] file;  // Max 256 character File Name
   begin
   $display ("\n%m: Reading file, %0s, into memory", file);
   $readmemb (file, mem, 0, Nword-1);
   end
endtask //}


// Task for displaying contents of a memory
task show;   //{ USAGE: inst.show (low, high);
   input [31:0] low, high;
   integer i;
   begin //{
   $display ("\n%m: Memory content dump");
   if (low < 0 || low > high || high >= Nword)
      $display ("Error! Invalid address range (%0d, %0d).", low, high,
                "\nUsage: %m (low, high);",
                "\n       where low >= 0 and high <= %0d.", Nword-1);
   else
      begin
      $display ("\n    Address\tValue");
      for (i = low ; i <= high ; i = i + 1)
         $display ("%d\t%b", i, mem[i]);
      end
   end //}
endtask //}

endmodule
