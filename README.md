To install Geant4
 /opt/exp_soft/muoncollider/setup.sh 

this code requires mad-x, root, pdftk, awk, sed 
$ getbeamprofile <currents.dat>

echo "Creating fls.pdf"

pdftk FL2TR001.pdf FL2TR002.pdf FL2TT001.pdf FL2TT002.pdf FL1TT001.pdf FL1TT002.pdf FL1TT003.pdf FL1TE001.pdf FL1TE002.pdf FL1TE003.pdf FL1EL101.pdf output fls.pdf