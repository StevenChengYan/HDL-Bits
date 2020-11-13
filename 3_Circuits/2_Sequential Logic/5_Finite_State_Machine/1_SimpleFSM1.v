module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=0, B=1; 
    reg state, next_state;

    //Next state logic
    always @(*) begin    // This is a combinational always block
        // State transition logic
        case (state)
            B: if(in==0) next_state <= A;
               else      next_state <= B;
            A: if(in==0) next_state <= B;
               else      next_state <= A;
            default:     next_state <= A;
        endcase
    end

    //State register
    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if(areset) state <= B;
		else state <= next_state;
    end

    // Output logic
    assign out = (state == B) ? 1:0;

endmodule
