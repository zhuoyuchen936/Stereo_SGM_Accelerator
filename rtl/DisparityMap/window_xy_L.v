/*
* @Author: ZhuoyuChen  
 * @Date: 2021-03-17 20:31:35 
 * @Last Modified by: KeLi
 * @Last Modified time: 2022-08-10 14:30:15
 */

 module window_xy_L (
    clock,
    clken,
    rst,
    linebuffer0,
    linebuffer1,


    lb0_pixel,
    lb1_pixel
);
parameter PIXEL_WIDTH = 11;
input clock;
input clken;
input rst;

input [(PIXEL_WIDTH-1):0]  linebuffer0;
input [(PIXEL_WIDTH-1):0]  linebuffer1;
output [(PIXEL_WIDTH*258-1):0] lb0_pixel;
output [(PIXEL_WIDTH*258-1):0] lb1_pixel;
 

reg [(PIXEL_WIDTH-1):0] lb0 [257:0];
reg [(PIXEL_WIDTH-1):0] lb1 [257:0];



assign lb0_pixel = {lb0[0],lb0[1],lb0[2],lb0[3],lb0[4],lb0[5],lb0[6],lb0[7],lb0[8],lb0[9],
lb0[10],lb0[11],lb0[12],lb0[13],lb0[14],lb0[15],lb0[16],lb0[17],lb0[18],lb0[19],
lb0[20],lb0[21],lb0[22],lb0[23],lb0[24],lb0[25],lb0[26],lb0[27],lb0[28],lb0[29],
lb0[30],lb0[31],lb0[32],lb0[33],lb0[34],lb0[35],lb0[36],lb0[37],lb0[38],lb0[39],
lb0[40],lb0[41],lb0[42],lb0[43],lb0[44],lb0[45],lb0[46],lb0[47],lb0[48],lb0[49],
lb0[50],lb0[51],lb0[52],lb0[53],lb0[54],lb0[55],lb0[56],lb0[57],lb0[58],lb0[59],
lb0[60],lb0[61],lb0[62],lb0[63],lb0[64],lb0[65],lb0[66],lb0[67],lb0[68],lb0[69],
lb0[70],lb0[71],lb0[72],lb0[73],lb0[74],lb0[75],lb0[76],lb0[77],lb0[78],lb0[79],
lb0[80],lb0[81],lb0[82],lb0[83],lb0[84],lb0[85],lb0[86],lb0[87],lb0[88],lb0[89],
lb0[90],lb0[91],lb0[92],lb0[93],lb0[94],lb0[95],lb0[96],lb0[97],lb0[98],lb0[99],
lb0[100],lb0[101],lb0[102],lb0[103],lb0[104],lb0[105],lb0[106],lb0[107],lb0[108],lb0[109],
lb0[110],lb0[111],lb0[112],lb0[113],lb0[114],lb0[115],lb0[116],lb0[117],lb0[118],lb0[119],
lb0[120],lb0[121],lb0[122],lb0[123],lb0[124],lb0[125],lb0[126],lb0[127],lb0[128],lb0[129],
lb0[130],lb0[131],lb0[132],lb0[133],lb0[134],lb0[135],lb0[136],lb0[137],lb0[138],lb0[139],
lb0[140],lb0[141],lb0[142],lb0[143],lb0[144],lb0[145],lb0[146],lb0[147],lb0[148],lb0[149],
lb0[150],lb0[151],lb0[152],lb0[153],lb0[154],lb0[155],lb0[156],lb0[157],lb0[158],lb0[159],
lb0[160],lb0[161],lb0[162],lb0[163],lb0[164],lb0[165],lb0[166],lb0[167],lb0[168],lb0[169],
lb0[170],lb0[171],lb0[172],lb0[173],lb0[174],lb0[175],lb0[176],lb0[177],lb0[178],lb0[179],
lb0[180],lb0[181],lb0[182],lb0[183],lb0[184],lb0[185],lb0[186],lb0[187],lb0[188],lb0[189],
lb0[190],lb0[191],lb0[192],lb0[193],lb0[194],lb0[195],lb0[196],lb0[197],lb0[198],lb0[199],
lb0[200],lb0[201],lb0[202],lb0[203],lb0[204],lb0[205],lb0[206],lb0[207],lb0[208],lb0[209],
lb0[210],lb0[211],lb0[212],lb0[213],lb0[214],lb0[215],lb0[216],lb0[217],lb0[218],lb0[219],
lb0[220],lb0[221],lb0[222],lb0[223],lb0[224],lb0[225],lb0[226],lb0[227],lb0[228],lb0[229],
lb0[230],lb0[231],lb0[232],lb0[233],lb0[234],lb0[235],lb0[236],lb0[237],lb0[238],lb0[239],
lb0[240],lb0[241],lb0[242],lb0[243],lb0[244],lb0[245],lb0[246],lb0[247],lb0[248],lb0[249],
lb0[250],lb0[251],lb0[252],lb0[253],lb0[254],lb0[255],lb0[256],lb0[257]};

