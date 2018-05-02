module Sub28bits(A, B, Ci, Co, F);
	
	input [23:0] A,B; //ngo vao 
	input Ci;//co nho ngo vao
	output [23:0] F;//ngo ra phep cong
	output Co;
	
	
	wire [23:0] Cout, Sub;
	
	//vi de tranh thuc hien phep tru [size-1:0] nen so bit cua moi bien se bat dau tu bit so 1
		
/*	input [24:0] A,B; //ngo vao 
	input Ci; //co nho ngo vao
	output [24:0] F;//ngo ra phep cong
	output Co;
	wire [24:0] Cout, Sub;*/
	
	


	
	//tao module 
	Sub sub1(.X(A[3:0]), .Y(B[3:0]), .Ci(Ci), .Co(Cout[3:0]), .Sub(Sub[3:0]));
	Sub sub2(.X(A[7:4]), .Y(B[7:4]), .Ci(Cout[3]), .Co(Cout[7:4]), .Sub(Sub[7:4]));
	Sub sub3(.X(A[11:8]), .Y(B[11:8]), .Ci(Cout[7]), .Co(Cout[11:8]), .Sub(Sub[11:8]));
	Sub sub4(.X(A[15:12]), .Y(B[15:12]), .Ci(Cout[11]), .Co(Cout[15:12]), .Sub(Sub[15:12]));
	Sub sub5(.X(A[19:16]), .Y(B[19:16]), .Ci(Cout[15]), .Co(Cout[19:16]), .Sub(Sub[19:16]));
	Sub sub6(.X(A[23:20]), .Y(B[23:20]), .Ci(Cout[19]), .Co(Cout[23:20]), .Sub(Sub[23:20]));
	
	
	assign Co=Cout[23];
	assign F[23:0]=Sub[23:0];
	
endmodule