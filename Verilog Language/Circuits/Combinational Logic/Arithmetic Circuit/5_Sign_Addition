module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire [7 : 0] cout;
    

    fadd f0(a[0], b[0], 0      , cout[0], s[0]);
    //Vector method => Instantiate
    fadd f[7:1] (a[7:1], b[7:1], cout[6:0], cout[7:1], s[7:1]);
    
    //Generate for loop method => Instantiate
    /*
    genvar i;
    generate 
        for(i=1; i<8; i++) begin:block1
            fadd f(a[i], b[i], cout[i-1], cout[i], s[i]);
        end
    endgenerate
    */
    
    //Tired method => Instantiate
    /*
    fadd f1(a[1], b[1], cout[0], cout[1], s[1]);
    fadd f2(a[2], b[2], cout[1], cout[2], s[2]);
    fadd f3(a[3], b[3], cout[2], cout[3], s[3]);
    fadd f4(a[4], b[4], cout[3], cout[4], s[4]);
    fadd f5(a[5], b[5], cout[4], cout[5], s[5]);
    fadd f6(a[6], b[6], cout[5], cout[6], s[6]);
    fadd f7(a[7], b[7], cout[6], cout[7], s[7]);
	*/
    
    assign overflow = cout[7] ^ cout[6];
    
endmodule

module fadd(
	input a, b,
    input cin,
    output cout,
    output sum
);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
