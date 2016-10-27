! March '03
!dipoles 
!beam out EXTRACTION ELECTRONS FROM ACCUM. TO TR


! orblancog. 2016.10
tkon = 1; !! trackkicker on
vdon = 1; !! vertical dipole on
hdon = 1; !! horizontal dipole on



! orblancog. 2016.09 
ROLL1: SROTATION, ANGLE=  TWOPI/4.;
ROLL2: SROTATION, ANGLE= -TWOPI/4.;

! DAFNE Technical Note : C-17 pag.~6, MM-7 pag.~2, I-16 pag.~14
!   Dipoles SPTA1001, SPTA2001
!   \alpha = 0.038 (2.177°), L nom = 0.623, I nom=1811.2
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2001 := 1/1*0.623;
MANGSPTA2001 := LSPTA2001*clight/(1e9*en)*1e-4*(0.565*abs(SPTA2001)-2.9); !magnetic angle
PANGSPTA2001 := 1/1*38.00e-3;!physical angle, 
SPTA2001 : SBEND,L:=LSPTA2001,ANGLE:=hdon*MANGSPTA2001;
! orblancog. 2016.10 Second model from fitting
! DAFNE Technical Note : MM-7 pag.~2, I-16 pag~14
!   \alpha = 0.038 (2.177°), L nom = 0.623+/-0.00025
! \alpha [rad], L [m]
! Fitting Figure~3 with engauge-digitizer+gnuplot : 
!   gives f(x[Gauss])=a*x[A]+b , 1Gauss=1e-4[T]
! Final set of parameters            Asymptotic Standard Error
! =======================            ==========================
! a               = 0.564897         +/- 0.00066      (0.1168%)
! b               = -2.94169         +/- 0.901        (30.63%)
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
! LSPTA2001 := 0.623;
! MANGSPTA2001 := LSPTA2001*clight/(1e9*en)*1e-4*(0.565*SPTA2001-2.9); !magnetic angle
! PANGSPTA2001 := 0.038; !physical angle
! SPTA2001 : SBEND,L:=LSPTA2001,ANGLE:=hdon*MANGSPTA2001;
! fake kicker to match the physical angle in the TL
!SPTA2001K: KICKER,L=0,HKICK:=tkon*(PANGSPTA2001 - MANGSPTA2001);
SPTA2001YR: yrotation,angle:=tkon*(PANGSPTA2001 - MANGSPTA2001);
!value, spta2001k->hkick;
value, spta2001->angle;
value, spta2001yr->angle/spta2001->angle;
!stop;


! 2003 data
! SPTA2002: SBEND,L=.623,ANGLE=.0349066; ! wrong name
! SPTA2001: SBEND,L=1.233,ANGLE=.593411946; ! wrong name
! \alpha = 0.5934 (34°), L nom = 1.233 ! ok
! orblancog. 2016.10 Maybe this magnet equal to SPTTR001 after all ???
! DAFNE Technical Note : C-17, pag.~5
!   \alpha = 0.5934 (34°), L nom = 1.233, I nom=2082.1
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2002 := 1/1*1.233;
MANGSPTA2002 := LSPTA2002*clight/(1e9*en)*(3.9324e-4*abs(SPTA2002)); !magnetic angle
PANGSPTA2002 := 1/1*1;!38°!0.5934; !physical angle
SPTA2002 : SBEND,L:=LSPTA2002,ANGLE:=hdon*MANGSPTA2002;
! fake kicker to match the physical angle in the TL
!SPTA2002K: KICKER,L=0,HKICK:=tkon*(PANGSPTA2002 - MANGSPTA2002);
SPTA2002YR: yrotation,angle:=tkon*(PANGSPTA2002 - MANGSPTA2002);
!value, spta2002k->hkick;
value, spta2002->angle;
value, spta2002yr->angle/spta2002->angle;
!stop;


