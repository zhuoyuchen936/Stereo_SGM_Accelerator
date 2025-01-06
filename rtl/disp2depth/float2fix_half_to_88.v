module float2fix_half_to_88(aclk, s_axis_a_tdata, m_axis_result_tdata,rstn,en,clken,valid);

    input aclk;
    input [15:0] s_axis_a_tdata; // 16-bit half-precision floating-point input
    output [15:0] m_axis_result_tdata; // 16-bit fixed-point output (8-bit integer, 8-bit fraction)

    input rstn;
    input clken;
    input en;
    output reg valid;

    reg [17:0] float_temp;
    reg [17:0] float_m;
    reg sign;

    reg en_0;
    always @(posedge aclk or negedge rstn ) begin
        if(!rstn)begin
            en_0<=1'd0;
            valid<=1'd0;
        end
        else if(clken)begin
            en_0<=en;
            valid<=en_0;
        end
        
    end
    reg [4:0] exp_reg;
    always @(posedge aclk or negedge rstn) begin
        if(!rstn)begin
            exp_reg<=5'd0;
            sign<=1'b0;
        end
        else if(clken)begin
            exp_reg <= s_axis_a_tdata[14:10];
            sign <= s_axis_a_tdata[15]; // Extract sign bit
        end
    end
reg [15:0]a_reg;
    always @(posedge aclk or negedge rstn) begin
        if(!rstn)begin
            float_m<=16'd0;
            a_reg<=16'd0;
        end
        else if(clken)begin
            float_m <= {7'd0,1'b1, s_axis_a_tdata[9:0]}; // Implicit leading 1
            a_reg<=s_axis_a_tdata;
        end
    end

    always @(posedge aclk or negedge rstn) begin
        if(!rstn)
            float_temp<=16'd0;
        else if(clken)begin
            if (exp_reg >= 5'd23) begin                // out of range-large
                //if(a_reg== 16'b0_11111_00000_00000)
                    float_temp<=18'h3ffff;
            end
            else if(exp_reg>= 5'd15)begin
                float_temp <= float_m << (exp_reg - 5'd15 ); 
            end 
            else if(exp_reg >= 5'd7)begin
                float_temp <= float_m << ( 5'd15 -exp_reg ); 
            end
            else begin                                // out of range-small
                float_temp<=18'h00000;
            end
        end
    end

    assign m_axis_result_tdata = float_temp[17:2];

endmodule

