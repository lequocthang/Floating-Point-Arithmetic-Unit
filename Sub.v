//Carry look ahead adder module-4bits(CLA 4 bits)
//thuat toan lam giam thoi gian truyen delay vi co nho ngo ra Co khong bi phu thuoc vao co nho ngo vao Ci truoc do nhu thong thuong
//ma ta tinh truc tiep tu 2 so ngo vao 
//Phep tinh X-Y
//Giai thuat: Gi=Xi&Yi
//			  Pi=Xi xnor Yi
//			  Ci=Gi+PiCi-1 (C-1=Cin)
//			  Subi=Xi xor Yi xor Ci-1

//--------------------------------------------------------------------------------------------------------------------------------------------
module Sub(X, Y, Ci, Co, Sub);
	input [3:0] X, Y; //ngo vao hai so 4 bits
	input Ci; //co nho ngo vao
	output [3:0] Sub;//ngo ra 4 bits
	output [3:0] Co; //co nho ngo ra
	wire [3:0] Pi, Gi; //lan luot la carry propagate va carry generate
	
	//tinh gia tri tai Sum[0]
	not not1(tepmnot1, X[0]);
	and and1(Gi[0], tepmnot1, Y[0]);
	xnor xor1(Pi[0], X[0], Y[0]);
	and and2(temp1, Pi[0], Ci); 
	or or1(Co[0], Gi[0], temp1);
	xor xor100(temp100, X[0], Y[0]);
	xor xor101(Sub[0], temp100, Ci);
	

	
	//tinh gia tri tai Sum[1]
	not not2(tempnot2, X[1]);
	and and3(Gi[1], tempnot2, Y[1]);
	xnor xor3(Pi[1], X[1], Y[1]);
	and and4(temp2, Pi[1], Gi[0]);
	and and5(temp3, Pi[1], Pi[0], Ci);
	or or2(Co[1], Gi[1], temp2, temp3);
	xor xor102(temp102, X[1], Y[1]);
	xor xor103(Sub[1], temp102, Co[0]);
	
	
	
	
	//tinh gia tri tai Sum[2]
	not not3(tempnot3, X[2]);
	and and6(Gi[2], tempnot3, Y[2]);
	xnor xor5(Pi[2], X[2], Y[2]);
	and and7(temp4, Pi[2], Gi[1]);
	and and8(temp5, Pi[2], Pi[1], Gi[0]);
	and and9(temp6, Pi[2], Pi[1], Pi[0], Ci);
	or or3(Co[2], Gi[2], temp4, temp5, temp6);
	xor xor104(temp104, X[2], Y[2]);
	xor xor105(Sub[2], temp104, Co[1]);

	
	//tinh gia tri tai Sum[3]
	not not4(tempnot4,X[3]);
	and and10(Gi[3], tempnot4, Y[3]);
	xnor xor7(Pi[3], X[3], Y[3]);
	and and11(temp7, Pi[3], Gi[2]);
	and and12(temp8, Pi[3], Pi[2], Gi[1]);
	and and13(temp9, Pi[3], Pi[2], Pi[1], Gi[0]);
	and and14(temp10,Pi[3], Pi[2], Pi[1], Pi[0], Ci);
	or or4(Co[3], Gi[3], temp7, temp8, temp9, temp10);
	xor xor106(temp106, X[3], Y[3]);
	xor xor107(Sub[3], temp106, Co[2]);

endmodule
