// oblancog. 2016.09.xx Drawing beam profiles
// this code generates the initial coordinates of the particles

// For the particle generation
#include "TRandom2.h"//period=10**26, fast, 32 bits for the state
// To check if the courant-snyder invariant 
#include "TMath.h"
// To read/write into a file
#include <iostream>
#include "TFile.h"
#include <fstream>
#include <stdio.h>
#include <string>

using namespace std;

int DrawProfile () {

  //Beam geometrical emittances
  double_t ex = 1;
  double_t ey = 1;
  double_t et = 1;
  // Phase space at input
  double_t gammax = 0.5;
  double_t betax = 2;
  double_t alfax = -0.5;
  double_t gammay = 1;
  double_t betay = 1;
  double_t alfay = 0;
  double_t Energyspread = 1;
  double_t etax=1;//off-momentum function
  double_t etapx=1;//off-momentum function
  double_t etay=0;//off-momentum function
  double_t etapy=0;//off-momentum function
  // Linear beam sizes from emittances and twiss
  double_t sigmax0 = 0;
  double_t sigmapx0 = 0;
  double_t sigmay0 = 0;
  double_t sigmapy0 = 0;
  double_t sigmas0 = 0;
  double_t sigmad0 = 0;

  ofstream mydebug;
  ofstream mymadxtrac;
  ifstream beta0in;
  string beta0string;
  ifstream beam0in;
  string beam0string;

  int nlines;
  char beta0line[80];
  char beam0line[80];

  char madx00[20];
  char madx01[20];
  char madx02[20];
  char madx03[20];
  char madx04[20];

  // Read twiss info
  beta0in.open("beta0.txt");
  if (beta0in == 0) {
    // if we cannot open the file, 
    // print an error message and return immediatly
    printf("Error: cannot open beta0.txt!\n");
    return 1;
  }
  cout << "  ... reading file beta0.txt (twiss params at input)"<<endl;
  beta0in >>  madx00 >> madx01 >> madx02 >> madx03;
  while(!beta0in.eof()){
    beta0in >> madx00 >> madx01 >> madx02 >> madx03 >> madx04;
    //    cout << madx01<<endl;
    if (!strcmp(madx01,"betx")) {cout<<"    "<<madx01<<" "<<madx04<<endl;betax=atof(madx04);}
    if (!strcmp(madx01,"alfx")) {cout<<"    "<<madx01<<" "<<madx04<<endl;alfax=atof(madx04);}
    if (!strcmp(madx01,"bety")) {cout<<"    "<<madx01<<" "<<madx04<<endl;betay=atof(madx04);}
    if (!strcmp(madx01,"alfy")) {cout<<"    "<<madx01<<" "<<madx04<<endl;alfay=atof(madx04);}
    if (!strcmp(madx01,"dx")) {cout<<"    "<<madx01<<" "<<madx04<<endl;etax=atof(madx04);}
    if (!strcmp(madx01,"dpx")) {cout<<"    "<<madx01<<" "<<madx04<<endl;etapx=atof(madx04);}
  }
  cout << "    ... all others ignored.";
  cout << "  beta0.txt read."<<endl;
  beam0in.close();
  cout << "  Calculating gamma[xy]..."<<endl;
  gammax = (1 + alfax*alfax )/betax;
  gammay = (1 + alfay*alfay )/betay;
  cout <<"    gammax "<<gammax<<endl;
  cout <<"    gammay "<<gammay<<endl;

  // Reading beam info
  beam0in.open("beam0.txt");
  if (beam0in == 0) {
    // if we cannot open the file, 
    // print an error message and return immediatly
    printf("Error: cannot open beam0.txt!\n");
    return 1;
  }
  cout << "  ... reading file beam0.txt (beam params)"<<endl;
  beam0in >>  madx00 >> madx01 >> madx02 >> madx03;
  while(!beam0in.eof()){
    beam0in >> madx01;// >> madx02 >> madx03 >> madx04;
    //    cout << madx01<<endl;
    //    cout << madx01<<endl;
    if (!strcmp(madx01,"ex")){
      beam0in >> madx02;
      beam0in >> madx03;
      beam0in >> madx04;
      cout<<"    "<<madx01<<" "<<madx04<<endl;
      ex=atof(madx04);}
    if (!strcmp(madx01,"ey")){
      beam0in >> madx02;
      beam0in >> madx03;
      beam0in >> madx04;
      cout<<"    "<<madx01<<" "<<madx04<<endl;
      ey=atof(madx04);}
    if (!strcmp(madx01,"sige")){
      beam0in >> madx02;
      beam0in >> madx03;
      beam0in >> madx04;
      cout<<"    "<<madx01<<" "<<madx04<<endl;
      Energyspread=atof(madx04);}
  }
  cout << "    ... all others ignored.";
  cout << "    beam0.txt read."<<endl;
  beam0in.close();

  // Calculate sigma0
  sigmax0  = TMath::Sqrt(ex*betax);
  sigmapx0 = TMath::Sqrt(ex/betax);
  sigmay0  = TMath::Sqrt(ey*betay);
  sigmapy0 = TMath::Sqrt(ey/betay);
  sigmas0  = TMath::Sqrt(et*0);
  //  sigmad0  = TMath::Sqrt(et*0);

  TCanvas *c1 = new TCanvas("c1");
  c1->Range(-20e-3,-20e-3,20e-3,20e-3);
  c1->SetGrid(20,20);
  TEllipse *el1 = new TEllipse(0,0,sigmax0,sigmay0);
  TEllipse *el2 = new TEllipse(0,0,3*sigmax0,3*sigmay0);

  cout << "  Drawing ellipse of axes [m]: " << sigmax0 << ' ' << sigmapx0<<endl;
  //  el1->GetXaxis()->SetNdivisions(20);
  //  el1->GetYaxis()->SetNdivisions(20);
  el2->Draw();
  el1->Draw();
  c1->RedrawAxis();


  return 0;
}

