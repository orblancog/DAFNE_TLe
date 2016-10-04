! DRIFT SECTION
!  25/03/2003

 D0:DRIFT ,L=0.;

!cambiamento del 28.1.93;
!******* START LIE1
 DL0:DRIFT ,L=1.000;
 DL1:DRIFT ,L=0.530;
 DL2:DRIFT ,L=2.620;
 DL3:DRIFT ,L=2.920;
 DL4:DRIFT ,L=.256;
 DL4A:DRIFT ,L=2.944;
 DL4A1:DRIFT ,L=2.944-0.015;
 DL4A2:DRIFT ,L=0.015;
!cambiamento del 12.4.94;
 DL5:DRIFT ,L=.428;
 DL5A:DRIFT ,L=.189;
!******* END LIE1

! START LIE2
 DL5A1:DRIFT ,L=1.185;
 DL5A2:DRIFT ,L=3.852;
 DL5A22:DRIFT ,L=.256;
 DL5B:DRIFT,L=0.4;
 dritm006        :drift l =     0.2000 ;
 DL6:DRIFT ,L=0.60;
 DL8A:DRIFT ,L=0.19;
 DL8:DRIFT ,L=0.51;
 DL9:DRIFT ,L=1.351;
! END LIE2 

! Drifts 

! ACCUMUL.SEPTUM - TR ;
 D1:DRIFT ,L=0.390;
 D2:DRIFT ,L=0.4754;
 D3:DRIFT ,L=0.277;

! Vertical chicane drifts  TL;

 D4:DRIFT ,L=.231;
 D4A:DRIFT ,L=.318;
 D5:DRIFT ,L=.543;
 D6:DRIFT ,L=.256;
 D6A:DRIFT ,L=.294;
 D7:DRIFT ,L=.55;
 D8:DRIFT ,L=1.267;
 D8A:DRIFT ,L=0.256;
 D9:DRIFT ,L=0.963;

!4 beams line drifts TT-LLE3;
 D10:DRIFT ,L=1.772;
 D11:DRIFT ,L=.256;
 D11A:DRIFT ,L=1.714;
 D12:DRIFT ,L=.256;
 D12A:DRIFT ,L=.594;
 D12B:DRIFT ,L=.85;
 D13:DRIFT ,L=.256;
 D13A:DRIFT ,L=1.444;
 D14:DRIFT ,L=.256;
 D14A:DRIFT ,L=1.789;
 D15:DRIFT ,L=1.65;

! wall drifts TT-LLE4;
 D16:DRIFT ,L=0.561;
 D16A:DRIFT ,L=4.189;
 D17:DRIFT ,L=4.349;

! drifts for injection into Dafne;
 DQ: DRIFT,L=0.2;
 D20A:DRIFT,L=0.4;
 D20B:DRIFT,L=0.475;
 D18A:DRIFT ,L=1.081-.834;
 D18B:DRIFT ,L=.834;
 D19:DRIFT ,L=0.424;
 D20:DRIFT ,L=0.457;


 D21A:DRIFT ,L=2.5-0.256;
 D21B:DRIFT ,L=0.256;
 D22:DRIFT ,L=2.387;
 D23A:DRIFT ,L=0.907-.256;
 D23B:DRIFT ,L=0.256;
 D24:DRIFT ,L=1.109;

 D25A:DRIFT ,L=1.418;
 D25B:DRIFT ,L=2.007-1.418;
 D26A:DRIFT ,L=2.14;              !close to QUATT011
 D26B:DRIFT ,L= 1.237;  ! Catia 3.696-2.14
 d26a1:drift,l=1.995;   ! Catia1.3
 d26a2:drift,l= .264;   ! Catia  2.14-1.3 -0.2


! TP
 D27:DRIFT ,L=1.863-0.45;
 D28:DRIFT ,L=1.884+0.45;
 D29:DRIFT ,L=1.884;
 D30:DRIFT ,L=1.708389;
 D31:DRIFT ,L=1.227;
 D32:DRIFT ,L=1.212023;
 D33:DRIFT ,L=0.390536;
 D34:DRIFT ,L=0.0;
! END TP;

! TE
 D51:DRIFT ,L=4.069;
 D52A:DRIFT ,L=1.302;
 D52B:DRIFT ,L:=1.558-1.302;
 D53:DRIFT ,L=1.56;
 D54:DRIFT ,L=1.88884;
 D55A:DRIFT ,L=1.055;
 D55B:DRIFT ,L:=1.775-1.055;
 D56:DRIFT ,L= 2.105; !  Catia 2.105
 D57A:DRIFT ,L:= 3.2-.256; ! Catia  3.2-.256
 D57B:DRIFT ,L=.256;
 D58:DRIFT ,L=  0.; ! Catia 2.65
 d158:drift,l= 3.745 ; ! Catia 2.5
 d159: drift,l= 3.972721; ! Catia 3.927721
 D59:DRIFT ,L= 4.21; ! Catia 2.85

 D60A:DRIFT ,L=.256;
 D60B:DRIFT ,L:=3.0-0.256;  ! Catia 3.0-0.256
 D61:DRIFT ,L:=1.44516+.005879;  ! Catia  1.451
 D62:DRIFT ,L=0.822640;


 D63:DRIFT ,L=0.773;
 D64A:DRIFT ,L:=0.87-0.256;
 D64B:DRIFT ,L=0.256;
 D65:DRIFT ,L=0.786;
 D66A:DRIFT ,L:=1.358-0.7;
 D66B:DRIFT ,L=0.7;
 D67:DRIFT ,L=1.76;
 D68:DRIFT ,L=0.213;
!D68:DRIFT ,L=0.07319;
 D69:DRIFT ,L=0.390536;
 D70:DRIFT ,L=0.;
! end TE


! DQ: DRIFT ,L=0.2; already defined

! DRIFT in the range LtoPM;

 DLTM0       :drift, l=1.000+0.950;
 DLTM1       :drift, l=0.530;
 DLTM2       :drift, l=2.570;
 DLTM3       :drift, l=2.820;
 DLTM4       :drift, l=0.206;
 DLTM5       :drift, l=1.902;
 DLTM6       :drift, l=0.632;
 DLTM7       :drift, l=0.300;
 DLTM8       :drift, l=0.377;
 DLTM9A      :drift, l=1.021;
 DLTM9B      :drift, l=0.880;
 DLTM9C      :drift, l=3.4858;
! DLTM9       :drift, l=5.3868;
 DLTM10      :drift, l=0.646;
 DLTM11      :drift, l=0.600;
 DLTM12      :drift, l=2.810;
 
RETURN;
