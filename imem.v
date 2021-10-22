// You need to generate this component correctly
module imem(address, clock, q);
	input [11:0] address;
	input clock;
	output [31:0] q;
	
	//create the ram for instruction memory
	//create the ram 2^13-1 = 8191 (1111 1111 1111)
	reg [31:0] ram [8191:0];
	initial
	begin
		ram[12'hFFF] = 12'hFFF;
	end
	//fetch the instruction only when the clock is positive
	reg [11:0] addre_reg;
	always @ (posedge clock)
	begin
		addre_reg <= address;
	end
	
	assign q = ram[addre_reg];
	
endmodule