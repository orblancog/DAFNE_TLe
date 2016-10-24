! March '03
!dipoles 
!beam out EXTRACTION ELECTRONS FROM ACCUM. TO TR

! orblancog. 2016.09 Maybe this is the first magnet ???
! DAFNE Technical Note : C-17 pag.~6, MM-7 pag.~2
!   Dipoles SPTA1001, SPTA2001
!   \alpha = 0.038 (2.177°), L nom = 0.623, I nom=1811.2
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2001 := 1/4*0.623;
MANGSPTA2001 := LSPTA2001*clight/(1e9*en)*1e-4*(0.565*SPTA2001-2.9); !magnetic angle
PANGSPTA2001 := 1/4*43.63e-3;!physical angle, tech.note.I-7, pag~13. ???  i thought it was 0.038
SPTA2001 : SBEND,L:=LSPTA2001,ANGLE:=MANGSPTA2001;
 ! fake kicker to match the physical angle in the TL
SPTA2001K: KICKER,L=0,HKICK:=PANGSPTA2001 - MANGSPTA2001;
!value, spta2001k->hkick*4;
!value, spta2001->angle*4;
!stop;

! 2003 data
! SPTA2002: SBEND,L=.623,ANGLE=.0349066; 
! Strangely enough... SPTA2001 has the length of SPTTL001, SPTTR001
! SPTA2001: SBEND,L=1.233,ANGLE=.593411946;
! \alpha = 0.5934 (34°), L nom = 1.233
! orblancog. 2016.10
! DAFNE Technical Note : MM-7, pag.~2
!   \alpha = 0.038 (2.177°), L nom = 0.623+/-0.00025
! \alpha [rad], L [m]
! Fitting Figure~3 with engauge-digitizer+gnuplot : 
!   gives f(x[Gauss])=a*x[A]+b , 1Gauss=1e-4[T]
! Final set of parameters            Asymptotic Standard Error
! =======================            ==========================
! a               = 0.564897         +/- 0.00066      (0.1168%)
! b               = -2.94169         +/- 0.901        (30.63%)
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
!LSPTA2002 := 0.623;
!MANGSPTA2002 := LSPTA2002*clight/(1e9*en)*1e-4*(0.565*SPTA2002-2.9); !magnetic angle
!PANGSPTA2002 := 0.038; !physical angle
!SPTA2002 : SBEND,L:=LSPTA2002,ANGLE:=MANGSPTA2002;
! fake kicker to match the physical angle in the TL
!SPTA2002K: KICKER,L=0,HKICK:=PANGSPTA2002 - MANGSPTA2002;
!value, spta2002k->hkick;
!value, spta2002->angle;
!stop;
! orblancog. 2016.10 Maybe this magnet is SPTTR001 after all ???
! DAFNE Technical Note : C-17, pag.~5
!   \alpha = 0.5934 (34°), L nom = 1.233, I nom=2082.1
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2002 := 1/60*1.233;
MANGSPTA2002 := LSPTA2002*clight/(1e9*en)*(3.9324e-4*abs(SPTA2002)); !magnetic angle
PANGSPTA2002 := 1/60*0.5934; !physical angle
SPTA2002 : SBEND,L:=LSPTA2002,ANGLE:=MANGSPTA2002;
! fake kicker to match the physical angle in the TL
SPTA2002K: KICKER,L=0,HKICK:=PANGSPTA2002 - MANGSPTA2002;
!value, spta2002k->hkick*60;
!value, spta2002->angle*60;
!stop;


! vertical magnet
! DVRTR001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;     ! Bends downward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom=100.19
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTR001 := 1/20*0.35;
if (abs(DVRTR001) <= 60){
MANGDVRTR001 := LDVRTR001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTR001));}
else{MANGDVRTR001 := LDVRTR001*clight/(1e9*en)*(-1.7718e-10*DVRTR001^4 + 9.0349e-7*abs(DVRTR001)^3 - 2.8357e-4*DVRTR001^2 + 3.4797e-2*abs(DVRTR001) - 0.59817);
};
PANGDVRTR001 := 1/20*0.192; !physical angle
DVRTR001 : SBEND,L:=LDVRTR001,TILT:=TWOPI/4,ANGLE:=MANGDVRTR001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTR001K: KICKER,L=0,VKICK:=PANGDVRTR001 - MANGDVRTR001;
!value, dvrtr001k->vkick*20;
!value, dvrtr001->angle*20;
!stop;


