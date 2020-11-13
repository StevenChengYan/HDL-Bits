module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    reg[3:0] state, state_next;
    
    parameter A=0, B=1, C=2, D=3;
    
    // State logic + State register
    always @(posedge clk) begin
        if(reset) state <= A;
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
    

endmodule