! vertical magnet
! DVRTR001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;     ! Bends downward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom=100.19
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTR001 := 1/1*0.35;
if (abs(DVRTR001) <= 60){
MANGDVRTR001 := LDVRTR001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTR001));}
else{MANGDVRTR001 := LDVRTR001*clight/(1e9*en)*(-1.7718e-10*DVRTR001^4 + 9.0349e-7*abs(DVRTR001)^3 - 2.8357e-4*DVRTR001^2 + 3.4797e-2*abs(DVRTR001) - 0.59817);
};
PANGDVRTR001 := 1/1*0.114; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.192, but it seems 0.114(°6.535)
DVRTR001 : SBEND,L:=LDVRTR001,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTR001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTR001K: KICKER,L=0,VKICK:=tkon*(PANGDVRTR001 - MANGDVRTR001);
DVRTR001yr: yrotation,L=0,ANGLE:=tkon*(PANGDVRTR001 - MANGDVRTR001);
!value, dvrtr001k->vkick;
value, dvrtr001->angle;
value, dvrtr001yr->angle/dvrtr001->angle;
!stop;


!DVRTR002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;  ! Bends upward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR002
!   \alpha = 0.192 (11°), L nom = 0.35, I nom=100.19
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTR002 := 1/1*0.35;
if (abs(DVRTR002) <= 60){
MANGDVRTR002 := -1*LDVRTR002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTR002));}
else{MANGDVRTR002 := -1*LDVRTR002*clight/(1e9*en)*(-1.7718e-10*DVRTR002^4 + 9.0349e-7*abs(DVRTR002)^3 - 2.8357e-4*DVRTR002^2 + 3.4797e-2*abs(DVRTR002) - 0.59817);
};
PANGDVRTR002 := -0.114*1/1; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.038, but it seems 0.114(°6.535)
DVRTR002 : SBEND,L:=LDVRTR002,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTR002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTR002K: KICKER,L=0,VKICK:=tkon*(PANGDVRTR002 - MANGDVRTR002);
DVRTR002YR: YROTATION,ANGLE:=tkon*(PANGDVRTR002 - MANGDVRTR002);
!value, dvrtr002k->vkick;
value, dvrtr002->angle;
value, dvrtr002YR->ANGLE/dvrtr002->angle;
!stop;



!Y  magnet for e- extraction  beam out  FROM ACCUMULATOR
!  DHYTT001: SBEND,L=1.,E1=-.6283185308,ANGLE=-.6283185308;  !TE1,TTP1
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHYTT001
!   \alpha = 0.62832 (36°), L nom = 1, I nom=95.34
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHYTT001 := 1.*1/1;
MANGDHYTT001 := -1*LDHYTT001*clight/(1e9*en)*(3.8349e-3 + 1.1171e-2*abs(DHYTT001));
PANGDHYTT001 := -0.62832*1/1; !physical angle
DHYTT001 : SBEND,L:=LDHYTT001,ANGLE:=hdon*MANGDHYTT001,E1=-.6283185308;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHYTT001K: KICKER,L=0,hKICK:=tkon*(PANGDHYTT001 - MANGDHYTT001);
DHYTT001yr: yrotation,angle:=tkon*(PANGDHYTT001 - MANGDHYTT001);
!value, DHYTT001k->hkick;
value, DHYTT001->angle;
value, DHYTT001yr->angle/DHYTT001->angle;
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
LDHPTT001 := 1/1*1.113;
if (abs(DHPTT001) <= 300){
  MANGDHPTT001 := LDHPTT001*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHPTT001));}
else {
  MANGDHPTT001 := LDHPTT001*clight/(1e9*en)*(-1.3699e-13*DHPTT001^4 + 3.7969e-9*abs(DHPTT001)^3 - 7.7012e-6*(DHPTT001)^2 + 6.2805e-3*abs(DHPTT001) - 0.56665);};
PANGDHPTT001 := 1/1*0.7854; !physical angle
DHPTT001 : SBEND,L:=LDHPTT001,ANGLE:=hdon*MANGDHPTT001;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHPTT001K: KICKER,L=0,hKICK:=tkon*(PANGDHPTT001 - MANGDHPTT001);
DHPTT001yr: yrotation,angle:=tkon*(PANGDHPTT001 - MANGDHPTT001);
!value, DHPTT001k->hkick;
value, DHPTT001->angle;
value, DHPTT001yr->angle/DHPTT001->angle;
!stop;!


