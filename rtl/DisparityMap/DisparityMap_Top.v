module DisparityMap_Top(
    input  clk,
    input  rst,
    input  clken,
    input  [10:0] width, 
    input  [10:0] height,
    input  [8:0] range,
    input  [7:0] avgdata_L,
    input  [7:0] avgdata_R,
    input  avg_final_valid_L,
    input  avg_final_valid_R,
    input  enable,
    input [6:0]P1,
    input [6:0]P2,
    output [15:0] disp_L,
    output [15:0] disp_R,
    output valid_final_L,
    output valid_final_R
);

/******************************************************************/
/***************************Aggregation****************************/
/******************************************************************/
	wire wr_en_Agg0_inst1;
    wire [1151:0] BWEB_Agg0_inst1;
    wire [10:0]  wr_addr_Agg0_inst1;
    wire [10:0]  rd_addr_Agg0_inst1;
 
	wire [1151:0] Q_Aggregation0_Ram_2;
	wire [1151:0] D_Aggregation0_Ram_1;
       
 
//   sliced_sram#(1152,1920,11,1,1152) RAM1920x1664_inst1(
//       .AA(wr_addr_Agg0_inst1),
//       .DA(D_Aggregation0_Ram_1),
//       .BWEBA(BWEB_Agg0_inst1),
//       .WEBA(wr_en_Agg0_inst1),
//       .CLK(clk),
//       .RST(rst),
//       .AB(rd_addr_Agg0_inst1),
//       .WEBB(1'b1),
//       .QB(Q_Aggregation0_Ram_2)
//   );
//
    sram_1920x1152_dp RAM1920x1152_Agg0(
        .clk_a(clk),
        .addr_a(wr_addr_Agg0_inst1),
        .din_a(D_Aggregation0_Ram_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Agg0_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Agg0_inst1),
        .din_b(1152'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .dout_b(Q_Aggregation0_Ram_2)
    );


    wire wr_en_Agg135_inst1;
    wire [895:0] BWEB_Agg135_inst1;
    wire [10:0]  wr_addr_Agg135_inst1;
    wire [10:0]  rd_addr_Agg135_inst1; 

	wire [895:0] Q_Aggregation135_Ram_2;
	wire [895:0] D_Aggregation135_Ram_1;

   sram_1920x896_dp RAM1920x896_Agg135(
        .clk_a(clk),
        .addr_a(wr_addr_Agg135_inst1),
        .din_a(D_Aggregation135_Ram_1),
        .ce_a(1'b0),
        .wr_en_a(wr_en_Agg135_inst1),
        .dout_a(),

        .clk_b(clk),
        .addr_b(rd_addr_Agg135_inst1),
        .din_b(896'd0),
        .ce_b(1'b0),
        .wr_en_b(1'b1),
        .dout_b(Q_Aggregation135_Ram_2)
    );
 
//    sliced_sram#(896,1920,11,1,896) RAM1920x1408_inst1(
//        .AA(wr_addr_Agg135_inst1),
//        .DA(D_Aggregation135_Ram_1),
//        .BWEBA(BWEB_Agg135_inst1),
//        .WEBA(wr_en_Agg135_inst1),
//        .CLK(clk),
//        .RST(rst),
//        .AB(rd_addr_Agg135_inst1),
//        .WEBB(1'b1),
//        .QB(Q_Aggregation135_Ram_2)
//    );

    DisparityMap_new DisparityMap_inst(
        .clk(clk),
	    .rst(rst),
	    .clken(clken),
        .enable(enable),
        .width(width),
        .height(height),
        .avg_final_valid_L(avg_final_valid_L),
        .avg_final_valid_R(avg_final_valid_R),
        .avgdata_L(avgdata_L),
        .avgdata_R(avgdata_R),
        .disp_L(disp_L),
        .disp_R(disp_R),
        .valid_final_L(valid_final_L),
        .valid_final_R(valid_final_R),
        .range(range),
        .P1(P1),
        .P2(P2),
/******************************************************************/
/***************************Aggregation****************************/
/******************************************************************/
        .wr_en_Agg0_inst1(wr_en_Agg0_inst1),
        .BWEB_Agg0_inst1(BWEB_Agg0_inst1),
        .wr_addr_Agg0_inst1(wr_addr_Agg0_inst1),
        .rd_addr_Agg0_inst1(rd_addr_Agg0_inst1),


        .Q_Aggregation0_Ram_2(Q_Aggregation0_Ram_2),
        .D_Aggregation0_Ram_1(D_Aggregation0_Ram_1),

        .wr_en_Agg135_inst1(wr_en_Agg135_inst1),
        .BWEB_Agg135_inst1(BWEB_Agg135_inst1),
        .wr_addr_Agg135_inst1(wr_addr_Agg135_inst1),
        .rd_addr_Agg135_inst1(rd_addr_Agg135_inst1),
        

        
        .Q_Aggregation135_Ram_2(Q_Aggregation135_Ram_2),
        .D_Aggregation135_Ram_1(D_Aggregation135_Ram_1)
    
    );
endmodule
