module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg[31:0] in_delay;
    always@(posedge clk) begin
        in_delay <= in;
        
        if(reset)
            out <= 0;
        else if(in_delay & ~in)
            out <= out | (in_delay & ~in);
        else
            out <= out;
    end

    
endmodule
