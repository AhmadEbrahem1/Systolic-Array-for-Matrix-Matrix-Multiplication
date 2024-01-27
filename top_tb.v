module top_tb;
reg [7:0] in_up1,in_up2,in_up3,in_up4; 
reg [7:0] in_left1,in_left2,in_left3,in_left4;
reg clk,rst;
wire done;


top dut (in_up1,in_up2,in_up3,in_up4, 
in_left1,in_left2,in_left3,in_left4, 
clk,rst,done);


initial 
begin
rst <= 0;
clk <= 0;
#3
rst <= 1;
end

initial 
begin
	repeat(21)
	#5 clk <= ~clk;
end


initial
begin
#3 in_left1<='d0;
in_up1<='d0;
#2 in_left1<='d10;
in_up1<='d3;
#10 in_left1<='d9;
in_up1<='d9;
#10 in_left1<='d7;
in_up1<='d12;
#10 in_left1<='d5;
in_up1<='d3;

end

initial
begin
#3 in_left2<='d0;
in_up2<='d0;
#2 in_left2<='d0;
in_up2<='d0;
#10 in_left2<='d8;
in_up2<='d12;
#10 in_left2<='d3;
in_up2<='d10;
#10 in_left2<='d3;
in_up2<='d1;
#10 in_left2<='d2;
in_up2<='d10;
end

initial
begin
#3 in_left3<='d0;
in_up3<='d0;
#2 in_left3<='d0;
in_up3<='d0;
#10 in_left3<='d0;
in_up3<='d0;
#10 in_left3<='d3;
in_up3<='d4;
#10 in_left3<='d2;
in_up3<='d12;
#10 in_left3<='d10;
in_up3<='d4;
#10 in_left3<='d8;
in_up3<='d12;
end

initial
begin
#3 in_left4<='d0;
in_up4<='d0;
#2 in_left4<='d0;
in_up4<='d0;
#10 in_left4<='d0;
in_up4<='d0;
#10 in_left4<='d0;
in_up4<='d0;
#10 in_left4<='d8;
in_up4<='d10;
#10 in_left4<='d4;
in_up4<='d2;
#10 in_left4<='d3;
in_up4<='d9;
#10 in_left4<='d3;
in_up4<='d18;
end







endmodule