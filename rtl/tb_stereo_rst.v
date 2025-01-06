module tb_stereo;
parameter sys_period_clk = 6;
parameter width = 11'd1920;
parameter height = 11'd1080;
parameter size = 21'd2073600;
parameter width_new = 11'd1920;
parameter height_new = 11'd1080;
parameter size_new = 21'd2073600;

// parameter width = 11'd640;
// parameter height = 11'd480;
// parameter size = 21'd307200;
// parameter width_new = 11'd640;
// parameter height_new = 11'd480;
// parameter size_new = 21'd307200;
// parameter width_new = 11'd640;
// parameter height_new = 11'd480;
// parameter size_new = 21'd307200;
// parameter range = 9'd128;
reg [8:0] range = 9'd128;
parameter median_sel = 2'b00;
//11x11 9x9 7x7
// 00   01  11
parameter lrc_param = {{10'd40}, {8'd0}};
parameter postbefore_median = 1'b0;
parameter post_sel = 1'b1;
parameter sel_col = 1'b1;
parameter depth_format = 1'b0;
parameter depth_param = 32'b0_10001010_00101111111111011110100;
parameter P1 = 7'b0000010;
parameter P2 = 7'b0001000;


reg clk;
reg rst;
reg next_image;
always#(sys_period_clk/2)clk=~clk;

initial begin
    clk<=0;
    rst<=0;
    next_image<=0;
    #200
    rst<=1;
    # 1000000
    range <= 'd256; 
    # 36800
    rst <=0;
    next_image <= 1;
    # 200
    rst <= 1;
    # 1036800
    $stop;
end

reg   image_hs  = 0 ;
reg v_end = 1;
reg [10:0] cntx_n;
reg [10:0] cntx_p;
always @(posedge clk) begin
	if(!rst )begin
	  image_hs <= 0;
	  cntx_n <= 0;
	  cntx_p <= 0;
      v_end <= 1;
	end
	else if(image_hs == 0) begin
		cntx_n <= cntx_n+1;
        if (cntx_n == 1) v_end <= 0;
		if(cntx_n == 20) begin
			image_hs <= 1;
			cntx_n <= 0;
		end
	end
	else if(image_hs == 1) begin
		cntx_p <= cntx_p+1;
		if(cntx_p == width - 1) begin
			image_hs <= 0;
			cntx_p <= 0;
		end
	end 
	else
		image_hs <= image_hs;
end
reg [31:0] address;
always @(posedge clk)begin
	if(!rst)begin
		address<=0;
	end
	else if(address <= size)begin
		if(image_hs)	address<=address+1;
		else	address<=address;
	end
	else begin
		address<=address;
	end		
end
reg [7:0] ram_L[size-1:0];//1920x1080=2073600  for PIXEL input
reg [7:0] ram_R[size-1:0];//1920x1080=2073600  for PIXEL input
wire [7:0]data_L;
wire [7:0]data_R;
assign data_L = ram_L[address];
assign data_R = ram_R[address];
initial begin
	// $readmemh("./640_480/png_L.txt",ram_L);  //initial pixel
	// $readmemh("./640_480/png_R.txt",ram_R);  //initial pixel  
   $readmemh("./1920_1080/left.txt",ram_L);  //initial pixel
	$readmemh("./1920_1080/right.txt",ram_R);  //initial pixel
//    $readmemh("/anlab/stuhome/zngz6/Desktop/stereo/stereo/stereo_rtl_code/1225_demo/hex/image_L_15.txt",ram_L);  //initial pixel
//    $readmemh("/anlab/stuhome/zngz6/Desktop/stereo/stereo/stereo_rtl_code/1225_demo/hex/image_R_15.txt",ram_R);  //initial pixel
//    $readmemh("./1920_1080/L_1.txt",ram_L);  //initial pixel
	// $readmemh("./1920_1080/R_1.txt",ram_R);  //initial pixel  
end	

wire [15:0]disp;
wire [15:0]disp_lrc;
wire disp_valid;
wire hs_disp;
wire vs_disp;
wire disp_lrc_valid;
wire [15:0]depth;
wire depth_valid;
wire [15:0]disp_3d;
wire disp_3d_val;

