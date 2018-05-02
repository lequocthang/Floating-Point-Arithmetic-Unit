//X+ la trang thai ke tiep cua X: neu X+=0 thi ngo ra Y luon la 0 (dong nghia voi viec truoc do da phat hien duoc bit 1)
//											 neu X+=1; xet ngo vao F de biet duoc ngo ra Y la gi
//X+=Y
//Y=~F&X+

module Counter_1bit_1(F, X, X_next, Y);
	input F;//bit ngo vao
	input X;//bit trang thai ke tiep
	output Y;//neu truoc do ngo ra la 1 va ngo vao la 0 thi Y=1
	output X_next;//trang thai ke tiep cua X
	
	//and u1(X, 1'b1, 1'b1);
	not u2(temp1, F);
	and u3(Y, temp1, X);
	and u4(X_next, Y, 1'b1);
	
endmodule

	