module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;
	/*
    //State logic
    always @(*) begin
        // State transition logic
        state = next_state;
    end

    //State register
    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) next_state <= OFF;
        else begin
            case (state)
                OFF: if(j==1) next_state <= ON;
                else if(j==0) next_state <= OFF;
                ON:  if(k==1) next_state <= OFF;
                else if(k == 0) next_state <= ON;
                default: next_state <= OFF;
            endcase
        end
    end
	*/
    
    //state logic + register
    always @(posedge clk, posedge areset) begin
        if(areset) state <= OFF;
        else begin
            case(state) 
                OFF: state <= (j==1)? ON:OFF;
                ON:  state <= (k==0)? ON:OFF;
                default: state <= OFF;
            endcase
        end
    end
   
    // Output logic
    assign out = (state == OFF) ? 0 : 1;

endmodule
