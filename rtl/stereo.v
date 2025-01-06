`include "define_stereo.v"
module stereo(
    input  clk,
    input  rst,
    input  clk_h,
    input  rst_h_n,
    input  clk_cfg,
    input  rst_cfg_n,
    //apb
    input  apb_sel,
    input  apb_enable,
    input  apb_write,
    input  [11:0] apb_addr,
    input  [31:0] apb_wdata,
    output [31:0] apb_rdata,
    //input left/right pixel stream
    input  [7:0]  data_in_left,
    input  [7:0]  data_in_right,
    input  data_in_hs,
    input  data_in_v_end,
    output [15:0] disp_prev,
    output disp_prev_val,
    output [15:0] disp_3d,
    output disp_3d_val,
    //disp before post-processing (debug)
    output [15:0] disp_l_debug,
    output disp_l_debug_val,
    output [15:0] disp_r_debug,
    output disp_r_debug_val,
    //disp after post-processing (debug)
    output [15:0] disp_lrc_debug,
    output disp_lrc_debug_val,
    output [15:0] disp_filling_debug,
    output disp_filling_debug_val,
    //disp before 3dnr (debug)
    output [15:0] disp_mf_debug,
    output disp_mf_debug_val,
    //disp after 3dnr (debug)
    output [15:0] disp_3d_debug,
    output disp_3d_debug_val,
    //final disp/depth output (non-debug)
    output disp_down_hs,
    output disp_down_vs,
    output disp_down_val,
    output [15:0] disp_down,
    output depth_down_hs,
    output depth_down_vs,
    output depth_down_val,
    output [15:0] depth_down
);
    parameter DWIDTH = 16;

    //parameter
    wire  [10:0]    config_width;
    wire  [10:0]    config_height;
    wire  [10:0]    config_width_new;              //1920 1600 1280 1024 640 320
    wire  [10:0]    config_height_new;             //1080 800  768  728  480 240
    wire  [8:0]     config_range;                  //disparity range (default 128)
    wire  [6:0]     config_P1;
    wire  [6:0]     config_P2;
    wire  [17:0]    config_lrc_param;              //lrc check threshold value: 10bit integers + 8bit decimals
    wire            config_postbefore_median;      //median 33 for disp_L/R, 1:yes, 0:no
    wire  [1:0]     config_median_sel;             //median window, 00:11x11, 01:9x9, 11:7x7
    wire            config_post_sel;               //1:traditiona five direction filling, 0:new_filling(more hole)
    wire            config_sel_col;                //lrc check column shape, 0: 1x3, 1: 1x5
    wire            config_depth_format;           //1:FP16 0:FXP16
    wire  [31:0]    config_depth_param;            //fB/pixe_size FP32
    wire  [1:0]     config_crop_size_top;          //downsamp crop size, 00:0, 01:50, 10:100, 11:150
    wire  [1:0]     config_crop_size_left;         //downsamp crop size, 00:0, 01:50, 10:100, 11:150
    wire  [15:0]    config_stereo_disp_threshold;  //clip threshold
    wire  [15:0]    config_stereo_disp_clip_value;  //clip value


    wire [6:0  ]    config_nr3d_factor_noise;
    wire [4:0  ]    config_nr3d_factor_pixel;
    wire [7:0]      config_nr3d_noise_level;
    wire [7:0]      config_nr3d_motion_levle;
    wire [1:0]      config_nr3d_dilated_mask_select;
    wire [15:0 ]    config_nr3d_threshold_max;
    wire [15:0 ]    config_nr3d_threshold_min;
    wire [2:0  ]    config_nr3d_quality_max_gray;
    wire [2:0  ]    config_nr3d_quality_max_disp;
    wire            config_nr3d_bypass_control;

   
    wire test_en=1'b0;
    wire downsampling_sel = (config_width == config_width_new)&& (config_height== config_height_new) ? 1'b0 : 1'b1;

/****************************************************************
************************Input Alignment*************************
****************************************************************/
    reg [7:0] data_in_left_dly0, data_in_left_dly;
    reg [7:0] data_in_right_dly0, data_in_right_dly;
    reg start_flag;
    reg clken_dly0, clken_dly;
    reg v_end_dly;
    always@(posedge clk or negedge rst)begin
        if (!rst)begin
            clken_dly <= 0;
            clken_dly0 <= 0;
            v_end_dly <= 0;
            data_in_left_dly0 <= 0;
            data_in_left_dly <= 0;
            data_in_right_dly <= 0;
            data_in_right_dly0 <= 0;
            start_flag <= 0;
        end
        else begin
            v_end_dly <= data_in_v_end;
            data_in_left_dly0 <= data_in_left;
            data_in_right_dly0 <= data_in_right;
            clken_dly0 <= data_in_hs;
            if (!data_in_v_end & v_end_dly)begin
                start_flag <= 1;
               end
            if (start_flag)begin
                clken_dly <= clken_dly0;
                data_in_left_dly <= data_in_left_dly0;
                data_in_right_dly <= data_in_right_dly0;
            end
            else begin
                clken_dly <= 0;
                data_in_left_dly <= 0;
                data_in_right_dly <= 0;
            end
        end 
    end
/****************************************************************
***************************DisparityMap**************************
****************************************************************/
    wire [15:0] disp_L;
    wire [15:0] disp_R;
    wire valid_final_L;
    wire valid_final_R;
    DisparityMap_Top DisparityMap_Top_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken_dly),
        .width(config_width),
        .height(config_height),
        .range(config_range),
        .avgdata_L(data_in_left_dly),
        .avgdata_R(data_in_right_dly),
        .avg_final_valid_L(clken_dly),
        .avg_final_valid_R(clken_dly),
        .P1(config_P1),
        .P2(config_P2),
        .enable(test_en),
        .disp_L(disp_L),
        .disp_R(disp_R),
        .valid_final_L(valid_final_L),
        .valid_final_R(valid_final_R)
    );

    `ifdef DEBUG_MODE
        wire [15:0] disp_l_debug;
        wire disp_l_debug_val;
        Disp_out_Top#(16) disp_l_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(valid_final_L),
            .valid_in(valid_final_L),
            .data_in(disp_L),
            .data_out(disp_l_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_l_debug_val)
        );
        wire [15:0] disp_r_debug;
        wire disp_r_debug_val;
        Disp_out_Top#(16) disp_r_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(valid_final_R),
            .valid_in(valid_final_R),
            .data_in(disp_L),
            .data_out(disp_r_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_r_debug_val)
        );
    `endif
/****************************************************************
**************************PostProcessing*************************
****************************************************************/
    wire [15:0] disp_hole;
    wire disp_hole_valid;
    wire [15:0] disp_lrc;
    wire disp_lrc_valid;

    Post_Window_Top#(16,11) PostProcessing_Top_inst(
        .clk(clk), 
        .rst(rst), 
        .clken(clken_dly),
        .range(config_range),
        .width(config_width),
        .enable(test_en), 
        .lrc_param(config_lrc_param),
        .valid_final_L(valid_final_L), 
        .valid_final_R(valid_final_R),
        .disp_L(disp_L), 
        .disp_R(disp_R),
        .postprocessing_sel(config_post_sel),
        .sel_col(config_sel_col),
        .valid_lrc(disp_lrc_valid),
        .disp_lrc(disp_lrc),
        .disp_hole(disp_hole), 
        .valid_final_hole(disp_hole_valid)
    );
    `ifdef DEBUG_MODE
        wire [15:0] disp_lrc_debug;
        wire disp_lrc_debug_val;
        Disp_out_Top#(16) disp_lrc_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(disp_lrc_valid),
            .valid_in(disp_lrc_valid),
            .data_in(disp_lrc),
            .data_out(disp_lrc_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_lrc_debug_val)
        );
        wire [15:0] disp_filling_debug;
        wire disp_filling_debug_val;
        Disp_out_Top#(16) disp_filling_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(disp_hole_valid),
            .valid_in(disp_hole_valid),
            .data_in(disp_hole),
            .data_out(disp_filling_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_filling_debug_val)
        );
    `endif
/****************************************************************
***************************MedianFilter**************************
****************************************************************/
    wire flag;
    wire [15:0]Median_disp_in = disp_hole;
    wire Median_valid = disp_hole_valid;
    wire [15:0]Median_disp_out;
    wire [15:0]disp_3d_temp;
    wire hs_3d_temp, val_3d_temp;
    wire Median_valid_out;

    MedianFilter_Top#(16) MedianFilter_Top_inst(
        .clk(clk),
        .rst(rst),
        .clken(clken_dly),
        .width(config_width),
        .enable(test_en),
        .window_size(config_median_sel),
        .disp_hole(Median_disp_in),
        .valid_final_hole(Median_valid),
        .disp(Median_disp_out),
        .valid_final(Median_valid_out),
        .flag(flag)
    );
    `ifdef DEBUG_MODE
        wire [15:0] disp_mf_debug;
        wire disp_mf_debug_val;
        Disp_out_Top#(16) disp_mf_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(Median_valid_out),
            .valid_in(Median_valid_out),
            .data_in(Median_disp_out),
            .data_out(disp_mf_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_mf_debug_val)
        );
    `endif
/****************************************************************
****************************Output to 3D*************************
****************************************************************/
    Disp_out_Top#(16) disp_to_3d(
        .wr_clk(clk),
        .wr_rstn(rst),
        .rd_clk(clk),
        .rd_rstn(rst),
        .width(config_width),
        .height(config_height),
        .width_new(config_width),
        .height_new(config_height),
        .cut_h(2'b00),
        .cut_w(2'b00),
        .vacancy(clken_dly && Median_valid_out),
        .valid_in(Median_valid_out),
        .data_in(Median_disp_out),
        .data_out(disp_3d_temp),
        .hsync(hs_3d_temp),
        .vsync(),
        .out_hs(),
        .out_vs(),
        .valid(val_3d_temp)
        // .valid(disp_valid)
    );

    `ifdef WITH_3D
        top_3dnr_stereo u_top_3dnr_stereo (
            /*input                 */  .clk_h                 (clk_h),
            /*input                 */  .clk_l                 (clk),
            /*input                 */  .rst_n                 (rst),
            /*input                 */  .rst_h_n               (rst_h_n),
            /*input       [7:0]     */  .gray_in               (data_in_left_dly[7:0]),
            /*input                 */  .gray_in_val           (clken_dly ),
            /*input       [7:0]     */  .disp_in               (disp_3d_temp[15:8]),
            /*input                 */  .disp_in_val           (val_3d_temp),
            /*input       [6:0]     */  .factor_noise_y        (config_nr3d_factor_noise),
            /*input       [4:0]     */  .factor_pixel_y        (config_nr3d_factor_pixel),
            /*input       [10:0]    */  .image_width           (config_width),
            /*input       [10:0]    */  .image_height          (config_height),
            /*input       [7:0]     */  .noise_level           (config_nr3d_noise_level),
            /*input       [7:0]     */  .motion_levle          (config_nr3d_motion_levle),
            /*input       [1:0]     */  .dilated_mask_select   (config_nr3d_dilated_mask_select),
            /*input       [7:0]   */    .dilated_thred         (8'd120          ),
            /*input       [15:0]    */  .threshold_max         (config_nr3d_threshold_max),
            /*input       [15:0]    */  .threshold_min         (config_nr3d_threshold_min),
            /*input       [2:0]     */  .quality_max_gray      (config_nr3d_quality_max_gray),
            /*input       [2:0]     */  .quality_max_disp      (config_nr3d_quality_max_disp),
            /*output      [7:0]     */  .disp_prev             (disp_prev[15:8]),
            /*output                */  .disp_prev_val         (disp_prev_val),
            /*output      [7:0]     */  .disp_out              (disp_3d[15:8]),
            /*output                */  .disp_out_val          (disp_3d_val)
        );
        reg [7:0] disp_low8_dly1;
        reg [7:0] disp_low8_dly2;
        reg [7:0] disp_low8_dly3;
        reg [7:0] disp_low8_dly4;
        reg [7:0] disp_low8_dly5;

        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                disp_low8_dly1 <= 0;
                disp_low8_dly2 <= 0;
                disp_low8_dly3 <= 0;
                disp_low8_dly4 <= 0;
                disp_low8_dly5 <= 0;
            end
            else begin
                disp_low8_dly1 <= disp_3d_temp[7:0];
                disp_low8_dly2 <= disp_low8_dly1;
                disp_low8_dly3 <= disp_low8_dly2;
                disp_low8_dly4 <= disp_low8_dly3;
                disp_low8_dly5 <= disp_low8_dly4;
            end
        end
        assign disp_3d[7:0] = disp_low8_dly5;

        reg [15:0] disp_3d_clip;
        reg disp_3d_val_clip;
        always@(posedge clk or negedge rst)begin
            if(!rst) begin
                disp_3d_clip <= 16'd1;
                disp_3d_val_clip <= 1'd0;
            end
            else begin
                if (disp_3d_val)begin
                    if (disp_3d < config_stereo_disp_threshold) begin
                        disp_3d_clip <= config_stereo_disp_clip_value;
                    end
                    else begin
                        disp_3d_clip <= disp_3d;
                    end
                end
                else begin
                    disp_3d_clip <= disp_3d;
                end
                disp_3d_val_clip <= disp_3d_val;
            end
        end

    `elsif WITHOUT_3D
        reg [15:0] disp_3d_clip;
        reg disp_3d_val_clip;
        always@(posedge clk or negedge rst)begin
            if(!rst) begin
                disp_3d_clip <= 16'd0;
                disp_3d_val_clip <= 1'd0;
            end
            else begin
                if (val_3d_temp)begin
                    if (disp_3d_temp < config_stereo_disp_threshold) begin
                        disp_3d_clip <= config_stereo_disp_clip_value;
                    end
                    else begin
                        disp_3d_clip <= disp_3d_temp;
                    end
                end
                else begin
                    disp_3d_clip <= disp_3d_temp;
                end
                disp_3d_val_clip <= val_3d_temp;
            end
        end 
    `endif
    
    `ifdef DEBUG_MODE
        wire [15:0] disp_3d_debug;
        wire disp_3d_debug_val;
        Disp_out_Top#(16) disp_3d_debug_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width),
            .height_new(config_height),
            .cut_h(2'b00),
            .cut_w(2'b00),
            .vacancy(disp_3d_val_clip),
            .valid_in(disp_3d_val_clip),
            .data_in(disp_3d_clip),
            .data_out(disp_3d_debug),
            .hsync(),
            .vsync(),
            .out_hs(),
            .out_vs(),
            .valid(disp_3d_debug_val)
        );
    `endif

    wire [15:0] disp_downsamp;
    wire val_disp_downsamp;
    wire vac_disp_downsamp;
    
    Top_DownSample #(16,11,17) disp_downsamp_inst(
            .clk(clk),
            .rst(rst),
            .clk_en(disp_3d_val_clip),
            .valid_in(1'b1),
            .data_in(disp_3d_clip),
            .height(config_height),
            .width(config_width),
            .height_new(config_height_new),
            .width_new(config_width_new),
            .cut_h(config_crop_size_top),
            .cut_w(config_crop_size_left),
            .data_out(disp_downsamp),
            .valid_out(val_disp_downsamp),
            .vacancy(vac_disp_downsamp)
    );
    wire disp_valid_down;
    Disp_out_Top#(16) disp_out_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width_new),
            .height_new(config_height_new),
            .vacancy(vac_disp_downsamp),
            .valid_in(val_disp_downsamp),
            .data_in(disp_downsamp),
            .cut_h(config_crop_size_top),
            .cut_w(config_crop_size_left),
            .data_out(disp_down),
            .hsync(),
            .vsync(),
            .out_hs(disp_down_hs),
            .out_vs(disp_down_vs),
            .valid(disp_valid_down)
        );
    assign disp_down_val = disp_valid_down;
