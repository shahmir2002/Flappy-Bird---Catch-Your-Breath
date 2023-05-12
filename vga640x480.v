`timescale 1ns / 1ps

module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire clr,			//asynchronous reset
	input wire [9:0] bird_coord,
	input wire [8:0] pipe_pos,
	input wire [7:0]pipe_array0,
	input wire [7:0]pipe_array1,
	input wire [3:0] current_score,
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue,	//blue vga output
	input heartrate1,
	input heartrate2,
	input heartrate3
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=

always @(posedge dclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =

reg a;
initial a = 0;
reg b;
initial b = 0;
reg c;
initial c = 0;
reg d;
initial d = 0;
reg e;
initial e = 0;
reg f;
initial f = 0;
reg g;
initial g = 0;
reg h;
initial h = 0;
reg i;
initial i = 0;
reg j;
initial j = 0;
reg k;
initial k = 0;
reg l;
initial l = 0;
reg m;
initial m = 0;
reg n;
initial n = 0;
reg o;
initial o = 0;
reg xx;
initial xx = 0;
reg bg;
initial bg=0;

always @ (*)
begin
case(current_score)
0:
begin
    bg= ~bg;
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j = 0;
	k = 0;
	l = 0;
	m = 0;
	n = 0;
	o = 0;
	xx = 1;
end
1:
begin
    xx=0;
    b = 0;
	c = 0;
	d=0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j=0;
	a=1;
end
2: 
begin
    xx = 0;
	a = 0;
	c = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	d = 0;
	j=0;
	b = 1;

end
3: 
begin
    xx = 0;
    a=0;
    b = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j=0;
	c = 1;
end
4: 
begin
    xx = 0;
    a = 0;
	b = 0;
	c = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j=0;
	d = 1;
end
5:
begin
    xx = 0;
    a = 0;
	b = 0;
	c = 0;
	d = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j=0;
	e = 1;
end
6: 
begin
    xx = 0;
	a=0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	g = 0;
	h = 0;
	i = 0;
//	j=0;
	f = 1;
end
7:
begin
    xx = 0;
    a=0;
    b = 0;
	c = 0;
	d=0;
	e = 0;
	f = 0;
	h = 0;
	i = 0;
//	j=0;
	g = 1;
end
8:
begin
    xx = 0;
    a=0;
    b = 0;
	c = 0;
	d=0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j=0;
	h = 1;
end
9: 
begin
    xx = 0;
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	j=0;
	i = 1;
end
10:
begin 
    xx = 1;
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	j = 1;
end
11:
begin 
    xx = 0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	a = 1;
	j = 1;
	
end
12:
begin
    xx = 0;
    a=0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	b = 1;
	j = 1;
end
13:
begin
    xx = 0;
    a=0;
    b = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	c = 1;
	j=1;
end
14:
begin 
    xx = 0;
    a=0;
    b = 0;
	c = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	d = 1;
	j = 1;
end
15:
begin 
	xx = 0;
    a=0;
    b = 0;
	c = 0;
	d = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 0;
	e=1;
	j=1;
end
16:
begin
    xx = 0;
    a=0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	g = 0;
	h = 0;
	i = 0;
	f=1;
	j=1;
end
17:
begin
    xx = 0;
    a = 0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	h = 0;
	i = 0;
	g=1;
	j=1;
	
end
18:
begin
   xx = 0;
    a=0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	i = 0;
	h=1;
	j=1;
end
19:
begin
    xx = 0;
    a=0;
    b = 0;
	c = 0;
	d = 0;
	e = 0;
	f = 0;
	g = 0;
	h = 0;
	i = 1;
	j=1;
end

endcase
end





always @(*)
begin

	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
	    if (e && ((((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+40)&& vc<(vbp+60))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+70)&& vc<(vbp+90))) ) )
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
	    else if (xx && ( (((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+30)&& vc<(vbp+100))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100)))  ))
        begin   
                red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
	   
	    else if (a && ((((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100))))  )
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
        
	    else if ( b && ((((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+70)&& vc<(vbp+90))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+40)&& vc<(vbp+60))) ) )
            begin
                red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
            end
        else if ( c && ((((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+70)&& vc<(vbp+90))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+40)&& vc<(vbp+60))) ) )
            begin
                red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
            end	   
	
       
        else if (d &&   ( (((hc>(hbp+590))&&(hc<(hbp+630))) && (vc>(vbp+60)&& vc<(vbp+70))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100))) || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+40)&& vc<(vbp+60))) ) )
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
        else if (e && ((((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+40)&& vc<(vbp+60))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+70)&& vc<(vbp+90))) ) )
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;

        end
        else if (f && ( (((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+30)&& vc<(vbp+100))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+70)&& vc<(vbp+90)))  ))
        begin
              red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
        else if (g && ( (((hc>(hbp+590))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+40))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100)))  ))
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end        
        else if (h && ( (((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+30)&& vc<(vbp+100))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100)))  ))
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end        
        else if (i && ( (((hc>(hbp+590))&&(hc<(hbp+630))) &&  ( (vc>(vbp+30) && vc<(vbp+40))|| (vc>(vbp+60)&& vc<(vbp+70)) || (vc>(vbp+90)&& vc<(vbp+100)) ) )   || (((hc>(hbp+590))&&(hc<(hbp+600))) && (vc>(vbp+30)&& vc<(vbp+60))) || (((hc>(hbp+620))&&(hc<(hbp+630))) && (vc>(vbp+30)&& vc<(vbp+100)))  ))
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
        else if (j && ((((hc>(hbp+570))&&(hc<(hbp+580))) && (vc>(vbp+30)&& vc<(vbp+100)))) )
        begin
               red = 3'b001;
				green = 3'b000;
				blue = 2'b11;
        end
           
        else if ( (heartrate1 == 1 || heartrate2==1 || heartrate3==1) && ((((hc>(hbp+20))&&(hc<(hbp+30))) && (vc>(vbp+70)&& vc<(vbp+100)))))
        begin
            red = 3'b001;
            green = 3'b000;
            blue = 2'b11  ; 
        end   
        else if ((heartrate2 == 1 || heartrate3==1) && ((((hc>(hbp+35))&&(hc<(hbp+45))) && (vc>(vbp+60)&& vc<(vbp+100)))) )
        begin
            red = 3'b001;
            green = 3'b000;
            blue = 2'b11  ;
        end
        else if (heartrate3 == 1 && ((((hc>(hbp+50))&&(hc<(hbp+60))) && (vc>(vbp+50)&& vc<(vbp+100)))))                 
        begin
             red = 3'b001;
            green = 3'b000;
            blue = 2'b11  ;
        end
        
                   
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------
		
        // BIRD
        else if (vc > (480 - bird_coord) - 20 && vc < (480 - bird_coord) + 20 && hc > hbp + 90 && hc < hbp + 140)
        begin
            if (hc > hbp + 130 && hc < hbp + 140 && vc > (480 - bird_coord) - 10 && vc < (480 - bird_coord))
            begin
                // Beak (small box)
                red = 3'b111;
                green = 3'b111;
                blue = 2'b00;
            end
            else if (hc > hbp + 110 && hc < hbp + 130 && vc > (480 - bird_coord) - 20 && vc < (480 - bird_coord))
            begin
                // Body (square)
                red = 3'b111;
                green = 3'b000;
                blue = 2'b11;
            end
            else if (hc > hbp + 125 && hc < hbp + 135 && vc > (480 - bird_coord) && vc < (480 - bird_coord) + 10)
            begin
                // Feet (small boxes)
                red = 3'b111;
                green = 3'b000;
                blue = 2'b11;
            end
        end
			
		//pipes
		
		else if ((hc < hfp-pipe_pos+50 && hc > hfp-pipe_pos) && (vc < pipe_array1+75 || vc > pipe_array1+215 && vc < 500))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b11;
		end		
		else if ((hc < hfp-345-pipe_pos+50 && hc > hfp-345-pipe_pos) && (vc < pipe_array0+75 || vc > pipe_array0+215 && vc < 500))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b00;
		end		
		//grass 
		else if (vc >= 500)
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end
		// top border
		else if (vc <= 40)
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b10;
		end
		// display cyan bar
		else if (hc >= (hbp) && hc < (hbp+640))
		begin
		if (bg==1) begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		else if (bg ==  0)
			begin
			    red = 3'b101;
                green = 3'b111;
			    blue = 2'b10; 
			end   
		end
		
//		else if (current_score == 15)
//		begin
//		    red = 3'b010;
//		end
		// we're outside active horizontal range so display black
		else
		begin
			red = 0;
			green = 0;
			blue = 0;
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
