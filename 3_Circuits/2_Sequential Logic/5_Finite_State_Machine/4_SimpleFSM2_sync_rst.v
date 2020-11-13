module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state;

	//state logic + state register
    always @(posedge clk) begin
        // State flip-flops with synchronous reset
        if(reset) state <= OFF;
        else begin
            case(state) 
                OFF: state <= (j==1)? ON:OFF;
                ON:  state <= (k==0)? ON:OFF;
                default: state <= OFF;
            endcase
        end
    end

    // Output logic
    assign out = (state == ON) ? 1:0;

endmodule
