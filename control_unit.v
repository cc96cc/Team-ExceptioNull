module control_unit(
  instruction,
  op,
  alu_control,
  alu_zero,
  branch,
  alu_src,
  wren_reg,
  wren_data,
  datamem_toreg);

  input [7:0] instruction;
  input [3:0] op;
  
  wire [3:0] op;
  wire [7:0] instruction;
  
  output alu_zero;
  output [2:0] alu_control;
  output branch;
  output alu_src;
  output wren_reg;
  output wren_data;
  output datamem_toreg;
  
  wire [2:0] alu_control;
  reg alu_zero;
  reg branch;
  reg alu_src;
  reg wren_reg;
  reg wren_data;
  reg datamem_toreg;
  

  assign instruction [7:4] = op;
  always @(instruction) 
    begin
      
    if (op == 4'b0000) begin   //Move
      alu_control = 3'b011;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b0001) begin   //Add
      alu_control = 3'b011;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end else 
        
    if (op == 4'b0010) begin   //And
      alu_control = 3'b011;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b0011) begin//Not
      alu_control = 3'b011;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b0100) begin   //Nor
      alu_control = 3'b011;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
  	  end else 
        
    if (op == 4'b0101) begin   //Slt: Set Less Than 
      alu_control = 3'b101;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b0110) begin    //Sll: Shift Left Logical
      alu_control = 3'b110;
      branch = 0;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b0111) begin   //Srl: Shift Right Logical
      alu_control = 3'b111;
      branch = 0;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 1;
      end else 
    
    if (op == 4'b1000) begin   //J: Jump
      alu_control = 3'b000;
      branch = 1;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 0;
  	  end else 
        
    if (op == 4'b1001) begin    //Jal: Jump and link
      alu_control = 3'b001;
      branch = 1;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 0;
  	  end else
        
    if (op == 4'b1010) begin   //lw: load word
      alu_control = 3'b010;
      branch = 0;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 1;
      end else 
        
    if (op == 4'b1011) begin  //sw: store word
      alu_control = 3'b011;
      branch = 0;
      alu_src = 0;
      wren_reg = 1;
      wren_data = 1;
      datamem_toreg = 1;
      end else
        
    if (op == 4'b1100) begin   //beq: branch if equal
      alu_control = 3'b100;
      branch = 1;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 0;
      end else
        
    if (op == 4'b1101) begin   //bne: branch not equal
      alu_control = 3'b101;
      branch = 1;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 0;
      end else
        
    if (op == 4'b1110) begin  //addi: add immediate
      alu_control = 3'b110;
      branch = 0;
      alu_src = 1;
      wren_reg = 0;
      wren_data = 0;
      datamem_toreg = 0;
  	  end else 
        
    if (op == 4'b1111) begin //li: load immediate
      alu_control = 3'b111;
      branch = 0;
      alu_src = 1;
      wren_reg = 1;
      wren_data = 0;
      datamem_toreg = 1;
      end
    end   
    
endmodule


module test;
  
  wire [2:0] alu_control;
  reg alu_zero;
  reg branch;
  reg alu_src;
  reg wren_reg;
  reg wren_data;
  reg datamem_toreg;
  
  wire [3:0] op;
  reg [7:0] instruction;
  
  initial begin
    instruction = 8'b0;
    #1;
 	$monitor ("op=%b,instruction=%b,alu_control=%b",op,instruction,alu_control);
    #10 instruction = 8'b10;
  end
 
endmodule
