module tb_stereo;
parameter sys_period_clk = 6;
reg clk;
reg rst;
reg [1:0] cut_h;
reg [1:0] cut_w;
always#(sys_period_clk/2)clk=~clk;

initial begin
    clk<=0;
    rst<=0;
    #200
    rst<=1;
end

reg image_hs  = 0 ;
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
    else if((address >= size-1))begin
	    address<=0;
	end

	else if(address < size-1)begin
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
	$readmemh("../rtl/2024_1204_left.txt",ram_R);  //initial pixel
    $readmemh("../rtl/2024_1204_right.txt",ram_L);  //initial pixel
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
// Debug outputs
wire [15:0] disp_l_debug;
wire disp_l_debug_val;
wire [15:0] disp_r_debug;
wire disp_r_debug_val;
wire [15:0] disp_lrc_debug;
wire disp_lrc_debug_val;
wire [15:0] disp_filling_debug;
wire disp_filling_debug_val;
wire [15:0] disp_mf_debug;
wire disp_mf_debug_val;
wire [15:0] disp_3d_debug;
wire disp_3d_debug_val;

stereo stereo_inst(
        .clk(clk), 
        .rst(rst), 
        .apb_sel(1'b0),
        .apb_enable(1'b0),
        .apb_write(1'b0),
        .data_in_hs(image_hs),
        .data_in_left(data_L), 
        .data_in_right(data_R),
        //debug signals
        .disp_l_debug(disp_l_debug),
        .disp_l_debug_val(disp_l_debug_val),
        .disp_r_debug(disp_r_debug),
        .disp_r_debug_val(disp_r_debug_val),
        .disp_lrc_debug(disp_lrc_debug),
        .disp_lrc_debug_val(disp_lrc_debug_val),
        .disp_filling_debug(disp_filling_debug),
        .disp_filling_debug_val(disp_filling_debug_val),
        .disp_mf_debug(disp_mf_debug),
        .disp_mf_debug_val(disp_mf_debug_val),
        .disp_3d_debug(disp_3d_debug),
        .disp_3d_debug_val(disp_3d_debug_val),
        //final disp/depth output (non-debug)
        .disp_down_hs(),
        .disp_down_vs(),
        .disp_down_val(disp_valid),
        .disp_down(disp),
        .depth_down_hs(),
        .depth_down_vs(),
        .depth_down_val(depth_valid),
        .depth_down(depth)
);

`ifdef DEBUG_MODE
    //debug
    integer handle_disp_l;
    integer handle_disp_r;
    integer handle_disp_lrc;
    integer handle_disp_filling;
    integer handle_disp_mf;
    integer handle_disp_3d;
    initial begin
        // Open files for debug handles
        handle_disp_l = $fopen("./1920_1080/disp_l.txt", "w");
        handle_disp_r = $fopen("./1920_1080/disp_r.txt", "w");
        handle_disp_lrc = $fopen("./1920_1080/disp_lrc.txt", "w");
        handle_disp_filling = $fopen("./1920_1080/disp_filling.txt", "w");
        handle_disp_mf = $fopen("./1920_1080/disp_mf.txt", "w");
        handle_disp_3d = $fopen("./1920_1080/disp_3d.txt", "w");
    end
`endif


//non-debug
integer handle_disp_down;
integer handle_depth_down;
initial begin
    // Open files for non-debug handles
    handle_disp_down = $fopen("./1920_1080/disp_down.txt", "w");
    handle_depth_down = $fopen("./1920_1080/depth_down.txt", "w");
end

integer i=0;
always @(posedge clk)begin
    if(disp_valid)begin
        i<=i+1;
        if(i<=(size_new-1)) begin
            if (disp_valid)$fdisplay(handle_disp_down,"%d",disp[15:8]);
        end
        else begin
            $fclose(handle_disp_down);
            $stop;
        end
    end
end
integer j=0;
always @(posedge clk)begin
    if(depth_valid)begin
        j<=j+1;
        if(j<=(size_new-1)) begin
            if (depth_valid)$fdisplay(handle_depth_down,"%d",depth[15:8]);
        end
        else begin
            $fclose(handle_depth_down);
            $stop;
        end
    end
end

`ifdef DEBUG_MODE
    integer k=0;
    always @(posedge clk)begin
        if(disp_l_debug_val)begin
            k<=k+1;
            if(k<=(size_new-1)) begin
                if (disp_l_debug_val)$fdisplay(handle_disp_l,"%d",disp_l_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_l);
                $stop;
            end
        end
    end
    integer m=0;
    always @(posedge clk)begin
        if(disp_r_debug_val)begin
            m<=m+1;
            if(m<=(size_new-1)) begin
                if (disp_r_debug_val)$fdisplay(handle_disp_r,"%d",disp_r_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_r);
                $stop;
            end
        end
    end
    integer n=0;
    always @(posedge clk)begin
        if(disp_lrc_debug_val)begin
            n<=n+1;
            if(n<=(size_new-1)) begin
                if (disp_lrc_debug_val)$fdisplay(handle_disp_lrc,"%d",disp_lrc_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_lrc);
                $stop;
            end
        end
    end
    integer f=0;
    always @(posedge clk)begin
        if(disp_filling_debug_val)begin
            f<=f+1;
            if(f<=(size_new-1)) begin
                if (disp_filling_debug_val)$fdisplay(handle_disp_filling,"%d",disp_filling_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_filling);
                $stop;
            end
        end
    end
    integer q=0;
    always @(posedge clk)begin
        if(disp_mf_debug_val)begin
            q<=q+1;
            if(q<=(size_new-1)) begin
                if (disp_mf_debug_val)$fdisplay(handle_disp_mf,"%d",disp_mf_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_mf);
                $stop;
            end
        end
    end
    integer e=0;
    always @(posedge clk)begin
        if(disp_3d_debug_val)begin
            e<=e+1;
            if(e<=(size_new-1)) begin
                if (disp_3d_debug_val)$fdisplay(handle_disp_3d,"%d",disp_3d_debug[15:8]);
            end
            else begin
                $fclose(handle_disp_3d);
                $stop;
            end
        end
    end
`endif


`ifdef DUMP_FSDB
initial begin
	$fsdbDumpfile("new.fsdb");
	$fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
		
endmodule
