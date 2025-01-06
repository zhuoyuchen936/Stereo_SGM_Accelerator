module sort_3(a,b,c,max,med,min);
parameter WIDTH=16;
input [WIDTH-1:0]a;
input [WIDTH-1:0]b;
input [WIDTH-1:0]c;

output reg [WIDTH-1:0]max;
output reg [WIDTH-1:0]med;
output reg [WIDTH-1:0]min;

wire flag1 = a > b;
wire flag2 = a > c;
wire flag3 = b > c;

always@(*)begin
    case({flag1,flag2,flag3})
    3'b111:  begin max<=a;med<=b;min<=c;  end            //abc
    3'b110:  begin max<=a;med<=c;min<=b;  end            //acb
    3'b011:  begin max<=b;med<=a;min<=c;  end            //bac
    3'b001:  begin max<=b;med<=c;min<=a;  end            //bca
    3'b000:  begin max<=c;med<=b;min<=a;  end            //cba
    3'b100:  begin max<=c;med<=a;min<=b;  end            //cab
    default: begin max<=a;med<=b;min<=c;  end
    endcase
end

endmodule
