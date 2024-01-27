module weight_block #(parameter data_width =8,num_of_PE=4,result_width = 16)(
input [data_width-1:0] in_up,
input [data_width-1:0] in_left,
input clk,rst,
output reg [data_width*num_of_PE-1:0] out_right,out_down,
output reg [result_width*num_of_PE-1:0] result);



wire [result_width-1:0] mult;


always@(posedge clk or negedge rst)
begin

	if(!rst)
	begin
	out_right<={data_width{1'b0}};
	out_down<={data_width{1'b0}};
	end
	else
	begin
	result<=result+mult;
	out_right<=in_left;
	out_down<=in_up;
	end



end




assign mult=in_up*in_left;
endmodule





