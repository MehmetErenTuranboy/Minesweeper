`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2017 21:41:46
// Design Name: 
// Module Name: Transition2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Transition2(input logic clk,reset,ok,
                  output logic shot

    );
     typedef enum logic[1:0]{s0,s1}statetype;
            statetype [2:0]state, nextstate; 
            
     always_ff@(posedge clk, posedge reset)
                            if(reset) state <= s0;
                            else 
                               state <= nextstate; 
            
     always_comb
        case(state)
            s0: nextstate = (ok)?s1:s0;
            s1: nextstate = (ok)?s1:s0;
                                           
            
        endcase 
        
         
        assign shot = (state == s1);    
endmodule

