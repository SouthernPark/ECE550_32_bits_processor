//this module will help me create a register with 32 flip-flops-enabled
//data changes only when enable digit enabled and rising edge/falling edge.
//for reg file, we change the value of reg only when we want to write data from memo
module reg_32(Q, data, enable, clock, clear);
	input [31:0] data;
	input clock, clear, enable;
	output [31:0] Q;
	
	generate
   genvar i;
	for(i=0;i<32;i=i+1) begin: reg_
         dffe_ref dff(Q[i],data[i], clock, enable, clear);
   end
	endgenerate
	
endmodule