! DHPTT002: SBEND, L = 1.113, ANGLE = -0.785398163;
! orblancog. 2016.10 I suppose this is equal to DHPTT001, with neg angle
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHPTT001
!   \alpha = 0.7854 (45°), L nom = 1.113, I nom=570.81
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHPTT002 := 1/1*1.113;
if (abs(DHPTT002) <= 300){
  MANGDHPTT002 := -1*LDHPTT002*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHPTT002));}
else {
  MANGDHPTT002 := -1*LDHPTT002*clight/(1e9*en)*(-1.3699e-13*DHPTT002^4 + 3.7969e-9*abs(DHPTT002)^3 - 7.7012e-6*(DHPTT002)^2 + 6.2805e-3*abs(DHPTT002) - 0.56665);};
PANGDHPTT002 := -0.7854*1/1; !physical angle
DHPTT002 : SBEND,L:=LDHPTT002,ANGLE:=hdon*MANGDHPTT002;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHPTT002K: KICKER,L=0,hKICK:=tkon*(PANGDHPTT002 - MANGDHPTT002);
DHPTT002yr: yrotation,angle:=tkon*(PANGDHPTT002 - MANGDHPTT002);
!value, DHPTT002k->hkick;
value, DHPTT002->angle;
value, DHPTT002yr->angle/DHPTT002->angle;
!stop;!



! DHRTT001: SBEND,L=0.757,ANGLE=-0.52359878,E1=-0.261799388,
!            E2=-0.261799388;
! orblancog. 2016.10 
! Tech.note. DI-10 pag.~28, I-10 pag.~10
! I nom=233[A], 1.18[T], 30°(0.524 [rad])
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHRTT001 := 1/1*0.757;
MANGDHRTT001 := -1*LDHRTT001*clight/(1e9*en)*(1.18/233*abs(DHRTT001));
PANGDHRTT001 := -0.5326*1/1; !physical angle
DHRTT001 : SBEND,L:=LDHRTT001,ANGLE:=hdon*MANGDHRTT001,E1=-0.261799388,E2=-0.261799388;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHRTT001K: KICKER,L=0,hKICK:=tkon*(PANGDHRTT001 - MANGDHRTT001);
DHRTT001yr: yrotation,angle:=tkon*(PANGDHRTT001 - MANGDHRTT001);
!value, DHRTT001k->hkick;
value, DHRTT001->angle;
value, DHRTT001yr->angle/DHRTT001->angle;
!stop;!



!DHSTT001: SBEND,L = 1.113, ANGLE = -0.785398163;
! orblancog. 2016.10 Length and angle matches DHPTT001
! DAFNE Technical Note : C-17 pag.~4
!   Dipoles DHPTT001
!   \alpha = 0.7854 (45°), L nom = 1.113, I nom=570.81
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHSTT001 := 1/1*1.113;
if (abs(DHSTT001) <= 300){
  MANGDHSTT001 := -1*LDHSTT001*clight/(1e9*en)*(1.2129e-4 + 2.419e-3*abs(DHSTT001));}
else {
  MANGDHSTT001 := -1*LDHSTT001*clight/(1e9*en)*(-1.3699e-13*DHSTT001^4 + 3.7969e-9*abs(DHSTT001)^3 - 7.7012e-6*(DHSTT001)^2 + 6.2805e-3*abs(DHSTT001) - 0.56665);};
PANGDHSTT001 := -1*1/1*0.7854; !physical angle
DHSTT001 : SBEND,L:=LDHSTT001,ANGLE:=hdon*MANGDHSTT001;!magnetic angle
! fake kicker to match the physical angle in the TL 
!DHSTT001K: KICKER,L=0,hKICK:=tkon*(PANGDHSTT001 - MANGDHSTT001);
DHSTT001yr: yrotation,angle:=tkon*(PANGDHSTT001 - MANGDHSTT001);
!value, DHSTT001k->hkick;
value, DHSTT001->angle;
value, DHSTT001yr->angle/DHSTT001->angle;
!stop;

