# ECE550_32_bits_processor
Qiangqiang Liu (ql143)  
ZeLin Jin (zj65)  

# clock
clock 50Hz  
imem_clock = clock  
dmem_clock = clock  
regfile_clock = ~clk_div4  
processor_clock = ~clk_div4  


# processor

## Control bits and ALU
Firstly, I hardcoded the control bits using ROM (multiple regs), the format of my control bits is below:  

>BR JR ALUinB ALUop(4bits) DMwe Rwe Rdst Rwd  
 0  0    0      xxxxx       0   1   1    0      (control bits for R type: add, sub, and, or, sll, sra)  
 0  0    1      00000       0   1   0    0      (control bits for addi)  
 0  0    1      00000       1   0   x    x      (control bits for sw)  
 0  0    1      00000       0   1   0    1      (control bits for lw)  
 
 
Secondly, I initialzed my alu.  

## Data Paths  
Step1 : Fetch the instruction which is q_imem   
Step2 : Set the reg file's signal (Rwe)  + set ctrl_readRegA, ctrl_readRegA, ctrl_write_Reg  
Step3 : Set ALU's signal (ALUinB)  +  set data_operandA, signed_immediate, data_operandB + check for different types of overflow    
Step4 : set data memo's signal (wren) + set address_dmem  +  data  +  data_writeReg  
Step5 : Update program counter  

