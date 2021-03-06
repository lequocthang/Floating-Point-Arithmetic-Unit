//module lua chon va xuat ket qua
module Brain(O, A, B, Cin, Cout, Fout);
	input [31:0] A, B;//ngo vao 32 bit
	input O;// O=0: phep cong
			 // O=1: phep tru
	input Cin; //co nho ngo vao
	output [31:0] Fout;//so float ngo ra
	output Cout;
	//wire [22:0] Fr_A, Fr_B;//la 23 bit phan fraction cua A, B 
	wire [7:0] Exp_A, Exp_B;//8 bit mu 
	wire Sign_A, Sign_B;//la phan dau cua A,B
	
	
	//wire [23:0] Full_A, Full_B; //la so day du phan nguyen va phan thap phan 1.xxxx, co tong la 24 bit 
								 
	
	//phan tach cac thanh phan cua ngo vao cho thuan tien tinh toan 
	assign Sign_A=A[31];
	assign Sign_B=B[31];
	assign Exp_A=A[30:23];
	assign Exp_B=B[30:23];
	wire [23:0] Full_A, Full_B; //la so day du phan nguyen va phan thap phan 1.xxxx, co tong la 24 bit 
	
	assign Full_A[23]= 2'b01; //them bit 1 da chuan hoa 
	assign Full_B[23]= 2'b01; //them bit 1 da chuan hoa 
	assign Full_A[22:0]= A[22:0]; //gan  23 bit thap phan 
	assign Full_B[22:0]= B[22:0]; //gan 23 bit thap phan 
	

	
	//thuc hien so sanh phan Exp cua hai so A,B
	wire [23:0] Exp_A_wide, Exp_B_wide;//mo rong Exp moi so la 4 bit 
	assign Exp_A_wide[23:8]=24'b0; // mo rong 16 bit 
	assign Exp_A_wide[7:0]=Exp_A;//co dang Exp_A_wide= 0000Exp_A
	assign Exp_B_wide[23:8]=24'b0; // mo rong 16 bit 
	assign Exp_B_wide[7:0]=Exp_B;//co dang Exp_A_wide= 0000Exp_A
	
	wire [23:0] Exp_A_wide_bu2, Exp_B_wide_bu2, Exp_delta_A, Exp_delta_B;
	
	bu2_28bit  bu1(.X(Exp_A_wide), .Bu_2(Exp_A_wide_bu2)); //lay bu 2 cua Exp_A_wide
	bu2_28bit  bu2(.X(Exp_B_wide), .Bu_2(Exp_B_wide_bu2)); //lay bu 2 cua Exp_B_wide
	
	
	
	//thuc hien phep tru so mu de biet sai so la bao nhieu, va de xet coi am hay duong thi chi xet bit MSB
	wire cc1,cc2,dogg1, dogg2,r;
	wire [23:0] diA_B;
	wire [7:0] w;
	CLA28bits  CLA1(.A(Exp_A_wide), .B(Exp_B_wide_bu2), .Ci(1'b0), .F(Exp_delta_A));// truong hop A>B
	CLA28bits  CLA2(.A(Exp_B_wide), .B(Exp_A_wide_bu2),.Ci(1'b0), .F(Exp_delta_B));//truong hop A<B
	
	Sub28bits u10000(.A(Full_A), .B(Full_B), .Ci(1'b0), .Co(cc1), .F(diA_B));
	Sub8bits u20000(.A(Exp_A), .B(Exp_B), .Ci(1'b0), .Co(cc2), .F(w));
	
	assign dogg1 = diA_B[23] | diA_B[22] | diA_B[21] | diA_B[20] | diA_B[19] | diA_B[18] | diA_B[17] | diA_B[16] 
			| diA_B[15] | diA_B[14] | diA_B[13] | diA_B[12] | diA_B[11] | diA_B[10] | diA_B[9] | diA_B[8] 
			| diA_B[7] | diA_B[6] | diA_B[5] | diA_B[4] | diA_B[3] | diA_B[2] | diA_B[1] | diA_B[0] ;
	assign dogg2 = w[7] | w[6] | w[5] | w[4] | w[3] | w[2] | w[1] | w[0] ;
	assign r=~dogg2 & dogg1 | dogg2& Exp_delta_A[8];
	
	
	
	//lay bit MSB cua Exp_delta_A de kiem tra la am hay duong 
	//wire compare;
	//assign compare=Exp_delta_A[23];		 
//--------------------------------------------------------------------------
wire [23:0] Fout1, Fout2, Fout3, Fout4, Fout5, Fout6, Fout7, Fout8, Fout9;//cac signal de luu cac ket qua tinh toan cho tung truong hop
add_sub_floating u1(.A(A), .B(B), .Cin(Cin), .Cout(Cout), .Fout1(Fout1), .Fout2(Fout2), .Fout3(Fout3), .Fout4(Fout4), .Fout5(Fout5), .Fout6(Fout6), .Fout7(Fout7), .Fout8(Fout8));
Mux4to1 u2(.s(r), .a(Sign_A), .b(Sign_B), .o(O), .F1(Fout1), .F2(Fout2), .F3(Fout3), .F4(Fout4), .F5(Fout5), .F6(Fout6), .F7(Fout7) ,.F8(Fout8), .Fout(Fout9));

wire [4:0] count; //so lan can dich sang trai
Counter_23bit_1 u3(.F(Fout9), .count(count));
wire [23:0] Fout_main;//sau khi thuc hien dich sang trai va la ngo ra ket qua
shift_left u4(.Sel(count), .F(Fout9), .Q(Fout_main));

wire [23:0] Exp_final;//ket qua phan exponent sau khi thuc hien tru voi phan dich trai
wire [23:0] select;

	assign select[23]=Exp_delta_A[8];
	assign select[22]=Exp_delta_A[8];
	assign select[21]=Exp_delta_A[8];
	assign select[20]=Exp_delta_A[8];
	
	assign select[19]=Exp_delta_A[8];
	assign select[18]=Exp_delta_A[8];
	assign select[17]=Exp_delta_A[8];
	assign select[16]=Exp_delta_A[8];
	
	assign select[15]=Exp_delta_A[8];
	assign select[14]=Exp_delta_A[8];
	assign select[13]=Exp_delta_A[8];
	assign select[12]=Exp_delta_A[8];
	
	assign select[11]=Exp_delta_A[8];
	assign select[10]=Exp_delta_A[8];
	assign select[9]=Exp_delta_A[8];
	assign select[8]=Exp_delta_A[8];
	
	assign select[7]=Exp_delta_A[8];
	assign select[6]=Exp_delta_A[8];
	assign select[5]=Exp_delta_A[8];
	assign select[4]=Exp_delta_A[8];
	
	assign select[3]=Exp_delta_A[8];
	assign select[2]=Exp_delta_A[8];
	assign select[1]=Exp_delta_A[8];
	assign select[0]=Exp_delta_A[8];

	assign Exp_final=Exp_A_wide&~select | Exp_B_wide&select;
	
wire [23:0] Exp_main;//thanh phan exponent chinh duoc xuat ra lam ket qua
wire [23:0] count_wide;//mo rong 19 bit cho count
assign count_wide[4:0]=count;
assign count_wide[23:5]=19'd0;
wire [23:0] coo1;
Sub28bits u5(.A(Exp_final), .B(count_wide), .Ci(1'b0), .Co(coo1), .F(Exp_main));

wire Sign_main;//dau ngo ra ket qua ngo ra
//assign Sign_main= ~Exp_delta_A[8]&Sign_A | Sign_A&Sign_B&~O | Sign_A&~Sign_B&O | Exp_delta_A[8]&~Sign_A&O;
assign Sign_main = ~O&Sign_B&r | O&~Sign_B&r | Sign_A&~r;



assign Fout[31]=Sign_main;//dau ket qua
assign Fout[30:23]= Exp_main[7:0];//thanh phan exponent ngo ra
assign Fout[22:0]=Fout_main[22:0];//ngo ra thanh phan thap phan


endmodule






