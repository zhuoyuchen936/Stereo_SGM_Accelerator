module fix2float_88_to_single(
    input aclk,                                  // input wire aclk
    input [15:0] s_axis_a_tdata,                 // input wire [15 : 0] s_axis_a_tdata
    output [31:0] m_axis_result_tdata,           // output wire [31 : 0] m_axis_result_tdata

    input rstn,
    input clken,
    input en,
    output reg valid
);

reg en_0;
always @(posedge aclk or negedge rstn) begin
    if (!rstn) begin
        en_0 <= 1'd0;
        valid <= 1'd0;
    end else if(clken) begin
        en_0 <= en;
        valid <= en_0;
    end
end

// Input register
reg [15:0] a0, a1;
always @(posedge aclk or negedge rstn) begin
    if (!rstn) begin
        a0 <= 16'd0;
        a1 <= 16'd0;
    end else if(clken)  begin
        a0 <= s_axis_a_tdata;
        a1 <= a0;
    end
end

// Lookup table for finding the position of the most significant bit
wire [4:0] u_rom[15:0];
assign u_rom[0] = (a0[0]) ? 5'd0 : 5'd31;
generate genvar i;
for (i = 1; i <= 15; i = i + 1) begin: u_inst
    assign u_rom[i] = a0[i] ? i : u_rom[i - 1];
end
endgenerate

// Shift logic
reg [4:0] shift_ram;
always @(posedge aclk or negedge rstn) begin
    if (!rstn) shift_ram <= 5'd0;
    else if(clken) shift_ram <= u_rom[15];
end

// Mantissa calculation
wire [31:0] M_pre;
assign M_pre = (shift_ram == 5'd31) ? 32'd0 : ({16'd0,a1} << (31-shift_ram));

// Sign bit - assuming the input is always positive
wire sign;
assign sign = 1'b0;

// Exponent calculation
reg [7:0] E;
always @(*) begin
    if (shift_ram == 5'd31) E = 8'd0;

    else if(shift_ram > 8) E = 8'd127 + (shift_ram-8);

    else E = 8'd127 - (8-shift_ram);
        
    //else E = 8'd127 + (shift_ram-8);
end

// Assembling the floating-point output
assign m_axis_result_tdata = {sign, E, M_pre[30:8]};

endmodule


//module fix2float_88_to_half(
//    input aclk,                                  // input wire aclk
//    input [15:0] s_axis_a_tdata,                 // input wire [15 : 0] s_axis_a_tdata
//    output [15:0] m_axis_result_tdata,           // output wire [15 : 0] m_axis_result_tdata
//
//    input rstn,
//    input en,
//    output reg valid
//);
//// half float
////{sign-1,exponent-5,fraction-10}
////（-1）^sign×2^（指数位的值-15）×（1+0.尾数)
//
//reg en_0,en_1;
//always @(posedge aclk or negedge rstn) begin
//    if(!rstn)begin
//        en_0<=1'd0;
//        en_1<=1'd0;
//        valid<=1'd0;
//    end
//    else if(en) begin
//        en_0<=en;
//       // en_1<=en_0;
//        valid<=en_0;
//    end  
//end
//
//// Input register
//reg [15:0] a0, a1;
//always @(posedge aclk or negedge rstn) begin
//    if(!rstn)begin
//        a0<=16'd0;
//        a1<=16'd0;
//    end
//    else if(en)begin
//        a0 <= s_axis_a_tdata;
//        a1 <= a0;
//    end
//end
//
//// Lookup table for finding the position of the most significant bit
//wire [4:0] u_rom[15:0];
//assign u_rom[0] = (a0[0]) ? 5'd0 : 5'd31; // 31 as default for no bits set
//generate genvar i;
//for(i = 1; i <= 15; i = i + 1) begin:u_inst
//    assign u_rom[i] = a0[i] ? i : u_rom[i - 1];
//end
//endgenerate
//
//// Shift logic
//reg [4:0] shift_ram;
//always @(posedge aclk or negedge rstn) begin
//    if(!rstn) shift_ram<=5'd0;
//    else if(en) shift_ram <= u_rom[15];
//end
//
//// Mantissa calculation
//wire [15:0] M_pre;
//assign M_pre = (shift_ram == 5'd31) ? 16'd0 : a1 << (5'd15 - shift_ram);
//
//// Sign bit - assuming the input is always positive
//wire sign;
//assign sign = 1'b0;
//
//// Exponent calculation
//reg [4:0] E;
//always @(*) begin
//    if (shift_ram == 5'd31) E = 5'd0;
//    else E = 5'd15 + shift_ram; // Adjusted for 16-bit half precision
//end
//
//// Assembling the floating-point output
//assign m_axis_result_tdata = {sign, E, M_pre[14:5]};
//
//endmodule

