module top_module(
    input clk,
    input in,
    input areset,
    output out); //

    reg[3:0] state, state_next;
    
    parameter A=0, B=1, C=2, D=3;
    /* 
    // method 1
    // State logic + State register
    always @(posedge clk, posedge areset) begin
        if(areset) state <= A;
        else begin
            case(state)            
                A: state <= (in==0)? A:B;
                B: state <= (in==0)? C:B;
                C: state <= (in==0)? A:D;
                D: state <= (in==0)? C:B;
                default: state <= A;
            endcase
        end
    end
    
    // Output logic
    assign out = (state==D)? 1:0;
    */
    
    
    // method 2 encoding: A=4'b0001, B=4'b0010, C=4'b0100, D=4'b1000
    // state logic
    always @(*) begin
        state_next[A] = (state[A] & ~in) | (state[C] & ~in);
        state_next[B] = (state[A] & in) | (state[B] & in) | (state[D] & in);
        state_next[C] = (state[B] & ~in) | (state[D] & ~in);
        state_next[D] = state[C] & in;
    end
    
    // One-hot-state
    always @(posedge clk, posedge areset) begin 
        if(areset) state <= 4'b0001;
        else state <= state_next;  
    end

    // Output logic
    assign out = state[D];
    
endmodule
