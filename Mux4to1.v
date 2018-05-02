module Mux4to1(s, a, b, o, F1, F2, F3, F4, F5, F6, F7 ,F8, Fout);
	input s, a, b,o;//S=0: khi A>B
				  //S=1: khi A<B
				  //A, B la dau cua 2 toan hang dau vao
	input [23:0] F1, F2, F3, F4, F5, F6, F7 ,F8;//chua tat ca cac ket qua tinh toan tu Fout1-->Fout8
	output [23:0] Fout; //ngo ra cua phep tinh
	wire [23:0] A, B, O, S;
	
	assign A[23]=a;
	assign A[22]=a;
	assign A[21]=a;
	assign A[20]=a;
	
	assign A[19]=a;
	assign A[18]=a;
	assign A[17]=a;
	assign A[16]=a;
	
	assign A[15]=a;
	assign A[14]=a;
	assign A[13]=a;
	assign A[12]=a;
	
	assign A[11]=a;
	assign A[10]=a;
	assign A[9]=a;
	assign A[8]=a;
	
	assign A[7]=a;
	assign A[6]=a;
	assign A[5]=a;
	assign A[4]=a;
	
	assign A[3]=a;
	assign A[2]=a;
	assign A[1]=a;
	assign A[0]=a;
	
	
	
	assign B[23]=b;
	assign B[22]=b;
	assign B[21]=b;
	assign B[20]=b;
	
	assign B[19]=b;
	assign B[18]=b;
	assign B[17]=b;
	assign B[16]=b;
	
	assign B[15]=b;
	assign B[14]=b;
	assign B[13]=b;
	assign B[12]=b;
	
	assign B[11]=b;
	assign B[10]=b;
	assign B[9]=b;
	assign B[8]=b;
	
	assign B[7]=b;
	assign B[6]=b;
	assign B[5]=b;
	assign B[4]=b;
	
	assign B[3]=b;
	assign B[2]=b;
	assign B[1]=b;
	assign B[0]=b;
	
	
	
	assign O[23]=o;
	assign O[22]=o;
	assign O[21]=o;
	assign O[20]=o;
	
	assign O[19]=o;
	assign O[18]=o;
	assign O[17]=o;
	assign O[16]=o;
	
	assign O[15]=o;
	assign O[14]=o;
	assign O[13]=o;
	assign O[12]=o;
	
	assign O[11]=o;
	assign O[10]=o;
	assign O[9]=o;
	assign O[8]=o;
	
	assign O[7]=o;
	assign O[6]=o;
	assign O[5]=o;
	assign O[4]=o;
	
	assign O[3]=o;
	assign O[2]=o;
	assign O[1]=o;
	assign O[0]=o;
	
	
	assign S[23]=s;
	assign S[22]=s;
	assign S[21]=s;
	assign S[20]=s;
	
	assign S[19]=s;
	assign S[18]=s;
	assign S[17]=s;
	assign S[16]=s;
	
	assign S[15]=s;
	assign S[14]=s;
	assign S[13]=s;
	assign S[12]=s;
	
	assign S[11]=s;
	assign S[10]=s;
	assign S[9]=s;
	assign S[8]=s;
	
	assign S[7]=s;
	assign S[6]=s;
	assign S[5]=s;
	assign S[4]=s;
	
	assign S[3]=s;
	assign S[2]=s;
	assign S[1]=s;
	assign S[0]=s;
	
	assign Fout=F1&~S&~A&~B&~O | F1&~S&~A&B&O | F2&~S&A&~B&~O | F2&~S&A&B&O | F3&~S&A&~B&O | F3&~S&A&B&~O | F4&~S&~A&B&~O | F4&~S&~A&~B&O | F5&S&~A&~B&~O |F5&S&~A&B&O 
				| F6&S&A&~B&~O | F6&S&A&B&O | F7&S&A&~B&O | F7&S&A&B&~O | F8&S&~A&~B&O | F8&S&~A&B&~O;
	
endmodule
	
	
	