! DVRTT001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;! Bends downward
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTT001 := 1/1*0.35;
if (abs(DVRTT001) <= 60){
MANGDVRTT001 := LDVRTT001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTT001));}
else{MANGDVRTT001 := LDVRTT001*clight/(1e9*en)*(-1.7718e-10*DVRTT001^4 + 9.0349e-7*abs(DVRTT001)^3 - 2.8357e-4*DVRTT001^2 + 3.4797e-2*abs(DVRTT001) - 0.59817);
};
PANGDVRTT001 := 1/1*0.192; !physical angle
DVRTT001 : SBEND,L:=LDVRTT001,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTT001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTT001K: KICKER,L=0,VKICK:=tkon*(PANGDVRTT001 - MANGDVRTT001);
DVRTT001yr: yrotation,angle:=tkon*(PANGDVRTT001 - MANGDVRTT001);
!value, dvrtt001k->vkick;
!value, PANGDVRTT001, MANGDVRTT001;
value, dvrtt001->angle;
value, dvrtt001yr->angle/dvrtt001->angle;
!stop;

! DVRTT002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTT002 := 1/1*0.35;
if (abs(DVRTT002) <= 60){
MANGDVRTT002 := -1*LDVRTT002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTT002));}
else{MANGDVRTT002 := -1*LDVRTT002*clight/(1e9*en)*(-1.7718e-10*DVRTT002^4 + 9.0349e-7*abs(DVRTT002)^3 - 2.8357e-4*DVRTT002^2 + 3.4797e-2*abs(DVRTT002) - 0.59817);
};
PANGDVRTT002 := -1*1/1*0.192; !physical angle
DVRTT002 : SBEND,L:=LDVRTT002,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTT002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTT002K: KICKER,L=0,VKICK:=tkon*(PANGDVRTT002 - MANGDVRTT002);
DVRTT002yr: yrotation,L=0,angle:=tkon*(PANGDVRTT002 - MANGDVRTT002);
!value, dvrtt002k->vkick;
value, dvrtt002->angle;
value, dvrtt002yr->angle/dvrtt002->angle;
!stop;


! DVRTE001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~5
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE001 := 1/1*0.35;
if (abs(DVRTE001) <= 60){
MANGDVRTE001 := LDVRTE001*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE001));}
else{MANGDVRTE001 := LDVRTE001*clight/(1e9*en)*(-1.7718e-10*DVRTE001^4 + 9.0349e-7*abs(DVRTE001)^3 - 2.8357e-4*DVRTE001^2 + 3.4797e-2*abs(DVRTE001) - 0.59817);
};
PANGDVRTE001 := 1/1*0.114; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.038, but it seems 0.114(°6.535)
DVRTE001 : SBEND,L:=LDVRTE001,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTE001,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTE001K: KICKER,L=0,VKICK:=tkon*(PANGDVRTE001 - MANGDVRTE001);
DVRTE001yr: yrotation,angle:=tkon*(PANGDVRTE001 - MANGDVRTE001);
!value, dvrte001k->vkick;
value, dvrte001->angle;
value, dvrte001yr->angle/dvrte001->angle;
!stop;

!DVRTE002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993; 
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE002 := 1/1*0.35;
if (abs(DVRTE002) <= 60){
MANGDVRTE002 := -1*LDVRTE002*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE002));}
else{MANGDVRTE002 := -1*LDVRTE002*clight/(1e9*en)*(-1.7718e-10*DVRTE002^4 + 9.0349e-7*abs(DVRTE002)^3 - 2.8357e-4*DVRTE002^2 + 3.4797e-2*abs(DVRTE002) - 0.59817);
};
PANGDVRTE002 := -1*1/1*0.114; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.038, but it seems 0.114(°6.535)
DVRTE002 : SBEND,L:=LDVRTE002,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTE002,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTE002k: KICKER,L=0,VKICK:=tkon*(PANGDVRTE002 - MANGDVRTE002);
DVRTE002yr: yrotation,angle:=tkon*(PANGDVRTE002 - MANGDVRTE002);
!value, dvrte002k->vkick;
value, dvrte002->angle;
value, dvrte002yr->angle/dvrte002->angle;
!stop;

