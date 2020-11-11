module top_module (
    input clk,
    input x,
    output z
); 
    wire d1, d2, d3;
    reg q1=0, q2=0, q3=0; //you must use reg in sequential logic
    
    assign d1 = q1 ^ x;
    assign d2 = ~q2 & x;
    assign d3 = ~q3 | x;
    
    DFF dff1(clk, d1, q1);
    DFF dff2(clk, d2, q2);
    DFF dff3(clk, d3, q3);

    assign z = ~(q1 | q2 | q3);

endmodule

module DFF(input clk, input d, output reg q);
    always@(posedge clk) begin
       q <= d;
    end
endmodule
