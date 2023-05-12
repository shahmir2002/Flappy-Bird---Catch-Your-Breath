`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module bird(clk, rst, enable, jump, down, state, fall_accel, y_coord
    );
	 
	 input clk;
	 input enable;
	 input jump;
	 input down;
	 input [1:0] fall_accel;
	 input rst;
	 input [1:0] state;
	 output reg signed[10:0] y_coord;
	 initial y_coord = 'd300;
	 
	 reg signed [10:0] vel; 
	 initial vel = 'd0;
	 
	 reg jump_d;
	 initial jump_d = 0;
		
	 reg [8:0] clock_div;
	 initial clock_div = 0;
	 always @ (posedge clk)
		clock_div <= clock_div+1;
	
	 always @ (posedge clock_div[4])
	 begin
	 if(enable && state == 2)
		begin
		//bird flight start
			if(jump && vel < 5)
			begin
				vel <= vel + 'd10;
			end
		//jump button not pressed
			else if ( vel > -4)
				vel <= vel - 1;//fall_accel;
		//bird flight start_down
			if(down && vel < 2)
			begin
				vel <= vel - 'd10;
			end
		//down button not pressed
//			else if ( vel > -5)
//				vel <= vel - 1;//fall_accel;
		end
	 else if (!state[1])
		vel <= 0;
	 end
	 
	 always @ (posedge clock_div[4])
	 begin
	 if(enable && state == 2)
		begin
		//put patch of grass
			if(y_coord <= 0)
				y_coord <= 0;
			else if(y_coord + vel <= 0)
				y_coord <= 0;
			else if((y_coord + vel) > 0 && (y_coord + vel) < 485)
				y_coord <= y_coord + vel;

		end
	 else if (state == 0)
		y_coord <= 0;
	 else if (state == 1)
		y_coord <= 300;
	 end
	 

endmodule