!DHRTE001: SBEND,L=0.757,ANGLE=.528679953,E1=.26433976,E2=.26433976;
! orblancog. 2016.10 
! DAFNE Tech. Note : DI-10 pag.~25, I-10 pag.~10., I-16 pag.~15
! DHRTE001 1.18[T] 30° (0.524 [rad])
! I nom=233[A]
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHRTE001 := 1/1*0.757;
MANGDHRTE001 := LDHRTE001*clight/(1e9*en)*(1.18/233*abs(DHRTE001));
PANGDHRTE001 := 0.5326*1/1; !physical angle
DHRTE001 : SBEND,L:=LDHRTE001,ANGLE:=hdon*MANGDHRTE001,E1=.26433976,E2=.26433976;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHRTE001K: KICKER,L=0,hKICK:=tkon*(PANGDHRTE001 - MANGDHRTE001);
DHRTE001yr: yrotation,angle:=tkon*(PANGDHRTE001 - MANGDHRTE001);
!value, DHRTE001k->hkick;
value, DHRTE001->angle;
value, DHRTE001yr->angle/DHRTE001->angle;
!stop;!

!DHRTE002: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;
! orblancog. 2016.10 
! DAFNE Tech. Note : DI-10 pag.~25, I-10 pag.~10., I-16 pag.~15
! DHRTE002 1.22[T] 31° (0.5411 [rad])
! I nom=155[A]
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHRTE002 := 0.1*1/1*0.757;
MANGDHRTE002 := -LDHRTE002*clight/(1e9*en)*(1.22/155*abs(DHRTE002));
PANGDHRTE002 := -1*0.5411*1/1; !physical angle
DHRTE002 : SBEND,L:=LDHRTE002,ANGLE:=0*hdon*MANGDHRTE002,E1=-.271049633,E2=-.271049633;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHRTE002K: KICKER,L=0,hKICK:=tkon*(PANGDHRTE002 - MANGDHRTE002);
DHRTE002yr: yrotation,angle:=tkon*(PANGDHRTE002 - MANGDHRTE002);
!value, DHRTE002k->hkick;
value, DHRTE002->angle;
value, DHRTE002yr->angle/DHRTE002->angle;
!stop;!


!DHRTE003: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;
! orblancog. 2016.10 
! DAFNE Tech. Note : DI-10 pag.~25, I-10 pag.~10., I-16 pag.~15
! DHRTE003 1.22[T] 31° (0.5411 [rad])
! I nom=155[A]
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDHRTE003 := 0.1*1/1*0.757;
MANGDHRTE003 := -LDHRTE003*clight/(1e9*en)*(1.22/155*abs(DHRTE003));
PANGDHRTE003 := -1*0.5411*1/1; !physical angle
DHRTE003 : SBEND,L:=LDHRTE003,ANGLE:=0*hdon*MANGDHRTE003,E1=-.271049633,E2=-.271049633;!magnetic angle
! fake kicker to match the physical angle in the TL
!DHRTE003K: KICKER,L=0,hKICK:=tkon*(PANGDHRTE003 - MANGDHRTE003);
DHRTE003yr: yrotation,angle:=tkon*(PANGDHRTE003 - MANGDHRTE003);
!value, DHRTE003k->hkick;
value, DHRTE003->angle;
value, DHRTE003yr->angle/DHRTE003->angle;
!stop;!


!DVRTE003: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE003 := 1/1*0.35;
if (abs(DVRTE003) <= 60){
MANGDVRTE003 := -1*LDVRTE003*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE003));}
else{MANGDVRTE003 := -1*LDVRTE003*clight/(1e9*en)*(-1.7718e-10*DVRTE003^4 + 9.0349e-7*abs(DVRTE003)^3 - 2.8357e-4*DVRTE003^2 + 3.4797e-2*abs(DVRTE003) - 0.59817);
};
PANGDVRTE003 := -1*1/1*0.114; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.038, but it seems 0.114(°6.535)
DVRTE003 : SBEND,L:=LDVRTE003,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTE003,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTE003K: KICKER,L=0,VKICK:=tkon*(PANGDVRTE003 - MANGDVRTE003);
DVRTE003yr: YROTATION,angle:=tkon*(PANGDVRTE003 - MANGDVRTE003);
!value, dvrte003k->vkick;
value, dvrte003->angle;
value, dvrte003yr->angle/dvrte003->angle;
!stop;

