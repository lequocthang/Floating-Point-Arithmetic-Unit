//thuc hien dich tu phai sang trai de cho ra ket qua chuan hoa cuoi cung
module shift_left(Sel, F, Q);
	input [4:0] Sel;//so bit can dich la Sel
	input [23:0] F;//ngo vao can thuc hien dich bit
	output [23:0] Q;//ngo ra
	
	wire [23:0] daobit;
	wire [23:0] temp;
	assign daobit[23]=F[0];
	assign daobit[22]=F[1];
	assign daobit[21]=F[2];
	assign daobit[20]=F[3];
	assign daobit[19]=F[4];
	assign daobit[18]=F[5];
	assign daobit[17]=F[6];
	assign daobit[16]=F[7];
	assign daobit[15]=F[8];
	assign daobit[14]=F[9];
	assign daobit[13]=F[10];
	assign daobit[12]=F[11];
	assign daobit[11]=F[12];
	assign daobit[10]=F[13];
	assign daobit[9]=F[14];
	assign daobit[8]=F[15];
	assign daobit[7]=F[16];
	assign daobit[6]=F[17];
	assign daobit[5]=F[18];
	assign daobit[4]=F[19];
	assign daobit[3]=F[20];
	assign daobit[2]=F[21];
	assign daobit[1]=F[22];
	assign daobit[0]=F[23];
	
	shift24bit u1(.Sel(Sel), .F(daobit), .Q(temp));
	
	assign Q[23]=temp[0];
	assign Q[22]=temp[1];
	assign Q[21]=temp[2];
	assign Q[20]=temp[3];
	assign Q[19]=temp[4];
	assign Q[18]=temp[5];
	assign Q[17]=temp[6];
	assign Q[16]=temp[7];
	assign Q[15]=temp[8];
	assign Q[14]=temp[9];
	assign Q[13]=temp[10];
	assign Q[12]=temp[11];
	assign Q[11]=temp[12];
	assign Q[10]=temp[13];
	assign Q[9]=temp[14];
	assign Q[8]=temp[15];
	assign Q[7]=temp[16];
	assign Q[6]=temp[17];
	assign Q[5]=temp[18];
	assign Q[4]=temp[19];
	assign Q[3]=temp[20];
	assign Q[2]=temp[21];
	assign Q[1]=temp[22];
	assign Q[0]=temp[23];

	
	
endmodule
