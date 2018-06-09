`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.05.2017 18:36:09
// Design Name: 
// Module Name: Shooter
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


module Shooter(input logic clk,clk_en,reset, up,down,left,right,ok,
                output logic [7:0][23:0]inp
   

    );
    
    
    typedef enum logic [6:0]{init,sR0,sR1,sR2,sR3,sR4,sR5,sR6,sR7,sR8,sR9,sR10,sR11,sR12,sR13,sR14,sR15,sR16,sR17,
                                  sR18,sR19,sR20,sR21,sR22,sR23,sR24,sR25,sR26,sR27,sR28,sR29,sR30,sR31,sR32,sR33,sR34,sR35,sR36,sR37,
                                  sR38,sR39,sR40,sR41,sR42,sR43,sR44,sR45,sR46,sR47,sR48,sR49,sR50,sR51,sR52,sR53,sR54,sR55,sR56,sR57,
                                  sR58,sR59,sR60,sR61,sR62,sR63} statetype;
    statetype [2:0]state, nextstate; 
    logic clockEnable3;
    localparam D = 100000000;
    logic [28:0] count = 0;
    logic clockEnable;
            
    always@ (posedge clk) 
    begin          
        count <= count + 1;
        if (count==D) //D: last value for counter
            count <= 0; //N: length of counter
        if (count==0)
            clockEnable <= 1'b1;
        else
            clockEnable <= 1'b0;
        if(up== 1'b1 || down== 1'b1 || right== 1'b1 || left== 1'b1 || ok == 1'b1)
            clockEnable <= 1'b1;
    end
    
    always_ff@(posedge clockEnable, posedge reset)
    begin
        if(reset == 1'b1 )
            state<=init;
        else if(clk_en==1) 
            state <= nextstate;  
    end
    
    always_comb
        case(state)
        init: nextstate = (ok)?sR0:init;
        sR0: if(up==1 && down==0 && right==0 && left==0) nextstate= sR1;
               else if(up==0 && down==0 && right==1 && left==0) nextstate=sR8;
               else if(up==0 && down==0 && right==0 && left==1) nextstate=sR40; 
                else if(ok==1) nextstate=sR0;         
               else nextstate= sR0;   
         sR1: if(up==1 && down==0 && right==0 && left==0) nextstate= sR2;
              else if(up==0 && down==1 && right==0 && left==0) nextstate=sR0;
              else if(up==0 && down==0 && right==0 && left==1) nextstate=sR43;
              else if(up==0 && down==0 && right==1 && left==0) nextstate=sR12;       
              else nextstate= sR1;         
         sR2: if(up==1 && down==0 && right==0 && left==0) nextstate= sR3;
              else if(up==0 && down==1 && right==0 && left==0) nextstate=sR1;
              else if(up==0 && down==0 && right==1 && left==0) nextstate=sR16;
              else if(up==0 && down==0 && right==0 && left==1) nextstate=sR46;          
              else nextstate= sR2;   
        sR3: if(up==1 && down==0 && right==0 && left==0) nextstate= sR4;
             else if(up==0 && down==1 && right==0 && left==0) nextstate=sR2;
             else if(up==0 && down==0 && right==1 && left==0) nextstate=sR20;
             else if(up==0 && down==0 && right==0 && left==1) nextstate=sR49;          
             else nextstate= sR3; 
        sR4: if(up==1 && down==0 && right==0 && left==0) nextstate= sR5;
             else if(up==0 && down==1 && right==0 && left==0) nextstate=sR3;
             else if(up==0 && down==0 && right==1 && left==0) nextstate=sR24;
             else if(up==0 && down==0 && right==0 && left==1) nextstate=sR52;          
             else nextstate= sR4;
       sR5: if(up==1 && down==0 && right==0 && left==0) nextstate= sR6;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR4;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR28;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR55;          
            else nextstate= sR5;
       sR6: if(up==1 && down==0 && right==0 && left==0) nextstate= sR7;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR4;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR32;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR58;          
            else nextstate= sR6;
      sR7: if(up==0 && down==1 && right==0 && left==0) nextstate= sR6;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR36;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR61;          
           else nextstate= sR7;         
      sR8: if(up==1 && down==0 && right==0 && left==0) nextstate= sR12;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR9;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR0;          
           else nextstate= sR8; 
      sR9: if(up==1 && down==0 && right==0 && left==0) nextstate= sR13;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR10;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR8;          
           else nextstate= sR9;     
      sR10: if(up==1 && down==0 && right==0 && left==0) nextstate= sR14;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR11;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR9;          
           else nextstate= sR10;  
           
      sR11: if(up==1 && down==0 && right==0 && left==0) nextstate= sR15;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR10;          
            else nextstate= sR11; 
      sR12: if(up==1 && down==0 && right==0 && left==0) nextstate= sR16;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR8;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR13;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR1;          
           else nextstate= sR12;                
      sR13: if(up==1 && down==0 && right==0 && left==0) nextstate= sR17;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR9;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR14;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR12;          
            else nextstate= sR13; 
      sR14: if(up==1 && down==0 && right==0 && left==0) nextstate= sR18;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR10;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR15;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR13;          
            else nextstate= sR14;
      sR15: if(up==1 && down==0 && right==0 && left==0) nextstate= sR19;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR11;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR14;          
            else nextstate= sR15;
      sR16: if(up==1 && down==0 && right==0 && left==0) nextstate= sR20;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR12;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR17;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR2;          
            else nextstate= sR16;
      sR17: if(up==1 && down==0 && right==0 && left==0) nextstate= sR21;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR13;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR18;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR16;          
            else nextstate= sR17;   
      sR18: if(up==1 && down==0 && right==0 && left==0) nextstate= sR22;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR14;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR19;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR17;          
            else nextstate= sR18;
        sR19: if(up==1 && down==0 && right==0 && left==0) nextstate= sR23;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR15;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR18;          
            else nextstate= sR19;
        sR20: if(up==1 && down==0 && right==0 && left==0) nextstate= sR24;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR16;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR21;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR3;          
            else nextstate= sR20;
       sR21: if(up==1 && down==0 && right==0 && left==0) nextstate= sR25;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR17;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR22;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR20;          
            else nextstate= sR21;   
       sR22: if(up==1 && down==0 && right==0 && left==0) nextstate= sR26;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR18;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR23;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR21;          
            else nextstate= sR22; 
       sR23: if(up==1 && down==0 && right==0 && left==0) nextstate= sR27;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR19;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR22;             
            else nextstate= sR23;
       sR24: if(up==1 && down==0 && right==0 && left==0) nextstate= sR28;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR20;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR25;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR4;          
            else nextstate= sR24;   
       sR25: if(up==1 && down==0 && right==0 && left==0) nextstate= sR29;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR21;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR26;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR24;          
            else nextstate= sR25; 
            
       sR26: if(up==1 && down==0 && right==0 && left==0) nextstate= sR30;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR22;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR27;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR25;          
            else nextstate= sR26; 
      sR27: if(up==1 && down==0 && right==0 && left==0) nextstate= sR31;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR23;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR26;          
            else nextstate= sR27;
      sR28: if(up==1 && down==0 && right==0 && left==0) nextstate= sR32;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR24;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR29;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR5;          
            else nextstate= sR28;   
      sR29: if(up==1 && down==0 && right==0 && left==0) nextstate= sR33;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR25;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR30;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR28;          
            else nextstate= sR29;
     sR30: if(up==1 && down==0 && right==0 && left==0) nextstate= sR34;
            else if(up==0 && down==1 && right==0 && left==0) nextstate=sR26;
            else if(up==0 && down==0 && right==1 && left==0) nextstate=sR31;
            else if(up==0 && down==0 && right==0 && left==1) nextstate=sR29;          
            else nextstate= sR30; 
     sR31: if(up==1 && down==0 && right==0 && left==0) nextstate= sR35;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR27;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR30;          
           else nextstate= sR31;
     sR32: if(up==1 && down==0 && right==0 && left==0) nextstate= sR36;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR28;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR33;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR6;          
           else nextstate= sR32;   
     sR33: if(up==1 && down==0 && right==0 && left==0) nextstate= sR37;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR29;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR34;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR32;          
           else nextstate= sR33;    
     sR34: if(up==1 && down==0 && right==0 && left==0) nextstate= sR38;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR30;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR35;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR33;          
           else nextstate= sR34; 
     sR35: if(up==1 && down==0 && right==0 && left==0) nextstate= sR39;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR31;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR34;          
           else nextstate= sR35;
     sR36: if(up==0 && down==1 && right==0 && left==0) nextstate= sR32;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR37;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR7;          
           else nextstate= sR36;   
     sR37: if(up==0 && down==1 && right==0 && left==0) nextstate= sR33;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR38;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR36;          
           else nextstate= sR37;
     sR38: if(up==0 && down==1 && right==0 && left==0) nextstate= sR34;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR39;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR37;          
           else nextstate= sR38;   
     sR39: if(up==0 && down==1 && right==0 && left==0) nextstate= sR35;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR38;          
           else nextstate= sR39;
     sR40: if(up==1 && down==0 && right==0 && left==0) nextstate= sR43;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR0;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR41;          
           else nextstate= sR40;
     sR41: if(up==1 && down==0 && right==0 && left==0) nextstate= sR44;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR40;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR42;          
           else nextstate= sR41;   
     sR42: if(up==1 && down==0 && right==0 && left==0) nextstate= sR45;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR41;     
           else nextstate= sR42;
     sR43: if(up==1 && down==0 && right==0 && left==0) nextstate=sR46;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR40;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR1;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR44;          
           else nextstate= sR43;   
           
     sR44: if(up==1 && down==0 && right==0 && left==0) nextstate= sR47;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR41;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR43;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR45;          
           else nextstate= sR44; 
     sR45: if(up==1 && down==0 && right==0 && left==0) nextstate= sR48;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR42;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR44;          
           else nextstate= sR45;
     sR46: if(up==1 && down==0 && right==0 && left==0) nextstate= sR49;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR43;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR2;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR47;          
           else nextstate= sR46;
     sR47: if(up==1 && down==0 && right==0 && left==0) nextstate= sR50;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR44;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR46;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR48;          
           else nextstate= sR47;
     sR48: if(up==1 && down==0 && right==0 && left==0) nextstate= sR51;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR45;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR47;          
           else nextstate= sR48;   
     sR49: if(up==1 && down==0 && right==0 && left==0) nextstate= sR52;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR46;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR3;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR50;          
           else nextstate= sR49;
     sR50: if(up==1 && down==0 && right==0 && left==0) nextstate= sR53;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR47;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR49;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR51;          
           else nextstate= sR50;
     sR51: if(up==1 && down==0 && right==0 && left==0) nextstate= sR54;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR48;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR50;                
           else nextstate= sR51;
     sR52: if(up==1 && down==0 && right==0 && left==0) nextstate= sR55;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR49;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR4;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR53;          
           else nextstate= sR52;   
     sR53: if(up==1 && down==0 && right==0 && left==0) nextstate= sR59;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR50;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR52;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR54;          
           else nextstate= sR53; 
     sR54: if(up==1 && down==0 && right==0 && left==0) nextstate= sR57;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR51;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR53;          
           else nextstate= sR54;
     sR55: if(up==1 && down==0 && right==0 && left==0) nextstate= sR58;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR52;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR5;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR56;          
           else nextstate= sR55;   
     sR56: if(up==1 && down==0 && right==0 && left==0) nextstate= sR59;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR53;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR55;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR57;          
           else nextstate= sR56;
     sR57: if(up==1 && down==0 && right==0 && left==0) nextstate= sR60;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR54;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR56;                
           else nextstate= sR57;
     sR58: if(up==1 && down==0 && right==0 && left==0) nextstate= sR61;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR55;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR6;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR59;          
           else nextstate= sR58;   
     sR59: if(up==1 && down==0 && right==0 && left==0) nextstate= sR62;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR56;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR58;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR60;          
           else nextstate= sR60; 
     sR60: if(up==1 && down==0 && right==0 && left==0) nextstate= sR63;
           else if(up==0 && down==1 && right==0 && left==0) nextstate=sR57;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR59;          
           else nextstate= sR60;
     sR61: if(up==0 && down==1 && right==0 && left==0) nextstate= sR58;      
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR7;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR62;          
           else nextstate= sR61;   
     sR62: if(up==0 && down==1 && right==0 && left==0) nextstate= sR59;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR61;
           else if(up==0 && down==0 && right==0 && left==1) nextstate=sR63;          
           else nextstate= sR62; 
     sR63: if(up==0 && down==1 && right==0 && left==0) nextstate= sR60;
           else if(up==0 && down==0 && right==1 && left==0) nextstate=sR62;
           else nextstate= sR63;          
               
            default: nextstate <=sR1;
        endcase

    always_comb
        if(state==init)
        begin
        inp[7:0]={8{1'd0}};
        end       
    
          else if( state==sR0)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000001_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR1)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000010_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR2)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000100_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR3)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00001000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR4)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00010000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR5)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00100000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR6)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b01000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR7)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b10000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR8)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000001_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR9)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000001_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR10)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000001_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR11)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000001_00000000_00000000;
                end                                                                                           
                else if( state==sR12)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000010_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR13)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000010_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR14)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000010_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR15)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000010_00000000_00000000;
                end                                                                                           
                else if( state==sR16)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000100_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                                                                                              
                else if( state==sR17)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000100_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR18)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000100_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR19)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000100_00000000_00000000;
                end                                                                                           
                else if( state==sR20)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00001000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR21)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00001000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end              
                else if( state==sR22)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00001000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end   
                else if( state==sR23)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00001000_00000000_00000000;
                end                                                                                           
                else if( state==sR24)
                begin
                inp[7]=24'b00000000_00000000_00000000; 
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00010000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                                                                                        
                else if( state==sR25)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00010000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR26)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00010000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR27)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00010000_00000000_00000000;
                end                                                                                           
                                                                                                                            
                else if( state==sR28)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00100000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR29)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00100000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end              
                else if( state==sR30)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00100000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR31)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00100000_00000000_00000000;
                end
                else if( state==sR32)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b01000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR33)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b01000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR34)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b01000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR35)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b01000000_00000000_00000000;
                end
                else if( state==sR36)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b10000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR37)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b10000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR38)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b10000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR39)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b10000000_00000000_00000000;
                end   
                else if( state==sR40)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000001_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR41)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000001_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR42)
                begin
                inp[7]=24'b00000001_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR43)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000010_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR44)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000010_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end
                else if( state==sR45)
                begin
                inp[7]=24'b00000010_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR46)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000100_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR47)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000100_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR48)
                begin
                inp[7]=24'b00000100_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR49)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00001000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR50)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00001000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR51)
                begin
                inp[7]=24'b00001000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00000000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR52)
                begin
                inp[7]=24'b00000000_00000000_00000000;
                inp[6]=24'b00000000_00000000_00000000;
                inp[5]=24'b00010000_00000000_00000000;
                inp[4]=24'b00000000_00000000_00000000;
                inp[3]=24'b00000000_00000000_00000000;
                inp[2]=24'b00000000_00000000_00000000;
                inp[1]=24'b00000000_00000000_00000000;
                inp[0]=24'b00000000_00000000_00000000;
                end                                                                                           
                else if( state==sR53)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b00010000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                                                                                                    
                      else if( state==sR54)
                      begin
                      inp[7]=24'b00010000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR55)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b00100000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR56)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b00100000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR57)
                      begin
                      inp[7]=24'b00100000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR58)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b01000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end              
                      else if( state==sR59)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b01000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end   
                else if( state==sR60)
                      begin
                      inp[7]=24'b01000000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR61)
                      begin
                      inp[7]=24'b00000000_00000000_00000000; 
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b10000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                                                                                              
                      else if( state==sR62)
                      begin
                      inp[7]=24'b00000000_00000000_00000000;
                      inp[6]=24'b10000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                           
                      else if( state==sR63)
                      begin
                      inp[7]=24'b10000000_00000000_00000000;
                      inp[6]=24'b00000000_00000000_00000000;
                      inp[5]=24'b00000000_00000000_00000000;
                      inp[4]=24'b00000000_00000000_00000000;
                      inp[3]=24'b00000000_00000000_00000000;
                      inp[2]=24'b00000000_00000000_00000000;
                      inp[1]=24'b00000000_00000000_00000000;
                      inp[0]=24'b00000000_00000000_00000000;
                      end                                                                                            
endmodule
