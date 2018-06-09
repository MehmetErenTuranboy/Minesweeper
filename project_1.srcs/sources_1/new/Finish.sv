`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2017 23:39:32
// Design Name: 
// Module Name: Finish
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


module Finish(input logic clk,reset,ok,
             input logic [7:0][23:0]inp,
             output logic [7:0][23:0]out
    );
    
    typedef enum logic [1:0] {S0, S1, S2, S3} stateType;
    stateType [1:0] state,nextstate;
     
    logic[7:0][23:0] o0, o1, o2, o3;
    
    //register
    always_ff@(posedge clk,posedge reset)
        state <=(reset)?S0: nextstate;
         
                  
    always_comb
    case(state)
          S0:if((inp[7:0] != 24'd0 && ok==1))begin
              o0[7:0] = inp[7:0];
              out[7:0]= out[7:0] | o0[7:0];
              nextstate=S1;
              end
              else begin
                 nextstate = S0;
              end
          S1:if(ok==1 && inp[7:0] != 24'd0)begin
              o1[7:0] = inp[7:0];
              out[7:0]= out[7:0] | o1[7:0];
              nextstate = S0;
              end
              else begin
                    nextstate = S1;
              end
           /*
           S2: begin
                out[0] = 24'b11111111_00000000_00000000;
                out[1] = 24'b11111111_00000000_00000000;
                out[2] = 24'b11111111_00000000_00000000;
                out[3] = 24'b11111111_00000000_00000000;
                out[4] = 24'b11111111_00000000_00000000;
                out[5] = 24'b11111111_00000000_00000000;
                out[6] = 24'b11111111_00000000_00000000;
                out[7] = 24'b11111111_00000000_00000000;
                nextstate = S2;
                end
          */
        default: nextstate = S0;  
    endcase  
                
    //output logic
    //assign finish = (state == S1);
                                         
endmodule