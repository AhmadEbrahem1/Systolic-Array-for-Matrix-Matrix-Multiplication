module array_module #(parameter num_of_columns=16,data_width=8,result_width=16,num_of_PE=16) (
input [data_width*num_of_columns-1:0] in_up_tot,
input [data_width*num_of_columns-1:0] in_left_tot,


input clk,rst,
output wire [num_of_columns*data_width*num_of_PE-1:0] out_down_TT_2

);


/*
row_module  PE_col (
	.in_up_tot(in_up_tot),
	.in_left_tot(in_left_tot[data_width-1:0]),
	.clk(clk),
	.rst(rst),
	.out_down_TT(out_down_TT_2[data_width*num_of_PE-1:0]),
	
	);
*/

genvar i;
generate
for (i=1;i<num_of_columns;i=i+1)

begin : generate_block_identifier 
	row_module  PE_col (
	.in_up_tot(out_down_TT_2[(i+1)*data_width*num_of_PE-1:data_width*num_of_PE*(i)]),
	.in_left_tot(in_left_tot[(i+1)*data_width-1:data_width*i]),
	.clk(clk),
	.rst(rst),
	//.out_down_TT(out_down_TT_2[((i-1)+1)*data_width-1:data_width*i]),

	);
	
	
end
	
	


	



endgenerate





endmodule