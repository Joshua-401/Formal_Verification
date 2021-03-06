// -------------------------------------------------------
// Copyright (c) 2018 Cadence Design Systems, Inc.
//
// All rights reserved.
//
// Cadence Design Systems Proprietary and Confidential.
// ------------------------------------------------------

module coin_counter (
        empty, clk, reset, dimes, dime_out, load, 
        nickels, nickel_out, two_dime_out
    );

    output empty;
    input clk;
    input reset;
    input [7:0] nickels, dimes;
    input dime_out;
    input nickel_out;
    input two_dime_out;
    input load;

    reg [7:0] nickel_count, dime_count;

    wire empty = !nickel_count || !dime_count;

    always @(posedge clk)
    begin
        if (reset) 
        begin : reset_block
            nickel_count <= 0; 
            dime_count <= 0;
        end
        else if ( load == 1)
        begin : load_block
            nickel_count <= nickels; 
            dime_count <= dimes;
        end
        else if ( nickel_out == 1 && dime_out == 0 && two_dime_out == 0)
        begin : one_nickel_block
            if (nickel_count != 0)
                nickel_count <= sub1(nickel_count);
        end

        else if ( nickel_out == 0 && dime_out == 1 && two_dime_out == 0)
        begin : one_dime_block
            if (dime_count != 0)
                dime_count <= sub1(dime_count);
            else
                if (nickel_count != 0)
                    nickel_count <= sub2(nickel_count);
        end
        else if ( nickel_out == 0 && dime_out == 0 && two_dime_out == 1)
        begin : two_dime_block
            if (dime_count != 0)
                dime_count <= sub2(dime_count);
            else
                if (nickel_count != 0)
                    nickel_count <= sub4(nickel_count);
        end
    end 
    function [7:0] sub1;
        input [7:0] a;
        sub1 = a - 8'h1;
    endfunction
			
    function [7:0] sub2;
        input [7:0] a;
        sub2 = a - 8'h2;
    endfunction

    function [7:0] sub4;
        input [7:0] a;
        sub4 = a - 8'h4;
    endfunction

endmodule
