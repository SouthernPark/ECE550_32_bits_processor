// You need to generate this component correctly
module dmem(address, clock, data, wren, q);
	//specify the 
	input [11:0] address;
	//the length of write data is 32 bits
	input [31:0] data;
	//written enabled (1-> write, 0->not write)
	input wren, clock;
	//32 bits data fetched form the address
	output [31:0] q;
	
	//create the ram 2^13-1 = 8191 (1111 1111 1111)
	reg [31:0] ram [8191:0];
	//register to store the address
	reg [11:0] addr_reg;
	always @ (posedge clock)
	begin
		//if write enabled
		if(wren)
			//assign the ram with data at address
			ram[address] <= data;
		else
			//set the data into register to hold address for read
			addr_reg <= address;
	end
	
	assign q = ram[addr_reg];
	
	
endmodule