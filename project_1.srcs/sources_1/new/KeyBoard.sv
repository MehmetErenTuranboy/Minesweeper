`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2017 12:06:43 PM
// Design Name: 
// Module Name: KeyBoard
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

/*
module KeyBoard(
        input logic clk,up,down,right, left, ok,
        output logic oup,odown,ook
    );
    
    logic stoper = 0;
    logic [20:0] count;
    logic[20:0] next;
    
  
      
     
     
      
      always_ff@(posedge clk) begin
        if( (up == 1'b1) | (down==1) | (right ==1) |  (left == 1) | (ok ==  1)) begin
          stoper <= 1;
        end
        if(~stoper && ok) begin
                    ook = 1;
                    end
             if(~stoper &&down) begin
                odown = 1;
                end
             if( up && ~stoper) begin
                oup = 1;
                end
        else begin
            stoper = 0;
        end
    end
endmodule*//*
module KeyBoard (input clk, input logic [3:0] col,output logic [3:0] row, output logic [7:0] keyCode);
reg [1:0]state=2'b00;
reg [1:0]nextState=2'b00;
logic [27:0] count, nextcount;

always_ff @(posedge clk)begin
	    count <= nextcount;
	    end
	    always_comb
	    nextcount <= count + 1; 

//state register
always@(negedge count) begin
    state <= nextState;
end

//output CL

  always@(posedge clk)
    if (col != 4'b0000) begin
    keyCode <= {row[0],row[1],row[2],row[3], col[0],col[1],col[2],col[3]};
    end

always_comb
       case (keyCode)
        8'b00010001: row = 4'b0000; 
        8'b00010010: row = 4'b0001; 
        8'b00010100: row = 4'b0010; 
        8'b00011000: row = 4'b0011; 
        8'b00100001: row = 4'b0100; 
        8'b00100010: row = 4'b0101; 
        8'b00100100: row = 4'b0110; 
        8'b00101000: row = 4'b0111; 
        8'b01000001: row = 4'b1000; 
        8'b01000010: row = 4'b1001;
        8'b01000100: row = 4'b1010; 
        8'b01001000: row = 4'b1011; 
        8'b10000001: row = 4'b1100; 
        8'b10000010: row = 4'b1101; 
        8'b10000100: row = 4'b1110; 
        8'b10001000: row = 4'b1111;
        default row = row; 	
       endcase     

//next state CL
always @(posedge clk) begin
        case (state)
            2'b00: nextState <= 2'b01;
            2'b01: nextState <= 2'b10;
            2'b10: nextState <= 2'b11;
            2'b11: nextState <= 2'b00;
            default: nextState <= 2'b11;
        endcase
end

endmodule
*/
//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University
// Engineer: Ridvan Çelik
// 
// Create Date: 03/30/2016 03:52:02 PM
// Module Name: keyboard
// Project Name: Digital Piano
// Target Devices: BASYS3 
// Description: To get data from 4x4 matrix keypad on beti board.
// 
// Revision:
// Additional Comments: JB ports should connect to keypad.
// 
//////////////////////////////////////////////////////////////////////////////////
/*
module KeyBoar(
        input logic clk,
        input logic [3:0] JBI,
        output logic [3:0] hex,
        output logic [7:0] key
     );
    
    logic stop;
    logic [7:0] key;
	logic [20:0] count, nextcount;

	always_ff @(posedge clk)
	   if (~stop) count <= nextcount;

	always_comb
		nextcount = count + 1;
	
    always_comb
       case (key)
        8'b00010001: hex = 4'b0000; 
        8'b00010010: hex = 4'b0001; 
        8'b00010100: hex = 4'b0010; 
        8'b00011000: hex = 4'b0011; 
        8'b00100001: hex = 4'b0100; 
        8'b00100010: hex = 4'b0101; 
        8'b00100100: hex = 4'b0110; 
        8'b00101000: hex = 4'b0111; 
        8'b01000001: hex = 4'b1000; 
        8'b01000010: hex = 4'b1001;
        8'b01000100: hex = 4'b1010; 
        8'b01001000: hex = 4'b1011; 
        8'b10000001: hex = 4'b1100; 
        8'b10000010: hex = 4'b1101; 
        8'b10000100: hex = 4'b1110; 
        8'b10001000: hex = 4'b1111;
        default hex = hex; 	
       endcase          	   
endmodule*/
/*
module KeyBoard(

input logic clk, // Clock pin form keyboard

input logic data, //Data pin form keyboard

output logic variable1,

output logic [7:0] carpma

);

logic [7:0] data_curr;

logic [7:0] data_pre;

logic [3:0] b;

logic flag;

initial begin

b<=4'h1;

flag<=1'b0;

data_curr<=8'h08;

data_pre<=8'h09;

end

always @(negedge clk) //Activating at negative edge of clock from keyboard

begin

case(b)

1:; //first bit

2:data_curr[0]<=data;

3:data_curr[1]<=data;

4:data_curr[2]<=data;

5:data_curr[3]<=data;

6:data_curr[4]<=data;

7:data_curr[5]<=data;

8:data_curr[6]<=data;

9:data_curr[7]<=data;

10:flag<=1'b1; //Parity bit

11:flag<=1'b0; //Ending bit

endcase

if(b<=10)

b<=b+1;

else if(b==11)

b<=1;

end

always@(posedge flag) // Printing data obtained to led

begin

begin

data_pre<=data_curr;

if(data_curr == 8'h29)

variable1 = 1;

else

variable1 = 0;

end

end

endmodule*/

module KeyBoard(
        input logic clk,
        input logic [3:0] JBI,
        output logic [3:0] JBO,
        output logic [3:0] hex,
        output logic [7:0] key
     );
    
    logic stop;
    logic [7:0] key;
	logic [20:0] count, nextcount;

	always_ff @(posedge clk)
	   if (~stop) count <= nextcount;

	always_comb
		nextcount = count + 1;
			
	always_comb begin
	   case (count[20:19])
		2'b00:  JBO <= 4'b0001; 	
		2'b01:  JBO <= 4'b0010; 		
		2'b10:  JBO <= 4'b0100; 	
		2'b11:  JBO <= 4'b1000; 		
	   endcase	
	    if((JBI == 4'b1000) | (JBI == 4'b0100) | (JBI == 4'b0010) | (JBI == 4'b0001) )  begin stop = 1; key <= {JBI,JBO}; end 
	    else begin stop = 0; key <= 8'b00000000; end
	   end
	   
    always_comb
       case (key)
        8'b00010001: hex = 4'b0000; 
        8'b00010010: hex = 4'b0001; 
        8'b00010100: hex = 4'b0010; 
        8'b00011000: hex = 4'b0011; 
        8'b00100001: hex = 4'b0100; 
        8'b00100010: hex = 4'b0101; 
        8'b00100100: hex = 4'b0110; 
        8'b00101000: hex = 4'b0111; 
        8'b01000001: hex = 4'b1000; 
        8'b01000010: hex = 4'b1001;
        8'b01000100: hex = 4'b1010; 
        8'b01001000: hex = 4'b1011; 
        8'b10000001: hex = 4'b1100; 
        8'b10000010: hex = 4'b1101; 
        8'b10000100: hex = 4'b1110; 
        8'b10001000: hex = 4'b1111;
        default hex = hex; 	
       endcase          	   
endmodule