assign lb1_pixel = {lb1[0],lb1[1],lb1[2],lb1[3],lb1[4],lb1[5],lb1[6],lb1[7],lb1[8],lb1[9],
lb1[10],lb1[11],lb1[12],lb1[13],lb1[14],lb1[15],lb1[16],lb1[17],lb1[18],lb1[19],
lb1[20],lb1[21],lb1[22],lb1[23],lb1[24],lb1[25],lb1[26],lb1[27],lb1[28],lb1[29],
lb1[30],lb1[31],lb1[32],lb1[33],lb1[34],lb1[35],lb1[36],lb1[37],lb1[38],lb1[39],
lb1[40],lb1[41],lb1[42],lb1[43],lb1[44],lb1[45],lb1[46],lb1[47],lb1[48],lb1[49],
lb1[50],lb1[51],lb1[52],lb1[53],lb1[54],lb1[55],lb1[56],lb1[57],lb1[58],lb1[59],
lb1[60],lb1[61],lb1[62],lb1[63],lb1[64],lb1[65],lb1[66],lb1[67],lb1[68],lb1[69],
lb1[70],lb1[71],lb1[72],lb1[73],lb1[74],lb1[75],lb1[76],lb1[77],lb1[78],lb1[79],
lb1[80],lb1[81],lb1[82],lb1[83],lb1[84],lb1[85],lb1[86],lb1[87],lb1[88],lb1[89],
lb1[90],lb1[91],lb1[92],lb1[93],lb1[94],lb1[95],lb1[96],lb1[97],lb1[98],lb1[99],
lb1[100],lb1[101],lb1[102],lb1[103],lb1[104],lb1[105],lb1[106],lb1[107],lb1[108],lb1[109],
lb1[110],lb1[111],lb1[112],lb1[113],lb1[114],lb1[115],lb1[116],lb1[117],lb1[118],lb1[119],
lb1[120],lb1[121],lb1[122],lb1[123],lb1[124],lb1[125],lb1[126],lb1[127],lb1[128],lb1[129],
lb1[130],lb1[131],lb1[132],lb1[133],lb1[134],lb1[135],lb1[136],lb1[137],lb1[138],lb1[139],
lb1[140],lb1[141],lb1[142],lb1[143],lb1[144],lb1[145],lb1[146],lb1[147],lb1[148],lb1[149],
lb1[150],lb1[151],lb1[152],lb1[153],lb1[154],lb1[155],lb1[156],lb1[157],lb1[158],lb1[159],
lb1[160],lb1[161],lb1[162],lb1[163],lb1[164],lb1[165],lb1[166],lb1[167],lb1[168],lb1[169],
lb1[170],lb1[171],lb1[172],lb1[173],lb1[174],lb1[175],lb1[176],lb1[177],lb1[178],lb1[179],
lb1[180],lb1[181],lb1[182],lb1[183],lb1[184],lb1[185],lb1[186],lb1[187],lb1[188],lb1[189],
lb1[190],lb1[191],lb1[192],lb1[193],lb1[194],lb1[195],lb1[196],lb1[197],lb1[198],lb1[199],
lb1[200],lb1[201],lb1[202],lb1[203],lb1[204],lb1[205],lb1[206],lb1[207],lb1[208],lb1[209],
lb1[210],lb1[211],lb1[212],lb1[213],lb1[214],lb1[215],lb1[216],lb1[217],lb1[218],lb1[219],
lb1[220],lb1[221],lb1[222],lb1[223],lb1[224],lb1[225],lb1[226],lb1[227],lb1[228],lb1[229],
lb1[230],lb1[231],lb1[232],lb1[233],lb1[234],lb1[235],lb1[236],lb1[237],lb1[238],lb1[239],
lb1[240],lb1[241],lb1[242],lb1[243],lb1[244],lb1[245],lb1[246],lb1[247],lb1[248],lb1[249],
lb1[250],lb1[251],lb1[252],lb1[253],lb1[254],lb1[255],lb1[256],lb1[257]};



//用于for循环
integer a0,a1;
integer b0,b1;
always @(posedge clock or negedge rst)begin
   if(!rst)begin
   for(a0=0;a0<258;a0=a0+1)
       lb0[a0]<=8'd0;
   for(a1=0;a1<258;a1=a1+1)
       lb1[a1]<=8'd0;
   end
   else if(clken)begin

       lb1[0]<=linebuffer1;	
       for(b1=0;b1<257;b1=b1+1)
       lb1[b1+1]<=lb1[b1];
   
       lb0[0]<=linebuffer0;	
       for(b0=0;b0<257;b0=b0+1)
       lb0[b0+1]<=lb0[b0];
   //////////////////////////////
   end
   else begin
       for(a0=0;a0<258;a0=a0+1)
           lb0[a0]<=lb0[a0];
       for(a1=0;a1<258;a1=a1+1)
           lb1[a1]<=lb1[a1];
         end
end 
endmodule 
