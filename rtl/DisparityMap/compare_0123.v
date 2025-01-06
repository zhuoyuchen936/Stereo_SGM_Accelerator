/*
 * @Author: like 
 * @Date: 2022-08-08 11:47:43 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 15:32:20
 */

module compare_0123(
    input clk,
    input rst,
    input clken,

    input [4:0] data_0,
    input [4:0] data_1,
    input [4:0] data_2,
    input [4:0] data_3,

    output [8:0]data_out
);

reg [5:0]data_out_1;
reg [5:0]data_out_2;

always @(posedge clk or negedge rst)begin 
    if(rst==0) begin
        data_out_1<=6'd0;
        data_out_2<=6'd0;
    end
    else if(clken) begin
        if(data_0 <= data_1)
            data_out_1 <= {data_0,1'b0};
        else
            data_out_1 <= {data_1,1'b1};
        if(data_2 <= data_3)
            data_out_2 <= {data_2,1'b0};
        else
            data_out_2 <= {data_3,1'b1};
    end
end

//0 1 2 3分别用00 10 01 11表示
    wire  [6:0]data_out_x;
    assign data_out_x = (data_out_1[5:1] <= data_out_2[5:1]) ? {data_out_1,1'b0} : {data_out_2,1'b1};
    assign data_out = {2'b0,data_out_x};

endmodule
