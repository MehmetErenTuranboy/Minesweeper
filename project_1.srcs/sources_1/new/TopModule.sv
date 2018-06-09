`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: GÖKTUÐ ÖZDOÐAN, MEHMET EREN TURANBOY
// 
// Create Date: 03.05.2017 20:34:50
// Design Name: MineSweeper
// Module Name: TopModule
// Project Name:MineSweeper
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


module TopModule(input logic clk,clk_key, reset,up,down,right, left, ok,data_key,
                 input logic [1:0] level,       
                 output logic [7:0]rowsOut, 
                 output logic shcp, stcp, mr, oe, ds,
                 output a, b, c, d, e, f, g, dp,
                  output [3:0] an
    );
    //Array 
    logic [7:0][23:0]inp1;
    logic [7:0][23:0]inp2;
    logic [7:0][23:0]inp3;
    logic [7:0][23:0]comp;
    logic [7:0][23:0]result;
    logic [7:0][23:0]target;
    logic [7:0][23:0]target2;
    logic [7:0][23:0]empty;
    logic [7:0]dumy;
    logic [3:0] keys = {up,down,right, left};
    logic [3:0] keysOut;
    logic keep,shot,okOut,finish,start,control,okNew,keyUp;
    //int endGame;
    //assign endGame = 0;
    //reg theEnd;
    //assign theEnd = 0;
    //logic up2;
    //logic [3:0]in0, in1, in2, in3;
    //logic startGame;
    //logic [2:0]keyOuts;

    Transition2 tr(clk,reset,okOut,okNew); 
    Sech sech(clk,reset,ok,okOut);
    Transition cont(clk,reset,okOut,keep,shot);
    SelectShip se(clk,!keep,reset,up,down,right,left, level,inp1);
    KeyBoard key( clk_key,data_key, keyUp);
    Shooter s(clk,keep,start,up,down,left,right,ok,inp2);
    
    
    // RED     
    compare c0[7:0]({inp2[0][23:16]},{inp1[0][23:16]},{comp[0][23:16]});
    compare c1[7:0]({inp2[1][23:16]},{inp1[1][23:16]},{comp[1][23:16]});
    compare c2[7:0]({inp2[2][23:16]},{inp1[2][23:16]},{comp[2][23:16]});    
    compare c3[7:0]({inp2[3][23:16]},{inp1[3][23:16]},{comp[3][23:16]});                                                                                
    compare c4[7:0]({inp2[4][23:16]},{inp1[4][23:16]},{comp[4][23:16]});
    compare c5[7:0]({inp2[5][23:16]},{inp1[5][23:16]},{comp[5][23:16]});
    compare c6[7:0]({inp2[6][23:16]},{inp1[6][23:16]},{comp[6][23:16]});
    compare c7[7:0]({inp2[7][23:16]},{inp1[7][23:16]},{comp[7][23:16]});
    
    // GREEN
    compare c8[7:0] ({inp2[0][23:16]},{inp1[0][15:8]},{comp[0][15:8]});
    compare c9[7:0] ({inp2[1][23:16]},{inp1[1][15:8]},{comp[1][15:8]});
    compare c10[7:0]({inp2[2][23:16]},{inp1[2][15:8]},{comp[2][15:8]});    
    compare c11[7:0]({inp2[3][23:16]},{inp1[3][15:8]},{comp[3][15:8]});                                                                                
    compare c12[7:0]({inp2[4][23:16]},{inp1[4][15:8]},{comp[4][15:8]});
    compare c13[7:0]({inp2[5][23:16]},{inp1[5][15:8]},{comp[5][15:8]});
    compare c14[7:0]({inp2[6][23:16]},{inp1[6][15:8]},{comp[6][15:8]});
    compare c15[7:0]({inp2[7][23:16]},{inp1[7][15:8]},{comp[7][15:8]});
    
    // BLUE
    compare c16[7:0]({inp2[0][23:16]},{inp1[0][7:0]},{comp[0][7:0]});
    compare c17[7:0]({inp2[1][23:16]},{inp1[1][7:0]},{comp[1][7:0]});
    compare c18[7:0]({inp2[2][23:16]},{inp1[2][7:0]},{comp[2][7:0]});    
    compare c19[7:0]({inp2[3][23:16]},{inp1[3][7:0]},{comp[3][7:0]});                                                                                
    compare c20[7:0]({inp2[4][23:16]},{inp1[4][7:0]},{comp[4][7:0]});
    compare c21[7:0]({inp2[5][23:16]},{inp1[5][7:0]},{comp[5][7:0]});
    compare c22[7:0]({inp2[6][23:16]},{inp1[6][7:0]},{comp[6][7:0]});
    compare c23[7:0]({inp2[7][23:16]},{inp1[7][7:0]},{comp[7][7:0]});
    
    sevenSegment ss( clk, reset, ok, a, b, c, d, e, f, g, dp, an);
    Finish ff(clk,start,okNew,comp,inp3);
    always_comb 
    begin
        if(keep==0 )
            result[7:0] = {inp1[7:0]};
        else
            result[7:0] = {inp2[7:0]} | {inp3[7:0]};
    end
    
    DotMatris led(clk, result, rowsOut,shcp, stcp, mr, oe, ds);
    
endmodule