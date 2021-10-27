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


| command | BR  | JR | ALUinB | ALUOp(5bits) | DMwe | Rwe | Rdst | Rwd |  
|  ------ | --- | -- | ------ | ------------ | ---- | --- | ---- | --- |
|  R-type |  0  |  0 |   0    |     xxxxx    |  0   |  1  |   1  |  0  |
|   addi  |  0  |  0 |   1    |     00000    |  0   |  1  |   0  |  0  |
|   sw    |  0  |  0 |   1    |     00000    |  1   |  0  |   x  |  x  |
|   lw    |  0  |  0 |   1    |     00000    |  0   |  1  |   0  |  1  |

 
 
Secondly, I initialzed my alu.  

## Data Paths  
Step1 : Fetch the instruction which is q_imem   
Step2 : Set the reg file's signal (Rwe)  + set ctrl_readRegA, ctrl_readRegA, ctrl_write_Reg  
Step3 : Set ALU's signal (ALUinB)  +  set data_operandA, signed_immediate, data_operandB + check for different types of overflow    
Step4 : set data memo's signal (wren) + set address_dmem  +  data  +  data_writeReg  
Step5 : Update program counter (add by 1)  

