//module thuc hien bu 2 so 4bit
module bu2_28bit(X, Bu_2);
	input [23:0] X;
	output [23:0] Bu_2;

	wire [23:0] bu_1; //24 bit vao va 4 bit mo rong 
	wire [23:0] Cout;
	
	//vi de tranh thuc hien phep tru [size-1:0] nen so bit cua moi bien se bat dau tu bit so 1
	
	//thuc hien lay bu 1
	assign bu_1[0]=~X[0];
	assign bu_1[1]=~X[1];
	assign bu_1[2]=~X[2];
	assign bu_1[3]=~X[3];
	
	assign bu_1[4]=~X[4];
	assign bu_1[5]=~X[5];
	assign bu_1[6]=~X[6];
	assign bu_1[7]=~X[7];
	
	assign bu_1[8]=~X[8];
	assign bu_1[9]=~X[9];
	assign bu_1[10]=~X[10];
	assign bu_1[11]=~X[11];
	
	assign bu_1[12]=~X[12];
	assign bu_1[13]=~X[13];
	assign bu_1[14]=~X[14];
	assign bu_1[15]=~X[15];
	
	assign bu_1[16]=~X[16];
	assign bu_1[17]=~X[17];
	assign bu_1[18]=~X[18];
	assign bu_1[19]=~X[19];
	
	assign bu_1[20]=~X[20];
	assign bu_1[21]=~X[21];
	assign bu_1[22]=~X[22];
	assign bu_1[23]=~X[23];
	/*
	assign bu_1[24]=~X[24];
	assign bu_1[25]=~X[25];
	assign bu_1[26]=~X[26];
	assign bu_1[27]=~X[27];
	
	assign bu_1[28]=~X[28];*/
	
	//thuc hien lay bu 2

	CLA cla1(.X(bu_1[3:0]), .Y(4'b0001), .Ci(0), .Co(Cout[3:0]), .Sum(Bu_2[3:0]));
	CLA cla2(.X(bu_1[7:4]), .Y(4'b0000), .Ci(Cout[3]),.Co(Cout[7:4]), .Sum(Bu_2[7:4]));
	CLA cla3(.X(bu_1[11:8]), .Y(4'b0000), .Ci(Cout[7]),.Co(Cout[11:8]), .Sum(Bu_2[11:8]));
	CLA CLA4(.X(bu_1[15:12]), .Y(4'b0000), .Ci(Cout[11]), .Co(Cout[15:12]), .Sum(Bu_2[15:12]));
	CLA CLA5(.X(bu_1[19:16]), .Y(4'b0000), .Ci(Cout[15]), .Co(Cout[19:16]), .Sum(Bu_2[19:16]));
	CLA CLA6(.X(bu_1[23:20]), .Y(4'b0000), .Ci(Cout[19]), .Co(Cout[23:20]), .Sum(Bu_2[23:20]));
	
	
	
endmodule