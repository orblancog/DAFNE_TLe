! March '03
!dipoles 
!beam out EXTRACTION ELECTRONS FROM ACCUM. TO TR

! 2003 data
! SPTA2002: SBEND,L=.623,ANGLE=.0349066;
! orblancog. 2016.10
! DAFNE Technical Note : MM-7, pag.~2
!   \alpha = 0.038 (2.177°), L nom = 0.623+/-0.00025
! \alpha [rad], L [m]
! Fitting Figure~3 with engauge-digitizer+gnuplot : gives f(x)=a*x+b in Gauss and [A], 1Gauss=1e-4[T]
! Final set of parameters            Asymptotic Standard Error
! =======================            ==========================
! a               = 0.564897         +/- 0.00066      (0.1168%)
! b               = -2.94169         +/- 0.901        (30.63%)
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2002 := 0.623;
MANGSPTA2002 := LSPTA2002*clight/(1e9*en)*1e-4*(0.565*SPTA2002-2.9); !magnetic angle
PANGSPTA2002 := 0.038; !physical angle
SPTA2002 : SBEND,L:=LSPTA2002,ANGLE:=MANGSPTA2002;
 ! fake kicker to match the physical angle in the TL
SPTA2002K: KICKER,L=0,HKICK:=PANGSPTA2002 - MANGSPTA2002;
!value, spta2002k->hkick;
!value, spta2002->angle;

!stop;

! Strangely enough... SPTA2001 has the length of SPTTL001, SPTTR001
! SPTA2001: SBEND,L=1.233,ANGLE=.593411946;
! \alpha = 0.5934 (34°), L nom = 1.233
! orblancog. 2016.09
! DAFNE Technical Note : C-17 pag.~6, MM-7 pag.~2
!   Dipoles SPTA1001, SPTA2001
!   \alpha = 0.038 (2.177°), L nom = 0.623
! \alpha [rad], L [m]
! kickangle = Length*clight/(1e9*Energy[GeV]) * B[T](I[A])
LSPTA2001 := 0.623;
MANGSPTA2001 := LSPTA2001*clight/(1e9*en)*1e-4*(0.565*SPTA2001-2.9); !magnetic angle
PANGSPTA2001 := 0.038; !physical angle
SPTA2001 : SBEND,L:=LSPTA2001,ANGLE:=MANGSPTA2001;
 ! fake kicker to match the physical angle in the TL
SPTA2001K: KICKER,L=0,HKICK:=PANGSPTA2001 - MANGSPTA2001;
!value, spta2001k->hkick;
!value, spta2001->angle;
!stop;

! vertical magnet
 DVRTR002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;  ! Bends upward

 DVRTR001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;     ! Bends downward

!Y  magnet for e- extraction  beam out  FROM ACCUMULATOR
 DHYTT001: SBEND,L=1.,E1=-.6283185308,ANGLE=-.6283185308;  !TE1,TTP1

! Bends upward
VBM: SBEND,L=.35,TILT:= pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;
! Bends downwstiltard
VBP: SBEND,L=.35,TILT:= pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;

 DHPTT001: SBEND, L = 1.113, ANGLE = 0.785398163;
 DHPTT002: SBEND, L = 1.113, ANGLE = -0.785398163;

 DHRTT001: SBEND,L=0.757,ANGLE=-0.52359878,E1=-0.261799388,
            E2=-0.261799388;

 DHSTT001: SBEND,L = 1.113, ANGLE = -0.785398163;

 DVRTT001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;

 DVRTT002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;

 DVRTE001: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;

 DVRTE002: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993; 

 DHRTE001: SBEND,L=0.757,ANGLE=.528679953,E1=.26433976,E2=.26433976;

 DHRTE002: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;

 DHRTE003: SBEND,L=0.757,ANGLE=-.542099266,E1=-.271049633,E2=-.271049633;

 DVRTE003: SBEND,L=.35,TILT := pi/2,ANGLE=-.191986,E1=-0.095993,E2=-0.095993;

 DVRTE004: SBEND,L=.35,TILT := pi/2,ANGLE=.191986,E1=0.095993,E2=0.095993;

 SPTEL101: SBEND, L = 1.233, ANGLE = -0.593411946;
 SPTEL102: SBEND, L = 0.623, ANGLE = -0.034906585;

DHSTB001: sbend,l=1.353,angle=0.0;    !bend to ...???

RETURN;
