// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output reg out;

    // Fill in state name declarations
    parameter A = 1'b0;
    parameter B = 1'b1;

    reg present_state, next_state;
    
	/*
    //next state logic
    always @(*) begin
        case (present_state)
            // Fill in state transition logic
            B: if(in==0) next_state = A;
               else      next_state = B;
            A: if(in==0) next_state = B;
               else      next_state = A;
            default:     next_state = A;
        endcase       
    end
    
    //state register
    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
        end 
        else begin
            // State flip-flops
            present_state <= next_state;   
        end
    end
	*/ 
    
    //next state logic + state register
    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
        end 
        else begin
            // State flip-flops;
            case (present_state)
                // Fill in state transition logic
                B: if(in==0) present_state <= A;
                   else      present_state <= B;
                A: if(in==0) present_state <= B;
                   else      present_state <= A;
                default:     present_state <= A;
        	endcase 
        end
    end
    
    //out logic
    always @(*) begin
        case (present_state)
            // Fill in output logic
            B: out = 1;
            A: out = 0;
            default: out = 0;
        endcase
    end
        
endmodule

