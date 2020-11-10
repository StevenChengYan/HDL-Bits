module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [2:0] co_wire;
    
    //Normal method
    bcd_fadd f0(a[3:0],   b[3:0],   cin,        co_wire[0], sum[3:0]);
    bcd_fadd f1(a[7:4],   b[7:4],   co_wire[0], co_wire[1], sum[7:4]);
    bcd_fadd f2(a[11:8],  b[11:8],  co_wire[1], co_wire[2], sum[11:8]);
    bcd_fadd f3(a[15:12], b[15:12], co_wire[2], cout,       sum[15:12]);
    
    //vector method
    /*
    bcd_fadd f[3:0] ({a[15:12],a[11:8],a[7:4],a[3:0]},
                     {b[15:12],b[11:8],b[7:4],b[3:0]},
                     {co_wire[2:0],cin},
                     {cout, co_wire[2:0]},
                     {sum[15:12],sum[11:8],sum[7:4],sum[3:0]}
                    );
	*/
endmodule
