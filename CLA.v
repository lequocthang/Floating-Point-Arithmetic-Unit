//Carry look ahead adder module-4bits(CLA 4 bits)
//thuat toan lam giam thoi gian truyen delay vi co nho ngo ra Co khong bi phu thuoc vao co nho ngo vao Ci truoc do nhu thong thuong
//ma ta tinh truc tiep tu 2 so ngo vao 
//Phep tinh X+Y
module CLA(X, Y, Ci, Co, Sum);
	input [3:0] X, Y; //ngo vao hai so 4 bits
	input Ci; //co nho ngo vao
	output [3:0] Sum;//ngo ra 4 bits
	output [3:0] Co; //co nho ngo ra
	wire [3:0] Pi, Gi; //lan luot la carry propagate va carry generate
	//reg [3:0] i; //bien dem bit thu i
	//wire [1:0] selec; //bien lua chon trong bo mux4to1
	
	
	//tinh gia tri tai Sum[0]
	xor xor1(Pi[0], X[0], Y[0]);
	and and1(Gi[0], X[0], Y[0]);
	and and2(temp1, Pi[0], Ci); 
	or or1(Co[0], Gi[0], temp1);
	xor xor2(Sum[0], Pi[0], Ci);
	
	
	/*assign Pi[0]<=X[0]^Y[0];
	assign Gi[0]<=X[0]&Y[0];
	assign Co[1]<=Gi[0] | Pi[0]&Ci;
	assign Sum[0] =Pi[0]^Ci;*/
	
	//tinh gia tri tai Sum[1]
	xor xor3(Pi[1], X[1], Y[1]);
	and and3(Gi[1], X[1], Y[1]);
	and and4(temp2, Pi[1], Gi[0]);
	and and5(temp3, Pi[1], Pi[0], Ci);
	or or2(Co[1], Gi[1], temp2, temp3);
	xor xor4(Sum[1], Pi[1], Co[0]);
	
	/*
	//tinh gia tri tai Sum[1]
	assign Pi[1]<=X[1]^Y[1];
	assign Gi[1]<=X[1]&Y[1];
	assign Co[2]<=Gi[1]| Pi[1]&Gi[0] | Pi[1]&Pi[0]&Ci;
	assign Sum[1] =Pi[1]^Co[1];*/
	
	
	//tinh gia tri tai Sum[2]
	xor xor5(Pi[2], X[2], Y[2]);
	and and6(Gi[2], X[2], Y[2]);
	and and7(temp4, Pi[2], Gi[1]);
	and and8(temp5, Pi[2], Pi[1], Gi[0]);
	and and9(temp6, Pi[2], Pi[1], Pi[0], Ci);
	or or3(Co[2], Gi[2], temp4, temp5, temp6);
	xor xor6(Sum[2], Pi[2], Co[1]);
	
	
	/*
	//tinh gia tri tai Sum[2]
	assign Pi[2]<=X[2]^Y[2];
	assign Gi[2]<=X[2]&Y[2];
	assign Co[3]<=Gi[2]+Pi[2]&Gi[1] | Pi[2]&Pi[1]&Gi[0] | Pi[2]&Pi[1]&Pi[0]&Ci;
	assign Sum[2] =Pi[2]^Co[2];*/
	
	
	//tinh gia tri tai Sum[3]
	xor xor7(Pi[3], X[3], Y[3]);
	and and10(Gi[3], X[3], Y[3]);
	and and11(temp7, Pi[3], Gi[2]);
	and and12(temp8, Pi[3], Pi[2], Gi[1]);
	and and13(temp9, Pi[3], Pi[2], Pi[1], Gi[0]);
	and and14(temp10,Pi[3], Pi[2], Pi[1], Pi[0], Ci);
	or or4(Co[3], Gi[3], temp7, temp8, temp9, temp10);
	xor xor8(Sum[3], Pi[3], Co[2]);
	
	/*
	//tinh gia tri tai Sum[3]
	assign Pi[3]<=X[3^Y[3];
	assign Gi[3]<=X[3]&Y[3;
	assign Co[4]<=Gi[3]| Pi[3]&Gi[2] | Pi[3]&Pi[2]&Gi[1] | Pi[3]&Pi[2]&Pi[1]&Gi[0] | Pi[3]&Pi[2]&Pi[1]&Pi[0]&Ci;
	assign Sum[3] =Pi[3]^Co[3];*/
	
endmodule
