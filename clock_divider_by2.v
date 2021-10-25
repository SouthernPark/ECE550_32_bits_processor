module clock_divider_by2 (clk ,rst, out_clk);
	output reg out_clk;
	input clk ;
	input rst;
	always @(posedge clk)
	begin
	
	//if rest is 1, divider clock will set to 0
	if (rst)
		out_clk <= 1'b0;
	else
	//else if reset is 0, all divider clock
		out_clk <= ~out_clk;	
	
	end
endmodule