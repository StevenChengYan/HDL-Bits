module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    reg [3:0] one, ten, hundred, thousand;

    assign ena = {(hundred==4'd9 && ten==4'd9 && one==4'd9) ,(ten == 4'd9 && one==4'd9), one==4'd9};
        
    decade_counter d_count0 (clk, reset, 1'b1 ,one);
    decade_counter d_count1 (clk, reset, ena[1] ,ten);
    decade_counter d_count2 (clk, reset, ena[2] ,hundred);
    decade_counter d_count3 (clk, reset, ena[3] ,thousand);
    
    assign q = {thousand, hundred, ten, one};
endmodule

  
module decade_counter (
    input clk,
    input reset,
    input enable,
    output reg[3:0] q);

    always@(posedge clk) begin
        if(reset) 
            q <= 0;
        else if(enable) begin
            if(q >= 9)
                q <= 0;
            else
                q <= q+1;
        end
    end
endmodule
