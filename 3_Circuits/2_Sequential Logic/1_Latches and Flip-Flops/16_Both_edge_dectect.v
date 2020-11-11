module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] in_delay;
    wire [7:0] in_inv;
    
    assign in_inv = ~in;
    
    always@(posedge clk) begin
        in_delay <= in;
        anyedge <=(~in_delay & in) | (in_delay & in_inv);
    end
    
endmodule
