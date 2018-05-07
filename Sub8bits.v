module Sub8bits(A, B, Ci, Co, F);
	
	input [7:0] A,B; //ngo vao 
	input Ci;//co nho ngo vao
	output [7:0] F;//ngo ra phep cong
	output Co;
	
	
	wire [7:0] Cout, Sub;
	
	//vi de tranh thuc hien phep tru [size-1:0] nen so bit cua moi bien se bat dau tu bit so 1
		
/*	input [24:0] A,B; //ngo vao 
	input Ci; //co nho ngo vao
	output [24:0] F;//ngo ra phep cong
	output Co;
	wire [24:0] Cout, Sub;*/
	
	


	
	//tao module 
	Sub sub1(.X(A[3:0]), .Y(B[3:0]), .Ci(Ci), .Co(Cout[3:0]), .Sub(Sub[3:0]));
	Sub sub2(.X(A[7:4]), .Y(B[7:4]), .Ci(Cout[3]), .Co(Cout[7:4]), .Sub(Sub[7:4]));

	
	
	assign Co=Cout[7];
	assign F[7:0]=Sub[7:0];
	
endmodule