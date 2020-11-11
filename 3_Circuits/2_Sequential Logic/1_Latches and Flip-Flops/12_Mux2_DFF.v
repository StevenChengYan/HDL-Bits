module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
   wire w1, w_din;
        
   always@(*) begin
        case(E)
            0: w1 = Q;
            1: w1 = w;
        endcase
        case(L)
            0: w_din = w1;
            1: w_din = R;
        endcase
    end
    
    always@(posedge clk) begin
        Q <= w_din;
    end
    
endmodule
