module result_test (
    clk,
    reset,
    start,
    result,
    flag
);
    parameter TEST_N = 20;
    input clk,reset,start;
    input[6:0] result;
    output flag;
    reg test_result;
    reg inc;
    reg finish;
    assign flag = test_result;
    wire[10:0] q_1,q_3;
    wire[10:0]  q_2,q_4;
    wire up1,up2,up3,up4;

    reg  [15:0] cnt_sgm;
    wire  valid_sgm;
    always@(posedge clk or negedge reset)begin
        if(!reset)begin
            cnt_sgm <= 16'd0;
        end
        else if(start)begin
            if(cnt_sgm == 16'd50000) cnt_sgm <= cnt_sgm; 
            else cnt_sgm <= cnt_sgm + 14'd1;
        end
        else begin
            cnt_sgm <= cnt_sgm;
        end
    end
    assign valid_sgm = (cnt_sgm == 16'd50000);
    wire trigger = (result>=7'd16)&&(result<=7'd30);
    counter_up #(.N(11),.LIMIT(1278)) counter1(.clk(clk),.reset(reset),.load(up1),.inc(inc),.up(up1),.d(11'd0),.q(q_1));
    counter_up #(.N(11),.LIMIT(1079))  counter2(.clk(clk),.reset(reset),.load(up2),.inc(up1),.up(up2),.d(11'd0),.q(q_2));
    counter_up #(.N(11),.LIMIT(1278)) counter3(.clk(clk),.reset(reset),.load(up3),.inc(start),.up(up3),.d(11'd0),.q(q_3));
    counter_up #(.N(11),.LIMIT(1079))  counter4(.clk(clk),.reset(reset),.load(up4),.inc(up3),.up(up4),.d(11'd0),.q(q_4));
    always @(posedge clk  or negedge reset) 
        if (!reset)
            inc<=0;
        else if (valid_sgm & (!finish))begin
            if(((result>=7'd16)&&(result<=7'd35)))begin
                inc<=1;
            end
            else begin
                inc<=0;
            end
        end
        else
            inc<=0;
    always @(posedge clk  or negedge reset)
        if(!reset)
            test_result<=0;
        else if(q_2==11'd20)///////q2==10'd21
            test_result<=1;
        else
            test_result<=test_result;

    always @(posedge clk  or negedge reset) 
        if (!reset)
            finish<=0;
        else if (up4)
            finish<=1;
        else
            finish<=finish;    
   
endmodule
