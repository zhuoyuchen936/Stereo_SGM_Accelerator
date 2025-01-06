module apb_slave_stereo(
    //System
    input                   rst_n                       ,
    input                   clk                         ,

    //APB
    input                   p_sel                       ,
    input                   p_enbale                    ,
    input      [12-1:0]     p_addr                      ,
    input                   p_write                     ,
    input      [32-1:0]     p_wr_data                   ,
    output reg [32-1:0]     p_rd_data                   ,

    output reg  [6:0  ]     config_nr3d_factor_noise           ,
    output reg  [4:0  ]     config_nr3d_factor_pixel           ,
    output reg  [7:0]       config_nr3d_noise_level            ,
    output reg  [7:0]       config_nr3d_motion_levle           ,
    output reg  [1:0]       config_nr3d_dilated_mask_select    ,
    output reg  [15:0 ]     config_nr3d_threshold_max          ,
    output reg  [15:0 ]     config_nr3d_threshold_min          ,
    output reg  [2:0  ]     config_nr3d_quality_max_gray       ,
    output reg  [2:0  ]     config_nr3d_quality_max_disp       ,
    output reg              config_nr3d_bypass_control         ,
    output reg  [10:0]      config_stereo_image_width          ,
    output reg  [10:0]      config_stereo_image_height         ,
    output reg  [10:0]      config_stereo_image_width_new      ,
    output reg  [10:0]      config_stereo_image_height_new     ,
    output reg  [8:0]       config_stereo_range                ,
    output reg  [6:0]       config_stereo_p1                   ,
    output reg  [6:0]       config_stereo_p2                   ,
    output reg  [17:0]      config_stereo_lrc_param            ,
    output reg              config_stereo_postbefore_median    ,
    output reg  [1:0]       config_stereo_median_sel           ,
    output reg              config_stereo_post_sel             ,
    output reg              config_stereo_downsampling_sel     ,
    output reg              config_stereo_depth_format         ,
    output reg  [31:0]      config_stereo_depth_param          ,
    output reg  [1:0]       config_stereo_crop_size_top        ,
    output reg  [1:0]       config_stereo_crop_size_left       ,
    output reg  [15:0]      config_stereo_disp_threshold       ,
    output reg  [15:0]      config_stereo_disp_clip_value      

);

parameter c_stereo_res          = 12'h260;
parameter c_stereo_res_new      = 12'h264;
parameter c_stereo_range_p1p2   = 12'h268;
parameter c_stere_post_sel      = 12'h26C;
parameter c_stereo_camera       = 12'h270;
parameter c_stereo_crop_size    = 12'h274;
parameter c_stereo_disp_clip    = 12'h278;

parameter c_nr3d_factor         = 12'h280;
parameter c_nr3d_comp_quality   = 12'h284;
parameter c_nr3d_thd            = 12'h288;


//----------------------------control logic---------------------------------------------
wire apb_wr          = p_sel && p_write && p_enbale        ;
wire apb_rd          = p_sel && ~p_write && p_enbale      ;



//write logic
always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        config_stereo_image_width       <= 11'd1920;
        config_stereo_image_height      <= 11'd1080;
        config_stereo_image_width_new   <= 11'd1920;
        config_stereo_image_height_new  <= 11'd1080;
        config_stereo_range             <= 9'd128;
        config_stereo_p1                <= 7'b0000010;
        config_stereo_p2                <= 7'b0001000;
        config_stereo_lrc_param         <= {{10'd40}, {8'd0}};
        config_stereo_postbefore_median <= 1'b0;
        config_stereo_median_sel        <= 2'b00;
        config_stereo_post_sel          <= 1'b0;
        config_stereo_downsampling_sel  <= 1'b1;
        config_stereo_depth_format      <= 1'b1;
        config_stereo_depth_param       <= 32'b0_10001010_00101111111111011110100;
        config_nr3d_factor_noise        <= 7'h20;
        config_nr3d_factor_pixel        <= 5'h10;
        config_nr3d_noise_level         <= 8'd5;
        config_nr3d_motion_levle        <= 8'd5;
        config_nr3d_dilated_mask_select <= 2'b11;
        config_nr3d_threshold_max       <= 16'd51600;  //90%
        config_nr3d_threshold_min       <= 16'd43000;  //75%
        config_nr3d_quality_max_gray    <= 3'd5;
        config_nr3d_quality_max_disp    <= 3'd5;
        config_nr3d_bypass_control      <= 1'b1;
        config_stereo_crop_size_top     <= 2'b0;
        config_stereo_crop_size_left    <= 2'b0;
        config_stereo_disp_threshold    <= 16'd10;
        config_stereo_disp_clip_value    <= 16'd1;
    end
    else if (apb_wr) begin
        case(p_addr)
            c_stereo_res :begin
                config_stereo_image_width          <= p_wr_data[10:0];
                config_stereo_image_height         <= p_wr_data[21:11];
            end
            c_stereo_res_new :begin
                config_stereo_image_width_new      <= p_wr_data[10:0];
                config_stereo_image_height_new     <= p_wr_data[21:11];
            end
            c_stereo_range_p1p2 :begin
                config_stereo_range                <= p_wr_data[8:0];
                config_stereo_p1                   <= p_wr_data[18:12];
                config_stereo_p2                   <= p_wr_data[28:22];
            end
            c_stere_post_sel :begin
                config_stereo_lrc_param            <= p_wr_data[27:10];
                config_stereo_postbefore_median    <= p_wr_data[0];
                config_stereo_median_sel           <= p_wr_data[2:1];
                config_stereo_post_sel             <= p_wr_data[3];
                config_stereo_downsampling_sel     <= p_wr_data[4];
                config_stereo_depth_format         <= p_wr_data[5];
            end
            c_stereo_camera :begin
                config_stereo_depth_param          <= p_wr_data[31:0];
            end
            c_stereo_crop_size :begin
                config_stereo_crop_size_top        <= p_wr_data[1:0];
                config_stereo_crop_size_left       <= p_wr_data[3:2];
            end
            c_stereo_disp_clip : begin
                config_stereo_disp_threshold       <= p_wr_data[31:16];
                config_stereo_disp_clip_value      <= p_wr_data[15:0];
            end
            c_nr3d_factor :begin
                config_nr3d_factor_noise           <= p_wr_data[6:0];
                config_nr3d_factor_pixel           <= p_wr_data[11:7];
                config_nr3d_noise_level            <= p_wr_data[19:12];
                config_nr3d_motion_levle           <= p_wr_data[27:20];
                config_nr3d_dilated_mask_select    <= p_wr_data[29:28];
                config_nr3d_bypass_control         <= p_wr_data[31];
            end
            c_nr3d_comp_quality :begin
                config_nr3d_quality_max_gray       <= p_wr_data[2:0];
                config_nr3d_quality_max_disp       <= p_wr_data[5:3];
            end
            c_nr3d_thd :begin
                config_nr3d_threshold_max          <= p_wr_data[15:0];
                config_nr3d_threshold_min          <= p_wr_data[31:16];
            end
            default: ;
        endcase
    end
    else begin
    end