/****************************************************************
******************************DepthOut***************************
****************************************************************/
    wire [15:0]depth;
    wire depth_valid;
    top_disp2depth top_disp2depth_inst(
        .clk(clk),
        .rstn(rst),
        .clken(disp_3d_val_clip),
        .valid_in(disp_3d_val_clip),
        .disp(disp_3d_clip),
        .depth_format(config_depth_format),
        .Tx(config_depth_param),
        .depth(depth),
        .valid(depth_valid)
    );

    wire [15:0] depth_downsamp;
    wire val_depth_downsamp;
    wire vac_depth_downsamp;
    
    Top_DownSample #(16,11,17) depth_downsamp_inst(
            .clk(clk),
            .rst(rst),
            .clk_en(disp_3d_val_clip),
            .valid_in(1'b1),
            .data_in(depth),
            .height(config_height),
            .width(config_width),
            .height_new(config_height_new),
            .width_new(config_width_new),
            .cut_h(config_crop_size_top),
            .cut_w(config_crop_size_left),
            .data_out(depth_downsamp),
            .valid_out(val_depth_downsamp),
            .vacancy(vac_depth_downsamp)
    );

    Disp_out_Top#(16) depth_out_inst(
            .wr_clk(clk),
            .wr_rstn(rst),
            .rd_clk(clk),
            .rd_rstn(rst),
            .width(config_width),
            .height(config_height),
            .width_new(config_width_new),
            .height_new(config_height_new),
            .cut_h(config_crop_size_top),
            .cut_w(config_crop_size_left),
            .vacancy(vac_depth_downsamp),
            .valid_in(val_depth_downsamp),
            .data_in(depth_downsamp),

            .data_out(depth_down),
            .hsync(),
            .vsync(),
            .out_hs(depth_down_hs),
            .out_vs(depth_down_vs),
            .valid(depth_down_val)
    );

