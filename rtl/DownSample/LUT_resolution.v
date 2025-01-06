//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Guan Xinyu
// 
// Create Date: 2023/09/06 15:24:55
// Design Name: 
// Module Name: LUT_resolution
// Project Name: 

//////////////////////////////////////////////////////////////////////////////////


module LUT_resolution
#(parameter AWIDTH =11, parameter EXTEND = 17)
(
    height1,
    width1,

    height2,
    width2,

    cut_h,
    cut_w,

    resolution_height,
    resolution_width

    );
    input [AWIDTH-1:0] height1, width1, height2, width2;
    input [1:0] cut_h,cut_w;
    output reg [AWIDTH+EXTEND-1:0] resolution_height,resolution_width;
  always @(*) begin
    case(cut_h)
        2'b00:
            case (height1)
            11'd1080:
                case(height2)
                    11'd1080:resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd800: resolution_height = 28'b00000000001_01011001100110011; //1.350000
                    11'd768: resolution_height = 28'b00000000001_01101000000000000; //1.406250
                    11'd720: resolution_height = 28'b00000000001_10000000000000000; //1.500000
                    11'd480: resolution_height = 28'b00000000010_01000000000000000; //2.250000
                    11'd240: resolution_height = 28'b00000000100_10000000000000000; //4.500000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd800:
                case(height2)
                    11'd800: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd768: resolution_height = 28'b00000000001_00001010101010101; //1.041667
                    11'd720: resolution_height = 28'b00000000001_00011100011100011; //1.111111
                    11'd480: resolution_height = 28'b00000000001_10101010101010101; //1.666667
                    11'd240: resolution_height = 28'b00000000011_01010101010101010; //3.333333     
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd768:
                case(height2)
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00010001000100010; //1.066667
                    11'd480: resolution_height = 28'b00000000001_10011001100110011; //1.600000
                    11'd240: resolution_height = 28'b00000000011_00110011001100110; //3.200000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd720:
                case(height2)
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd360: resolution_height = 28'b00000000010_00000000000000000; //2
                    11'd480: resolution_height = 28'b00000000001_10000000000000000; //1.500000
                    11'd240: resolution_height = 28'b00000000011_00000000000000000; //3.000000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd480:
                case(height2)
                    11'd480: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd240: resolution_height = 28'b00000000010_00000000000000000; //2.000000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            default :        resolution_height = 28'b00000000001_00000000000000000; // 1
            endcase
        2'b01:
            case (height1)
            11'd1080:
                case(height2)
                    11'd1080:resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd800: resolution_height = 28'b00000000001_01001001100110011; //1.2875
                    11'd768: resolution_height = 28'b00000000001_01010111010101010; //1.341145833333
                    11'd720: resolution_height = 28'b00000000001_01101110001110001; //1.43055555555
                    11'd480: resolution_height = 28'b00000000010_00100101010101010; //2.145833333
                    11'd240: resolution_height = 28'b00000000100_01001010101010101; //4.29166666666
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd800:
                case(height2)
                    11'd800: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00001010101010101; //1.0416666666666666666
                    11'd480: resolution_height = 28'b00000000001_10010000000000000; //1.5625
                    11'd240: resolution_height = 28'b00000000011_00100000000000000; //3.125     
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd768:
                case(height2)
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd480: resolution_height = 28'b00000000001_01111110111011101; //1.49583333333333333
                    11'd240: resolution_height = 28'b00000000010_11111101110111011; //2.991666666666
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd720:
                case(height2)
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd360: resolution_height = 28'b00000000001_11011100011100011; //1.86111111111111
                    11'd480: resolution_height = 28'b00000000001_01100101010101010; //1.3958333333333333
                    11'd240: resolution_height = 28'b00000000010_11001010101010101; //2.79166666666
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd480:
                case(height2)
                    11'd480: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd240: resolution_height = 28'b00000000001_11001010101010101; //1.791666666666
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            default :        resolution_height = 28'b00000000001_00000000000000000; // 1
            endcase
        2'b10:
            case (height1)
            11'd1080:
                case(height2)
                    11'd1080:resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd800: resolution_height = 28'b00000000001_00111001100110011; //1.225
                    11'd768: resolution_height = 28'b00000000001_01000110101010101; //1.2760416666666666666
                    11'd720: resolution_height = 28'b00000000001_01011100011100011; //1.36111111111111
                    11'd480: resolution_height = 28'b00000000010_00001010101010101; //2.0416666666666666666
                    11'd240: resolution_height = 28'b00000000100_00010101010101010; //4.083333333333
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd800:
                case(height2)
                    11'd800: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd480: resolution_height = 28'b00000000001_01110101010101010; //1.45833333
                    11'd240: resolution_height = 28'b00000000010_11101010101010101; //2.91666666666  
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd768:
                case(height2)
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd480: resolution_height = 28'b00000000001_01100100010001000; //1.39166666666
                    11'd240: resolution_height = 28'b00000000010_11001000100010001; //2.7833333333
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd720:
                case(height2)
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd360: resolution_height = 28'b00000000001_10111000111000111; //1.7222222222222
                    11'd480: resolution_height = 28'b00000000001_01001010101010101; //1.291666666666
                    11'd240: resolution_height = 28'b00000000010_10010101010101010; //2.5833333333333
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd480:
                case(height2)
                    11'd480: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd240: resolution_height = 28'b00000000001_10010101010101010; //1.5833333
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            default :        resolution_height = 28'b00000000001_00000000000000000; // 1
            endcase
        default:
            case (height1)
            11'd1080:
                case(height2)
                    11'd1080:resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd800: resolution_height = 28'b00000000001_01011001100110011; //1.350000
                    11'd768: resolution_height = 28'b00000000001_01101000000000000; //1.406250
                    11'd720: resolution_height = 28'b00000000001_10000000000000000; //1.500000
                    11'd480: resolution_height = 28'b00000000010_01000000000000000; //2.250000
                    11'd240: resolution_height = 28'b00000000100_10000000000000000; //4.500000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd800:
                case(height2)
                    11'd800: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd768: resolution_height = 28'b00000000001_00001010101010101; //1.041667
                    11'd720: resolution_height = 28'b00000000001_00011100011100011; //1.111111
                    11'd480: resolution_height = 28'b00000000001_10101010101010101; //1.666667
                    11'd240: resolution_height = 28'b00000000011_01010101010101010; //3.333333     
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd768:
                case(height2)
                    11'd768: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd720: resolution_height = 28'b00000000001_00010001000100010; //1.066667
                    11'd480: resolution_height = 28'b00000000001_10011001100110011; //1.600000
                    11'd240: resolution_height = 28'b00000000011_00110011001100110; //3.200000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd720:
                case(height2)
                    11'd720: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd360: resolution_height = 28'b00000000010_00000000000000000; //2
                    11'd480: resolution_height = 28'b00000000001_10000000000000000; //1.500000
                    11'd240: resolution_height = 28'b00000000011_00000000000000000; //3.000000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            11'd480:
                case(height2)
                    11'd480: resolution_height = 28'b00000000001_00000000000000000; //1
                    11'd240: resolution_height = 28'b00000000010_00000000000000000; //2.000000
                    default :        resolution_height = 28'b00000000001_00000000000000000; // 1
                endcase
            default :        resolution_height = 28'b00000000001_00000000000000000; // 1
            endcase
        endcase
  end

    always @(*) begin
    case(cut_w)
    2'b00:
        case (width1)
        11'd1920:
            case(width2)
                11'd1920: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1600: resolution_width = 28'b00000000001_00110011001100110; //1.200000
                11'd1280: resolution_width = 28'b00000000001_10000000000000000; //1.500000
                11'd1024: resolution_width = 28'b00000000001_11100000000000000; //1.875000
                11'd640:  resolution_width = 28'b00000000011_00000000000000000; //3.000000
                11'd320:  resolution_width = 28'b00000000110_00000000000000000; //6.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1600:
            case(width2)
                11'd1600: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1280: resolution_width = 28'b00000000001_01000000000000000; //1.250000
                11'd1024: resolution_width = 28'b00000000001_10010000000000000; //1.562500
                11'd640:  resolution_width = 28'b00000000010_10000000000000000; //2.500000
                11'd320:  resolution_width = 28'b00000000101_00000000000000000; //5.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1        
            endcase
        11'd1280:
            case(width2)
                11'd1280: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1024: resolution_width = 28'b00000000001_01000000000000000; //1.250000
                11'd640:  resolution_width = 28'b00000000010_00000000000000000; //2.000000
                11'd320:  resolution_width = 28'b00000000100_00000000000000000; //4.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1024:
            case(width2)
                11'd1024: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd640:  resolution_width = 28'b00000000001_10011001100110011; //1.600000
                11'd320:  resolution_width = 28'b00000000011_00110011001100110; //3.200000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
                
            endcase
        11'd640:
                case(width2)
                    11'd640:  resolution_width = 28'b00000000001_00000000000000000; // 1 
                    11'd320:begin resolution_width = 28'b00000000010_00000000000000000;end //2.000000
                endcase
        default :      resolution_width = 28'b00000000001_00000000000000000; // 1   
        endcase
    2'b01:
        case (width1)
        11'd1920:
            case(width2)
                11'd1920: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1600: resolution_width = 28'b00000000001_00101011001100110; //1.16875
                11'd1280: resolution_width = 28'b00000000001_01110110000000000; //1.4609375
                11'd1024: resolution_width = 28'b00000000001_11010011100000000; //1.826171875
                11'd640:  resolution_width = 28'b00000000010_11101100000000000; //2.921875
                11'd320:  resolution_width = 28'b00000000101_11011000000000000; //5.84375
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1600:
            case(width2)
                11'd1600: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1280: resolution_width = 28'b00000000001_00110110000000000; //1.2109375
                11'd1024: resolution_width = 28'b00000000001_10000011100000000; //1.513671875
                11'd640:  resolution_width = 28'b00000000010_01101100000000000; //2.421875
                11'd320:  resolution_width = 28'b00000000100_11011000000000000; //4.84375
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1        
            endcase
        11'd1280:
            case(width2)
                11'd1280: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1024: resolution_width = 28'b00000000001_00110011100000000; //1.201171875
                11'd640:  resolution_width = 28'b00000000010_11101100000000000; //1.921875
                11'd320:  resolution_width = 28'b00000000011_11011000000000000; //3.84375
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1024:
            case(width2)
                11'd1024: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd640:  resolution_width = 28'b00000000001_10000101100110011; //1.521875
                11'd320:  resolution_width = 28'b00000000011_00001011001100110; //3.04375
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
                
            endcase
        11'd640:
                case(width2)
                    11'd640:  resolution_width = 28'b00000000001_00000000000000000; // 1 
                    11'd320:  resolution_width = 28'b00000000001_11011000000000000;//1.84375
                endcase
        default :      resolution_width = 28'b00000000001_00000000000000000; // 1   
        endcase
    2'b10:
        case (width1)
        11'd1920:
            case(width2)
                11'd1920: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1600: resolution_width = 28'b00000000001_00100011001100110; //1.1375
                11'd1280: resolution_width = 28'b00000000001_01101100000000000; //1.421875
                11'd1024: resolution_width = 28'b00000000001_11000111000000000; //1.77734375
                11'd640:  resolution_width = 28'b00000000010_11011000000000000; //2.84375
                11'd320:  resolution_width = 28'b00000000101_10110000000000000; //5.6875
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1600:
            case(width2)
                11'd1600: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1280: resolution_width = 28'b00000000001_00101100000000000; //1.171875
                11'd1024: resolution_width = 28'b00000000001_01110111000000000; //1.46484375
                11'd640:  resolution_width = 28'b00000000010_01011000000000000; //2.34375
                11'd320:  resolution_width = 28'b00000000100_10110000000000000; //4.6875
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1        
            endcase
        11'd1280:
            case(width2)
                11'd1280: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1024: resolution_width = 28'b00000000001_00100111000000000; //1.15234375
                11'd640:  resolution_width = 28'b00000000001_11011000000000000; //1.84375
                11'd320:  resolution_width = 28'b00000000011_10110000000000000; //3.6875
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1024:
            case(width2)
                11'd1024: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd640:  resolution_width = 28'b00000000001_01110001100110011; //1.44375
                11'd320:  resolution_width = 28'b00000000010_11100011001100110; //2.8875
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
                
            endcase
        11'd640:
                case(width2)
                    11'd640:  resolution_width = 28'b00000000001_00000000000000000; // 1 
                    11'd320:  resolution_width = 28'b00000000001_10110000000000000; //1.6875
                endcase
        default :      resolution_width = 28'b00000000001_00000000000000000; // 1   
        endcase
    default:
        case (width1)
        11'd1920:
            case(width2)
                11'd1920: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1600: resolution_width = 28'b00000000001_00110011001100110; //1.200000
                11'd1280: resolution_width = 28'b00000000001_10000000000000000; //1.500000
                11'd1024: resolution_width = 28'b00000000001_11100000000000000; //1.875000
                11'd640:  resolution_width = 28'b00000000011_00000000000000000; //3.000000
                11'd320:  resolution_width = 28'b00000000110_00000000000000000; //6.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1600:
            case(width2)
                11'd1600: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1280: resolution_width = 28'b00000000001_01000000000000000; //1.250000
                11'd1024: resolution_width = 28'b00000000001_10010000000000000; //1.562500
                11'd640:  resolution_width = 28'b00000000010_10000000000000000; //2.500000
                11'd320:  resolution_width = 28'b00000000101_00000000000000000; //5.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1        
            endcase
        11'd1280:
            case(width2)
                11'd1280: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd1024: resolution_width = 28'b00000000001_01000000000000000; //1.250000
                11'd640:  resolution_width = 28'b00000000010_00000000000000000; //2.000000
                11'd320:  resolution_width = 28'b00000000100_00000000000000000; //4.000000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
            endcase
        11'd1024:
            case(width2)
                11'd1024: resolution_width = 28'b00000000001_00000000000000000; // 1 
                11'd640:  resolution_width = 28'b00000000001_10011001100110011; //1.600000
                11'd320:  resolution_width = 28'b00000000011_00110011001100110; //3.200000
                default :      resolution_width = 28'b00000000001_00000000000000000; // 1 
                
            endcase
        11'd640:
                case(width2)
                    11'd640:  resolution_width = 28'b00000000001_00000000000000000; // 1 
                    11'd320:begin resolution_width = 28'b00000000010_00000000000000000;end //2.000000
                endcase
        default :      resolution_width = 28'b00000000001_00000000000000000; // 1   
        endcase
    endcase
  end
  
endmodule
