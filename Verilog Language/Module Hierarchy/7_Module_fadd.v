module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire cout;

    //add1 (a[0],b[0],cout[0],sum[0],cout[0]);
    //add1 (a[1],b[1],cout[1],sum[1],cout[1]);
    //add1 (a[2],b[2],cout[2],sum[2],cout[2]); 
	
    add16(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum[15:0]), .cout(cout));
    add16(.a(a[31:16]), .b(b[31:16]), .cin(cout), .sum(sum[31:16]), .cout(0));
    
endmodule

//module add16( input a[15:0], input b[15:0], input cin, output sum output cout);
//endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    always@(a or b or cin)
    begin
    	sum = a ^ b ^ cin;
    	cout =  a&b | a&cin | b&cin;
    end
endmodule
