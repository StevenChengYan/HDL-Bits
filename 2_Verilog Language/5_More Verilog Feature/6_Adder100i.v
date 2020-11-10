module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	
    integer i;

    fulladd f0(sum[0], cout[0], a[0], b[0], cin);
    fulladd f[99:1](sum[99:1], cout[99:1], a[99:1], b[99:1], cout[98:0]);

endmodule

module fulladd(s, c_out, ain, bin, c_in);
   output s, c_out;
   input ain, bin, c_in;
   assign s = (ain^bin)^c_in; // sum bit
   assign c_out = (ain & bin) | (bin & c_in) | (c_in & ain); //carry bit
endmodule
