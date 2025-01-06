module counter_up (
    clk,
    reset,
    load,
    inc,
    up,
    d,
    q
);
    parameter N = 4;
    parameter LIMIT = 15;

    input clk,reset,inc,load;
    input [N-1:0] d;
    output [N-1:0]q;
    output up;
    reg up;
    reg [N-1:0] q;

    always @(posedge clk or negedge reset)
        if(!reset) q<=0;
        else if(load) q<=d;
        else if(inc) q<=q+1;
    always @(posedge clk or negedge reset) 
        if(!reset) 
            up<=0;
        else if (inc & q==LIMIT) 
            up<=1;
        else
            up<=0;
     
endmodule
