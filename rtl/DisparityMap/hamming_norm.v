module hamming_norm(
    input clk,
    input rst,
    input clken,

    
    input [3:0]cost_hamming,
    output reg [6:0]cost_hamming_norm
);

always@(posedge clk or negedge rst)begin
    if(!rst)begin
        cost_hamming_norm<=7'd0;
    end
    else if(clken) begin
    case(cost_hamming)
    4'd0: cost_hamming_norm <= 7'b1_000_000;
    4'd1: cost_hamming_norm <= 7'b0_111_100;
    4'd2: cost_hamming_norm <= 7'b0_111_000;
    4'd3: cost_hamming_norm <= 7'b0_110_101;
    4'd4: cost_hamming_norm <= 7'b0_110_001;
    4'd5: cost_hamming_norm <= 7'b0_101_110;
    4'd6: cost_hamming_norm <= 7'b0_101_011;
    4'd7: cost_hamming_norm <= 7'b0_101_001;
    4'd8: cost_hamming_norm <= 7'b0_100_110;
    4'd9: cost_hamming_norm <= 7'b0_100_100;
    default:cost_hamming_norm <= 7'b0_000_000;
    endcase
    end
    else begin
        cost_hamming_norm<=cost_hamming_norm;
    end
end

endmodule
