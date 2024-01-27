module top(
input [7:0] in_up1,in_up2,in_up3,in_up4, 
input [7:0] in_left1,in_left2,in_left3,in_left4, 
input clk,rst,
output reg done);


wire [7:0] out_right1,out_right2,out_right3,out_right4,out_right5,out_right6,out_right7,out_right8;
wire [7:0] out_right9,out_right10,out_right11,out_right12,out_right13,out_right14,out_right15,out_right16; 

wire [7:0] out_down1,out_down2,out_down3,out_down4,out_down5,out_down6,out_down7,out_down8;
wire [7:0] out_down9,out_down10,out_down11,out_down12,out_down13,out_down14,out_down15,out_down16;

wire [15:0] result1,result2,result3,result4,result5,result6,result7,result8;
wire [15:0] result9,result10,result11,result12,result13,result14,result15,result16; 

reg [3:0] count;

weight_block x11 (in_up1,in_left1,clk,rst,out_right1,out_down1,result1);
weight_block x12 (in_up2,out_right1,clk,rst,out_right2,out_down2,result2);
weight_block x13 (in_up3,out_right2,clk,rst,out_right3,out_down3,result3);
weight_block x14 (in_up4,out_right3,clk,rst,out_right4,out_down4,result4);


weight_block x21 (out_down1,in_left2,clk,rst,out_right5,out_down5,result5);
weight_block x22 (out_down2,out_right5,clk,rst,out_right6,out_down6,result6);
weight_block x23 (out_down3,out_right6,clk,rst,out_right7,out_down7,result7);
weight_block x24 (out_down4,out_right7,clk,rst,out_right8,out_down8,result8);


weight_block x31 (out_down5,in_left3,clk,rst,out_right9,out_down9,result9);
weight_block x32 (out_down6,out_right9,clk,rst,out_right10,out_down10,result10);
weight_block x33 (out_down7,out_right10,clk,rst,out_right11,out_down11,result11);
weight_block x34 (out_down8,out_right11,clk,rst,out_right12,out_down12,result12);


weight_block x41 (out_down9,in_left4,clk,rst,out_right13,out_down13,result13);
weight_block x42 (out_down10,out_right13,clk,rst,out_right14,out_down14,result14);
weight_block x43 (out_down11,out_right14,clk,rst,out_right15,out_down15,result15);
weight_block x44 (out_down12,out_right15,clk,rst,out_right16,out_down16,result16);



always@(posedge clk or negedge rst)
begin

	if(!rst)
	begin
	done<=0;
	count<=0;
	end
	else
	if(count==9)
	begin
	done<=1;
	count<=0;
	
	end
	else
	begin
	count<=count+1;
	done<=0;
	end
end
endmodule