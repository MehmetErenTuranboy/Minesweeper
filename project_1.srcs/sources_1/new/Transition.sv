`timescale 1ns / 1ps
module Transition(input logic clk,reset,ok,
                  output logic keep,shot

    );
     typedef enum logic[1:0]{s0,s1,s2}statetype;
            statetype [2:0]state, nextstate; 
            
     always_ff@(posedge clk, posedge reset)
                            if(reset) state <= s0;
                            else 
                               state <= nextstate; 
            
     always_comb
        case(state)
            s0: nextstate = (ok)?s1:s0;
            s1: nextstate = (ok)?s2:s1;
            s2: nextstate = (ok)?s2:s2;
        endcase 
        
        assign keep = (state==s1|| state==s2); 
        assign shot = (state == s2);    
endmodule