!DVRTR002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;  ! Bends upward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR002
!   \alpha = 0.192 (11°), L nom = 0.35, I nom=100.19
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTR002 := 1/20*0.35;
if (abs(DVRTR002) <= 60){
MANGDVRTR002 := -1*LDVRTR002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTR002));}
else{MANGDVRTR002 := -1*LDVRTR002*clight/(1e9*en)*(-1.7718e-10*DVRTR002^4 + 9.0349e-7*abs(DVRTR002)^3 - 2.8357e-4*DVRTR002^2 + 3.4797e-2*abs(DVRTR002) - 0.59817);
};
PANGDVRTR002 := -0.192*1/20; !physical angle
DVRTR002 : SBEND,L:=LDVRTR002,TILT:=TWOPI/4,ANGLE:=MANGDVRTR002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTR002K: KICKER,L=0,VKICK:=PANGDVRTR002 - MANGDVRTR002;
!value, dvrtr002k->vkick*20;
!value, dvrtr002->angle*20;
!stop;



!Y  magnet for e- extraction  beam out  FROM ACCUMULATOR
!  DHYTT001: SBEND,L=1.,E1=-.6283185308,ANGLE=-.6283185308;  !TE1,TTP1
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHYTT001
!   \alpha = 0.62832 (36°), L nom = 1, I nom=95.34
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHYTT001 := 1.*1/80;
MANGDHYTT001 := -1*LDHYTT001*clight/(1e9*en)*(3.8349e-3 + 1.1171e-2*abs(DHYTT001));
PANGDHYTT001 := -0.62832*1/80; !physical angle
DHYTT001 : SBEND,L:=LDHYTT001,ANGLE:=MANGDHYTT001,E1=-.6283185308;!magnetic angle
! fake kicker to match the physical angle in the TL
DHYTT001K: KICKER,L=0,hKICK:=PANGDHYTT001 - MANGDHYTT001;
!value, DHYTT001k->hkick*80;
!value, DHYTT001->angle*80;
!stop;



! Bends upward ???
VBM: SBEND,L=.35,TILT:= pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;
! Bends downwstiltard ???
VBP: SBEND,L=.35,TILT:= pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;


! DHPTT001: SBEND, L = 1.113, ANGLE = 0.785398163;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHPTT001
!   \alpha = 0.7854 (45°), L nom = 1.113, I nom=570.81
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHPTT001 := 1/80*1.113;
if (abs(DHPTT001) <= 300){
  MANGDHPTT001 := LDHPTT001*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHPTT001));}
else {
  MANGDHPTT001 := LDHPTT001*clight/(1e9*en)*(-1.3699e-13*DHPTT001^4 + 3.7969e-9*abs(DHPTT001)^3 - 7.7012e-6*(DHPTT001)^2 + 6.2805e-3*abs(DHPTT001) - 0.56665);};
PANGDHPTT001 := 1/80*0.7854; !physical angle
DHPTT001 : SBEND,L:=LDHPTT001,ANGLE:=MANGDHPTT001;!magnetic angle
! fake kicker to match the physical angle in the TL
DHPTT001K: KICKER,L=0,hKICK:=PANGDHPTT001 - MANGDHPTT001;
!value, DHPTT001k->hkick*80;
!value, DHPTT001->angle*80;
!stop;!


! DHPTT002: SBEND, L = 1.113, ANGLE = -0.785398163;
! orblancog. 2016.10 I suppose this is equal to DHPTT001, with neg angle
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHPTT001
!   \alpha = 0.7854 (45°), L nom = 1.113, I nom=570.81
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHPTT002 := 1/80*1.113;
if (abs(DHPTT002) <= 300){
  MANGDHPTT002 := -1*LDHPTT002*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHPTT002));}
else {
  MANGDHPTT002 := -1*LDHPTT002*clight/(1e9*en)*(-1.3699e-13*DHPTT002^4 + 3.7969e-9*abs(DHPTT002)^3 - 7.7012e-6*(DHPTT002)^2 + 6.2805e-3*abs(DHPTT002) - 0.56665);};
PANGDHPTT002 := -0.7854*1/80; !physical angle
DHPTT002 : SBEND,L:=LDHPTT002,ANGLE:=MANGDHPTT002;!magnetic angle
! fake kicker to match the physical angle in the TL
DHPTT002K: KICKER,L=0,hKICK:=PANGDHPTT002 - MANGDHPTT002;
!value, DHPTT002k->hkick*80;
!value, DHPTT002->angle*80;
!stop;!



! DHRTT001: SBEND,L=0.757,ANGLE=-0.52359878,E1=-0.261799388,
!            E2=-0.261799388;
! orblancog. 2016.10 
! Tech.note. I-8, pag.~17
DHRTT001: SBEND,L=0.757,ANGLE=-0.5236,E1=-0.2618,
            E2=-0.2618;

!DHSTT001: SBEND,L = 1.113, ANGLE = -0.785398163;
! orblancog. 2016.10 Length and angle matches DHPTT001
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHPTT001
!   \alpha = 0.7854 (45°), L nom = 1.113, I nom=570.81
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHSTT001 := 1/80*1.113;
if (abs(DHSTT001) <= 300){
  MANGDHSTT001 := -1*LDHSTT001*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHSTT001));}
