module Counter_23bit_1(F, count);
	input [23:0] F;//bit ngo vao
	//input X;//bit trang thai ke tiep
	output [4:0] count;//so bit 1 Xuat ra ngoai
	
	wire [23:0] Q;//dung de chua cac gia tri 1 hoac 0 khi thuc hien phat hien so bit 1
	wire [23:0]	X_next;//trang thai ke tiep cua X
	wire [4:0] Sum1, Sum2, Sum3, Sum4, Sum5, Sum6, Sum7, Sum8, Sum9, Sum10, Sum11, Sum12, Sum13, Sum14, Sum15, Sum16, Sum17, Sum18, Sum19, Sum20, Sum21, Sum22, Sum23; 
	wire [4:0] Co1, Co2, Co3, co4, Co5, Co6, Co7, Co8, Co9, Co10, C011, Co12, Co13, co14, Co15, Co16, co17, Co18, Co19, Co20, Co21, Co22, Co23;
	//assign X=1'b1;
	Counter_1bit_1 count1(.F(F[23]), .X(1'b1), .X_next(X_next[0]), .Y(Q[0]));
	Counter_1bit_1 count2(.F(F[22]), .X(X_next[0]), .X_next(X_next[1]), .Y(Q[1]));
	Counter_1bit_1 count3(.F(F[21]), .X(X_next[1]), .X_next(X_next[2]), .Y(Q[2]));
	Counter_1bit_1 count4(.F(F[20]), .X(X_next[2]), .X_next(X_next[3]), .Y(Q[3]));
	
	Counter_1bit_1 count5(.F(F[19]), .X(X_next[3]), .X_next(X_next[4]), .Y(Q[4]));
	Counter_1bit_1 count6(.F(F[18]), .X(X_next[4]), .X_next(X_next[5]), .Y(Q[5]));
	Counter_1bit_1 count7(.F(F[17]), .X(X_next[5]), .X_next(X_next[6]), .Y(Q[6]));
	Counter_1bit_1 count8(.F(F[16]), .X(X_next[6]), .X_next(X_next[7]), .Y(Q[7]));
	
	Counter_1bit_1 count9(.F(F[15]), .X(X_next[7]), .X_next(X_next[8]), .Y(Q[8]));
	Counter_1bit_1 count10(.F(F[14]), .X(X_next[8]), .X_next(X_next[9]), .Y(Q[9]));
	Counter_1bit_1 count11(.F(F[13]), .X(X_next[9]), .X_next(X_next[10]), .Y(Q[10]));
	Counter_1bit_1 count12(.F(F[12]), .X(X_next[10]), .X_next(X_next[11]), .Y(Q[11]));
	
	Counter_1bit_1 count13(.F(F[11]), .X(X_next[11]), .X_next(X_next[12]), .Y(Q[12]));
	Counter_1bit_1 count14(.F(F[10]), .X(X_next[12]), .X_next(X_next[13]), .Y(Q[13]));
	Counter_1bit_1 count15(.F(F[9]), .X(X_next[13]), .X_next(X_next[14]), .Y(Q[14]));
	Counter_1bit_1 count16(.F(F[8]), .X(X_next[14]), .X_next(X_next[15]), .Y(Q[15]));
	
	Counter_1bit_1 count17(.F(F[7]), .X(X_next[15]), .X_next(X_next[16]), .Y(Q[16]));
	Counter_1bit_1 count18(.F(F[6]), .X(X_next[16]), .X_next(X_next[17]), .Y(Q[17]));
	Counter_1bit_1 count19(.F(F[5]), .X(X_next[17]), .X_next(X_next[18]), .Y(Q[18]));
	Counter_1bit_1 count20(.F(F[4]), .X(X_next[18]), .X_next(X_next[19]), .Y(Q[19]));
	
	Counter_1bit_1 count21(.F(F[3]), .X(X_next[19]), .X_next(X_next[20]), .Y(Q[20]));
	Counter_1bit_1 count22(.F(F[2]), .X(X_next[20]), .X_next(X_next[21]), .Y(Q[21]));
	Counter_1bit_1 count23(.F(F[1]), .X(X_next[21]), .X_next(X_next[22]), .Y(Q[22]));
	Counter_1bit_1 count24(.F(F[0]), .X(X_next[22]), .X_next(X_next[23]), .Y(Q[23]));
	
	//dem ca bit 1
	wire [4:0] y0,y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15, y16, y17, y18, y19, y20, y21, y22, y23;
	
	widen5bit u1(.X(Q[0]), .Y(y0));
	widen5bit u2(.X(Q[1]), .Y(y1));
	CLA5bit cla1(.X(y0), .Y(y1), .Ci(1'b0), .Co(Co1), .Sum(Sum1));
	
	widen5bit u3(.X(Q[2]), .Y(y2));
	CLA5bit cla2(.X(y2), .Y(Sum1), .Ci(1'b0), .Co(Co2),  .Sum(Sum2));
	
	widen5bit u4(.X(Q[3]), .Y(y3));
	CLA5bit cla3(.X(y3), .Y(Sum2), .Ci(1'b0),  .Co(Co3), .Sum(Sum3));
	
	widen5bit u5(.X(Q[4]), .Y(y4));
	CLA5bit cla4(.X(y4), .Y(Sum3), .Ci(1'b0),  .Co(Co4), .Sum(Sum4));
	
	widen5bit u6(.X(Q[5]), .Y(y5));
	CLA5bit cla5(.X(y5), .Y(Sum4), .Ci(1'b0), .Co(Co5),  .Sum(Sum5));
	
	widen5bit u7(.X(Q[6]), .Y(y6));
	CLA5bit cla6(.X(y6), .Y(Sum5), .Ci(1'b0),  .Co(Co6), .Sum(Sum6));
	
	widen5bit u8(.X(Q[7]), .Y(y7));
	CLA5bit cla7(.X(y7), .Y(Sum6), .Ci(1'b0),  .Co(Co7), .Sum(Sum7));
	
	widen5bit u9(.X(Q[8]), .Y(y8));
	CLA5bit cla8(.X(y8), .Y(Sum7), .Ci(1'b0), .Co(Co8),  .Sum(Sum8));
	
	widen5bit u10(.X(Q[9]), .Y(y9));
	CLA5bit cla9(.X(y9), .Y(Sum8), .Ci(1'b0),  .Co(Co9), .Sum(Sum9));
	
	widen5bit u11(.X(Q[10]), .Y(y10));
	CLA5bit cla10(.X(y10), .Y(Sum9), .Ci(1'b0),  .Co(Co10), .Sum(Sum10));
	
	widen5bit u12(.X(Q[11]), .Y(y11));
	CLA5bit cla11(.X(y11), .Y(Sum10), .Ci(1'b0),  .Co(Co11), .Sum(Sum11));
	
	widen5bit u13(.X(Q[12]), .Y(y12));
	CLA5bit cla12(.X(y12), .Y(Sum11), .Ci(1'b0),  .Co(Co12), .Sum(Sum12));
	
	widen5bit u14(.X(Q[13]), .Y(y13));
	CLA5bit cla13(.X(y13), .Y(Sum12), .Ci(1'b0),  .Co(Co13), .Sum(Sum13));
	
	widen5bit u15(.X(Q[14]), .Y(y14));
	CLA5bit cla14(.X(y14), .Y(Sum13), .Ci(1'b0),  .Co(Co14), .Sum(Sum14));
	
	widen5bit u16(.X(Q[15]), .Y(y15));
	CLA5bit cla15(.X(y15), .Y(Sum14), .Ci(1'b0),  .Co(Co15), .Sum(Sum15));
	
	widen5bit u17(.X(Q[16]), .Y(y16));
	CLA5bit cla16(.X(y16), .Y(Sum15), .Ci(1'b0),  .Co(Co16), .Sum(Sum16));
	
	widen5bit u18(.X(Q[17]), .Y(y17));
	CLA5bit cla17(.X(y17), .Y(Sum16), .Ci(1'b0), .Co(Co17),  .Sum(Sum17));
	
	widen5bit u19(.X(Q[18]), .Y(y18));
	CLA5bit cla18(.X(y18), .Y(Sum17), .Ci(1'b0),  .Co(Co18), .Sum(Sum18));
	
	widen5bit u20(.X(Q[19]), .Y(y19));
	CLA5bit cla19(.X(y19), .Y(Sum18), .Ci(1'b0), .Co(Co19),  .Sum(Sum19));
	
	widen5bit u21(.X(Q[20]), .Y(y20));
	CLA5bit cla20(.X(y20), .Y(Sum19), .Ci(1'b0), .Co(Co20),  .Sum(Sum20));
	
	widen5bit u22(.X(Q[21]), .Y(y21));
	CLA5bit cla21(.X(y21), .Y(Sum20), .Ci(1'b0), .Co(Co21),  .Sum(Sum21));
	
	widen5bit u23(.X(Q[22]), .Y(y22));
	CLA5bit cla22(.X(y22), .Y(Sum21), .Ci(1'b0),  .Co(Co22), .Sum(Sum22));
	
	widen5bit u24(.X(Q[23]), .Y(y23));
	CLA5bit cla23(.X(y23), .Y(Sum22), .Ci(1'b0),  .Co(Co23), .Sum(Sum23));
	
	//wire [4:0] count_1;//chinh xac con so can dich la (so bit 0) + 1
	assign count=Sum23;
	//wire co24;//chi la signal
	//CLA5bit u100(.X(count_1), .Y(5'b00001), .Ci(1'b0), .Co(co24), .Sum(count));
	
	
endmodule
	
	
	
	