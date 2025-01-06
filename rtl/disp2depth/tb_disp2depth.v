module tb_disp2depth;
parameter sys_period_clk = 4;
parameter width = 11'd718;
parameter height = 11'd496;
parameter size = 24'd356128;

//parameter width = 11'd640;
//parameter height = 11'd480;
parameter width_new = 11'd718;
parameter height_new = 11'd496;
//parameter size = 24'd307200;

//parameter width = 11'd1920;
//parameter height = 11'd1080;
//parameter width_new = 11'd1920;
//parameter height_new = 11'd1080;
//parameter size = 24'd2073600;
parameter range = 9'd128;
reg clk=1;
reg rst;
always#(sys_period_clk/2)clk=~clk;

reg   image_hs  = 0 ;
reg [10:0] cntx_n;
reg [10:0] cntx_p;
always @(posedge clk) begin
	if(!rst )begin
	  image_hs <= 0;
	  cntx_n <= 0;
	  cntx_p <= 0;
	end
	else if(image_hs == 0) begin
		cntx_n <= cntx_n+1;
		if(cntx_n == 10) begin
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
wire flag;
wire vacancy; 
reg [7:0] ram_L[size-1:0];//1920x1080=2073600  for PIXEL input
reg [7:0] ram_R[size-1:0];//1920x1080=2073600  for PIXEL input
wire [7:0]data_L;
wire [7:0]data_R;
assign data_L = ram_L[address];
assign data_R = ram_R[address];
reg test_en;
initial begin
//	$readmemh("./1920_1080/left.txt",ram_L);  //initial pixel
//	$readmemh("./1920_1080/right.txt",ram_R);  //initial pixel

	$readmemh("./718_496/png_L.txt",ram_L);  //initial pixel
	$readmemh("./718_496/png_R.txt",ram_R);  //initial pixel 
end	

reg [15:0]ram_disp[size-1:0];
wire [15:0]disp;
assign disp=ram_disp[address];
initial begin
	$readmemh("./718_496/disp.txt",ram_disp);  //initial pixel
end

    wire [15:0]depth;
    wire valid;
top_disp2depth inst(
    .rstn(rst),
    .clk(clk),
    .clken(image_hs),
    .depth_format(1'b0),
    .Tx(32'b0_10001010_00101111111111011110100),
    .disp(disp),

    .depth(depth),
    .valid(valid)
);

initial begin
    clk<=1; 
    rst<=0;
    test_en<=0;
    #200
    rst<=1;
    #2000
    test_en<=0;
end
integer handle;	
initial begin
    handle=$fopen("./718_496/depth_out.txt","w");
end

integer i=0;
		always @(posedge clk)begin
			if(valid&image_hs)begin
				i<=i+1;
				if(i<=(size-1)) begin
                    if (valid)$fdisplay(handle,"%b",depth);
				end
				else begin
					$fclose(handle);
					$stop;
				end
			end
		end

`ifdef DUMP_FSDB
initial begin
	$fsdbDumpfile("new.fsdb");
	$fsdbDumpvars;
    $fsdbDumpMDA;
end
`endif
		
		
endmodule
