! March 2003
!LINAC2ACC_e = WHOLE LINE FROM LINAC TO ACC.  e-  (LINEL)

/*
//Optic function at Linac exit:
emitx   = 1.e-6;
emity   = 1.e-6;
delp    = 5.e-3;
resbeam;
beam,sequence=e_ae,particle=electron,energy=0.51,sige=delp,sigt=1.,ex=emitx,ey=emity;
twiss,chrom,save,betx=10.39,bety=7.17,alfx=1.037,alfy=-1.004,file="eai_start.tfs"; 


 bxLinac = 10.3;
 byLinac = 5.36;
 alfyLinac = -0.256;
 alfxLinac = 0.0;
*/

// =====
// Optic function at Linac exit as from LC-6
// =====
 bxLinac = 10.39;
 byLinac = 7.17;
 alfyLinac = -1.004;
 alfxLinac = 1.037;

// =====
// Optic function at A septa from Oct 2013 measurements
// =====

emitx   = 1.e-6;
emity   = 1.e-6;
delp    = 5.e-3;

/*
 betxacc = 1.523447597;
 betyacc = 2.588854918;
 alfxacc = 0.004055829007;
 alfyacc = 0.03825538128;
 dxacc   = 0.2166557213;
 dyacc   = 0.05440481193;
*/

! Oscar BLANCO. test values
 betxacc = 3.07;!3.22;
 betyacc = 4.041;!4.53;
 alfxacc = 1.017;!0.66;
 alfyacc = 0.458;!0.37;
 dxacc   = 0.2166557213;
 dyacc   = 0.05440481193;



// =====
// EAE SETUP
// =====
emitx_ae = 2.8e-7;
emity_ae = 1.4e-7;
delp_ae  = 1.e-3;


// =====
// optic function at MRe injection septum 2012
// =====
betxseptum =  8.691565917;
muxseptum  = -0.01308398467;
alfxseptum =  0;
betyseptum =  1.155394601;
muyseptum  = -0.0255984716;
alfyseptum =  0.;
dxseptum = -1.2;
dyseptum = 0.0;

// =====
// oblancog
// =====
betxseptum =  9.389757597;
muxseptum  = 0;
alfxseptum =  0.05538605968;
betyseptum =  1.237891428;
muyseptum  = 0;
alfyseptum =  0.07187174582;
dxseptum = -1.401444589;
dpxseptum = 0.01389481764;
dyseptum = -0.005524226884;
dpyseptum = 0.001681025845;


!beam, particle=electron, energy = .51,sequence = e_ae,sige=se,sigt = 1.;
use, sequence= e_ae;

select, flag=twiss,clear;
envx := 3.0*sqrt(emitx_ae*table(twiss,betx)+(table(twiss,dx)*delp_ae)*(table(twiss,dx)*delp_ae));
envy := 3.0*sqrt(emity_ae*table(twiss,bety)+(table(twiss,dy)*delp_ae)*(table(twiss,dy)*delp_ae));
select, flag=twiss, column=NAME, KEYWORD, S, L, BETX, BETY, ALFX, ALFY,
MUX, MUY, DX, DPX, DY, DPY, ANGLE,K1L, K2L, K3L, K4L, envx, envy,k0l,ddx,ddy;
!name,s,betx,bety,dx,dy,envx,envy, alfx,alfy,mux,RE56,
!angle,k1l,l;
twiss,chrom,rmatrix,sequence=e_AE,BETX=betxacc,BETY=betyacc,ALFX=alfxacc,ALFY=alfyacc,
                          dx = dxacc, dy = dyacc,file="tle_ae.tls",save;
			  
return;
//save, sequence= e_ae, file='e_ae_seq';

e_ae_rev: line = (-e_ae);
beam, particle=electron, energy = .51,sequence = e_ae_rev,sige=se,sigt = 1.;

use, sequence= e_ae_rev;

select, flag=twiss,clear;
envx := 3.0*sqrt(emitx_ae*table(twiss,betx)+(table(twiss,dx)*delp_ae)*(table(twiss,dx)*delp_ae));
envy := 3.0*sqrt(emity_ae*table(twiss,bety)+(table(twiss,dy)*delp_ae)*(table(twiss,dy)*delp_ae));

!select, flag=twiss, column=name,s,betx,bety,dx,dy,envx,envy, alfx,alfy,mux,muy;
select, flag=twiss, column=NAME, KEYWORD, S, L, BETX, BETY, ALFX, ALFY,
MUX, MUY, DX, DPX, DY, DPY, ANGLE,K1L, K2L, K3L, K4L, envx, envy,k0l,ddx,ddy;
!twiss,chrom,sequence=e_ae_rev,BETX=betxseptum,BETY=betyseptum,ALFX=alfxseptum,ALFY=alfyseptum,
!                          dx = dxseptum, dy = dyseptum, file="tle_ae_rev.tls",save;
twiss,chrom,sequence=e_ae_rev,BETX=betxseptum,BETY=betyseptum,
	ALFX=alfxseptum,ALFY=alfyseptum,
	dx = dxseptum, dy = dyseptum,
	dpx= dpxseptum,dpy= dpyseptum,
	file="tle_ae_rev.tls",save;

!system, "ps2pdf madx.ps";

! !###PTC  To produce fort.18
! ptc_create_universe;
! ptc_create_layout,model=2,method=6,nst=10;
! ptc_normal,icase=5,no=8,deltap=0.00;
! ptc_end;
!!! End MAD-X Code

return;
!STOP;
