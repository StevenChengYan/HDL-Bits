module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    //method 1
    assign motor = vibrate_mode & ring;
    assign ringer = (~vibrate_mode) & ring;
    
    //method 2
    /*
    assign motor = vibrate_mode ? ring : 0;
    assign ringer = vibrate_mode ? 0 : ring;
    */
    
    //method 3
    /*
    always@(vibrate_mode, ring) begin
        if(vibrate_mode) begin
            motor = ring;
            ringer = 0;
        end
    	else begin
            ringer = ring;
            motor = 0;
        end
    end
    */
endmodule
