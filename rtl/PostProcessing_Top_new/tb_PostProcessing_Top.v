`define DUMP_FSDB

module tb_PostProcessing_Top;


parameter sys_period = 20;
parameter depth = 640;
parameter WIDTH = 9;
parameter AWIDTH =11;
parameter range = 128;
reg clk;
reg rst;
reg clken;
reg [WIDTH-1:0]data_L;
reg [WIDTH-1:0]data_R;
reg enable;
reg [WIDTH-1:0] ram_L[307199:0];//1920x1080=2073600  for PIXEL input
reg [WIDTH-1:0] ram_R[307199:0];//1920x1080=2073600  for PIXEL input
wire [WIDTH-1:0] PIXEL_L;
wire [WIDTH-1:0] PIXEL_R;
reg [31:0] address;

always #(sys_period/2) clk <= ~clk;
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
		if(cntx_n == 20) begin
			image_hs <= 1;
			cntx_n <= 0;
		end
	end
	else if(image_hs == 1) begin
		cntx_p <= cntx_p+1;
		if(cntx_p == 639) begin
			image_hs <= 0;
			cntx_p <= 0;
		end
	end 
	else
		image_hs <= image_hs;
		
end

wire valid_final;
wire [WIDTH-1:0] disp_final;
wire   clken0 = enable | clken;
wire [10:0] width = 11'd640;

PostProcessing_Top#(depth,WIDTH,AWIDTH)  PostProcessing_Top_inst(
	.clk(clk),
	.rst(rst),
	.clken(image_hs),
	.enable(enable),
    .width(width),
	.valid_final_L(image_hs),
	.valid_final_R(image_hs),
	.disp_L(PIXEL_L<<1),
	.disp_R(PIXEL_R<<1),
    .range(range),
	

	.disp_hole(disp_final),
	.valid_final_hole(valid_final)
);


wire [WIDTH-1:1] disp_final_int=disp_final[WIDTH-1:1];


initial begin
	$readmemh("../2024_1211_left.txt",ram_L);  //initial pixel
	$readmemh("../2024_1211_right.txt",ram_R);  //initial pixel 
end	

initial begin
	clk<=0;
	rst<=0;
    	enable<=0;
	#200;
	enable<=1;
	rst<=1;

end 

assign PIXEL_L = ram_L[address];
assign PIXEL_R = ram_R[address];

always @(posedge clk)
	begin
			if(!rst)begin
				address<=0;
			end
			else if(address <= 307199)   //   START
				begin
					if(image_hs)	address<=address+1;
					else	address<=address;
				end
			else
				begin
				address<=address;
				end		
   end

reg [WIDTH-1:0] data_init_check_L,data_init_check_R;
always @(posedge clk) begin 
		data_L<=PIXEL_L; 
		data_R<=PIXEL_R;
		
		data_init_check_L<=PIXEL_L[WIDTH-1:0];
		data_init_check_R<=PIXEL_R[WIDTH-1:0];
end 

integer handle_disp;
integer handle_initL;
integer handle_initR;
initial begin
handle_disp=$fopen("../PostProcessing_Top_new/image/image_out/disp_myh.txt","wt");
handle_initL=$fopen("../PostProcessing_Top_new/image/image_out/left_initial.txt","wt");
handle_initR=$fopen("../PostProcessing_Top_new/image/image_out/right_initial.txt","wt");
end


integer j=0;
always @(posedge clk)begin
	if(valid_final&&image_hs)begin
	j<=j+1;
	$fdisplay(handle_disp,"%d",disp_final_int);
	
	end
	else j<=j;
	if(j==2073599)begin
	$fclose(handle_disp);
	
	$stop;
	end
end 

integer i=0;
always @(posedge clk)begin
	if(image_hs)begin
	i<=i+1;
	$fdisplay(handle_initL,"%d",data_init_check_L);
	$fdisplay(handle_initR,"%d",data_init_check_R);
	end
	else i<=i;
	if(i==2073599)begin

	$fclose(handle_initL);
	$fclose(handle_initR);
	$stop;
	end
end 



`ifdef DUMP_FSDB
initial begin
	$fsdbDumpfile("new.fsdb");
	$fsdbDumpvars;
	$fsdbDumpMDA();
end
`endif	
endmodule 