!DVRTE004: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;
! orblancog. 2016.10
! DAFNE Technical Note : C-17 pag.~6
!   Dipoles DVRTR001
!   \alpha = 0.192 (11°), L nom = 0.35, I nom = 100.19
! \alpha [rad], L [m], I [A]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LDVRTE004 := 1/1*0.35;
if (abs(DVRTE004) <= 60){
MANGDVRTE004 := LDVRTE004*clight/(1e9*en)*(1.0514e-3 + 1.1010e-2*abs(DVRTE004));}
else{MANGDVRTE004 := LDVRTE004*clight/(1e9*en)*(-1.7718e-10*DVRTE004^4 + 9.0349e-7*abs(DVRTE004)^3 - 2.8357e-4*DVRTE004^2 + 3.4797e-2*abs(DVRTE004) - 0.59817);
};
PANGDVRTE004 := 1/1*0.114; !physical angle, tech.note.I-7, pag~6. ???  i thought it was 0.038, but it seems 0.114(°6.535)
DVRTE004 : SBEND,L:=LDVRTE004,TILT:=TWOPI/4,ANGLE:=vdon*MANGDVRTE004,E1=0.095993,E2=0.095993;!magnetic angle
! fake kicker to match the physical angle in the TL
!DVRTE004K: KICKER,L=0,VKICK:=tkon*(PANGDVRTE004 - MANGDVRTE004);
DVRTE004yr: yrotation,angle:=tkon*(PANGDVRTE004 - MANGDVRTE004);
!value, dvrte004k->vkick;
value, dvrte004->angle;
value, dvrte004yr->angle/dvrte004->angle;
!stop;!



! SPTEL101: SBEND, L = 1.233, ANGLE = -0.593411946;
! orblancog. 2016.10 Maybe this magnet is SPTTR001 after all ???
! DAFNE Technical Note : C-17, pag.~5
!   \alpha = 0.5934 (34°), L nom = 1.233, I nom=2082.1
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTEL101 := 1/1*1.233;
MANGSPTEL101 := -1*LSPTEL101*clight/(1e9*en)*(3.9324e-4*abs(SPTEL101)); !magnetic angle
PANGSPTEL101 := -1*1/1*0.5934; !physical angle
SPTEL101 : SBEND,L:=LSPTEL101,ANGLE:=hdon*MANGSPTEL101;
! fake kicker to match the physical angle in the TL
!SPTEL101K: KICKER,L=0,HKICK:=tkon*(PANGSPTEL101 - MANGSPTEL101);
SPTEL101yr: yrotation,angle:=tkon*(PANGSPTEL101 - MANGSPTEL101);
!value, sptel101k->hkick;
value, sptel101->angle;
value, sptel101yr->angle/sptel101->angle;
!stop;


!SPTEL102: SBEND, L = 0.623, ANGLE = -0.034906585;
! DAFNE Technical Note : C-17 pag.~6, MM-7 pag.~2, I-16 pag.~14
!   Dipoles SPTA1001, SPTA2001
!   \alpha = 0.038 (2.177°), L nom = 0.623, I nom=1811.2
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTEL102 := 1/1*0.623;
MANGSPTEL102 := -1*LSPTEL102*clight/(1e9*en)*1e-4*(0.565*abs(SPTEL102)-2.9); !magnetic angle
PANGSPTEL102 := -1*1/1*38.00e-3;!physical angle
SPTEL102 : SBEND,L:=LSPTEL102,ANGLE:=hdon*MANGSPTEL102;
 ! fake kicker to match the physical angle in the TL
!SPTEL102K: KICKER,L=0,HKICK:=tkon*(PANGSPTEL102 - MANGSPTEL102);
SPTEL102yr: yrotation,angle:=tkon*(PANGSPTEL102 - MANGSPTEL102);
!value, sptel102k->hkick;
value, sptel102->angle;
value, sptel102yr->angle/sptel102->angle;
!stop;


DHSTB001: sbend,l=1.353,angle=0.0;    !bend to ...???

RETURN;