apb_slave_stereo u_apb_slave_stereo(
    /*input                 */  .clk                                (clk_cfg                           ),
    /*input                 */  .rst_n                              (rst_cfg_n                         ),
    /*input                 */  .p_sel                              (apb_sel                           ),
    /*input                 */  .p_enbale                           (apb_enable                        ),
    /*input      [12-1:0]   */  .p_addr                             (apb_addr                          ),
    /*input                 */  .p_write                            (apb_write                         ),
    /*input      [32-1:0]   */  .p_wr_data                          (apb_wdata                         ),
    /*output reg [32-1:0]   */  .p_rd_data                          (apb_rdata                         ),
    /*output reg  [6:0  ]   */  .config_nr3d_factor_noise           (config_nr3d_factor_noise          ),
    /*output reg  [4:0  ]   */  .config_nr3d_factor_pixel           (config_nr3d_factor_pixel          ),
    /*output reg  [7:0]     */  .config_nr3d_noise_level            (config_nr3d_noise_level           ),
    /*output reg  [7:0]     */  .config_nr3d_motion_levle           (config_nr3d_motion_levle          ),
    /*output reg  [1:0]     */  .config_nr3d_dilated_mask_select    (config_nr3d_dilated_mask_select   ),
    /*output reg  [15:0 ]   */  .config_nr3d_threshold_max          (config_nr3d_threshold_max         ),
    /*output reg  [15:0 ]   */  .config_nr3d_threshold_min          (config_nr3d_threshold_min         ),
    /*output reg  [2:0  ]   */  .config_nr3d_quality_max_gray       (config_nr3d_quality_max_gray      ),
    /*output reg  [2:0  ]   */  .config_nr3d_quality_max_disp       (config_nr3d_quality_max_disp      ),
    /*output reg            */  .config_nr3d_bypass_control         (config_nr3d_bypass_control        ),
    /*output reg  [10:0]    */  .config_stereo_image_width          (config_width                      ),
    /*output reg  [10:0]    */  .config_stereo_image_height         (config_height                     ),
    /*output reg  [10:0]    */  .config_stereo_image_width_new      (config_width_new                  ),
    /*output reg  [10:0]    */  .config_stereo_image_height_new     (config_height_new                 ),
    /*output reg  [8:0]     */  .config_stereo_range                (config_range                      ),
    /*output reg  [6:0]     */  .config_stereo_p1                   (config_P1                         ),
    /*output reg  [6:0]     */  .config_stereo_p2                   (config_P2                         ),
    /*output reg  [17:0]    */  .config_stereo_lrc_param            (config_lrc_param                  ),
    /*output reg            */  .config_stereo_postbefore_median    (config_postbefore_median          ),
    /*output reg  [1:0]     */  .config_stereo_median_sel           (config_median_sel                 ),
    /*output reg            */  .config_stereo_post_sel             (config_post_sel                   ),
    /*output reg            */  .config_stereo_downsampling_sel     (config_sel_col                    ),
    /*output reg            */  .config_stereo_depth_format         (config_depth_format               ),
    /*output reg  [31:0]    */  .config_stereo_depth_param          (config_depth_param                ),
    /*output reg  [1:0]     */  .config_stereo_crop_size_top        (config_crop_size_top              ),
    /*output reg  [1:0]     */  .config_stereo_crop_size_left       (config_crop_size_left             ),
    /*output reg  [15:0]     */ .config_stereo_disp_threshold       (config_stereo_disp_threshold      ),
    /*output reg  [15:0]     */ .config_stereo_disp_clip_value      (config_stereo_disp_clip_value     )
);



endmodule
