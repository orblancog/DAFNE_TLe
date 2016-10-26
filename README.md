# TLe
DAFNE transfer line ACC->DAFNEe-

## Requirements
This code requires mad-x, root, pdftk, awk, sed
The input datafile is the "magnet_current.dat" file. 

## Execution
1) Convert the currents to madx
$ ./cur2madx "magnet_current.dat"
$ madx < e_ae.madx

## Others

To install Geant4
 /opt/exp_soft/muoncollider/setup.sh 

$ getbeamprofile <currents.dat>

echo "Creating fls.pdf"

pdftk FL2TR001.pdf FL2TR002.pdf FL2TT001.pdf FL2TT002.pdf FL1TT001.pdf FL1TT002.pdf FL1TT003.pdf FL1TE001.pdf FL1TE002.pdf FL1TE003.pdf FL1EL101.pdf output fls.pdfcat tle_ae.tls | grep -i fl | cut -d ' ' -f 2
scp dante@192.168.192.75:/u2/dcs/space/uniDatabase/datasets/TLe/eTLe_20161006_1803_pom6QuaterExcellent.dat .
cat tle_ae.tls | awk '{print  }'

