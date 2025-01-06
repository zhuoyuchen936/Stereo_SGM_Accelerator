/*
 * @Author: Pingcheng Dong
 * @Date: 2024-01-08
*/
module LR_Check_Engine (
        clk,
        rst,
        clken,
        img_width,
        range,
        // From Align_Buffer
        data_in_align, 
        rd_addr_align, 
        rd_en_align, 
        // To Column_Buffer
        rd_addr_to_colbuf, 
        // From Column_Buffer
        data_in_col,
        // select column shape
        sel_col,
        // threshold value
        check_th,
        // Final Output
        data_out,
        valid
);
    parameter WIDTH=16; // disp_L width
    parameter CWIDTH=80; // column disp_R width
    parameter AWIDTH=9; // address width
    parameter DEPTH=512; // column buffer depth
    
    input clk, rst, clken;
    input [WIDTH-1:0] data_in_align; // disp_L
    input [AWIDTH-1:0] rd_addr_align; // disp_L's rd_addr
    input [8:0] range; // disparity range
    input [10:0] img_width; // the width of image
    input rd_en_align; // disp_L's rd_en
    input [CWIDTH-1:0] data_in_col; // corresponding 1x5 disp_R
    input sel_col; // 0: 1x3, 1: 1x5
    input [17:0] check_th; // threshold value: 10bit integers + 8bit decimals
    output reg [AWIDTH-1:0] rd_addr_to_colbuf; // search 1x5 disp_R
    output reg [WIDTH+1:0] data_out; // 2 MSBs: occlusion and mismatch
    output reg valid; // final valid

    reg signed [WIDTH:0] din_align_delay0, din_align_delay1; // add 1 sign bit
    reg rd_en_delay0, rd_en_delay1;
    reg [10:0] cnt;
    // obtain integer part and the {{AWIDTH-8}1'b0} is to align data width 
    wire [AWIDTH-1:0] data_in_integer = {{{AWIDTH-8}{1'b0}}, data_in_align[{WIDTH-1} -: 8]}; 
    // current disp_L's x coordinate is less than range and disp_L  
    // is larger than the cnt -> target disp_R is out of left boundary
    // wire less_than_range = ((cnt < range) && (data_in_integer > cnt)) ? 1'b1 : 1'b0; 
    wire less_than_range = 0;
    always@(posedge clk or negedge rst)begin
        if(!rst) begin
            rd_addr_to_colbuf <= 0;
            cnt<=0;
        end
        else if (clken && !rd_en_align)begin
            if (less_than_range)begin
                // rd_addr_align - range < 0 represents lrc is out of boundary
                if (rd_addr_align < cnt) begin 
                    rd_addr_to_colbuf <= DEPTH + rd_addr_align - cnt; // replcace disp_L by cnt
                end
                else begin
                    rd_addr_to_colbuf <= rd_addr_align - cnt;
                end 
            end
            else begin
                if (rd_addr_align < data_in_integer) begin
                    rd_addr_to_colbuf <= DEPTH + rd_addr_align - data_in_integer;
                end
                else begin
                    rd_addr_to_colbuf <= rd_addr_align - data_in_integer;
                end
            end
            // row counter
            if (cnt == img_width-1) cnt <= 0;
            else cnt <= cnt +1;
        end
        else begin
            rd_addr_to_colbuf <= rd_addr_to_colbuf;
            cnt <= cnt;
        end
    end
    // delay for aligning with data_in_col
    always@(posedge clk or negedge rst)begin
        if(!rst)begin
            din_align_delay0 <= 0;
            din_align_delay1 <= 0;
            rd_en_delay0 <= 1;
            rd_en_delay1 <= 1;
        end
        else if(clken && !rd_en_align)begin
            // extend 1 sign bit
            din_align_delay0 <= {1'b0, data_in_align};
            din_align_delay1 <= din_align_delay0;
            rd_en_delay0 <= rd_en_align;
            rd_en_delay1 <= rd_en_delay0;
        end
        else begin
            din_align_delay0 <= din_align_delay0;
            din_align_delay1 <= din_align_delay1;
            rd_en_delay0 <= rd_en_delay0;
            rd_en_delay1 <= rd_en_delay1;
        end
    end

    // obtain check sum
    wire signed [WIDTH:0] din_col_sign [0:4];
    wire signed [WIDTH:0] align_minus_col [0:4];
    wire [WIDTH-1:0] abs_align_col [0:4];
    wire signed [WIDTH+4:0] check_sum_1_3;
    wire signed [WIDTH+4:0] check_sum_0_4;
    wire [WIDTH+4:0] abs_check_sum_1_3;
    wire [WIDTH+4:0] abs_check_sum_0_4;
    wire [WIDTH+4:0] check_sum;
    wire [WIDTH+4:0] abs_check_sum;

    genvar i;
    generate
        for (i = 0; i < 5; i = i + 1) begin : minus_abs
            assign din_col_sign[i] = {1'b0, data_in_col[WIDTH*(i+1)-1 : WIDTH*i]};
            assign align_minus_col[i] = din_align_delay1 - din_col_sign[i];
            assign abs_align_col[i] = align_minus_col[i][WIDTH] ? (~align_minus_col[i][WIDTH-1:0] + 1) : align_minus_col[i][WIDTH-1:0];
        end
    endgenerate

    // w abs is to detect wrong match
    assign abs_check_sum_1_3 = abs_align_col[1] + abs_align_col[2] + abs_align_col[3];
    assign abs_check_sum_0_4 = abs_align_col[0] + abs_align_col[1] + abs_align_col[2] + abs_align_col[3] + abs_align_col[4];

    // w/o abs is to further detect occlusion and mismatch
    assign check_sum_1_3 = align_minus_col[1] + align_minus_col[2] + align_minus_col[3];
    assign check_sum_0_4 = align_minus_col[0] + align_minus_col[1] + align_minus_col[2] + align_minus_col[3] + align_minus_col[4];

    // select shape
    assign check_sum = sel_col ? check_sum_0_4 : check_sum_1_3;
    assign abs_check_sum = sel_col ? abs_check_sum_0_4 : abs_check_sum_1_3; 

    // Start LR_Check
    always@(posedge clk or negedge rst)begin
        if (!rst)begin
            data_out <= 0;
            valid <= 0;
        end
        else if(clken && !rd_en_delay1)begin
            if (abs_check_sum > {{3{1'b0}}, check_th}) begin
                // detect sign bit to check postive and negtive
                if (check_sum[WIDTH+4]) data_out <= {2'b10 , {{WIDTH}{1'b0}}}; // disp_L < disp_R: occlusion
                else data_out <= {2'b01 , {{WIDTH}{1'b0}} };     // disp_L > disp_R: mismatch
            end
            else begin
                data_out <= {2'b00,din_align_delay1[WIDTH-1:0]}; // valid disp
            end
            valid <= 1;
        end
        else begin
            data_out <= data_out;
            valid <= valid;
        end
    end

endmodule