module widen5bit(X,Y);
	input X;
	output [4:0] Y;
	
	assign Y[0]=X;
	assign Y[4:1]=4'b0000;
	
endmodule
