//module nay dung de tinh toan
module add_sub_floating(A, B, Cin, Cout, Fout1, Fout2, Fout3, Fout4, Fout5, Fout6, Fout7, Fout8);
	input [31:0] A,B; //so float ngo vao
	input Cin; //co nho ngo vao
	output [23:0] Fout1, Fout2, Fout3, Fout4, Fout5, Fout6, Fout7, Fout8;//so float ngo ra
	output Cout;
	wire [22:0] Fr_A, Fr_B;//la 23 bit phan fraction cua A, B 
	wire [7:0] Exp_A, Exp_B;//8 bit mu 
	wire Sign_A, Sign_B;//la phan dau cua A,B
	
	
	wire [23:0] Full_A, Full_B; //la so day du phan nguyen va phan thap phan 1.xxxx, co tong la 24 bit 
								 
	
	//phan tach cac thanh phan cua ngo vao cho thuan tien tinh toan 
	assign Sign_A=A[31];
	assign Sign_B=B[31];
	assign Exp_A=A[30:23];
	assign Exp_B=B[30:23];
	assign Fr_A=A[22:0];
	assign Fr_B=B[22:0];
	
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
	CLA28bits  CLA1(.A(Exp_A_wide), .B(Exp_B_wide_bu2), .Ci(1'b0), .F(Exp_delta_A));// truong hop A>B
	CLA28bits  CLA2(.A(Exp_B_wide), .B(Exp_A_wide_bu2),.Ci(1'b0), .F(Exp_delta_B));//truong hop A<B
	
	
	//lay bit MSB cua Exp_delta_A de kiem tra la am hay duong 
	wire compare;
	assign compare=Exp_delta_A[23];
	//cac ngo ra cua cac truong hop tinh toan 
//	wire [23:0] Fout1, Fout2, Fout3, Fout4, Fout5, Fout6, Fout7, Fout8;
	
	//------------------------------------------------------------------------------------------------------------------------------------	
	//Truong hop A>B co nghia la Exp_delta_A>0 , do do khong can doi bu 2 Exp_delta_A va Full_B phai dich phai Exp_delta_A lan
	//sau do cat đi Full_A, Full_B chuan 24 bit de thuc hien phep cong, tru 

	
	//wire [11:0] Increase_Exp_delta_A_23;//de tang Exp_delta_A lenh 23 don vi va tang do chenh lenh len 23 don vi
	
	//CLA28bits #(.size(12)) CLA3(.A(Exp_delta_A), .B(12'b000000010111), .Ci(1'b0), .F(Increase_Exp_delta_A_23));// tang Exp_delta_A len 23 don vi 
	
	//thuc hien dich bit sang phai doi voi Full_B
	//wire [45:0] Shift_B;//khai bao them bien de bien doi B  de thuc hien tinh toan 
	//assign Shift_B[23:0]=Full_B;//
	//wire [22:0] Wide_bit;//bien luu tru bit 0 de mo rong, dich bit 
	//assign Wide_bit=23'd0;
	//translate #(.size2(22), .size1(0), .size4(Increase_Exp_delta_A_23), .size3(24)) trans1(.X(Wide_bit), .F(Shift_B));// them bit 0 cho Shift_B=000Full_B
	//wire [23:0] Final_B;//gia tri cua 24 bit o ngo vao Full_B da duoc dich bit va chuan 24 bit de tinh toan duoc gan vao Final_B
	//translate #(.size2(Increase_Exp_delta_A_23), .size1(Exp_delta_A), .size4(23), .size3(0)) trans1(.X(Shift_B), .F(Final_B));//lay du 23 bit tu trai qua phải o Shift_B gan cho Final_B
	
	
	wire [23:0] Shift_B;//bien luu tru cua B khi bi dich sang phai 
	shift24bit sh1(.Sel(Exp_delta_A[4:0]), .F(Full_B), .Q(Shift_B));//dich Full_B sang Exp_delta_A bit 
	
	//thuc hien phep toan cua hai so: A + B; A - (-B); va ket qua la duong 
	CLA28bits CLA3(.A(Full_A), .B(Shift_B),.Ci(1'b0), .F(Fout1));
	
	//thuc hien phep: -A+B; -A - (-B), -A+B do do ta thuc hien A-B, va xem nhu ket qua am 
	Sub28bits  Sub1(.A(Full_A), .B(Shift_B),.Ci(1'b0), .F(Fout2));
	
	
	//thuc hien phep toan: -A -B; -A + -B va ket qua la am (xet dau truoc khi xuat)
	CLA28bits  CLA4(.A(Full_A), .B(Shift_B),.Ci(1'b0), .F(Fout3));
	
	//thuc hien phep toan: A-B, A+ (-B)
	Sub28bits Sub2(.A(Full_A), .B(Shift_B),.Ci(1'b0), .F(Fout4));
//-----------------------------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------------------------
//Truong hop A<B co nghia la Exp_delta_A<0 , do do khong can doi bu 2 Exp_delta_B va Full_A phai dich phai Exp_delta_B lan
	//sau do chuan hoa  Full_A thanh  24 bit de thuc hien phep cong, tru 

	
	//wire [11:0] Increase_Exp_delta_B_23;//de tang Exp_delta_B lenh 23 don vi va tang do chenh lenh len 23 don vi
	
	//CLA28bits #(.size(12)) CLA3(.A(Exp_delta_A), .B(12'b000000010111), .Ci(1'b0), .F(Increase_Exp_delta_B_23));// tang Exp_delta_B len 23 don vi 
	
	//thuc hien dich bit sang phai doi voi Full_A
	//wire [45:0] Shift_A;//bao them bien de bien doi A de thuc hien tinh toan 
	//assign Shift_A[23:0]=Full_A;//gan Shift_A cho so hang lon hon 
	//assign Shift_B[23:0]=Full_B;//
	//wire [22:0] Wide_bit;//bien luu tru bit 0 de mo rong, dich bit 
	//assign Wide_bit=23'd0;
	//translate #(.size2(22), .size1(0), .size4(Increase_Exp_delta_B_23), .size3(24)) trans1(.X(Wide_bit), .F(Shift_A));// them bit 0 cho Shift_A=000Full_A
	//wire [23:0] Final_A;//gia tri cua 24 bit o ngo vao Full_A da duoc dich bit va chuan 24 bit de tinh toan duoc gan vao Final_A
	//translate #(.size2(Increase_Exp_delta_B_23), .size1(Exp_delta_B), .size4(23), .size3(0)) trans1(.X(Shift_A), .F(Final_A));//lay du 23 bit tu trai qua phải o Shift_A gan cho Final_A
	
	
	wire [23:0] Shift_A;//bien luu tru cua Full_A khi bi dich sang phai 
	shift24bit sh2(.Sel(Exp_delta_B[4:0]), .F(Full_A), .Q(Shift_A));//dich Full_A sang Exp_delta_B bit 
	
	//thuc hien phep toan cua hai so: A + B; A - (-B); va ket qua la duong 
	CLA28bits CLA5(.A(Full_B), .B(Shift_A),.Ci(1'b0), .F(Fout5));
	
	//thuc hien phep: -A+B; -A - (-B), do do ta thuc hien B-A, va ket qua duong 
	Sub28bits  Sub6(.A(Full_B), .B(Shift_A),.Ci(1'b0), .F(Fout6));
	
	
	//thuc hien phep toan: -A -B; -A + -B va thuc hien phep toan A+B ,ket qua la am (xet dau truoc khi xuat)
	CLA28bits CLA7(.A(Full_B), .B(Shift_A),.Ci(1'b0), .F(Fout7));
	
	//thuc hien phep toan: A-B, A+ (-B) doi lai B-A va ket qua am 
	Sub28bits  Sub8(.A(Full_B), .B(Shift_A),.Ci(1'b0), .F(Fout8));
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------
	
endmodule 	
	
	
	
	
	
	
	
	