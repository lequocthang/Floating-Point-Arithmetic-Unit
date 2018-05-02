//bo cong 1 bit

module CLA1bit(X, Y, Ci, Co, Sum);
	input  X, Y; //ngo vao hai so 4 bits
	input Ci; //co nho ngo vao
	output Sum;//ngo ra 4 bits
	output Co; //co nho ngo ra
	wire Pi, Gi; //lan luot la carry propagate va carry generate


	xor xor1(Pi, X, Y);
	and and1(Gi, X, Y);
	and and2(temp1, Pi, Ci); 
	or or1(Co, Gi, temp1);
	xor xor2(Sum, Pi, Ci);
	
	
endmodule

	