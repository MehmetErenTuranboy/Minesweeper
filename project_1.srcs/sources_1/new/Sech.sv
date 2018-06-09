`timescale 1ns / 1ps
module Sech(input logic clk,reset,ok,
            output out
    );
    
    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6,S7} stateType;
    stateType [1:0] state,nextState;  
                            
    //register
    always_ff@(posedge clk,posedge reset)//no resetable ff
        state <=(reset)?S0: nextState;
        
    //next state logic
    always_comb   
        case(state)
            S0: nextState = (ok)?S1:S0;
            S1: nextState = (ok)?S2:S0;
            S2: nextState = (ok)?S3:S0;
            S3: nextState = (ok)?S4:S0;
            S4: nextState = (ok)?S5:S0;
            S5: nextState = (ok)?S6:S0;
            S6: nextState = (ok)?S7:S0;
            S7: nextState = (ok)?S7:S0;
            
            default: nextState = S0;  
        endcase  
        
    //output logic
    assign out = (state == S6);
                        
endmodule