end


//read logic
always @(*) begin
    // init
    p_rd_data = 32'd0;
    if(apb_rd) begin
        case (p_addr)
            c_stereo_res    :begin
                p_rd_data           =  32'b0;
                p_rd_data[10:0]     =  config_stereo_image_width ;
                p_rd_data[21:11]    =  config_stereo_image_height;
            end
            c_stereo_res_new:begin
                p_rd_data           =  32'b0;
                p_rd_data[10:0]     =  config_stereo_image_width_new ;
                p_rd_data[21:11]    =  config_stereo_image_height_new;
            end
            c_stereo_range_p1p2  :begin
                p_rd_data           =  32'b0;
                p_rd_data[8:0]      =  config_stereo_range;
                p_rd_data[18:12]    =  config_stereo_p1   ;
                p_rd_data[28:22]    =  config_stereo_p2   ;
            end
            c_stere_post_sel  :begin
                p_rd_data           =  32'b0;
                p_rd_data[27:10]    =  config_stereo_lrc_param        ;
                p_rd_data[0]        =  config_stereo_postbefore_median;
                p_rd_data[2:1]      =  config_stereo_median_sel       ;
                p_rd_data[3]        =  config_stereo_post_sel         ;
                p_rd_data[4]        =  config_stereo_downsampling_sel ;
                p_rd_data[5]        =  config_stereo_depth_format     ;
            end
            c_stereo_camera  :begin
                p_rd_data[31:0]     =  config_stereo_depth_param;
            end
            c_stereo_crop_size :begin
                p_rd_data[1:0]      = config_stereo_crop_size_top[1:0];
                p_rd_data[3:2]      = config_stereo_crop_size_left[1:0];
            end
            c_stereo_disp_clip : begin
                p_rd_data[31:16]    = config_stereo_disp_threshold ;
                p_rd_data[15:0]     = config_stereo_disp_clip_value;
            end
            c_nr3d_factor   :begin
                p_rd_data           =  32'b0;
                p_rd_data[6:0]      =  config_nr3d_factor_noise       ;
                p_rd_data[11:7]     =  config_nr3d_factor_pixel       ;
                p_rd_data[19:12]    =  config_nr3d_noise_level        ;
                p_rd_data[27:20]    =  config_nr3d_motion_levle       ;
                p_rd_data[29:28]    =  config_nr3d_dilated_mask_select;
                p_rd_data[31]       =  config_nr3d_bypass_control     ;
            end
            c_nr3d_comp_quality      :begin
                p_rd_data           =  32'b0;
                p_rd_data[2:0]      =  config_nr3d_quality_max_gray;
                p_rd_data[5:3]      =  config_nr3d_quality_max_disp;
            end
            c_nr3d_thd      :begin
                p_rd_data           =  32'b0;
                p_rd_data[15:0]     =  config_nr3d_threshold_max;
                p_rd_data[31:16]    =  config_nr3d_threshold_min;
            end
            default: begin
                p_rd_data = 32'd0;
            end
        endcase
    end
    else begin
        p_rd_data = 32'd0;
    end
end









endmodule