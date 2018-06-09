`timescale 1ns / 1ps
module SelectShip( input logic clk,clk_en,reset, up, down, right,left,
                    input logic [1:0] level,
                  output logic [7:0][23:0]out              
    );
    
    typedef enum logic [5:0]{s0,s1,s2} statetype;
                              
    statetype [2:0]state, nextstate; 
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
        if(up== 1'b1 || down== 1'b1 || right== 1'b1 || left== 1'b1 )
            clockEnable <= 1'b1;
    end
    
    always_ff@(posedge clockEnable, posedge reset)
    begin
        if(reset==1)begin           
            state<=s0;
        end
        else
            if(clk_en == 1'b1) begin
                state <= nextstate;
            end
    end              
               
    always_comb
    begin
        if ( level == 2'd0 ) begin
        //MAP 1
        out[0] = 24'b11111111_11110001_11110001;
        out[1] = 24'b11111010_10000010_10000001;
        out[2] = 24'b11011100_10000110_10000001;
        out[3] = 24'b11111100_10000100_10000011;
        out[4] = 24'b11110111_11000000_11000000;
        out[5] = 24'b11101101_11000000_11000000;                                                
        out[6] = 24'b11111111_11000000_11000000;
        out[7] = 24'b11111111_11111111_11111111;
        end
        else if ( level == 2'd1 ) begin           
        // MAP 2
        out[0] = 24'b11101111_11100111_00000111;
        out[1] = 24'b00111111_01100111_00000111;
        out[2] = 24'b11011111_11010001_00110001;
        out[3] = 24'b11111011_11110001_11110001;
        out[4] = 24'b11111111_11000001_11000001;
        out[5] = 24'b11101111_10000000_10000000;                                                
        out[6] = 24'b11011101_10000000_10000000;
        out[7] = 24'b11111111_10001000_10001000;
        end
        else if ( level == 2'd2 ) begin
        // MAP 3
        out[0] = 24'b11111111_11000111_11000111;
        out[1] = 24'b11101111_11000111_11000111;
        out[2] = 24'b11111111_11111000_11000000;
        out[3] = 24'b11101001_10111000_10000000;
        out[4] = 24'b11001111_10001000_10000000;
        out[5] = 24'b11111111_10000111_10000111;                                                
        out[6] = 24'b11111111_11111100_11111100;
        out[7] = 24'b11111110_11111100_11111100;
        end             
    end
endmodule



    