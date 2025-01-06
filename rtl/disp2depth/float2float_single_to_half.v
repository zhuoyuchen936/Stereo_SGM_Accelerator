module float2float_single_to_half(
    input aclk,                                  // input wire aclk
    input [31:0] s_axis_a_tdata,                 // input wire [15 : 0] s_axis_a_tdata
    output reg [15:0] m_axis_result_tdata,           // output wire [31 : 0] m_axis_result_tdata

    input rstn,
    input en,
    input clken,
    output reg valid
);

reg en_0;
always @(posedge aclk or negedge rstn) begin
    if (!rstn) begin
        valid <= 1'd0;
    end else if(clken)begin
        valid <= en;
    end
end

// sign
always @(posedge aclk or negedge rstn) begin
    if (!rstn) begin
        m_axis_result_tdata[15]<=1'b0;
    end else if(clken) begin
        m_axis_result_tdata[15]<=s_axis_a_tdata[31];
    end
end


// exponent
always @(posedge aclk or negedge rstn) begin
    if (!rstn) begin
        m_axis_result_tdata[14:10]<=5'b0;   //exponent
        m_axis_result_tdata[9:0]<=10'b0;    //fraction
    end else if(clken) begin
        if(s_axis_a_tdata == 32'b0_11111111_00000_00000_00000_00000_000)begin
            m_axis_result_tdata[14:10]<=5'b11111;
            m_axis_result_tdata[9:0]<=10'b0;
        end
        else if(s_axis_a_tdata[30:23] > 8'd127 )begin
            if (s_axis_a_tdata[30:23] - 8'd127 > 15 ) begin        //too large    actually not happen
                m_axis_result_tdata[14:10]<=5'b11111;
                m_axis_result_tdata[9:0]<=10'b0;
            end
            else begin
                m_axis_result_tdata[14:10]<= (s_axis_a_tdata[30:23]-127+15);
                m_axis_result_tdata[9:0]<=s_axis_a_tdata[22:13];
            end
        end
        else begin 
            if (8'd127 - s_axis_a_tdata[30:23]  > 15 ) begin        //too small  assign 0
                m_axis_result_tdata[14:10]<=5'b00000;
                m_axis_result_tdata[9:0]<=10'b0;
            end
            else begin 
                m_axis_result_tdata[14:10]<= (15-(127 - s_axis_a_tdata[30:23]));
                m_axis_result_tdata[9:0]<=s_axis_a_tdata[22:13];
             end
         end
     end
end



endmodule
