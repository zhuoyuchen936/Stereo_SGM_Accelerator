//////////////////////////////////////////////////////////////////////////////////
// Engineer: Guan Xinyu
// 
// Create Date: 2023/10/10 09:55:36
// Design Name: SGM_UpSample
// Module Name: asy_fifo 
// Dependencies: To synchronous the clk for upsample mudule
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module asy_fifo
    #(
        parameter WIDTH = 8,
        parameter DEPTH = 2048,
        parameter AWIDTH = 11,
        parameter H_TOTAL=11'd800
    )

    (
        wr_data,
        wr_clk,
        wr_rstn,
        wr_en,

        rd_clk,
        rd_rstn,
        rd_en,
    
        width_new,
        valid_down,
        fifo_empty,
        fifo_full,
        rd_data,
        valid

    );
        input [ WIDTH - 1 : 0 ]  wr_data;
        input                    wr_clk, wr_rstn, wr_en;
        input                    rd_clk, rd_rstn, rd_en;
        input [10:0]             width_new;
        input                    valid_down;
        output  reg              fifo_full, fifo_empty;  
        output  reg [ WIDTH - 1 : 0 ] rd_data;
        output                   valid;
        //rd and wr pointer
        reg [AWIDTH:0] wr_ptr, rd_ptr;     
        // def the fifo
        reg [ WIDTH -1 : 0 ]  fifo [ DEPTH-1 : 0 ];


        reg [AWIDTH:0] mark_ptr;
        reg [3:0]cnt_valid;
        always @(posedge wr_clk or negedge wr_rstn) begin
            if(wr_rstn)begin
                mark_ptr    <= 0;
                cnt_valid   <= 0;
            end
            else if ( (wr_ptr-mark_ptr == (width_new) ) || ( ({(AWIDTH+1){1'b1}}-mark_ptr+wr_ptr)==(width_new) ) ) begin
                mark_ptr    <= wr_ptr;
                cnt_valid   <= cnt_valid+1;
            end
            else if ( valid_down)begin
                mark_ptr    <= mark_ptr;
                cnt_valid   <=cnt_valid-1;
            end
            
            else begin
                mark_ptr    <= mark_ptr;
                cnt_valid   <= cnt_valid;
            end
        end 

        assign valid=(cnt_valid>0)? 1'b1:1'b0;
        
        // write operation
        always @(posedge wr_clk or negedge wr_rstn) begin
            if(wr_rstn)begin
                wr_ptr <= 0;
            end
            else if (wr_en && !fifo_full) begin
                fifo[wr_ptr[AWIDTH-1:0]] <= wr_data;
                wr_ptr       <= wr_ptr + 1;
            end
            else begin
                wr_ptr       <= wr_ptr;
            end
        end  

        //read operation
        always @(posedge rd_clk or negedge rd_rstn) begin
            if(rd_rstn)begin
                rd_ptr <= 0;
                rd_data <= 0;
            end
            else if(rd_en && !fifo_empty)begin
                rd_data <= fifo[rd_ptr[AWIDTH-1:0]];
                rd_ptr  <= rd_ptr + 1;
            end
            else begin
                rd_ptr <= rd_ptr;
            end
        end
        
        
        

        // B to G

        wire [AWIDTH : 0] wr_ptr_g;
        wire [AWIDTH : 0] rd_ptr_g;
        assign wr_ptr_g = wr_ptr ^ (wr_ptr >>> 1);
        assign rd_ptr_g = rd_ptr ^ (rd_ptr >>> 1);

        //delay gray code
        reg [AWIDTH : 0] wr_ptr_gr, wr_ptr_grr;
        reg [AWIDTH : 0] rd_ptr_gr, rd_ptr_grr;


        //synchronous the wr_ptr, two clk delay
        always @ (posedge rd_clk or negedge rd_rstn) begin
            if(rd_rstn) begin
                wr_ptr_gr <= 0;
                wr_ptr_grr <= 0;
            end
            else begin
                wr_ptr_gr <= wr_ptr_g;
                wr_ptr_grr <= wr_ptr_gr;
            end
        end

        //synchronous the rd_ptr, two clk delay
        always @ (posedge wr_clk or negedge wr_rstn) begin
            if(wr_rstn) begin
                rd_ptr_gr <= 0;
                rd_ptr_grr <= 0;
            end
            else begin
                rd_ptr_gr <= rd_ptr_g;
                rd_ptr_grr <= rd_ptr_gr;
            end
        end

        // Full and Empty
        always @ (posedge wr_clk or negedge wr_rstn) begin
        if(wr_rstn)
            fifo_full <= 0;
        else if((wr_ptr_g[AWIDTH] != rd_ptr_grr[AWIDTH]) && (wr_ptr_g[AWIDTH - 1] != rd_ptr_grr[AWIDTH - 1]) && (wr_ptr_g[AWIDTH - 2 : 0] == rd_ptr_grr[AWIDTH - 2 : 0]))
            fifo_full <= 1;
        else
            fifo_full <= 0;
        end
        always @ (posedge rd_clk or negedge rd_rstn) begin
        if(rd_rstn)
            fifo_empty <= 0;
        else if(wr_ptr_grr[AWIDTH : 0] == rd_ptr_g[AWIDTH : 0])
            fifo_empty <= 1;
        else
            fifo_empty <= 0;
        end
endmodule
