!CORRECTORS
!  March 2003

! orblancog .2016.09 hkick and vkick calculation
cvhon = 1; !! turn on correctors

! DAFNE Technical Note : C-17, 
!   Horizontal/Vertical correctors, pag.~8
!   CHVTM001÷004, CHVTT001÷004, CHV, CHVTL001÷003, CHVTR001÷003
!   (e) X = \alpha*E = 1.2475e-5*I + 1.011e-6
! \alpha [rad], E [GeV], I [A]
! For small angles \alpha, KICK = X / E
! Note : kickers  are of zero length
cerr: kicker,hkick=.00,vkick=.001;
ccvtall1 = cvhon*1.2475e-5;
ccvtall2 = cvhon*1.011e-6;

!INJECTION LINAC -> ACCUMULATOR
 CHVTM001: kicker,
 	   hkick:= 1/en * ccvtall1*CHHTM001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTM001 + ccvtall2;
 CHVTM002: kicker,
 	   hkick:= 1/en * ccvtall1*CHHTM002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTM002 + ccvtall2;
 CHVTM003: kicker,
 	   hkick:= 1/en * ccvtall1*CHHTM003 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTM003 + ccvtall2;
 CHVTM004: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTM004 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTM004 + ccvtall2;
 CHVTT005: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTT005 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT005 + ccvtall2;
 CHVTT004: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTT004 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT004 + ccvtall2;
 CHVTT003: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTT003 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT003 + ccvtall2;
 CHVTT002: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTT002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT002 + ccvtall2;
 CHVTT001: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTT001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT001 + ccvtall2;
 CHVTL003: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTL003 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTL003 + ccvtall2;
 CHVTL002: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTL002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTL002 + ccvtall2;
 CHVTL001: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTL001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTL001 + ccvtall2;
 CHVTR001: kicker,
 	   hkick:= 1/en * ccvtall1*CHHTR001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTR001 + ccvtall2;
 CHVTR002: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTR002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTR002 + ccvtall2;
 CHVTR003: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTR003 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTR003 + ccvtall2;


! ! EXTRACTION ACCUMULATOR -> DAFNE MRe-???
! The commented kickers are already defined and are 
! left here as info :
! CHVTT001: kicker,
! CHVTT002: kicker,
! CHVTT003: kicker,
! CHVTT004: kicker,
! CHVTT005: kicker,
 CHVTT006: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTT006 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT006 + ccvtall2;
 CHVTT007: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTT007 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT007 + ccvtall2;
 CHVTT008: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTT008 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT008 + ccvtall2;
 CHVTT009: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTT009 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT009 + ccvtall2;
 CHVTT010: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTT010 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTT010 + ccvtall2;
!EXTRACTION ACCUMULATOR -> DAFNE MRe-
 CHVTE001: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTE001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE001 + ccvtall2;
 CHVTE002: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTE002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE002 + ccvtall2;
 CHVTE003: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTE003 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE003 + ccvtall2;
 CHVTE004: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTE004 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE004 + ccvtall2;
 CHVTE005: kicker,
   	   hkick:= 1/en * ccvtall1*CHHTE005 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE005 + ccvtall2;
 CHVTE006: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTE006 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTE006 + ccvtall2;

!mb added
 CHVTP001: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTP001 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTP001 + ccvtall2;
 CHVTP002: kicker,
  	   hkick:= 1/en * ccvtall1*CHHTP002 + ccvtall2,
	   vkick:= 1/en * ccvtall1*CVVTP002 + ccvtall2;

!in ED1
ker5:kicker,hkick=-0.00;
! in ED3
ker1:kicker,vkick=0.00;
ker2:kicker,vkick=0.00;
!in ED5
ker3:kicker,vkick=0.00;
ker4:kicker,vkick=0.00;
! in ED7
ker6:kicker,vkick=0.;
ker7:kicker,vkick=-0.;
mst:marker;

RETURN;
