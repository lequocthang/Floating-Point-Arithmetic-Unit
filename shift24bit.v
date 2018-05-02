module shift24bit(Sel, F, Q);
	input [4:0] Sel; //ngo lua chon 5 bit
	input [23:0] F;//ngo vao 24 bit can phai thuc hien dich bit 
	output [23:0] Q;//ngo ra sau qua trinh dich bit
	wire Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8 ,Q9, Q10, Q11, Q12, Q13, Q14, Q15, Q16, Q17, Q18,
		Q19, Q20, Q21, Q22, Q23;//la cac duong tinh hieu
	

	//cac duong tinh hieu 
	assign Q23= ~Sel[4]&~Sel[3]&~Sel[2]&~Sel[1]&~Sel[0];//0
	assign Q22= ~Sel[4]&~Sel[3]&~Sel[2]&~Sel[1]&Sel[0];//1
	assign Q21= ~Sel[4]&~Sel[3]&~Sel[2]&Sel[1]&~Sel[0];//2
	assign Q20=	~Sel[4]&~Sel[3]&~Sel[2]&Sel[1]&Sel[0];//3
		
	assign Q19= ~Sel[4]&~Sel[3]&Sel[2]&~Sel[1]&~Sel[0];//4
	assign Q18= ~Sel[4]&~Sel[3]&Sel[2]&~Sel[1]&Sel[0];//5
	assign Q17= ~Sel[4]&~Sel[3]&Sel[2]&Sel[1]&~Sel[0];//6
	assign Q16= ~Sel[4]&~Sel[3]&Sel[2]&Sel[1]&Sel[0];//7
	
	assign Q15= ~Sel[4]&Sel[3]&~Sel[2]&~Sel[1]&~Sel[0];//8
	assign Q14= ~Sel[4]&Sel[3]&~Sel[2]&~Sel[1]&Sel[0];//9
	assign Q13= ~Sel[4]&Sel[3]&~Sel[2]&Sel[1]&~Sel[0];//10
	assign Q12=	~Sel[4]&Sel[3]&~Sel[2]&Sel[1]&Sel[0];//11
	
	assign Q11= ~Sel[4]&Sel[3]&Sel[2]&~Sel[1]&~Sel[0];//12
	assign Q10= ~Sel[4]&Sel[3]&Sel[2]&~Sel[1]&Sel[0];//13
	assign Q9= ~Sel[4]&Sel[3]&Sel[2]&Sel[1]&~Sel[0];//14
	assign Q8= ~Sel[4]&Sel[3]&Sel[2]&Sel[1]&Sel[0];//15
	
	
	assign Q7= Sel[4]&~Sel[3]&~Sel[2]&~Sel[1]&~Sel[0];//16
	assign Q6= Sel[4]&~Sel[3]&~Sel[2]&~Sel[1]&Sel[0];//17
	assign Q5= Sel[4]&~Sel[3]&~Sel[2]&Sel[1]&~Sel[0];//18
	assign Q4= Sel[4]&~Sel[3]&~Sel[2]&Sel[1]&Sel[0];//19
	
	assign Q3= Sel[4]&~Sel[3]&Sel[2]&~Sel[1]&~Sel[0];//20
	assign Q2= Sel[4]&~Sel[3]&Sel[2]&~Sel[1]&Sel[0];//21
	assign Q1= Sel[4]&~Sel[3]&Sel[2]&Sel[1]&~Sel[0];//22
	assign Q0= Sel[4]&~Sel[3]&Sel[2]&Sel[1]&Sel[0];//23
	
	
	//cac ham se duoi se cho cac bit dich tuong ung voi ngo vao 
	assign Q[23]=F[23]&Q23;
	assign Q[22]=F[22]&Q23 | F[23]&Q22;
	assign Q[21]=F[21]&Q23 | F[22]&Q22 | F[23]&Q21;
	assign Q[20]=F[20]&Q23 | F[21]&Q22 | F[22]&Q21 | F[23]&Q20;
	assign Q[19]=F[19]&Q23 | F[20]&Q22 | F[21]&Q21 | F[22]&Q20 | F[23]&Q19;
	assign Q[18]=F[18]&Q23 | F[19]&Q22 | F[20]&Q21 | F[21]&Q20 | F[22]&Q19 |  F[23]&Q18;
	assign Q[17]=F[17]&Q23 | F[18]&Q22 | F[19]&Q21 | F[20]&Q20 | F[21]&Q19 |  F[22]&Q18 | F[23]&Q17;
	assign Q[16]=F[16]&Q23 | F[17]&Q22 | F[18]&Q21 | F[19]&Q20 | F[20]&Q19 |  F[21]&Q18 | F[22]&Q17 | F[23]&Q16;
	assign Q[15]=F[15]&Q23 | F[16]&Q22 | F[17]&Q21 | F[18]&Q20 | F[19]&Q19 |  F[20]&Q18 | F[21]&Q17 | F[22]&Q16 |  F[23]&Q15;
	assign Q[14]=F[14]&Q23 | F[15]&Q22 | F[16]&Q21 | F[17]&Q20 | F[18]&Q19 |  F[19]&Q18 | F[20]&Q17 | F[21]&Q16 |  F[22]&Q15 | F[23]&Q14;
	assign Q[13]=F[13]&Q23 | F[14]&Q22 | F[15]&Q21 | F[16]&Q20 | F[17]&Q19 |  F[18]&Q18 | F[19]&Q17 | F[20]&Q16 |  F[21]&Q15 | F[22]&Q14 | F[23]&Q13;
	assign Q[12]=F[12]&Q23 | F[13]&Q22 | F[14]&Q21 | F[15]&Q20 | F[16]&Q19 |  F[17]&Q18 | F[18]&Q17 | F[19]&Q16 |  F[20]&Q15 | F[21]&Q14 | F[22]&Q13 | F[23]&Q12;
	assign Q[11]=F[11]&Q23 | F[12]&Q22 | F[13]&Q21 | F[14]&Q20 | F[15]&Q19 |  F[16]&Q18 | F[17]&Q17 | F[18]&Q16 |  F[19]&Q15 | F[20]&Q14 | F[21]&Q13 | F[22]&Q12 | F[23]&Q11;
	assign Q[10]=F[10]&Q23 | F[11]&Q22 | F[12]&Q21 | F[13]&Q20 | F[14]&Q19 |  F[15]&Q18 | F[16]&Q17 | F[17]&Q16 |  F[18]&Q15 | F[19]&Q14 | F[20]&Q13 | F[21]&Q12 | F[22]&Q11 | F[23]&Q10;
	assign Q[9]=F[9]&Q23 | F[10]&Q22 | F[11]&Q21 | F[12]&Q20 | F[13]&Q19 |  F[14]&Q18 | F[15]&Q17 | F[16]&Q16 |  F[17]&Q15 | F[18]&Q14 | F[19]&Q13 | F[20]&Q12 | F[21]&Q11 | F[22]&Q10 | F[23]&Q9;
	assign Q[8]=F[8]&Q23 | F[9]&Q22 | F[10]&Q21 | F[11]&Q20 | F[12]&Q19 |  F[13]&Q18 | F[14]&Q17 | F[15]&Q16 |  F[16]&Q15 | F[17]&Q14 | F[18]&Q13 | F[19]&Q12 | F[20]&Q11 | F[21]&Q10 | F[22]&Q9 | F[23]&Q8;
	assign Q[7]=F[7]&Q23 | F[8]&Q22 | F[9]&Q21 | F[10]&Q20 | F[11]&Q19 |  F[12]&Q18 | F[13]&Q17 | F[14]&Q16 |  F[15]&Q15 | F[16]&Q14 | F[17]&Q13 | F[18]&Q12 | F[19]&Q11 | F[20]&Q10 | F[21]&Q9 | F[22]&Q8 | F[23]&Q7;
	assign Q[6]=F[6]&Q23 | F[7]&Q22 | F[8]&Q21 | F[9]&Q20 | F[10]&Q19 |  F[11]&Q18 | F[12]&Q17 | F[13]&Q16 |  F[14]&Q15 | F[15]&Q14 | F[16]&Q13 | F[17]&Q12 | F[18]&Q11 | F[19]&Q10 | F[20]&Q9 | F[21]&Q8 | F[22]&Q7 | F[23]&Q6; 
	assign Q[5]=F[5]&Q23 | F[6]&Q22 | F[7]&Q21 | F[8]&Q20 | F[9]&Q19 |  F[10]&Q18 | F[11]&Q17 | F[12]&Q16 |  F[13]&Q15 | F[14]&Q14 | F[15]&Q13 | F[16]&Q12 | F[17]&Q11 | F[18]&Q10 | F[19]&Q9 | F[20]&Q8 | F[21]&Q7 | F[22]&Q6 | F[23]&Q5; 
	assign Q[4]=F[4]&Q23 | F[5]&Q22 | F[6]&Q21 | F[7]&Q20 | F[8]&Q19 |  F[9]&Q18 | F[10]&Q17 | F[11]&Q16 |  F[12]&Q15 | F[13]&Q14 | F[14]&Q13 | F[15]&Q12 | F[16]&Q11 | F[17]&Q10 | F[18]&Q9 | F[19]&Q8 | F[20]&Q7 | F[21]&Q6 | F[22]&Q5 | F[23]&Q4;
	assign Q[3]=F[3]&Q23 | F[4]&Q22 | F[5]&Q21 | F[6]&Q20 | F[7]&Q19 |  F[8]&Q18 | F[9]&Q17 | F[10]&Q16 |  F[11]&Q15 | F[12]&Q14 | F[13]&Q13 | F[14]&Q12 | F[15]&Q11 | F[16]&Q10 | F[17]&Q9 | F[18]&Q8 | F[19]&Q7 | F[20]&Q6 | F[21]&Q5 | F[22]&Q4 | F[23]&Q3;
	assign Q[2]=F[2]&Q23 | F[3]&Q22 | F[4]&Q21 | F[5]&Q20 | F[6]&Q19 |  F[7]&Q18 | F[8]&Q17 | F[9]&Q16 |  F[10]&Q15 | F[11]&Q14 | F[12]&Q13 | F[13]&Q12 | F[14]&Q11 | F[15]&Q10 | F[16]&Q9 | F[17]&Q8 | F[18]&Q7 | F[19]&Q6 | F[20]&Q5 | F[21]&Q4 | F[22]&Q3 |F[23]&Q2; 
	assign Q[1]=F[1]&Q23 | F[2]&Q22 | F[3]&Q21 | F[4]&Q20 | F[5]&Q19 |  F[6]&Q18 | F[7]&Q17 | F[8]&Q16 |  F[9]&Q15 | F[10]&Q14 | F[11]&Q13 | F[12]&Q12 | F[13]&Q11 | F[14]&Q10 | F[15]&Q9 | F[16]&Q8 | F[17]&Q7 | F[18]&Q6 | F[19]&Q5 | F[20]&Q4 | F[21]&Q3 |F[22]&Q2 | F[23]&Q1;
	assign Q[0]=F[0]&Q23 | F[1]&Q22 | F[2]&Q21 | F[3]&Q20 | F[4]&Q19 |  F[5]&Q18 | F[6]&Q17 | F[7]&Q16 |  F[8]&Q15 | F[9]&Q14 | F[10]&Q13 | F[11]&Q12 | F[12]&Q11 | F[13]&Q10 | F[14]&Q9 | F[15]&Q8 | F[16]&Q7 | F[17]&Q6 | F[18]&Q5 | F[19]&Q4 | F[20]&Q3 |F[21]&Q2 | F[22]&Q1 |  F[23]&Q0;

	
endmodule
	
	
	
	
	
	
	
	