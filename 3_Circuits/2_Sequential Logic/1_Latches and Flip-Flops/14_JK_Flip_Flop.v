module top_module (
    input clk,
    input j,
    input k,
    output Q); 

    always@(posedge clk) begin
        case({j,k})
            'b00: Q <= Q;
            'b01: Q <= 0;
            'b10: Q <= 1;
            'b11: Q <= ~Q;
       endcase
    end
    
endmodule
