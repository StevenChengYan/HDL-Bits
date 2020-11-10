module top_module( 
    input a, b, cin,
    output cout, sum );
    assign sum = (a^b)^cin; // sum bit
    assign cout = (a & b) | (b & cin) | (cin & a); //carry bit
endmodule
