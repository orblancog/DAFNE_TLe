!  March 2003
! Quadrupole  calibration constants and length

! orblancog .2016.09 Adding notes
! DAFNE Technical Note : C-17, 
! Transfer Line Quadrupoles (Type B), pag.~6
! K = (1/E) [ 3.3617e-2*I + 1.7292e-2 ]
! K [m^-2], E [GeV], I [A]
 lsq := 0.20;
 c1s = 3.3617e-2;
 c2s = 1.7292e-2;

! ??? No info
! c1ss = 9.1277e-3;  ! small QUADRUPOLEs used in the day-one
! c2ss = 4.53e-3;     
! orblancog. 2016.09 trying values of type A quads
 c1ss = 2.51e-2;
 c2ss = 7.13e-3;
! c1ss = 3.9786e-3
! c2ss = 2.72e-3

! DAFNE Technical Note : C-17, 
! Transfer Line Quadrupoles (Type A), pag.~7
! K = (1/E) [ 2.5100e-2*I + 7.13e-3 ]
! K [m^-2], E [GeV], I [A]
 llq := 0.30;
 c1l = 2.51e-2;
 c2l = 7.13e-3;

!list of quadrupoles in DAFNE TRANSFER LINE
! L is the half Length of the quadrupolerupoles

! half last Linac quadrupole
 QLE0    : quadrupole,L = 0.14,K1 := KLE0;

! in TM 
 QUATM001: quadrupole,L := lsq/2, K1 := ktm01;
 QUATM002: quadrupole,L := llq/2, K1 := ktm02;
 QUATM003: quadrupole,L := llq/2, K1 := ktm03;
 QUATM004: quadrupole,L := lsq/2, K1 := ktm04;
 QUATM005: quadrupole,L := lsq/2, K1 := ktm05;
 QUATM006: quadrupole,L := lsq/2, K1 := ktm06;
 QUATM007: quadrupole,L := lsq/2, K1 := ktm07;
 QUATM008: quadrupole,L := lsq/2, K1 := ktm08;
 QUATM009: quadrupole,L := lsq/2, K1 := ktm09;

! in TT  Accum. extraction 
 QUATT001: quadrupole,l := llq/2, K1 := ktt01;
 QUATT002: quadrupole,l := llq/2, K1 := ktt02;
 QUATT003: quadrupole,l := llq/2, K1 := ktt03;
 QUATT004: quadrupole,l := llq/2, K1 := ktt04;
 QUATT005: quadrupole,l := llq/2, K1 := ktt05;
 QUATT006: quadrupole,l := lsq/2, K1 := ktt06;

 QUATT007: quadrupole,l := lsq/2, K1 := ktt07;
 QUATT008: quadrupole,l := lsq/2, K1 := ktt08;
 QUATT009: quadrupole,l := lsq/2, K1 := ktt09;
 QUATT010: quadrupole,l := lsq/2, K1 := ktt10;
 QUATT011: quadrupole,l := lsq/2, K1 := ktt11;

! in  TR
 QUATR001: quadrupole,l := lsq/2, K1 := ktr01;
 QUATR002: quadrupole,l := lsq/2, K1 := ktr02;
 QUATR003: quadrupole,l := lsq/2, K1 := ktr03;
 QUATR004: quadrupole,l := lsq/2, K1 := ktr04;
 QUATR005: quadrupole,l := lsq/2, K1 := ktr05;

! in  TL
 QUATL001: quadrupole,l := lsq/2, K1 := ktl01;
 QUATL002: quadrupole,l := lsq/2, K1 := ktl02;
 QUATL003: quadrupole,l := lsq/2, K1 := ktl03;
 QUATL004: quadrupole,l := lsq/2, K1 := ktl04;
 QUATL005: quadrupole,l := lsq/2, K1 := ktl05;