else {
  MANGDHSTT001 := -1*LDHSTT001*clight/(1e9*en)*(-1.3699e-13*DHSTT001^4 + 3.7969e-9*abs(DHSTT001)^3 - 7.7012e-6*(DHSTT001)^2 + 6.2805e-3*abs(DHSTT001) - 0.56665);};
PANGDHSTT001 := -1*1/80*0.7854; !physical angle
DHSTT001 : SBEND,L:=LDHSTT001,ANGLE:=MANGDHSTT001;!magnetic angle
! fake kicker to match the physical angle in the TL ???
DHSTT001K: KICKER,L=0,hKICK:=PANGDHSTT001 - MANGDHSTT001;
!value, DHSTT001k->hkick*80;
!value, DHSTT001->angle*80;
!stop;

! DVRTT001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;! Bends downward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTT001 := 1/20*0.35;
if (abs(DVRTT001) <= 60){
MANGDVRTT001 := LDVRTT001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTT001));}
else{MANGDVRTT001 := LDVRTT001*clight/(1e9*en)*(-1.7718e-10*DVRTT001^4 + 9.0349e-7*abs(DVRTT001)^3 - 2.8357e-4*DVRTT001^2 + 3.4797e-2*abs(DVRTT001) - 0.59817);
};
PANGDVRTT001 := 1/20*0.192; !physical angle
DVRTT001 : SBEND,L:=LDVRTT001,TILT:=TWOPI/4,ANGLE:=MANGDVRTT001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTT001K: KICKER,L=0,VKICK:=PANGDVRTT001 - MANGDVRTT001;
!value, dvrtt001k->vkick*20;
!value, dvrtt001->angle*20;
!stop;

! DVRTT002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTT002 := 1/20*0.35;
if (abs(DVRTT002) <= 60){
MANGDVRTT002 := -1*LDVRTT002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTT002));}
else{MANGDVRTT002 := -1*LDVRTT002*clight/(1e9*en)*(-1.7718e-10*DVRTT002^4 + 9.0349e-7*abs(DVRTT002)^3 - 2.8357e-4*DVRTT002^2 + 3.4797e-2*abs(DVRTT002) - 0.59817);
};
PANGDVRTT002 := -1*1/20*0.192; !physical angle
DVRTT002 : SBEND,L:=LDVRTT002,TILT:=TWOPI/4,ANGLE:=MANGDVRTT002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTT002K: KICKER,L=0,VKICK:=PANGDVRTT002 - MANGDVRTT002;
!value, dvrtt002k->vkick*20;
!value, dvrtt002->angle*20;
!stop;


! DVRTE001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE001 := 1/20*0.35;
if (abs(DVRTE001) <= 60){
MANGDVRTE001 := LDVRTE001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE001));}
else{MANGDVRTE001 := LDVRTE001*clight/(1e9*en)*(-1.7718e-10*DVRTE001^4 + 9.0349e-7*abs(DVRTE001)^3 - 2.8357e-4*DVRTE001^2 + 3.4797e-2*abs(DVRTE001) - 0.59817);
};
PANGDVRTE001 := 1/20*0.192; !physical angle
DVRTE001 : SBEND,L:=LDVRTE001,TILT:=TWOPI/4,ANGLE:=MANGDVRTE001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTE001K: KICKER,L=0,VKICK:=PANGDVRTE001 - MANGDVRTE001;
!value, dvrte001k->vkick*20;
!value, dvrte001->angle*20;
!stop;

!DVRTE002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993; 
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE002 := 1/20*0.35;
if (abs(DVRTE002) <= 60){
MANGDVRTE002 := -1*LDVRTE002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE002));}
else{MANGDVRTE002 := -1*LDVRTE002*clight/(1e9*en)*(-1.7718e-10*DVRTE002^4 + 9.0349e-7*abs(DVRTE002)^3 - 2.8357e-4*DVRTE002^2 + 3.4797e-2*abs(DVRTE002) - 0.59817);
};
PANGDVRTE002 := -1*1/20*0.192; !physical angle
DVRTE002 : SBEND,L:=LDVRTE002,TILT:=TWOPI/4,ANGLE:=MANGDVRTE002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
DVRTE002K: KICKER,L=0,VKICK:=PANGDVRTE002 - MANGDVRTE002;
!value, dvrte002k->vkick*20;
!value, dvrte002->angle*20;
!stop;

 DHRTE001: SBEND,L=0.757,ANGLE=.528679953,E1=.26433976,E2=.26433976;

 DHRTE002: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;

 DHRTE003: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;

 DVRTE003: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;

 DVRTE004: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;

 SPTEL101: SBEND, L = 1.233, ANGLE = -0.593411946;
 SPTEL102: SBEND, L = 0.623, ANGLE = -0.034906585;

DHSTB001: sbend,l=1.353,angle=0.0;    !bend to ...???

RETURN;
