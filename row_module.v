module row_module #(parameter num_of_PE=16,data_width=8,result_width=16) (

input [data_width*num_of_PE-1:0] in_up_tot,
input [data_width-1:0] in_left_tot,

input clk,rst,

output   [data_width*num_of_PE-1:0] out_down_TT,
output   [result_width*num_of_PE-1:0] result_TT
);
 


wire [data_width*num_of_PE-1:0] out_right_TT;
 
 
 weight_block  PE_new (.in_up (in_up_tot[data_width-1:0]),
	.in_left (in_left_tot),.out_right(out_right_TT[data_width-1:0]),.out_down(out_down_TT[data_width-1:0]));
 
genvar i;



generate
for (i=1;i<num_of_PE;i=i+1)
begin : generate_block_identifier 
	weight_block  PE_new (.in_up (in_up_tot[(i+1)*data_width-1:data_width*i]),
	.in_left (out_right_TT[((i-1)+1)*data_width-1:data_width*(i-1)]),.out_right(out_right_TT[(i+1)*data_width-1:data_width*i]),.out_down(out_down_TT[(i+1)*data_width-1:data_width*i]));
end
	
	


	



endgenerate

endmodule