! in TE
 QUATE001: quadrupole,l := lsq/2, K1 := kte01;
 QUATE002: quadrupole,l := lsq/2, K1 := kte02;
 QUATE003: quadrupole,l := lsq/2, K1 := kte03;
 QUATE004: quadrupole,l := lsq/2, K1 := kte04;
 QUATE005: quadrupole,l := lsq/2, K1 := kte05;
 QUATE006: quadrupole,l := lsq/2, K1 := kte06;
 QUATE007: quadrupole,l := lsq/2, K1 := kte07;
 QUATE008: quadrupole,l := lsq/2, K1 := kte08;
 QUATE009: quadrupole,l := lsq/2, K1 := kte09;

 QUATE104: quadrupole,l := llq/2, K1 := kte104;
 QUATE105: quadrupole,l := llq/2, K1 := kte105;
//  QUATE105: drift, l := llq/2;


! in TP
 QUATP001: quadrupole,l := lsq/2, K1 := ktp01;
 QUATP002: quadrupole,l := lsq/2, K1 := ktp02;
 QUATP003: quadrupole,l := lsq/2, K1 := ktp03;
 QUATP004: quadrupole,l := lsq/2, K1 := ktp04;

! Quadrupole  k**2 [m**-2] as a function of the Energy [MeV] and
! power supply Current [A]

 kle0  := (0.07*cle0+0.05)*(0.510/en);

 ktm01 := (ctm001/(ABS(ctm001)))*(c1s*(abs(ctm001)+dtm001)+c2s)/en*pertm;
 ktm02 :=(ctm002/(ABS(ctm002)))*(c1ss*(abs(ctm002)+dtm002)+c2ss)/en*pertm;
 ktm03 :=(ctm003/(ABS(ctm003)))*(c1ss*(abs(ctm003)+dtm003)+c2ss)/en*pertm;
 ktm04 := (ctm004/(ABS(ctm004)))*(c1s*(abs(ctm004)+dtm004)+c2s)/en*pertm;
 ktm05 := (ctm005/(ABS(ctm005)))*(c1s*(abs(ctm005)+dtm005)+c2s)/en*pertm;
 ktm06 := (ctm006/(ABS(ctm006)))*(c1s*(abs(ctm006)+dtm006)+c2s)/en*pertm;
 ktm07 := (ctm007/(ABS(ctm007)))*(c1s*(abs(ctm007)+dtm007)+c2s)/en*pertm;
 ktm08 := (ctm008/(ABS(ctm008)))*(c1s*(abs(ctm008)+dtm008)+c2s)/en*pertm;
 ktm09 := (ctm009/(ABS(ctm009)))*(c1s*(abs(ctm009)+dtm009)+c2s)/en*pertm;

 ktt01 :=((ctt001+dtt001)/(ABS(ctt001+dtt001)))*(c1l*(abs(ctt001)+dtt001)+c2l)/en*pertt12;
 ktt02 :=((ctt002+dtt002)/(ABS(ctt002+dtt002)))*(c1l*(abs(ctt002)+dtt002)+c2l)/en*pertt12;
 ktt03 :=((ctt003+dtt003)/(ABS(ctt003+dtt003)))*(c1l*(abs(ctt003)+dtt003)+c2l)/en*pertt12;
 ktt04 :=((ctt004+dtt004)/(ABS(ctt004+dtt004)))*(c1l*(abs(ctt004)+dtt004)+c2l)/en*pertt12;

 ktt05 :=((ctt005+dtt005)/(ABS(ctt005+dtt005)))*(c1l*(abs(ctt005)+dtt005)+c2l)/en*pertt12;
 ktt06 :=((ctt006+dtt006)/(ABS(ctt006+dtt006)))*(c1s*(abs(ctt006)+dtt006)+c2s)/en*pertt12;


 ktt07 := ((ctt007+dtt007)/(ABS(ctt007+dtt007)))*(c1s*(abs(ctt007)+dtt007)+c2s)/en*pertt3;
 ktt08 := ((ctt008+dtt008)/(ABS(ctt008+dtt008)))*(c1s*(abs(ctt008)+dtt008)+c2s)/en*pertt3;
 ktt09 := ((ctt009+dtt009)/(ABS(ctt009+dtt009)))*(c1s*(abs(ctt009)+dtt009)+c2s)/en*pertt3;
 ktt10 := ((ctt010+dtt010)/(ABS(ctt010+dtt010)))*(c1s*(abs(ctt010)+dtt010)+c2s)/en*pertt3;
 ktt11 := ((ctt011+dtt011)/(ABS(ctt011+dtt011)))*(c1s*(abs(ctt011)+dtt011)+c2s)/en*pertt3;
 ktr01 := ((ctr001+dtr001)/(ABS(ctr001+dtr001)))*(c1s*(abs(ctr001)+dtr001)+c2s)/en*pertr;
 ktr02 := ((ctr002+dtr002)/(ABS(ctr002+dtr002)))*(c1s*(abs(ctr002)+dtr002)+c2s)/en*pertr;
 ktr03 := ((ctr003+dtr003)/(ABS(ctr003+dtr003)))*(c1s*(abs(ctr003)+dtr003)+c2s)/en*pertr;
 ktr04 := ((ctr004+dtr004)/(ABS(ctr004+dtr004)))*(c1s*(abs(ctr004)+dtr004)+c2s)/en*pertr;
 ktr05 := ((ctr005+dtr005)/(ABS(ctr005+dtr005)))*(c1s*(abs(ctr005)+dtr005)+c2s)/en*pertr;

 ktl01 :=  (ctl001/(ABS(ctl001)))*(c1s*(abs(ctl001)+dtl001)+c2s)/en*pertl;
 ktl02 :=  (ctl002/(ABS(ctl002)))*(c1s*(abs(ctl002)+dtl002)+c2s)/en*pertl;
 ktl03 :=  (ctl003/(ABS(ctl003)))*(c1s*(abs(ctl003)+dtl003)+c2s)/en*pertl;
 ktl04 :=  (ctl004/(ABS(ctl004)))*(c1s*(abs(ctl004)+dtl004)+c2s)/en*pertl;
 ktl05 :=  (ctl005/(ABS(ctl005)))*(c1s*(abs(ctl005)+dtl005)+c2s)/en*pertl;

 kte01 :=  ((cte001+dte001)/(ABS(cte001+dte001)))*(c1s*(abs(cte001)+dte001)+c2s)/en*perte;
 kte02 :=  ((cte002+dte002)/(ABS(cte002+dte002)))*(c1s*(abs(cte002)+dte002)+c2s)/en*perte;
 kte03 :=  ((cte003+dte003)/(ABS(cte003+dte003)))*(c1s*(abs(cte003)+dte003)+c2s)/en*perte;
 kte04 :=  ((cte004+dte004)/(ABS(cte004+dte004)))*(c1s*(abs(cte004)+dte004)+c2s)/en*perte;
 kte05 :=  ((cte005+dte005)/(ABS(cte005+dte005)))*(c1s*(abs(cte005)+dte005)+c2s)/en*perte;
 kte06 :=  ((cte006+dte006)/(ABS(cte006+dte006)))*(c1s*(abs(cte006)+dte006)+c2s)/en*perte;
 kte07 :=  ((cte007+dte007)/(ABS(cte007+dte007)))*(c1s*(abs(cte007)+dte007)+c2s)/en*perte;
 kte08 :=  ((cte008+dte008)/(ABS(cte008+dte008)))*(c1s*(abs(cte008)+dte008)+c2s)/en*perte;
 kte09 :=  ((cte009+dte009)/(ABS(cte009+dte009)))*(c1s*(abs(cte009)+dte009)+c2s)/en*perte;
 kte104:=((cte104+dte104)/(ABS(cte104+dte104)))*(c1ss*(abs(cte104)+dte104)+c2ss)/en*perte;
 kte105:=((cte105+dte105)/(ABS(cte105+dte105)))*(c1ss*(abs(cte105)+dte105)+c2ss)/en*perte;

 ktp01 :=  (ctp001/(ABS(ctp001)))*(c1s*(abs(ctp001)+dtp001)+c2s)/en*pertp;
 ktp02 :=  (ctp002/(ABS(ctp002)))*(c1s*(abs(ctp002)+dtp002)+c2s)/en*pertp;
 ktp03 :=  (ctp003/(ABS(ctp003)))*(c1s*(abs(ctp003)+dtp003)+c2s)/en*pertp;
 ktp04 :=  (ctp004/(ABS(ctp004)))*(c1s*(abs(ctp004)+dtp004)+c2s)/en*pertp;


return;
