module decoder(
	input 	logic [1:0]		Operation,
	input 	logic [5:0] 	Function,
	input 	logic [3:0] 	Rd,
	output 	logic [1:0]	 	FlagW,
	output 	logic 		 	PCS,
	output 	logic 		 	RegW,
	output 	logic 		 	MemW,
	output 	logic 			MemToReg,
	output 	logic 			ALUSource,
	output 	logic [1:0]		ImmediateSource,
	output 	logic [1:0]		RegSource,
	output 	logic [1:0]		ALUControl
	);
	
	logic [9:0] controls;
	logic branch;
	logic ALUOp;
	
	always_comb 
	
		case(Operation)
			2'b00: if(Function[5]) begin
				// Data-processing immediate
				controls = 10'b0000101001;
				end else begin 
					// Data-processing register
					controls = 10'b0000001001;
				end
			2'b01: if(Function[0]) begin
				// LDR
				controls = 10'b0001111000;
				end else begin 
					// STR
					controls = 10'b1001110100;
				end
					//B
			2'b10: controls = 10'b0110100010;
			default: controls = 10'bx;	
		endcase
		
	assign {RegSource, ImmediateSource, ALUSource, MemToReg, RegW, MemW, branch, ALUOp } = controls;
		
	always_comb 
		if(ALUOp) begin
			case(Function[4:1])
				4'b0100: ALUControl = 2'b00; //ADD
				4'b0010: ALUControl = 2'b01; //SUB
				4'b0000: ALUControl = 2'b10; //AND
				4'b1100: ALUControl = 2'b11; //OR
				default: ALUControl = 2'bx;
			endcase
			
			FlagW[1] = Function[0];
			FlagW[0] = Function[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
			
		end else begin
			ALUControl = 2'b00;
			FlagW = 2'b00;
		end
	
	assign PCS = ((Rd == 4'b1111) & RegW) | branch;	

endmodule