stereo stereo_inst(
        .clk(clk), 
        .rst(rst), 
        .image_hs(image_hs),
        .v_end(v_end),

        .data_in_left(data_L), 
        .data_in_right(data_R),


        .width(width),
        .height(height),
        .width_new(width_new),
        .height_new(height_new),

        .P1(P1),
        .P2(P2),

        .range(range),
        .lrc_param(lrc_param),
        .sel_col(sel_col),
        .median_sel(median_sel),
        .postbefore_median(postbefore_median),
        .post_sel(post_sel),

        .depth_format(depth_format),
        .depth_param(depth_param),

        .depth_down(depth),
        .depth_down_val(depth_valid),
        .disp(disp),
        .disp_valid(disp_valid),
        .hs_disp(hs_disp),
        .vs_disp(vs_disp),
        .disp_lrc(disp_lrc),
        .disp_lrc_valid(disp_lrc_valid),
        .disp_3d(disp_3d),
        .disp_3d_val(disp_3d_val)

);

integer handle_disp;
integer handle_disp_3d;
integer handle_disp_3d_rst2;
integer handle_depth;
integer handle_disp_lrc;
initial begin
            //handle_disp=$fopen("./1920_1080/disp_out.txt","w");
            handle_disp_3d=$fopen("./1920_1080/disp_out_3d.txt","w");
            handle_disp_3d_rst2=$fopen("./1920_1080/disp_out_3d_rst2.txt","w");
            //handle_disp_lrc=$fopen("./1920_1080/disp_out_lrc.txt","w");
            //handle_depth=$fopen("./1920_1080/depth_out.txt","w");
            // handle_disp=$fopen("./640_480/disp_out.txt","w");
            // handle_disp_lrc=$fopen("./640_480/disp_out_lrc.txt","w");
            // handle_depth=$fopen("./640_480/depth_out.txt","w");

end

//integer i=0;
//        always @(posedge clk)begin
//            // if(disp_valid&image_hs)begin
//            if(disp_valid)begin
//                i<=i+1;
//                if(i<=(size_new-2)) begin
//                    if (disp_valid)$fdisplay(handle_disp,"%d",disp[15:8]);
//                end
//                else begin
//                    $fclose(handle_disp);
//                    $stop;
//                end
//            end
//        end
integer w=0;
integer w1=0;
always @(posedge clk)begin
    // if(disp_valid&image_hs)begin
    if(disp_3d_val && !next_image)begin
        w<=w+1;
        if(w<=(size-2)) begin
            if (disp_3d_val)$fdisplay(handle_disp_3d,"%d",disp_3d[15:8]);
        end
        else begin
            $fclose(handle_disp_3d);
            $stop;
        end
    end
end

always @(posedge clk)begin
    // if(disp_valid&image_hs)begin
    if(disp_3d_val && next_image)begin
        w1<=w1+1;
        if(w1<=(size-2)) begin
            if (disp_3d_val)$fdisplay(handle_disp_3d_rst2,"%d",disp_3d[15:8]);
        end
        else begin
            $fclose(handle_disp_3d_rst2);
            $stop;
        end
    end
end
//integer j=0;
//        always @(posedge clk)begin
//            if(depth_valid)begin
//                j<=j+1;
//                if(j<=(size_new-2)) begin
//                    if (depth_valid)$fdisplay(handle_depth,"%d",depth[15:8]);
//                end
//                else begin
//                    $fclose(handle_depth);
//                    $stop;
//                end
//            end
//        end
//
//integer k=0;
//        always @(posedge clk)begin
//            if(disp_lrc_valid&image_hs)begin
//                k<=k+1;
//                if(k<=(size_new-1)) begin
//                    if (disp_lrc_valid)$fdisplay(handle_disp_lrc,"%d",disp_lrc[15:8]);
//                end
//                else begin
//                    $fclose(handle_disp_lrc);
//                    $stop;
//                end
//            end
//        end
`ifdef DUMP_FSDB
initial begin
	$fsdbDumpfile("new.fsdb");
	$fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
		
endmodule
