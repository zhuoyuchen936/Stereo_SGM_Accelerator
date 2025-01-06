// **********************************************************
// * Author : Wangxl
// * Email : wangxl@fvchip.com
// * Create time : 2023-04-14
// * Last modified : 2023-04-14
// *
// * Filename : sram_mod_2prf_bit_en.v
// * Description : v1.0
// * Copyright (c) : FvChip 2023. All rights reserved.
// **********************************************************

module sram_mod_dp_bit_en
  #(parameter ADDR_WIDTH = 10,          // Address width parameter
    parameter DATA_WIDTH = 8,           // Data width parameter
    parameter ADDR_SPACE = 1024)        // Address space parameter
(
    input clk_a,                        // Clock input
    input [ADDR_WIDTH-1:0] addr_a,      // Group A address input
    input [DATA_WIDTH-1:0] din_a,       // Group A data input
    input ce_a,                         // Group A chip enable input (low-active)
    input wr_en_a,                      // Group A write enable input (low-active)
    input [DATA_WIDTH-1:0] bit_en_a,    // Group A bit enable input (low-active)
    output reg [DATA_WIDTH-1:0] dout_a, // Group A data output

    input clk_b,                        // Clock input
    input [ADDR_WIDTH-1:0] addr_b,      // Group B address input
    input [DATA_WIDTH-1:0] din_b,       // Group B data input
    input ce_b,                         // Group B chip enable input (low-active)
    input wr_en_b,                      // Group B write enable input (low-active)
    input [DATA_WIDTH-1:0] bit_en_b,    // Group B bit enable input (low-active)
    output reg [DATA_WIDTH-1:0] dout_b  // Group B data output
);
  
integer i;
integer j;

reg [DATA_WIDTH-1:0] memory [ADDR_SPACE-1:0]; // Declare memory array


always @(posedge clk_a) begin
    if (!ce_a && !wr_en_a) begin // Check if Group A write chip enable and write enable are low
        for (i = 0; i < DATA_WIDTH; i=i+1) begin
            if (!bit_en_a[i]) begin     // Check if Group A bit enable is low for this bit
                memory[addr_a][i] <= din_a[i];
            end
            else ;
        end
    end
end

always @(posedge clk_b) begin
    if (!ce_b && !wr_en_b) begin // Check if Group B write chip enable and write enable are low
        if(!ce_a && !wr_en_a && addr_a == addr_b) begin
            //Error: if Group B is writing same address with Group A
            $display("ERROR: dp sram writing same address at time:  %.1f ns", $time);
        end
        else begin
            for (j = 0; j < DATA_WIDTH; j=j+1) begin
                if (!bit_en_b[j]) begin // Check if Group B bit enable is high for this bit
                    memory[addr_b][j] <= din_b[j];
                end
                else;
            end
        end
    end
end

always @(posedge clk_a) begin
    if (!ce_a && wr_en_a) begin // Check if Group A write chip enable is low and write enable is high
        dout_a <= memory[addr_a]; // Read data
        if(!ce_b && !wr_en_b && addr_a == addr_b) begin
            //Waring: if reading and writing same address
            $display("Waring: dp sram reading and writing same address at time:  %.1f ns", $time);
        end
    end
end

always @(posedge clk_b) begin
    if (!ce_b && wr_en_b) begin // Check if Group B write chip enable is low and write enable is high
        dout_b <= memory[addr_b]; // Read data
        if(!ce_a && !wr_en_a && addr_a == addr_b) begin
            //Waring: if reading and writing same address
            $display("Waring: dp sram reading and writing same address at time:  %.1f ns", $time);
        end
    end
end

endmodule