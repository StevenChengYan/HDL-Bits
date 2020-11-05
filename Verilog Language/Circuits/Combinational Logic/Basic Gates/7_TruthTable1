module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    //sum of product
    //assign f = (x1 & x3) | (x2 & (~x3));
    
    //product of sum
    //assign f = (x2 | x3) & (x1 | (~x3));
    
    //only use nand
    wire w1, w2;
    nand n1(w1, x1, x3);
    nand n2(w2, x2, ~x3);
    nand n3(f, w1, w2);
    
endmodule
