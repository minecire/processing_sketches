import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
Minim minim;
AudioSample player;
AudioSample player2;
AudioSample player3;
AudioSample player4;
double t = 0;
JSONObject everything;
boolean start = false;
boolean[] smallupgrades = {false,false,false,false,false,false,false,false,false,false,false,false};
int[] micecoords = {500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500,500};
boolean done = false;
boolean achievements = false;
int scrolly = 0;
int achScroll = 0;
long winprice = 500000000;
boolean x = true;
boolean[] AchList = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false};
int[] Just_Recieved = {0,0};
String JRText = "";
long clix = 0;
long mice = 0;
int thing = 0;
long miceprice = 50;
long buttonprice = 300;
int buttons = 0;
long clickerprice = 1000;
int games = 0;
long machprice = 20000;
int machs = 0;
int farms = 0;
int animationPoint = 1;
long farmprice = 100000;
long factprice = 3000000;
int facts = 0;
long cmanprice = 50000000;
int cmen = 0;
long planetprice = 200000000;
long whiteholeprice = 1000000000;
long clonerprice = 500000000;
int planets = 0;
int whiteholes = 0;
int cloners = 0;
long pointerCPC = 1;
double miceCPS = 1;
double buttonCPS = 1;
double clickerCPS = 1;
double machCPS = 1;
double farmCPS = 1;
double factCPS = 1;
double cmanCPS = 1;
double planetCPS = 1;
double whiteholeCPS = 1;
double clonerCPS = 1;
long pointerUGprice = 50;
long miceUGprice = 500;
long buttonUGprice = 3000;
long clickerUGprice = 10000;
long machUGprice = 200000;
long farmUGprice = 1000000;
long factUGprice = 30000000;
long cmanUGprice = 500000000;
long planetUGprice = 2000000000;
long clonerUGprice = 500000000;
long whiteholeUGprice = 1000000000;
String CPS = "";
double CP;
long pointerUGLevel = 1;
int miceUGLevel = 1;
int buttonUGLevel = 1;
int clickerUGLevel = 1;
int machUGLevel = 1;
int farmUGLevel = 1;
int factUGLevel = 1;
int cmanUGLevel = 1;
int planetUGLevel = 1;
int whiteholeUGLevel = 1;
int clonerUGLevel = 1;
long gclix = 0;
int p = 0;
boolean won = false;
boolean mini = false;
boolean gold = false;
int style = 1;
int z = 0;
int w = 0;
void rainbg(){
  for(int L = 0; L < 400; L++){
    stroke(L,255-(L/2),L/4);
    line(L,0,L,400);
  }
};
int logten(double apple){
  w = 0;
  while(apple>10){
    apple/=10;
    w+=1;
  }
  return(w);
}
int numberofachcheck(){
  z = 0;
  for(int i=0;i<AchList.length; i++){
    if(AchList[i] == true){
      z+=1;
    }
  }
  return z;
}
void achcheck(){
  if(clix >= 1 && AchList[0] == false){
    JRText = "You Got 1 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 1;
    AchList[0] = true;
  }
  else if(clix >= 10 && AchList[1] == false){
    JRText = "You Got 10 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 2;
    AchList[1] = true;
  }
  else if(clix >= 100 && AchList[2] == false){
    JRText = "You Got 100 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 3;
    AchList[2] = true;
  }
  else if(clix >= 1000 && AchList[3] == false){
    JRText = "You Got 1000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 4;
    AchList[3] = true;
  }
  else if(clix >= 10000 && AchList[4] == false){
    JRText = "You Got 10000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 5;
    AchList[4] = true;
  }
  else if(clix >= 100000 && AchList[5] == false){
    JRText = "You Got 100000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 6;
    AchList[5] = true;
  }
  else if(clix >= 500000 && AchList[6] == false){
    JRText = "You Got 500000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 7;
    AchList[6] = true;
  }
  else if(clix >= 1000000 && AchList[7] == false){
    JRText = "You Got 1000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 8;
    AchList[7] = true;
  }
  else if(clix >= 5000000 && AchList[8] == false){
    JRText = "You Got 5000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 9;
    AchList[8] = true;
  }
  else if(clix >= 10000000 && AchList[9] == false){
    JRText = "You Got 10000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 10;
    AchList[9] = true;
  }
  else if(clix >= 50000000 && AchList[10] == false){
    JRText = "You Got 50000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 11;
    AchList[10] = true;
  }
  else if(clix >= 100000000 && AchList[11] == false){
    JRText = "You Got 100000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 12;
    AchList[11] = true;
  }
  else if(clix >= 500000000 && AchList[12] == false){
    JRText = "You Got 500000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 13;
    AchList[12] = true;
  }
  else if(clix >= 1000000000 && AchList[13] == false){
    JRText = "You Got 1000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 14;
    AchList[13] = true;
  }
  else if(clix >= winprice/100 && AchList[14] == false){
    JRText = "You Got 5000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 15;
    AchList[14] = true;
  }
  else if(clix >= winprice/50 && AchList[15] == false){
    JRText = "You Got 10000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 16;
    AchList[15] = true;
  }
  else if(clix >= winprice/10 && AchList[16] == false){
    JRText = "You Got 50000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 17;
    AchList[16] = true;
  }
  else if(clix >= winprice/5 && AchList[17] == false){
    JRText = "You Got 100000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 18;
    AchList[17] = true;
  }
  else if(clix>=winprice && AchList[18] == false){
    JRText = "You Got 500000000000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 19;
    AchList[18] = true;
  }
  else if(pointerUGLevel >= 2 && AchList[19] == false){
    JRText = "You upgraded you cliquer to level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 20;
    AchList[19] = true;
  }
  else if(pointerUGLevel >= 5 && AchList[20] == false){
    JRText = "You upgraded you cliquer to level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 21;
    AchList[20] = true;
  }
  else if(pointerUGLevel >= 10 && AchList[21] == false){
    JRText = "You upgraded you cliquer to level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 22;
    AchList[21] = true;
  }
  else if(pointerUGLevel >= 20 && AchList[22] == false){
    JRText = "You upgraded you cliquer to level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 23;
    AchList[22] = true;
  }
  else if(pointerUGLevel >= 50 && AchList[23] == false){
    JRText = "You Got 100000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 24;
    AchList[23] = true;
  }
  else if(pointerUGLevel >= 100 && AchList[24] == false){
    JRText = "You Got 500000 Clix!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 25;
    AchList[24] = true;
  }
  else if(mice >= 1 && AchList[25] == false){
    JRText = "You Got 1 Mouse!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 26;
    AchList[25] = true;
  }
  else if(mice >= 2 && AchList[26] == false){
    JRText = "You Got 2 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 27;
    AchList[26] = true;
  }
  else if(mice >= 3 && AchList[27] == false){
    JRText = "You Got 3 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 28;
    AchList[27] = true;
  }
  else if(mice >= 5 && AchList[28] == false){
    JRText = "You Got 5 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 29;
    AchList[28] = true;
  }
  else if(mice >= 10 && AchList[29] == false){
    JRText = "You Got 10 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 30;
    AchList[29] = true;
  }
  else if(mice >= 20 && AchList[30] == false){
    JRText = "You Got 20 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 31;
    AchList[30] = true;
  }
  else if(mice >= 50 && AchList[31] == false){
    JRText = "You Got 50 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 32;
    AchList[31] = true;
  }
  else if(mice >= 100 && AchList[32] == false){
    JRText = "You Got 100 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 31;
    AchList[32] = true;
  }
  else if(mice >= 200 && AchList[33] == false){
    JRText = "You Got 200 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 32;
    AchList[33] = true;
  }
  else if(mice >= 500 && AchList[34] == false){
    JRText = "You Got 500 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[34] = true;
  }
  else if(mice >= 1000 && AchList[35] == false){
    JRText = "You Got 1000 Mice!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 34;
    AchList[35] = true;
  }
  else if(miceUGLevel >= 2 && AchList[36] == false){
    JRText = "You Upgraded Mice To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[36] = true;
  }
  else if(miceUGLevel >= 3 && AchList[37] == false){
    JRText = "You Upgraded Mice To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[37] = true;
  }
  else if(miceUGLevel >= 5 && AchList[38] == false){
    JRText = "You Upgraded Mice To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[38] = true;
  }
  else if(miceUGLevel >= 8 && AchList[39] == false){
    JRText = "You Upgraded Mice To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[39] = true;
  }
  else if(miceUGLevel >= 10 && AchList[40] == false){
    JRText = "You Upgraded Mice To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[40] = true;
  }
  else if(miceUGLevel >= 20 && AchList[41] == false){
    JRText = "You Upgraded Mice To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[41] = true;
  }
  else if(miceUGLevel >= 50 && AchList[42] == false){
    JRText = "You Upgraded Mice To Level 50!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[42] = true;
  }
  else if(miceUGLevel >= 100 && AchList[43] == false){
    JRText = "You Upgraded Mice To Level 100!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[43] = true;
  }
  else if(miceUGLevel >= 200 && AchList[44] == false){
    JRText = "You Upgraded Mice To Level 200!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 33;
    AchList[44] = true;
  }
  else if(buttons >= 1 && AchList[45] == false){
    JRText = "You Got 1 Button!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 35;
    AchList[45] = true;
  }
  else if(buttons >= 2 && AchList[46] == false){
    JRText = "You Got 2 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 36;
    AchList[46] = true;
  }
  else if(buttons >= 3 && AchList[47] == false){
    JRText = "You Got 3 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 35;
    AchList[47] = true;
  }
  else if(buttons >= 5 && AchList[48] == false){
    JRText = "You Got 5 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 38;
    AchList[48] = true;
  }
  else if(buttons >= 10 && AchList[49] == false){
    JRText = "You Got 10 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 39;
    AchList[49] = true;
  }
  else if(buttons >= 30 && AchList[50] == false){
    JRText = "You Got 30 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 40;
    AchList[50] = true;
  }
  else if(buttons >= 50 && AchList[51] == false){
    JRText = "You Got 50 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 41;
    AchList[51] = true;
  }
  else if(buttons >= 100 && AchList[52] == false){
    JRText = "You Got 100 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 42;
    AchList[52] = true;
  }
  else if(buttons >= 150 && AchList[53] == false){
    JRText = "You Got 150 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 43;
    AchList[53] = true;
  }
  else if(buttons >= 200 && AchList[54] == false){
    JRText = "You Got 200 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 45;
    AchList[54] = true;
  }
  else if(buttons >= 250 && AchList[55] == false){
    JRText = "You Got 250 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 45;
    AchList[55] = true;
  }
  else if(buttons >= 500 && AchList[56] == false){
    JRText = "You Got 500 Buttons!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[56] = true;
  }
  else if(buttonUGLevel >= 2 && AchList[57] == false){
    JRText = "You Upgraded Buttons To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[57] = true;
  }
  else if(buttonUGLevel >= 3 && AchList[58] == false){
    JRText = "You Upgraded Buttons To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[58] = true;
  }
  else if(buttonUGLevel >= 4 && AchList[59] == false){
    JRText = "You Upgraded Buttons To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[59] = true;
  }
  else if(buttonUGLevel >= 5 && AchList[60] == false){
    JRText = "You Upgraded Buttons To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[60] = true;
  }
  else if(buttonUGLevel >= 6 && AchList[61] == false){
    JRText = "You Upgraded Buttons To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[61] = true;
  }
  else if(buttonUGLevel >= 8 && AchList[62] == false){
    JRText = "You Upgraded Buttons To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[62] = true;
  }
  else if(buttonUGLevel >= 10 && AchList[63] == false){
    JRText = "You Upgraded Buttons To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[63] = true;
  }
  else if(buttonUGLevel >= 20 && AchList[64] == false){
    JRText = "You Upgraded Buttons To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[64] = true;
  }
  else if(buttonUGLevel >= 40 && AchList[65] == false){
    JRText = "You Upgraded Buttons To Level 40!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[65] = true;
  }
  else if(buttonUGLevel >= 50 && AchList[66] == false){
    JRText = "You Upgraded Buttons To Level 50!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[66] = true;
  }
  else if(buttonUGLevel >= 75 && AchList[67] == false){
    JRText = "You Upgraded Buttons To Level 75!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[67] = true;
  }
  else if(buttonUGLevel >= 100 && AchList[68] == false){
    JRText = "You Upgraded Buttons To Level 100!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[68] = true;
  }
  else if(buttonUGLevel >= 125 && AchList[69] == false){
    JRText = "You Upgraded Buttons To Level 125!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[69] = true;
  }
  else if(buttonUGLevel >= 150 && AchList[70] == false){
    JRText = "You Upgraded Buttons To Level 150!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[70] = true;
  }
  else if(buttonUGLevel >= 175 && AchList[71] == false){
    JRText = "You Upgraded Buttons To Level 175!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[71] = true;
  }
  else if(buttonUGLevel >= 200 && AchList[72] == false){
    JRText = "You Upgraded Buttons To Level 200!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[72] = true;
  }
  else if(games >= 1 && AchList[73] == false){
    JRText = "You Have 1 Clicker Game!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[73] = true;
  }
  else if(games >= 2 && AchList[74] == false){
    JRText = "You Have 2 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[74] = true;
  }
  else if(games >= 3 && AchList[75] == false){
    JRText = "You Have 3 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[75] = true;
  }
  else if(games >= 4 && AchList[76] == false){
    JRText = "You Have 4 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[76] = true;
  }
  else if(games >= 5 && AchList[77] == false){
    JRText = "You Have 5 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[77] = true;
  }
  else if(games >= 8 && AchList[78] == false){
    JRText = "You Have 8 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[78] = true;
  }
  else if(games >= 10 && AchList[79] == false){
    JRText = "You Have 10 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[79] = true;
  }
  else if(games >= 15 && AchList[80] == false){
    JRText = "You Have 15 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[80] = true;
  }
  else if(games >= 22 && AchList[81] == false){
    JRText = "You Have 22 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[81] = true;
  }
  else if(games >= 30 && AchList[82] == false){
    JRText = "You Have 30 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[82] = true;
  }
  else if(games >= 40 && AchList[83] == false){
    JRText = "You Have 40 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[83] = true;
  }
  else if(games >= 50 && AchList[84] == false){
    JRText = "You Have 50 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[84] = true;
  }
  else if(games >= 60 && AchList[85] == false){
    JRText = "You Have 60 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[85] = true;
  }
  else if(games >= 80 && AchList[86] == false){
    JRText = "You Have 80 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[86] = true;
  }
  else if(games >= 100 && AchList[87] == false){
    JRText = "You Have 100 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[87] = true;
  }
  else if(games >= 125 && AchList[88] == false){
    JRText = "You Have 125 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[88] = true;
  }
  else if(games >= 150 && AchList[89] == false){
    JRText = "You Have 150 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[89] = true;
  }
  else if(games >= 175 && AchList[90] == false){
    JRText = "You Have 175 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[90] = true;
  }
  else if(games >= 200 && AchList[91] == false){
    JRText = "You Have 200 Clicker Games!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[91] = true;
  }
  else if(clickerUGLevel >= 2 && AchList[92] == false){
    JRText = "You Upgraded Clicker Games To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[92] = true;
  }
  else if(clickerUGLevel >= 3 && AchList[93] == false){
    JRText = "You Upgraded Clicker Games To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[93] = true;
  }
  else if(clickerUGLevel >= 4 && AchList[94] == false){
    JRText = "You Upgraded Clicker Games To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[94] = true;
  }
  else if(clickerUGLevel >= 5 && AchList[95] == false){
    JRText = "You Upgraded Clicker Games To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[95] = true;
  }
  else if(clickerUGLevel >= 8 && AchList[96] == false){
    JRText = "You Upgraded Clicker Games To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[96] = true;
  }
  else if(clickerUGLevel >= 10 && AchList[97] == false){
    JRText = "You Upgraded Clicker Games To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[97] = true;
  }
  else if(clickerUGLevel >= 15 && AchList[98] == false){
    JRText = "You Upgraded Clicker Games To Level 15!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[98] = true;
  }
  else if(clickerUGLevel >= 20 && AchList[99] == false){
    JRText = "You Upgraded Clicker Games To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[99] = true;
  }
  else if(clickerUGLevel >= 30 && AchList[100] == false){
    JRText = "You Upgraded Clicker Games To Level 30!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[100] = true;
  }
  else if(clickerUGLevel >= 50 && AchList[101] == false){
    JRText = "You Upgraded Clicker Games To Level 50!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[101] = true;
  }
  else if(clickerUGLevel >= 60 && AchList[102] == false){
    JRText = "You Upgraded Clicker Games To Level 60!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[102] = true;
  }
  else if(clickerUGLevel >= 85 && AchList[103] == false){
    JRText = "You Upgraded Clicker Games To Level 85!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[103] = true;
  }
  else if(clickerUGLevel >= 110 && AchList[104] == false){
    JRText = "You Upgraded Clicker Games To Level 110!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[104] = true;
  }
  else if(machs >= 1 && AchList[105] == false){
    JRText = "You Have 1 Machine!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[105] = true;
  }
  else if(machs >= 2 && AchList[106] == false){
    JRText = "You Have 2 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[106] = true;
  }
  else if(machs >= 3 && AchList[107] == false){
    JRText = "You Have 3 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[107] = true;
  }
  else if(machs >= 4 && AchList[108] == false){
    JRText = "You Have 4 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[108] = true;
  }
  else if(machs >= 5 && AchList[109] == false){
    JRText = "You Have 5 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[109] = true;
  }
  else if(machs >= 6 && AchList[110] == false){
    JRText = "You Have 6 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[110] = true;
  }
  else if(machs >= 7 && AchList[111] == false){
    JRText = "You Have 7 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[111] = true;
  }
  else if(machs >= 8 && AchList[112] == false){
    JRText = "You Have 8 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[112] = true;
  }
  else if(machs >= 10 && AchList[113] == false){
    JRText = "You Have 10 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[113] = true;
  }
  else if(machs >= 15 && AchList[114] == false){
    JRText = "You Have 15 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[114] = true;
  }
  else if(machs >= 25 && AchList[115] == false){
    JRText = "You Have 25 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[115] = true;
  }
  else if(machs >= 50 && AchList[116] == false){
    JRText = "You Have 50 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[116] = true;
  }
  else if(machs >= 80 && AchList[117] == false){
    JRText = "You Have 80 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[117] = true;
  }
  else if(machs >= 120 && AchList[118] == false){
    JRText = "You Have 120 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[118] = true;
  }
  else if(machs >= 170 && AchList[118] == false){
    JRText = "You Have 170 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[118] = true;
  }
  else if(machs >= 240 && AchList[119] == false){
    JRText = "You Have 240 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[119] = true;
  }
  else if(machs >= 300 && AchList[120] == false){
    JRText = "You Have 300 Machines!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[120] = true;
  }
  else if(machUGLevel >= 2 && AchList[121] == false){
    JRText = "You Upgraded Machines To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[121] = true;
  }
  else if(machUGLevel >= 3 && AchList[122] == false){
    JRText = "You Upgraded Machines To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[122] = true;
  }
  else if(machUGLevel >= 4 && AchList[123] == false){
    JRText = "You Upgraded Machines To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[123] = true;
  }
  else if(machUGLevel >= 5 && AchList[124] == false){
    JRText = "You Upgraded Machines To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[124] = true;
  }
  else if(machUGLevel >= 6 && AchList[125] == false){
    JRText = "You Upgraded Machines To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[125] = true;
  }
  else if(machUGLevel >= 7 && AchList[126] == false){
    JRText = "You Upgraded Machines To Level 7!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[126] = true;
  }
  else if(machUGLevel >= 8 && AchList[127] == false){
    JRText = "You Upgraded Machines To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[127] = true;
  }
  else if(machUGLevel >= 10 && AchList[128] == false){
    JRText = "You Upgraded Machines To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[128] = true;
  }
  else if(machUGLevel >= 15 && AchList[129] == false){
    JRText = "You Upgraded Machines To Level 15!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[129] = true;
  }
  else if(machUGLevel >= 20 && AchList[130] == false){
    JRText = "You Upgraded Machines To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[130] = true;
  }
  else if(machUGLevel >= 30 && AchList[131] == false){
    JRText = "You Upgraded Machines To Level 30!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[131] = true;
  }
  else if(machUGLevel >= 40 && AchList[132] == false){
    JRText = "You Upgraded Machines To Level 40!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[132] = true;
  }
  else if(machUGLevel >= 50 && AchList[133] == false){
    JRText = "You Upgraded Machines To Level 50!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[133] = true;
  }
  else if(machUGLevel >= 75 && AchList[134] == false){
    JRText = "You Upgraded Machines To Level 75!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[134] = true;
  }
  else if(farms >= 1 && AchList[135] == false){
    JRText = "You Got 1 Farm!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[135] = true;
  }
  else if(farms >= 2 && AchList[136] == false){
    JRText = "You Got 2 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[136] = true;
  }
  else if(farms >= 3 && AchList[137] == false){
    JRText = "You Got 3 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[137] = true;
  }
  else if(farms >= 4 && AchList[138] == false){
    JRText = "You Got 4 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[138] = true;
  }
  else if(farms >= 5 && AchList[139] == false){
    JRText = "You Got 5 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[139] = true;
  }
  else if(farms >= 6 && AchList[140] == false){
    JRText = "You Got 6 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[140] = true;
  }
  else if(farms >= 7 && AchList[141] == false){
    JRText = "You Got 7 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[141] = true;
  }
  else if(farms >= 8 & AchList[142] == false){
    JRText = "You Got 8 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[142] = true;
  }
  else if(farms >= 9 && AchList[143] == false){
    JRText = "You Got 9 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[143] = true;
  }
  else if(farms >= 10 && AchList[144] == false){
    JRText = "You Got 10 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[144] = true;
  }
  else if(farms >= 12 && AchList[145] == false){
    JRText = "You Got 12 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[145] = true;
  }
  else if(farms >= 15 && AchList[146] == false){
    JRText = "You Got 15 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[146] = true;
  }
  else if(farms >= 20 && AchList[147] == false){
    JRText = "You Got 20 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[147] = true;
  }
  else if(farms >= 30 && AchList[148] == false){
    JRText = "You Got 30 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[148] = true;
  }
  else if(farms >= 50 && AchList[149] == false){
    JRText = "You Got 50 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[149] = true;
  }
  else if(farms >= 70 & AchList[150] == false){
    JRText = "You Got 70 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[150] = true;
  }
  else if(farms >= 100 && AchList[151] == false){
    JRText = "You Got 100 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[151] = true;
  }
  else if(farms >= 150 && AchList[152] == false){
    JRText = "You Got 150 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[152] = true;
  }
  else if(farms >= 220 & AchList[153] == false){
    JRText = "You Got 220 Farms!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[153] = true;
  }
  else if(farmUGLevel >= 2 & AchList[154] == false){
    JRText = "You Upgraded Farms To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[154] = true;
  }
  else if(farmUGLevel >= 3 & AchList[155] == false){
    JRText = "You Upgraded Farms To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[155] = true;
  }
  else if(farmUGLevel >= 4 & AchList[156] == false){
    JRText = "You Upgraded Farms To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[156] = true;
  }
  else if(farmUGLevel >= 5 & AchList[157] == false){
    JRText = "You Upgraded Farms To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[157] = true;
  }
  else if(farmUGLevel >= 6 & AchList[158] == false){
    JRText = "You Upgraded Farms To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[158] = true;
  }
  else if(farmUGLevel >= 7 & AchList[159] == false){
    JRText = "You Upgraded Farms To Level 7!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[159] = true;
  }
  else if(farmUGLevel >= 8 & AchList[160] == false){
    JRText = "You Upgraded Farms To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[160] = true;
  }
  else if(farmUGLevel >= 9 & AchList[161] == false){
    JRText = "You Upgraded Farms To Level 9!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[161] = true;
  }
  else if(farmUGLevel >= 10 & AchList[162] == false){
    JRText = "You Upgraded Farms To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[162] = true;
  }
  else if(farmUGLevel >= 12 & AchList[163] == false){
    JRText = "You Upgraded Farms To Level 12!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[163] = true;
  }
  else if(farmUGLevel >= 15 & AchList[164] == false){
    JRText = "You Upgraded Farms To Level 15!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[164] = true;
  }
  else if(farmUGLevel >= 20 & AchList[165] == false){
    JRText = "You Upgraded Farms To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[165] = true;
  }
  else if(farmUGLevel >= 25 & AchList[166] == false){
    JRText = "You Upgraded Farms To Level 25!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[166] = true;
  }
  else if(farmUGLevel >= 30 & AchList[167] == false){
    JRText = "You Upgraded Farms To Level 30!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[167] = true;
  }
  else if(farmUGLevel >= 40 & AchList[168] == false){
    JRText = "You Upgraded Farms To Level 40!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[168] = true;
  }
  else if(facts >= 1 & AchList[169] == false){
    JRText = "You Bought 1 Factory!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[169] = true;
  }
  else if(facts >= 2 & AchList[170] == false){
    JRText = "You Bought 2 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[170] = true;
  }
  else if(facts >= 3 & AchList[171] == false){
    JRText = "You Bought 3 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[171] = true;
  }
  else if(facts >= 4 & AchList[172] == false){
    JRText = "You Bought 4 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[172] = true;
  }
  else if(facts >= 5 & AchList[173] == false){
    JRText = "You Bought 5 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[173] = true;
  }
  else if(facts >= 6 & AchList[174] == false){
    JRText = "You Bought 6 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[174] = true;
  }
  else if(facts >= 7 & AchList[175] == false){
    JRText = "You Bought 7 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[175] = true;
  }
  else if(facts >= 8 & AchList[176] == false){
    JRText = "You Bought 8 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[176] = true;
  }
  else if(facts >= 9 & AchList[177] == false){
    JRText = "You Bought 9 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[177] = true;
  }
  else if(facts >= 10 & AchList[178] == false){
    JRText = "You Bought 10 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[178] = true;
  }
  else if(facts >= 12 & AchList[179] == false){
    JRText = "You Bought 12 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[179] = true;
  }
  else if(facts >= 14 & AchList[180] == false){
    JRText = "You Bought 14 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[180] = true;
  }
  else if(facts >= 16 & AchList[181] == false){
    JRText = "You Bought 16 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[181] = true;
  }
  else if(facts >= 18 & AchList[182] == false){
    JRText = "You Bought 18 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[182] = true;
  }
  else if(facts >= 20 & AchList[183] == false){
    JRText = "You Bought 20 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[183] = true;
  }
  else if(facts >= 25 & AchList[184] == false){
    JRText = "You Bought 25 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[184] = true;
  }
  else if(facts >= 35 & AchList[185] == false){
    JRText = "You Bought 35 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[185] = true;
  }
  else if(facts >= 50 & AchList[186] == false){
    JRText = "You Bought 50 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[186] = true;
  }
  else if(facts >= 70 & AchList[187] == false){
    JRText = "You Bought 70 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[187] = true;
  }
  else if(facts >= 90 & AchList[188] == false){
    JRText = "You Bought 90 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[188] = true;
  }
  else if(facts >= 125 & AchList[189] == false){
    JRText = "You Bought 125 Factories!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[189] = true;
  }
  else if(factUGLevel >= 2 & AchList[190] == false){
    JRText = "You Upgraded Factories To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[190] = true;
  }
  else if(factUGLevel >= 3 & AchList[191] == false){
    JRText = "You Upgraded Factories To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[191] = true;
  }
  else if(factUGLevel >= 4 & AchList[192] == false){
    JRText = "You Upgraded Factories To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[192] = true;
  }
  else if(factUGLevel >= 5 & AchList[193] == false){
    JRText = "You Upgraded Factories To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[193] = true;
  }
  else if(factUGLevel >= 6 & AchList[194] == false){
    JRText = "You Upgraded Factories To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[194] = true;
  }
  else if(factUGLevel >= 7 & AchList[195] == false){
    JRText = "You Upgraded Factories To Level 7!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[195] = true;
  }
  else if(factUGLevel >= 8 & AchList[196] == false){
    JRText = "You Upgraded Factories To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[196] = true;
  }
  else if(factUGLevel >= 9 & AchList[197] == false){
    JRText = "You Upgraded Factories To Level 9!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[197] = true;
  }
  else if(factUGLevel >= 10 & AchList[198] == false){
    JRText = "You Upgraded Factories To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[198] = true;
  }
  else if(factUGLevel >= 11 & AchList[199] == false){
    JRText = "You Upgraded Factories To Level 11!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[199] = true;
  }
  else if(factUGLevel >= 13 & AchList[200] == false){
    JRText = "You Upgraded Factories To Level 13!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[200] = true;
  }
  else if(factUGLevel >= 15 & AchList[201] == false){
    JRText = "You Upgraded Factories To Level 15!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[201] = true;
  }
  else if(factUGLevel >= 20 & AchList[202] == false){
    JRText = "You Upgraded Factories To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[202] = true;
  }
  else if(factUGLevel >= 25 & AchList[203] == false){
    JRText = "You Upgraded Factories To Level 25!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[203] = true;
  }
  else if(cmen >= 1 & AchList[204] == false){
    JRText = "You Got 1 ClickerMan!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[204] = true;
  }
  else if(cmen >= 2 & AchList[205] == false){
    JRText = "You Got 2 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[205] = true;
  }
  else if(cmen >= 3 & AchList[206] == false){
    JRText = "You Got 3 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[206] = true;
  }
  else if(cmen >= 4 & AchList[207] == false){
    JRText = "You Got 4 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[207] = true;
  }
  else if(cmen >= 5 & AchList[208] == false){
    JRText = "You Got 5 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[208] = true;
  }
  else if(cmen >= 6 & AchList[209] == false){
    JRText = "You Got 6 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[209] = true;
  }
  else if(cmen >= 7 & AchList[210] == false){
    JRText = "You Got 7 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[210] = true;
  }
  else if(cmen >= 8 & AchList[211] == false){
    JRText = "You Got 8 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[211] = true;
  }
  else if(cmen >= 9 & AchList[212] == false){
    JRText = "You Got 9 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[212] = true;
  }
  else if(cmen >= 10 & AchList[213] == false){
    JRText = "You Got 10 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[213] = true;
  }
  else if(cmen >= 12 & AchList[214] == false){
    JRText = "You Got 12 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[214] = true;
  }
  else if(cmen >= 14 & AchList[215] == false){
    JRText = "You Got 14 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[215] = true;
  }
  else if(cmen >= 16 & AchList[216] == false){
    JRText = "You Got 16 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[216] = true;
  }
  else if(cmen >=18 & AchList[217] == false){
    JRText = "You Got 18 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[217] = true;
  }
  else if(cmen >= 20 & AchList[218] == false){
    JRText = "You Got 20 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[218] = true;
  }
  else if(cmen >= 25 & AchList[219] == false){
    JRText = "You Got 25 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[219] = true;
  }
  else if(cmen >= 40 & AchList[220] == false){
    JRText = "You Got 40 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[220] = true;
  }
  else if(cmen >= 60 & AchList[221] == false){
    JRText = "You Got 60 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[221] = true;
  }
  else if(cmen >= 90 & AchList[222] == false){
    JRText = "You Got 90 ClickerMen!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[222] = true;
  }
  else if(cmanUGLevel >= 2 & AchList[223] == false){
    JRText = "You Upgraded ClickerMen To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[223] = true;
  }
  else if(cmanUGLevel >= 3 & AchList[224] == false){
    JRText = "You Upgraded ClickerMen To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[224] = true;
  }
  else if(cmanUGLevel >= 4 & AchList[225] == false){
    JRText = "You Upgraded ClickerMen To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[225] = true;
  }
  else if(cmanUGLevel >= 5 & AchList[226] == false){
    JRText = "You Upgraded ClickerMen To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[226] = true;
  }
  else if(cmanUGLevel >= 6 & AchList[227] == false){
    JRText = "You Upgraded ClickerMen To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[227] = true;
  }
  else if(cmanUGLevel >= 7 & AchList[228] == false){
    JRText = "You Upgraded ClickerMen To Level 7!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[228] = true;
  }
  else if(cmanUGLevel >= 8 & AchList[229] == false){
    JRText = "You Upgraded ClickerMen To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[229] = true;
  }
  else if(cmanUGLevel >= 9 & AchList[230] == false){
    JRText = "You Upgraded ClickerMen To Level 9!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[230] = true;
  }
  else if(cmanUGLevel >= 10 & AchList[231] == false){
    JRText = "You Upgraded ClickerMen To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[231] = true;
  }
  else if(cmanUGLevel >= 11 & AchList[232] == false){
    JRText = "You Upgraded ClickerMen To Level 11!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[232] = true;
  }
  else if(cmanUGLevel >= 12 & AchList[233] == false){
    JRText = "You Upgraded ClickerMen To Level 12!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[233] = true;
  }
  else if(planets >= 1 & AchList[234] == false){
    JRText = "You Got 1 Planet!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[234] = true;
  }
  else if(planets >= 2 & AchList[235] == false){
    JRText = "You Got 2 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[235] = true;
  }
  else if(planets >= 3 & AchList[236] == false){
    JRText = "You Got 3 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[236] = true;
  }
  else if(planets >= 4 & AchList[237] == false){
    JRText = "You Got 4 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[237] = true;
  }
  else if(planets >= 5 & AchList[238] == false){
    JRText = "You Got 5 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[238] = true;
  }
  else if(planets >= 6 & AchList[239] == false){
    JRText = "You Got 6 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[239] = true;
  }
  else if(planets >= 7 & AchList[240] == false){
    JRText = "You Got 7 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[240] = true;
  }
  else if(planets >= 8 & AchList[241] == false){
    JRText = "You Got 8 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[241] = true;
  }
  else if(planets >= 9 & AchList[242] == false){
    JRText = "You Got 9 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[242] = true;
  }
  else if(planets >= 10 & AchList[243] == false){
    JRText = "You Got 10 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[243] = true;
  }
  else if(planets >= 11 & AchList[244] == false){
    JRText = "You Got 11 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[244] = true;
  }
  else if(planets >= 12 & AchList[245] == false){
    JRText = "You Got 12 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[245] = true;
  }
  else if(planets >= 13 & AchList[246] == false){
    JRText = "You Got 13 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[246] = true;
  }
  else if(planets >= 15 & AchList[247] == false){
    JRText = "You Got 15 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[247] = true;
  }
  else if(planets >= 18 & AchList[248] == false){
    JRText = "You Got 18 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[248] = true;
  }
  else if(planets >= 23 & AchList[249] == false){
    JRText = "You Got 23 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[249] = true;
  }
  else if(planets >= 30 & AchList[250] == false){
    JRText = "You Got 30 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[250] = true;
  }
  else if(planets >= 40 & AchList[251] == false){
    JRText = "You Got 40 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[251] = true;
  }
  else if(planets >= 50 & AchList[252] == false){
    JRText = "You Got 50 Planets!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[252] = true;
  }
  else if(planetUGLevel >= 2 & AchList[253] == false){
    JRText = "You Upgraded Planets To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[253] = true;
  }
  else if(planetUGLevel >= 3 & AchList[254] == false){
    JRText = "You Upgraded Planets To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[254] = true;
  }
  else if(planetUGLevel >= 4 & AchList[255] == false){
    JRText = "You Upgraded Planets To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[255] = true;
  }
  else if(planetUGLevel >= 5 & AchList[256] == false){
    JRText = "You Upgraded Planets To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[256] = true;
  }
  else if(planetUGLevel >= 6 & AchList[257] == false){
    JRText = "You Upgraded Planets To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[257] = true;
  }
  else if(planetUGLevel >= 7 & AchList[258] == false){
    JRText = "You Upgraded Planets To Level 7!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[258] = true;
  }
  else if(planetUGLevel >= 8 & AchList[259] == false){
    JRText = "You Upgraded Planets To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[259] = true;
  }
  else if(cloners >= 1 & AchList[260] == false){
    JRText = "You Got 1 Cloner!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[260] = true;
  }
  else if(cloners >= 2 & AchList[261] == false){
    JRText = "You Got 2 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[261] = true;
  }
  else if(cloners >= 3 & AchList[262] == false){
    JRText = "You Got 3 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[262] = true;
  }
  else if(cloners >= 4 & AchList[263] == false){
    JRText = "You Got 4 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[263] = true;
  }
  else if(cloners >= 5 & AchList[264] == false){
    JRText = "You Got 5 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[264] = true;
  }
  else if(cloners >= 6 & AchList[265] == false){
    JRText = "You Got 6 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[265] = true;
  }
  else if(cloners >= 7 & AchList[266] == false){
    JRText = "You Got 7 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[266] = true;
  }
  else if(cloners >= 8 & AchList[267] == false){
    JRText = "You Got 8 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[267] = true;
  }else if(cloners >= 10 & AchList[268] == false){
    JRText = "You Got 10 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[268] = true;
  }
  else if(cloners >= 15 & AchList[269] == false){
    JRText = "You Got 15 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[269] = true;
  }
  else if(cloners >= 20 & AchList[270] == false){
    JRText = "You Got 20 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[270] = true;
  }
  else if(cloners >= 25 & AchList[271] == false){
    JRText = "You Got 25 Cloners!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[271] = true;
  }
  else if(clonerUGLevel >= 2 & AchList[272] == false){
    JRText = "You Upgraded Cloners To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[272] = true;
  }
  else if(clonerUGLevel >= 3 & AchList[273] == false){
    JRText = "You Upgraded Cloners To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[273] = true;
  }
  else if(clonerUGLevel >= 4 & AchList[274] == false){
    JRText = "You Upgraded Cloners To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[274] = true;
  }
  else if(clonerUGLevel >= 5 & AchList[275] == false){
    JRText = "You Upgraded Cloners To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[275] = true;
  }
  else if(whiteholes >= 1 & AchList[276] == false){
    JRText = "You Got 1 White Hole!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[276] = true;
  }
  else if(whiteholes >= 2 & AchList[277] == false){
    JRText = "You Got 2 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[277] = true;
  }
  else if(whiteholes >= 3 & AchList[278] == false){
    JRText = "You Got 3 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[278] = true;
  }
  else if(whiteholes >= 4 & AchList[279] == false){
    JRText = "You Got 4 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[279] = true;
  }
  else if(whiteholes >= 5 & AchList[280] == false){
    JRText = "You Got 5 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[280] = true;
  }
  else if(whiteholes >= 6 & AchList[281] == false){
    JRText = "You Got 6 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[281] = true;
  }
  else if(whiteholes >= 7 & AchList[282] == false){
    JRText = "You Got 7 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[282] = true;
  }
  else if(whiteholes >= 8 & AchList[283] == false){
    JRText = "You Got 8 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[283] = true;
  }
  else if(whiteholes >= 9 & AchList[284] == false){
    JRText = "You Got 9 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[284] = true;
  }
  else if(whiteholes >= 10 & AchList[285] == false){
    JRText = "You Got 10 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[285] = true;
  }
  else if(whiteholes >= 11 & AchList[286] == false){
    JRText = "You Got 11 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[286] = true;
  }
  else if(whiteholes >= 12 & AchList[287] == false){
    JRText = "You Got 12 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[287] = true;
  }
  else if(whiteholes >= 13 & AchList[288] == false){
    JRText = "You Got 13 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[288] = true;
  }
  else if(whiteholes >= 14 & AchList[289] == false){
    JRText = "You Got 14 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[289] = true;
  }
  else if(whiteholes >= 15 & AchList[290] == false){
    JRText = "You Got 15 White Holes!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[290] = true;
  }
  else if(whiteholeUGLevel >= 2 & AchList[291] == false){
    JRText = "You Upgraded White Holes To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[291] = true;
  }
  else if(whiteholeUGLevel >= 3 & AchList[292] == false){
    JRText = "You Upgraded White Holes To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[292] = true;
  }
  else if(whiteholeUGLevel >= 4 & AchList[293] == false){
    JRText = "You Upgraded White Holes To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[293] = true;
  }
  else if(gclix >= 1 & AchList[294] == false){
    JRText = "You Got 1 Golden Clique!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[294] = true;
  }
  else if(gclix >= 2 & AchList[295] == false){
    JRText = "You Got 2 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[295] = true;
  }
  else if(gclix >= 3 & AchList[296] == false){
    JRText = "You Got 3 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[296] = true;
  }
  else if(gclix >= 4 & AchList[297] == false){
    JRText = "You Got 4 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[297] = true;
  }
  else if(gclix >= 5 & AchList[298] == false){
    JRText = "You Got 5 Golden Clique!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[298] = true;
  }
  else if(gclix >= 10 & AchList[299] == false){
    JRText = "You Got 10 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[299] = true;
  }
  else if(gclix >= 15 & AchList[300] == false){
    JRText = "You Got 15 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[300] = true;
  }
  else if(gclix >= 20 & AchList[301] == false){
    JRText = "You Got 20 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[301] = true;
  }
  else if(gclix >= 25 & AchList[302] == false){
    JRText = "You Got 25 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[302] = true;
  }
  else if(gclix >= 35 & AchList[303] == false){
    JRText = "You Got 35 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[303] = true;
  }
  else if(gclix >= 50 & AchList[304] == false){
    JRText = "You Got 50 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[304] = true;
  }
  else if(gclix >= 200 & AchList[305] == false){
    JRText = "You Got 200 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[305] = true;
  }
  else if(gclix >= 500 & AchList[306] == false){
    JRText = "You Got 500 Golden Clique!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[306] = true;
  }
  else if(gclix >= 1000 & AchList[307] == false){
    JRText = "You Got 1000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[307] = true;
  }
  else if(gclix >= 5000 & AchList[308] == false){
    JRText = "You Got 5000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[308] = true;
  }
  else if(gclix >= 10000 & AchList[309] == false){
    JRText = "You Got 10000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[309] = true;
  }
  else if(gclix >= 50000 & AchList[310] == false){
    JRText = "You Got 50000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[310] = true;
  }
  else if(gclix >= 100000 & AchList[311] == false){
    JRText = "You Got 100000 Golden Clique!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[311] = true;
  }
  else if(gclix >= 500000 & AchList[312] == false){
    JRText = "You Got 500000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[312] = true;
  }
  else if(gclix >= 1000000 & AchList[313] == false){
    JRText = "You Got 1000000 Golden Cliques!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[313] = true;
  }
  else if(won == true & AchList[314] == false){
    JRText = "You Won The Game!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[314] = true;
  }
  else if(mice >= 1 & buttons >= 1 & games >= 1 & machs >= 1 & farms >= 1 & facts >= 1 & cmen >= 1 & planets >= 1 & cloners >= 1 & whiteholes >= 1 & AchList[315] == false){
    JRText = "You Got 1 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[315] = true;
  }
  else if(mice >= 5 & buttons >= 5 & games >= 5 & machs >= 5 & farms >= 5 & facts >= 5 & cmen >= 5 & planets >= 5 & cloners >= 5 & whiteholes >= 5 & AchList[316] == false){
    JRText = "You Got 5 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[316] = true;
  }
  else if(mice >= 10 & buttons >= 10 & games >= 10 & machs >= 10 & farms >= 10 & facts >= 10 & cmen >= 10 & planets >= 10 & cloners >= 10 & whiteholes >= 10 & AchList[317] == false){
    JRText = "You Got 10 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[317] = true;
  }
  else if(mice >= 20 & buttons >= 20 & games >= 20 & machs >= 20 & farms >= 20 & facts >= 20 & cmen >= 20 & planets >= 20 & cloners >= 20 & whiteholes >= 20 & AchList[318] == false){
    JRText = "You Got 20 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[318] = true;
  }
  else if(mice >= 30 & buttons >= 30 & games >= 30 & machs >= 30 & farms >= 30 & facts >= 30 & cmen >= 30 & planets >= 30 & cloners >= 30 & whiteholes >= 30 & AchList[319] == false){
    JRText = "You Got 30 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[319] = true;
  }
  else if(mice >= 40 & buttons >= 40 & games >= 40 & machs >= 40 & farms >= 40 & facts >= 40 & cmen >= 40 & planets >= 40 & cloners >= 40 & whiteholes >= 40 & AchList[320] == false){
    JRText = "You Got 40 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[320] = true;
  }
  else if(mice >= 50 & buttons >= 50 & games >= 50 & machs >= 50 & farms >= 50 & facts >= 50 & cmen >= 50 & planets >= 50 & cloners >= 50 & whiteholes >= 50 & AchList[321] == false){
    JRText = "You Got 50 Of Everything!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[321] = true;
  }
  else if(miceUGLevel >= 2 & buttonUGLevel >= 2 & clickerUGLevel >= 2 & machUGLevel >= 2 & farmUGLevel >= 2 & factUGLevel >= 2 & cmanUGLevel >= 2 & planetUGLevel >= 2 & clonerUGLevel >= 2 & whiteholeUGLevel >= 2 & AchList[322] == false){
    JRText = "You Ugraded Everything To Level 2!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[322] = true;
  }
  else if(miceUGLevel >= 3 & buttonUGLevel >= 3 & clickerUGLevel >= 3 & machUGLevel >= 3 & farmUGLevel >= 3 & factUGLevel >= 3 & cmanUGLevel >= 3 & planetUGLevel >= 3 & clonerUGLevel >= 3 & whiteholeUGLevel >= 3 & AchList[323] == false){
    JRText = "You Ugraded Everything To Level 3!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[323] = true;
  }
  else if(miceUGLevel >= 4 & buttonUGLevel >= 4 & clickerUGLevel >= 4 & machUGLevel >= 4 & farmUGLevel >= 4 & factUGLevel >= 4 & cmanUGLevel >= 4 & planetUGLevel >= 4 & clonerUGLevel >= 4 & whiteholeUGLevel >= 4 & AchList[324] == false){
    JRText = "You Ugraded Everything To Level 4!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[324] = true;
  }
  else if(miceUGLevel >= 5 & buttonUGLevel >= 5 & clickerUGLevel >= 5 & machUGLevel >= 5 & farmUGLevel >= 5 & factUGLevel >= 5 & cmanUGLevel >= 5 & planetUGLevel >= 5 & clonerUGLevel >= 5 & whiteholeUGLevel >= 5 & AchList[325] == false){
    JRText = "You Ugraded Everything To Level 5!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[325] = true;
  }
  else if(miceUGLevel >= 6 & buttonUGLevel >= 6 & clickerUGLevel >= 6 & machUGLevel >= 6 & farmUGLevel >= 6 & factUGLevel >= 6 & cmanUGLevel >= 6 & planetUGLevel >= 6 & clonerUGLevel >= 6 & whiteholeUGLevel >= 6 & AchList[326] == false){
    JRText = "You Ugraded Everything To Level 6!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[326] = true;
  }
  else if(miceUGLevel >= 8 & buttonUGLevel >= 8 & clickerUGLevel >= 8 & machUGLevel >= 8 & farmUGLevel >= 8 & factUGLevel >= 8 & cmanUGLevel >= 8 & planetUGLevel >= 8 & clonerUGLevel >= 8 & whiteholeUGLevel >= 8 & AchList[327] == false){
    JRText = "You Ugraded Everything To Level 8!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[327] = true;
  }
  else if(miceUGLevel >= 10 & buttonUGLevel >= 10 & clickerUGLevel >= 10 & machUGLevel >= 10 & farmUGLevel >= 10 & factUGLevel >= 10 & cmanUGLevel >= 10 & planetUGLevel >= 10 & clonerUGLevel >= 10 & whiteholeUGLevel >= 10 & AchList[328] == false){
    JRText = "You Ugraded Everything To Level 10!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[328] = true;
  }
  else if(miceUGLevel >= 20 & buttonUGLevel >= 20 & clickerUGLevel >= 20 & machUGLevel >= 20 & farmUGLevel >= 20 & factUGLevel >= 20 & cmanUGLevel >= 20 & planetUGLevel >= 20 & clonerUGLevel >= 20 & whiteholeUGLevel >= 20 & AchList[329] == false){
    JRText = "You Ugraded Everything To Level 20!";
    Just_Recieved[0] = 1;
    Just_Recieved[1] = 46;
    AchList[329] = true;
  }
}
void setup() {
  loadStuff();
  whiteholeUGprice*=10;
  clonerUGprice*=10;
  winprice*=1000;
  frameRate(50);
  size(400, 400);
  minim = new Minim(this);
  player = minim.loadSample("CliqueyClicker.mp3",512);
  player2 = minim.loadSample("GetAch.wav",512);
  player3 = minim.loadSample("Buy Something.wav",512);
  player4 = minim.loadSample("Click.wav",512);
  player.trigger(); 
}
void draw() {
  if(t >= 55.44){
    player.trigger();
    t = 0;
  }
    t+=0.02;
  achcheck();
  if(start == false){
  if(animationPoint < 200){
    animationPoint+=1;
  }
  background(0);
  if(animationPoint>150){
  textSize((animationPoint-149)/2);
  text("Cliquey Clicker!",200-((animationPoint-150)*1.8), (animationPoint-150)*4);
  text("Press Space To Start!",200-((animationPoint-150)*2), (animationPoint-150)*4+40);
  }
  else if(animationPoint<=40){
  fill(255,0,0);  
  rect(animationPoint*8,200,100,50);
  }
  else if(animationPoint<=80){
  fill(0,255,0);
  rect(360-(animationPoint-40)*8,200+(animationPoint-40),100,50);
  }
  else{
    fill(0,0,255);
    rect(40+(animationPoint-80)*1.5,240-(animationPoint-80)*3,100,50);
  }
  }
  else if(start == true){
    if(keyPressed){
      if(key == 'w' && scrolly>-149){
        scrolly-=3;
      }
      else if(key == 's' && scrolly<-1){
        scrolly+=3;
      }
    }
    if(won == false){
    if(achievements == false){
    thing+=1;
    if(style == 1){
    background(255, 0, 0);
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(style == 4){
      fill(100);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(0,0,255);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    fill(0,255,0);
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    fill(0,255,255);
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    fill(255,0,255);
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    fill(255,255,0);
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    fill(255,255,255);
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    fill(255,150,0);
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    fill(0);
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    fill(255,255,255);
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    fill(100,100,100);
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    fill(50,255,150);
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    fill(0);
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,100,50);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    fill(0);
    rect(0,175,100,50);
    fill(50,0,255);
    rect(150,370,100,30);
    }
    else if(style == 2){
      background(100, 100, 100);
      for (int i = 1; i < micecoords.length/2; i++){
        fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=1;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    fill(255);
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    if(CP > 1000000){
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(0,255,0);
    stroke(255,255,255);
    if(smallupgrades[0] == false){
    rect(300,scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    rect(150,370,100,30);
    rect(0,175,100,50);
    fill(0);
    }
    else if(style == 3){
    background(255, 150, 0);
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(150,0,255);
    stroke(105,255,0);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,100,50);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    rect(0,175,100,50);
    rect(150,370,100,30);
    }
    else if(style == 4){
    background(0, 0, 0);
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(clix<1000000){
    fill(100);
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    noFill();
    stroke(0,0,255);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,99,49);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    stroke(0,255,0);
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,99,49);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    stroke(0,255,255);
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,99,49);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    stroke(255,0,255);
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,99,49);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    stroke(255,255,0);
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,99,49);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    stroke(255,255,255);
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,99,49);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    stroke(255,150,0);
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,99,49);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    stroke(30);
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,99,49);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    stroke(255,255,255);
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,99,49);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    stroke(100,100,100);
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,99,49);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    stroke(50,255,150);
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,99,49);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    stroke(30);
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,99,49);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    stroke(30);
    rect(0,175,100,50);
    stroke(50,0,255);
    rect(150,370,100,30);
    }
    else if(style == 5){
    rainbg();
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(style == 4){
      fill(100);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(0,0,255);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    fill(0,255,0);
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    fill(0,255,255);
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    fill(255,0,255);
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    fill(255,255,0);
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    fill(255,255,255);
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    fill(255,150,0);
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    fill(0);
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    fill(255,255,255);
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    fill(100,100,100);
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    fill(50,255,150);
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    fill(0);
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,100,50);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    fill(0);
    rect(0,175,100,50);
    fill(50,0,255);
    rect(150,370,100,30);
    }
    else if(style == 6){
    background(255,0,255);
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(style == 4){
      fill(100);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(255,0,0);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    fill(255,100,0);
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    fill(255,200,0);
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    fill(255,255,0);
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    fill(150,255,0);
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    fill(50,255,0);
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    fill(0,255,0);
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    fill(0,240,100);
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    fill(0,230,200);
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    fill(0,150,255);
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    fill(0,50,255);
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    fill(0,0,255);
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,100,50);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    fill(150,0,255);
    rect(0,175,100,50);
    fill(50,0,255);
    rect(150,370,100,30);
    }
    else if(style == 7){
    
    if(hour() < 6 || hour() > 18){
      fill(100);
      background(0);
    }
    else{
      background(0,255,255);
      fill(255,255,0);
    }
    if(hour() >= 6 && hour() < 12 || hour() >= 18 && hour() <= 0){
    ellipse(50,(400 + hour()-((floor(hour()/6.0))*6)*(-30) - minute()/2),50,50);
    }
    else{
      ellipse(50,(hour()-12)*(60) + minute(),50,50);
    }
    for (int i = 1; i < micecoords.length/2; i++){
    fill(0);
    stroke(255,255,255);
    rect(194+micecoords[2*i-1], 150+micecoords[2*i], 12, 12);
    triangle(185+micecoords[2*i-1], 150+micecoords[2*i], 215+micecoords[2*i-1], 150+micecoords[2*i], 200+micecoords[2*i-1], 130+micecoords[2*i]);
    noStroke();
    rect(195+micecoords[2*i-1], 149+micecoords[2*i], 11, 3);
    micecoords[2*i]+=2;
    }
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    if(style == 4){
      fill(100);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      text("Clix: "+String.format("%4f",clix/pow(10,floor(logten(clix))))+"x10^"+floor(logten(clix)), 50, 50);
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100.0)/100.0);
    CPS = String.format("%.2f",CP);
    if(CP < 1000000){
    text("CPS: "+CPS, 50, 70);
    }
    else{
      text("CPS: "+String.format("%4f",CP/pow(10,floor(logten(CP))))+"x10^"+floor(logten(CP)), 50, 70);
    }
    text("Times "+String.format("%.2f",((numberofachcheck()+100.0)/100.0))+" boost",50,90);
    fill(255,0,0);
    if(smallupgrades[0] == false){
    rect(300,00+scrolly,100,50);
    }
    else{
      rect(310,5+scrolly,80,40);
    }
    fill(255,100,0);
    if(smallupgrades[1] == false){
    rect(300,50+scrolly,100,50);
    }
    else{
      rect(310,55+scrolly,80,40);
    }
    fill(255,200,0);
    if(smallupgrades[2] == false){
    rect(300,100+scrolly,100,50);
    }
    else{
      rect(310,105+scrolly,80,40);
    }
    fill(255,255,0);
    if(smallupgrades[3] == false){
    rect(300,150+scrolly,100,50);
    }
    else{
      rect(310,155+scrolly,80,40);
    }
    fill(150,255,0);
    if(smallupgrades[4] == false){
    rect(300,200+scrolly,100,50);
    }
    else{
      rect(310,205+scrolly,80,40);
    }
    fill(50,255,0);
    if(smallupgrades[5] == false){
    rect(300,250+scrolly,100,50);
    }
    else{
      rect(310,255+scrolly,80,40);
    }
    fill(0,255,0);
    if(smallupgrades[6] == false){
    rect(300,300+scrolly,100,50);
    }
    else{
      rect(310,305+scrolly,80,40);
    }
    fill(0,240,100);
    if(smallupgrades[7] == false){
    rect(300,350+scrolly,100,50);
    }
    else{
      rect(310,355+scrolly,80,40);
    }
    fill(0,230,200);
    if(smallupgrades[8] == false){
    rect(300,400+scrolly,100,50);
    }
    else{
      rect(310,405+scrolly,80,40);
    }
    fill(0,150,255);
    if(smallupgrades[9] == false){
    rect(300,450+scrolly,100,50);
    }
    else{
      rect(310,455+scrolly,80,40);
    }
    fill(0,50,255);
    if(smallupgrades[10] == false){
    rect(300,500+scrolly,100,50);
    }
    else{
      rect(310,505+scrolly,80,40);
    }
    fill(0,0,255);
    if(smallupgrades[11] == false){
    rect(300,550+scrolly,100,50);
    }
    else{
      rect(310,555+scrolly,80,40);
    }
    fill(150,0,255);
    rect(0,175,100,50);
    fill(50,0,255);
    rect(150,370,100,30);
    }
    if(thing == 50){
    clix+=mice*miceCPS*((numberofachcheck()+100.0)/100.0);
    thing = 0;
    saveStuff();
    }
    if(thing == 0 || thing == 10 || thing == 20 || thing == 30 || thing == 40){
      clix+=buttons*buttonCPS*((numberofachcheck()+100.0)/100.0);
    }
    if(thing == 0 || thing == 5 || thing == 10 || thing == 15 || thing == 20 || thing == 25 || thing == 30 || thing == 35 || thing == 40 || thing == 45){
      clix+=games*clickerCPS*((numberofachcheck()+100.0)/100.0);
    }
    clix+=machs*machCPS*((numberofachcheck()+100.0)/100.0);
    clix+=(farms*4*farmCPS*((numberofachcheck()+100.0)/100.0));
    clix+=(facts*20*factCPS*((numberofachcheck()+100.0)/100.0));
    clix+=(cmen*100*cmanCPS*((numberofachcheck()+100.0)/100.0));
    clix+=(planetCPS*4000*planets*((numberofachcheck()+100.0)/100.0));
    clix+=(clonerCPS*20000*cloners*((numberofachcheck()+100.0)/100.0));
    clix+=(whiteholeCPS*100000*whiteholes*((numberofachcheck()+100.0)/100.0));
    fill(0);
    if(style == 4){
      fill(100);
    }
    if(style == 6){
      fill(0,100);
    }
    text("Buy A Mouse ", 305, 20+scrolly);
    text("Buy A Button ", 305, 70+scrolly);
    text("Buy A Clicker", 305, 120+scrolly);
    text("Game",305,140+scrolly);
    text("Buy A Machine  ", 305, 170+scrolly);
    text("Buy A Farm  ", 305, 220+scrolly);
    text("Buy A Factory  ", 305, 270+scrolly);
    text("Buy A", 305, 320+scrolly);
    text("ClickerMan",305,340+scrolly);
    if(style == 4){
      fill(100);
    }
    if(style == 1 || style == 5){
    fill(255);
    }
    text("Buy A Planet",305,370+scrolly);
    if(style != 4 && style != 6){
      fill(0);
    }
    text("Buy A Cloner",305,420+scrolly);
    if(style == 1 || style == 5){
    fill(255);
    }
    text("Buy A White",305,470+scrolly);
    text("Hole",305,490+scrolly);
    if(style != 4 && style != 6){
      fill(0);
    }
    text("Win The Game  ", 305, 520+scrolly);
    if(style == 1 || style == 5){
      fill(255);
    }
    text("Achievements",10,205);
    text("Reset",180,390);
    }else{
      background(205, 100, 0);
    if(x == true){
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    }else if(x == false){
    stroke(255);
    fill(0);
    rect(188, 150, 24, 24);
    triangle(165, 150, 235, 150, 200, 70);
    noStroke();
    rect(188, 121, 24, 30);
    }
    fill(0);
    if(style == 4){
      fill(100);
    }
    if(clix<1000000){
    text("Clix: "+clix,50,50);
    }
    else{
      
    }
    CP = ((mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS)) + (planets*200000*(planetCPS)) + (cloners*1000000*(clonerCPS)) + (whiteholes*5000000*(whiteholeCPS)))*((numberofachcheck()+100)/100);
    CPS = String.format("%.2f",CP);
    text("CPS: "+CPS, 50, 70);
    fill(0,0,105);
    stroke(0,140,0);
    rect(300,00,100,50);
    rect(300,50,100,50);
    rect(300,100,100,50);
    rect(300,150,100,50);
    rect(300,200,100,50);
    rect(300,250,100,50);
    rect(300,300,100,50);
    rect(300,350,100,50);
    fill(0);
    }
    if(Just_Recieved[0] == 1){
      noStroke();
      textSize(10);
      if(style == 1 || style == 5){
      fill(100,0,255);
      }else if(style == 2){
        fill(100,255,100);
      }
      else if(style == 3){
        fill(255,0,100);
      }
      else if(style == 4){
        noFill();
        stroke(100,0,255);
      }
      else if(style == 6){
        noStroke();
        fill(255,100);
      }
      if(animationPoint == 0){
        //player2.rewind();
        player2.trigger();
      }
      animationPoint+=1;
      if(animationPoint < 50){
        rect(400-(animationPoint*6),0,200,50);
        fill(0);
        if(style == 4){
          fill(100);
        }
        text(JRText,410-(animationPoint*6),20);
      }
      else if(animationPoint < 100){
        rect(100,0,200,50);
        fill(0);
        if(style == 4){
          fill(100);
        }
        text(JRText,110,20);
      }
      else if(animationPoint < 200){
        rect(100-((animationPoint-100)*6),0,200,50);
        fill(0);
        text(JRText,110-((animationPoint-100)*6),20);
      }
      else{
        Just_Recieved[0] = 0;
        animationPoint = 0;
      }
    }
    if(mouseX>300){
      text("Click to buy!",20,260);
      if(mouseY<500+scrolly){
      text("Press 'u' to upgrade!",20,280);
      }
      if(mouseY<50+scrolly){
        if(miceprice < 1000000){
        text("Costs "+miceprice+" clix.",20, 300);
        }
        else{
          text("Costs "+String.format("%4f",miceprice/pow(10,floor(logten(miceprice))))+"x10^"+floor(logten(miceprice))+" clix.",20, 300);
        }
        text("You have "+mice+" mice",20,320);
        if(miceCPS < 1000000){
        text("+"+String.format("%.2f",miceCPS)+" CPS per mouse",20,340);
        }
        else{
          text("+"+String.format("%4f",miceCPS/pow(10,floor(logten(miceCPS))))+"x10^"+floor(logten(miceCPS))+" CPS per mouse",20,340);
        }
        if(miceUGprice < 1000000){
        text("Costs "+miceUGprice+" clix to upgrade to level "+(miceUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",miceUGprice/pow(10,floor(logten(miceUGprice))))+"x10^"+floor(logten(miceUGprice))+" clix to upgrade to level "+(miceUGLevel+1),20, 360);
        }
      }
      else if(mouseY<100+scrolly){
         if(buttonprice < 1000000){
        text("Costs "+buttonprice+" clix.",20, 300);
        }
        else{
          text("Costs "+String.format("%4f",buttonprice/pow(10,floor(logten(buttonprice))))+"x10^"+floor(logten(buttonprice))+" clix.",20, 300);
        }
        text("You have "+buttons+" buttons",20,320);
        if(buttonCPS*5 < 1000000){
        text("+"+String.format("%.2f",buttonCPS*5)+" CPS per button",20,340);
        }
        else{
          text("+"+String.format("%4f",(buttonCPS*5)/pow(10,floor(logten(buttonCPS*5))))+"x10^"+floor(logten(buttonCPS*5))+" CPS per button",20,340);
        }
        if(buttonUGprice < 1000000){
        text("Costs "+buttonUGprice+" clix to upgrade to level "+(buttonUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",buttonUGprice/pow(10,floor(logten(buttonUGprice))))+"x10^"+floor(logten(buttonUGprice))+" clix to upgrade to level "+(buttonUGLevel+1),20, 360);
        }
      }
      else if(mouseY<150+scrolly){
        if(clickerprice < 1000000){
        text("Costs "+clickerprice+" clix.",20, 300);
        }
        else{
          text("Costs "+String.format("%4f",(clickerprice)/pow(10,floor(logten(clickerprice))))+"x10^"+floor(logten(clickerprice))+" clix.",20, 300);
        }
        text("You have "+games+" clicker games",20,320);
        if(clickerCPS*10 < 1000000){
        text("+"+String.format("%.2f",clickerCPS*10)+" CPS per clicker game",20,340);
        }
        else{
          text("+"+String.format("%4f",(clickerCPS*10)/pow(10,floor(logten(clickerCPS*10))))+"x10^"+floor(logten(clickerCPS*10))+" CPS per clicker game",20,340);
        }
        if(clickerUGprice < 1000000){
        text("Costs "+clickerUGprice+" clix to upgrade to level "+(clickerUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",clickerUGprice/pow(10,floor(logten(clickerUGprice))))+"x10^"+floor(logten(clickerUGprice))+" clix to upgrade to level "+(clickerUGLevel+1),20, 360);
        }
      }
      else if(mouseY<200+scrolly){
        if(machprice < 1000000){
        text("Costs "+machprice+" clix.",20, 300);
        }
        else{
          text("Costs "+String.format("%4f",machprice/pow(10,floor(logten(machprice))))+"x10^"+floor(logten(machprice))+" clix.",20, 300);
        }
        text("You have "+machs+" machines",20,320);
        if(machCPS*50 < 1000000){
        text("+"+String.format("%.2f",machCPS*50)+" CPS per machine",20,340);
        }
        else{
          text("+"+String.format("%4f",(machCPS*50)/pow(10,floor(logten(machCPS*50))))+"x10^"+floor(logten(machCPS*50))+" CPS per machine",20,340);
        }
        if(machUGprice < 1000000){
        text("Costs "+machUGprice+" clix to upgrade to level "+(machUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",machUGprice/pow(10,floor(logten(machUGprice))))+"x10^"+floor(logten(machUGprice))+" clix to upgrade to level "+(machUGLevel+1),20, 360);
        }
      }
      else if(mouseY<250+scrolly){
        if(farmprice < 1000000){
        text("Costs "+farmprice+" clix.",20, 300);
        }
        else{
          text("Costs "+String.format("%4f",farmprice/pow(10,floor(logten(farmprice))))+"x10^"+floor(logten(farmprice))+" clix.",20, 300);
        }
        text("You have "+farms+" farms",20,320);
        if(farmCPS*200 < 1000000){
        text("+"+String.format("%.2f",farmCPS*200)+" CPS per farm",20,340);
        }
        else{
          text("+"+String.format("%4f",(farmCPS*200)/pow(10,floor(logten(farmCPS*200))))+"x10^"+floor(logten(farmCPS*200))+" CPS per farm",20,340);
        }
        if(farmUGprice < 1000000){
        text("Costs "+farmUGprice+" clix to upgrade to level "+(farmUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",farmUGprice/pow(10,floor(logten(farmUGprice))))+"x10^"+floor(logten(farmUGprice))+" clix to upgrade to level "+(farmUGLevel+1),20, 360);
        }
      }
      else if(mouseY<300+scrolly){
        text("Costs "+String.format("%4f",factprice/pow(10,floor(logten(factprice))))+"x10^"+floor(logten(factprice))+" clix.",20, 300);
        text("You have "+facts+" Factories",20,320);
        if(factCPS*1000 < 1000000){
        text("+"+String.format("%.2f",factCPS*1000)+" CPS per Factory",20,340);
        }
        else{
          text("+"+String.format("%4f",(factCPS*1000)/pow(10,floor(logten(factCPS*1000))))+"x10^"+floor(logten(factCPS*1000))+" CPS per Factory",20,340);
        }
        if(factUGprice < 1000000){
        text("Costs "+factUGprice+" clix to upgrade to level "+(factUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",factUGprice/pow(10,floor(logten(factUGprice))))+"x10^"+floor(logten(factUGprice))+" clix to upgrade to level "+(farmUGLevel+1),20, 360);
        }
      }
      else if(mouseY<350+scrolly){
        text("Costs "+String.format("%4f",cmanprice/pow(10,floor(logten(cmanprice))))+"x10^"+floor(logten(cmanprice))+" clix.",20, 300);
        text("You have "+cmen+" Clicker Men",20,320);
        if(cmanCPS*50000 < 1000000){
        text("+"+String.format("%.2f",cmanCPS*50000)+" CPS per Clicker Man",20,340);
        }
        else{
          text("+"+String.format("%4f",(cmanCPS*50000)/pow(10,floor(logten(cmanCPS*50000))))+"x10^"+floor(logten(cmanCPS*50000))+" CPS per Clicker Man",20,340);
        }
        if(cmanUGprice < 1000000){
        text("Costs "+cmanUGprice+" clix to upgrade to level "+(cmanUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",cmanUGprice/pow(10,floor(logten(cmanUGprice))))+"x10^"+floor(logten(cmanUGprice))+" clix to upgrade to level "+(cmanUGLevel+1),20, 360);
        }
      }
      else if(mouseY<400+scrolly){
        text("Costs "+String.format("%4f",planetprice/pow(10,floor(logten(planetprice))))+"x10^"+floor(logten(planetprice))+" clix.",20, 300);
        text("You have "+planets+" Planets",20,320);
        if(planetCPS*200000 < 1000000){
        text("+"+String.format("%.2f",planetCPS*200000)+" CPS per Planet",20,340);
        }
        else{
          text("+"+String.format("%4f",(planetCPS*200000)/pow(10,floor(logten(planetCPS*200000))))+"x10^"+floor(logten(planetCPS*200000))+" CPS per Planet",20,340);
        }
        if(planetUGprice < 1000000){
        text("Costs "+planetUGprice+" clix to upgrade to level "+(planetUGLevel+1),20, 360);
        }
        else{
          text("Costs "+String.format("%4f",planetUGprice/pow(10,floor(logten(planetUGprice))))+"x10^"+floor(logten(planetUGprice))+" clix to upgrade to level "+(planetUGLevel+1),20, 360);
        }
      }
      else if(mouseY<450+scrolly){
        text("Costs "+String.format("%4f",clonerprice/pow(10,floor(logten(clonerprice))))+"x10^"+floor(logten(clonerprice))+" clix.",20, 300);
        text("You have "+cloners+" Cloners",20,320);
        if(clonerCPS*1000000 < 1000000){
        text("+"+String.format("%.2f",clonerCPS*1000000)+" CPS per Cloner",20,340);
        }
        else{
          text("+"+String.format("%4f",(clonerCPS*1000000)/pow(10,floor(logten(clonerCPS*1000000))))+"x10^"+floor(logten(clonerCPS*1000000))+" CPS per Cloner",20,340);
        }
        text("Costs "+String.format("%4f",clonerUGprice/pow(10,floor(logten(clonerUGprice))))+"x10^"+floor(logten(clonerUGprice))+" clix to upgrade to level "+(clonerUGLevel+1),20, 360);
      }
      else if(mouseY<500+scrolly){
        text("Costs "+String.format("%4f",whiteholeprice/pow(10,floor(logten(whiteholeprice))))+"x10^"+floor(logten(whiteholeprice))+" clix.",20, 300);
        text("You have "+whiteholes+" White Holes",20,320);
        if(whiteholeCPS*5000000 < 1000000){
        text("+"+String.format("%.2f",whiteholeCPS*5000000)+" CPS per White Hole",20,340);
        }
        else{
          text("+"+String.format("%4f",(whiteholeCPS*5000000)/pow(10,floor(logten(whiteholeCPS*5000000))))+"x10^"+floor(logten(whiteholeCPS*5000000))+" CPS per White Hole",20,340);
        }
        text("Costs "+String.format("%4f",whiteholeUGprice/pow(10,floor(logten(whiteholeUGprice))))+"x10^"+floor(logten(whiteholeUGprice))+" clix to upgrade to level "+(whiteholeUGLevel+1),20, 360);
      }
      else{
        text("Costs 5x10^11 clix.",20, 280);
      }
    }
    if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150){
      text("Gives you "+pointerCPC+" clix per click.",20, 300);
      text("Press 'u' to upgrade to level "+(pointerUGLevel+1),20,320);
      if(pointerUGprice < 1000000){
        text("For "+pointerUGprice+" Clix",20,340);
        }
        else{
          text("For "+String.format("%4f",pointerUGprice/pow(10,floor(logten(pointerUGprice))))+"x10^"+floor(logten(pointerUGprice))+" Clix",20,340);
        }
    }
    if(mouseX>180 && mouseX<220 && mouseY>150 && mouseY<190){
      text("Gives you "+pointerCPC+" clix per click.",20, 300);
      text("Press 'u' to upgrade to level "+(pointerUGLevel+1),20,320);
      text("For "+pointerUGprice+" clix!",20,340);
      if(pointerUGprice < 1000000){
        text("For "+pointerUGprice+" Clix",20,340);
        }
        else{
          text("For "+String.format("%4f",pointerUGprice/pow(10,floor(logten(pointerUGprice))))+"x10^"+floor(logten(pointerUGprice))+" Clix",20,340);
        }
  }
    if(mouseX>150 && mouseX<250 && mouseY>370){
      text("Warning: Will Reset Everything!",20,300);
    }
    
    if(achievements == true){
      if(keyPressed){
      if(key == 'w' && achScroll>=((AchList.length*60)-400)*-1){
        achScroll-=30;
      }
      else if(key == 's' && achScroll<=1){
        achScroll+=30;
      }
    }
      noStroke();
      background(100,50,20);
        for(int i = 0; i < AchList.length; i++){
          fill(0,255,0);
        if(AchList[i] == false){
          fill(255,0,0);
        }
        rect(50,(10+(i*60))+achScroll,300,50);
        fill(0);
        }
        text("Get 1 Clique",70,30+achScroll);
        text("Get 10 Clix",70,90+achScroll);
        text("Get 100 Clix",70,150+achScroll);
        text("Get 1000 Clix",70,210+achScroll);
        text("Get 10000 Clix",70,270+achScroll);
        text("Get 100000 Clix",70,330+achScroll);
        text("Get 500000 Clix",70,390+achScroll);
        text("Get 1000000 Clix",70,450+achScroll);
        text("Get 5000000 Clix",70,510+achScroll);
        text("Get 10000000 Clix",70,570+achScroll);
        text("Get 50000000 Clix",70,630+achScroll);
        text("Get 100000000 Clix",70,690+achScroll);
        text("Get 500000000 Clix",70,750+achScroll);
        text("Get 1000000000 Clix",70,810+achScroll);
        text("Get 5000000000 Clix",70,870+achScroll);
        text("Get 10000000000 Clix",70,950+achScroll);
        text("Get 50000000000 Clix",70,1010+achScroll);
        text("Get 100000000000 Clix",70,1070+achScroll);
        text("Get 200000000000 Clix",70,1130+achScroll);
        text("Upgrade Clicker To Level 2",70,1190+achScroll);
        text("Upgrade Clicker To Level 5",70,1250+achScroll);
        text("Upgrade Clicker To Level 10",70,1310+achScroll);
        text("Upgrade Clicker To Level 20",70,1370+achScroll);
        text("Upgrade Clicker To Level 50",70,1430+achScroll);
        text("Upgrade Clicker To Level 100",70,1490+achScroll);
        text("Get 1 Mouse",70,1550+achScroll);
        text("Get 2 Mice",70,1610+achScroll);
        text("Get 3 Mice",70,1670+achScroll);
        text("Get 5 Mice",70,1730+achScroll);
        text("Get 10 Mice",70,1790+achScroll);
        text("Get 20 Mice",70,1850+achScroll);
        text("Get 50 Mice",70,1910+achScroll);
        text("Get 100 Mice",70,1970+achScroll);
        text("Get 200 Mice",70,2030+achScroll);
        text("Get 500 Mice",70,2090+achScroll);
        text("Get 1000 Mice",70,2150+achScroll);
        text("Upgrade Mice To Level 2",70,2210+achScroll);
        text("Upgrade Mice To Level 3",70,2270+achScroll);
        text("Upgrade Mice To Level 5",70,2330+achScroll);
        text("Upgrade Mice To Level 8",70,2390+achScroll);
        text("Upgrade Mice To Level 10",70,2450+achScroll);
        text("Upgrade Mice To Level 20",70,2510+achScroll);
        text("Upgrade Mice To Level 50",70,2570+achScroll);
        text("Upgrade Mice To Level 100",70,2630+achScroll);
        text("Upgrade Mice To Level 200",70,2690+achScroll);
        text("Get 1 Button",70,2750+achScroll);
        text("Get 2 Buttons",70,2810+achScroll);
        text("Get 3 Buttons",70,2870+achScroll);
        text("Get 5 Buttons",70,2930+achScroll);
        text("Get 10 Buttons",70,2990+achScroll);
        text("Get 30 Buttons",70,3050+achScroll);
        text("Get 50 Buttons",70,3110+achScroll);
        text("Get 100 Buttons",70,3170+achScroll);
        text("Get 150 Buttons",70,3230+achScroll);
        text("Get 200 Buttons",70,3290+achScroll);
        text("Get 250 Buttons",70,3350+achScroll);
        text("Get 500 Buttons",70,3410+achScroll);
        text("Upgrade Buttons To Level 2",70,3470+achScroll);
        text("Upgrade Buttons To Level 3",70,3530+achScroll);
        text("Upgrade Buttons To Level 4",70,3590+achScroll);
        text("Upgrade Buttons To Level 5",70,3650+achScroll);
        text("Upgrade Buttons To Level 6",70,3710+achScroll);
        text("Upgrade Buttons To Level 8",70,3770+achScroll);
        text("Upgrade Buttons To Level 10",70,3830+achScroll);
        text("Upgrade Buttons To Level 20",70,3890+achScroll);
        text("Upgrade Buttons To Level 40",70,3950+achScroll);
        text("Upgrade Buttons To Level 50",70,4010+achScroll);
        text("Upgrade Buttons To Level 75",70,4070+achScroll);
        text("Upgrade Buttons To Level 100",70,4130+achScroll);
        text("Upgrade Buttons To Level 125",70,4190+achScroll);
        text("Upgrade Buttons To Level 150",70,4250+achScroll);
        text("Upgrade Buttons To Level 175",70,4310+achScroll);
        text("Upgrade Buttons To Level 200",70,4370+achScroll);
        text("Get 1 Clicker Game",70,4430+achScroll);
        text("Get 2 Clicker Games",70,4490+achScroll);
        text("Get 3 Clicker Games",70,4550+achScroll);
        text("Get 4 Clicker Games",70,4610+achScroll);
        text("Get 5 Clicker Games",70,4670+achScroll);
        text("Get 8 Clicker Games",70,4730+achScroll);
        text("Get 10 Clicker Games",70,4790+achScroll);
        text("Get 15 Clicker Games",70,4850+achScroll);
        text("Get 30 Clicker Games",70,4910+achScroll);
        text("Get 40 Clicker Games",70,4970+achScroll);
        text("Get 50 Clicker Games",70,5030+achScroll);
        text("Get 60 Clicker Games",70,5090+achScroll);
        text("Get 80 Clicker Games",70,5150+achScroll);
        text("Get 100 Clicker Games",70,5210+achScroll);
        text("Get 125 Clicker Games",70,5270+achScroll);
        text("Get 150 Clicker Games",70,5330+achScroll);
        text("Get 175 Clicker Games",70,5390+achScroll);
        text("Get 200 Clicker Games",70,5450+achScroll);
        text("Upgrade Clicker Games To Level 2",70,5510+achScroll);
        text("Upgrade Clicker Games To Level 3",70,5570+achScroll);
        text("Upgrade Clicker Games To Level 4",70,5630+achScroll);
        text("Upgrade Clicker Games To Level 5",70,5690+achScroll);
        text("Upgrade Clicker Games To Level 8",70,5750+achScroll);
        text("Upgrade Clicker Games To Level 10",70,5810+achScroll);
        text("Upgrade Clicker Games To Level 15",70,5870+achScroll);
        text("Upgrade Clicker Games To Level 20",70,5930+achScroll);
        text("Upgrade Clicker Games To Level 30",70,5990+achScroll);
        text("Upgrade Clicker Games To Level 50",70,6050+achScroll);
        text("Upgrade Clicker Games To Level 60",70,6110+achScroll);
        text("Upgrade Clicker Games To Level 85",70,6170+achScroll);
        text("Upgrade Clicker Games To Level 110",70,6230+achScroll);
        text("Get 1 Machine",70,6290+achScroll);
        text("Get 2 Machines",70,6350+achScroll);
        text("Get 3 Machines",70,6410+achScroll);
        text("Get 4 Machines",70,6470+achScroll);
        text("Get 5 Machines",70,6530+achScroll);
        text("Get 6 Machines",70,6590+achScroll);
        text("Get 7 Machines",70,6650+achScroll);
        text("Get 8 Machines",70,6710+achScroll);
        text("Get 10 Machines",70,6770+achScroll);
        text("Get 15 Machines",70,6830+achScroll);
        text("Get 25 Machines",70,6890+achScroll);
        text("Get 50 Machines",70,6950+achScroll);
        text("Get 80 Machines",70,7010+achScroll);
        text("Get 120 Machines",70,7070+achScroll);
        text("Get 170 Machines",70,7130+achScroll);
        text("Get 240 Machines",70,7190+achScroll);
        text("Get 300 Machines",70,7250+achScroll);
        text("Upgrade Machines To Level 2",70,7310+achScroll);
        text("Upgrade Machines To Level 3",70,7370+achScroll);
        text("Upgrade Machines To Level 4",70,7430+achScroll);
        text("Upgrade Machines To Level 5",70,7490+achScroll);
        text("Upgrade Machines To Level 6",70,7550+achScroll);
        text("Upgrade Machines To Level 7",70,7610+achScroll);
        text("Upgrade Machines To Level 8",70,7670+achScroll);
        text("Upgrade Machines To Level 10",70,7730+achScroll);
        text("Upgrade Machines To Level 15",70,7790+achScroll);
        text("Upgrade Machines To Level 20",70,7850+achScroll);
        text("Upgrade Machines To Level 30",70,7910+achScroll);
        text("Upgrade Machines To Level 40",70,7970+achScroll);
        text("Upgrade Machines To Level 50",70,8030+achScroll);
        text("Upgrade Machines To Level 75",70,8090+achScroll);
        text("Get 1 Farm",70,8150+achScroll);
        text("Get 2 Farms",70,8210+achScroll);
        text("Get 3 Farms",70,8270+achScroll);
        text("Get 4 Farms",70,8330+achScroll);
        text("Get 5 Farms",70,8390+achScroll);
        text("Get 6 Farms",70,8450+achScroll);
        text("Get 7 Farms",70,8510+achScroll);
        text("Get 8 Farms",70,8570+achScroll);
        text("Get 9 Farms",70,8630+achScroll);
        text("Get 10 Farms",70,8690+achScroll);
        text("Get 12 Farms",70,8750+achScroll);
        text("Get 15 Farms",70,8810+achScroll);
        text("Get 20 Farms",70,8870+achScroll);
        text("Get 30 Farms",70,8930+achScroll);
        text("Get 50 Farms",70,8990+achScroll);
        text("Get 70 Farms",70,9050+achScroll);
        text("Get 100 Farm",70,9110+achScroll);
        text("Get 150 Farms",70,9170+achScroll);
        text("Get 220 Farms",70,9230+achScroll);
        text("Upgrade Farms To Level 2",70,9290+achScroll);
        text("Upgrade Farms To Level 3",70,9350+achScroll);
        text("Upgrade Farms To Level 4",70,9410+achScroll);
        text("Upgrade Farms To Level 5",70,9470+achScroll);
        text("Upgrade Farms To Level 6",70,9530+achScroll);
        text("Upgrade Farms To Level 7",70,9590+achScroll);
        text("Upgrade Farms To Level 8",70,9650+achScroll);
        text("Upgrade Farms To Level 9",70,9710+achScroll);
        text("Upgrade Farms To Level 10",70,9770+achScroll);
        text("Upgrade Farms To Level 12",70,9830+achScroll);
        text("Upgrade Farms To Level 15",70,9890+achScroll);
        text("Upgrade Farms To Level 20",70,9950+achScroll);
        text("Upgrade Farms To Level 25",70,10010+achScroll);
        text("Upgrade Farms To Level 30",70,10070+achScroll);
        text("Upgrade Farms To Level 40",70,10130+achScroll);
        text("Get 1 Factory",70,10190+achScroll);
        text("Get 2 Factories",70,10250+achScroll);
        text("Get 3 Factories",70,10310+achScroll);
        text("Get 4 Factories",70,10370+achScroll);
        text("Get 5 Factories",70,10430+achScroll);
        text("Get 6 Factories",70,10490+achScroll);
        text("Get 7 Factories",70,10550+achScroll);
        text("Get 8 Factories",70,10610+achScroll);
        text("Get 9 Factories",70,10670+achScroll);
        text("Get 10 Factories",70,10730+achScroll);
        text("Get 12 Factories",70,10790+achScroll);
        text("Get 14 Factories",70,10850+achScroll);
        text("Get 16 Factories",70,10910+achScroll);
        text("Get 18 Factories",70,10970+achScroll);
        text("Get 20 Factories",70,11030+achScroll);
        text("Get 25 Factories",70,11090+achScroll);
        text("Get 35 Factories",70,11150+achScroll);
        text("Get 50 Factories",70,11210+achScroll);
        text("Get 70 Factories",70,11270+achScroll);
        text("Get 90 Factories",70,11330+achScroll);
        text("Get 125 Factories",70,11390+achScroll);
        text("Upgrade Factories To Level 2",70,11450+achScroll);
        text("Upgrade Factories To Level 3",70,11510+achScroll);
        text("Upgrade Factories To Level 4",70,11570+achScroll);
        text("Upgrade Factories To Level 5",70,11630+achScroll);
        text("Upgrade Factories To Level 6",70,11690+achScroll);
        text("Upgrade Factories To Level 7",70,11750+achScroll);
        text("Upgrade Factories To Level 8",70,11810+achScroll);
        text("Upgrade Factories To Level 9",70,11870+achScroll);
        text("Upgrade Factories To Level 10",70,11930+achScroll);
        text("Upgrade Factories To Level 11",70,11990+achScroll);
        text("Upgrade Factories To Level 13",70,12050+achScroll);
        text("Upgrade Factories To Level 15",70,12110+achScroll);
        text("Upgrade Factories To Level 20",70,12170+achScroll);
        text("Upgrade Factories To Level 25",70,12230+achScroll);
        text("Get 1 Clicker Man",70,12290+achScroll);
        text("Get 2 Clicker Men",70,12350+achScroll);
        text("Get 3 Clicker Men",70,12410+achScroll);
        text("Get 4 Clicker Men",70,12470+achScroll);
        text("Get 5 Clicker Men",70,12530+achScroll);
        text("Get 6 Clicker Men",70,12590+achScroll);
        text("Get 7 Clicker Men",70,12650+achScroll);
        text("Get 8 Clicker Men",70,12710+achScroll);
        text("Get 9 Clicker Men",70,12770+achScroll);
        text("Get 10 Clicker Men",70,12830+achScroll);
        text("Get 12 Clicker Men",70,12890+achScroll);
        text("Get 14 Clicker Men",70,12950+achScroll);
        text("Get 16 Clicker Men",70,13010+achScroll);
        text("Get 18 Clicker Men",70,13070+achScroll);
        text("Get 20 Clicker Men",70,13130+achScroll);
        text("Get 25 Clicker Men",70,13190+achScroll);
        text("Get 40 Clicker Men",70,13250+achScroll);
        text("Get 60 Clicker Men",70,13310+achScroll);
        text("Get 90 Clicker Men",70,13370+achScroll);
        text("Upgrade Clicker Men To Level 2",70,13430+achScroll);
        text("Upgrade Clicker Men To Level 3",70,13490+achScroll);
        text("Upgrade Clicker Men To Level 4",70,13550+achScroll);
        text("Upgrade Clicker Men To Level 5",70,13610+achScroll);
        text("Upgrade Clicker Men To Level 6",70,13670+achScroll);
        text("Upgrade Clicker Men To Level 7",70,13730+achScroll);
        text("Upgrade Clicker Men To Level 8",70,13790+achScroll);
        text("Upgrade Clicker Men To Level 9",70,13850+achScroll);
        text("Upgrade Clicker Men To Level 10",70,13910+achScroll);
        text("Upgrade Clicker Men To Level 11",70,13970+achScroll);
        text("Upgrade Clicker Men To Level 12",70,14030+achScroll);
        text("Get 1 Planet",70,14090+achScroll);
        text("Get 2 Planets",70,14150+achScroll);
        text("Get 3 Planets",70,14210+achScroll);
        text("Get 4 Planets",70,14270+achScroll);
        text("Get 5 Planets",70,14330+achScroll);
        text("Get 6 Planets",70,14390+achScroll);
        text("Get 7 Planets",70,14450+achScroll);
        text("Get 8 Planets",70,14510+achScroll);
        text("Get 9 Planets",70,14570+achScroll);
        text("Get 10 Planets",70,14630+achScroll);
        text("Get 11 Planets",70,14690+achScroll);
        text("Get 12 Planets",70,14750+achScroll);
        text("Get 13 Planets",70,14810+achScroll);
        text("Get 15 Planets",70,14870+achScroll);
        text("Get 18 Planets",70,14930+achScroll);
        text("Get 23 Planets",70,14990+achScroll);
        text("Get 30 Planets",70,15050+achScroll);
        text("Get 40 Planets",70,15110+achScroll);
        text("Get 50 Planets",70,15170+achScroll);
        text("Upgrade Planets To Level 2",70,15230+achScroll);
        text("Upgrade Planets To Level 3",70,15290+achScroll);
        text("Upgrade Planets To Level 4",70,15350+achScroll);
        text("Upgrade Planets To Level 5",70,15410+achScroll);
        text("Upgrade Planets To Level 6",70,15470+achScroll);
        text("Upgrade Planets To Level 7",70,15530+achScroll);
        text("Upgrade Planets To Level 8",70,15590+achScroll);
        text("Get 1 Cloner",70,15650+achScroll);
        text("Get 2 Cloners",70,15710+achScroll);
        text("Get 3 Cloners",70,15770+achScroll);
        text("Get 4 Cloners",70,15830+achScroll);
        text("Get 5 Cloners",70,15890+achScroll);
        text("Get 6 Cloners",70,15950+achScroll);
        text("Get 7 Cloners",70,16010+achScroll);
        text("Get 8 Cloners",70,16070+achScroll);
        text("Get 10 Cloners",70,16130+achScroll);
        text("Get 15 Cloners",70,16190+achScroll);
        text("Get 20 Cloners",70,16250+achScroll);
        text("Get 25 Cloners",70,16310+achScroll);
        text("Upgrade Cloners To Level 2",70,16370+achScroll);
        text("Upgrade Cloners To Level 3",70,16430+achScroll);
        text("Upgrade Cloners To Level 4",70,16490+achScroll);
        text("Upgrade Cloners To Level 5",70,16550+achScroll);
        text("Get 1 White Hole",70,16610+achScroll);
        text("Get 2 White Holes",70,16670+achScroll);
        text("Get 3 White Holes",70,16730+achScroll);
        text("Get 4 White Holes",70,16790+achScroll);
        text("Get 5 White Holes",70,16850+achScroll);
        text("Get 6 White Holes",70,16910+achScroll);
        text("Get 7 White Holes",70,16970+achScroll);
        text("Get 8 White Holes",70,17030+achScroll);
        text("Get 9 White Holes",70,17090+achScroll);
        text("Get 10 White Holes",70,17150+achScroll);
        text("Get 11 White Holes",70,17210+achScroll);
        text("Get 12 White Holes",70,17270+achScroll);
        text("Get 13 White Holes",70,17330+achScroll);
        text("Get 14 White Holes",70,17390+achScroll);
        text("Get 15 White Holes",70,17450+achScroll);
        text("Upgrade White Holes To Level 2",70,17510+achScroll);
        text("Upgrade White Holes To Level 3",70,17570+achScroll);
        text("Upgrade White Holes To Level 4",70,17630+achScroll);
        text("Get 1 Golden Clique",70,17690+achScroll);
        text("Get 2 Golden Cliques",70,17750+achScroll);
        text("Get 3 Golden Cliques",70,17810+achScroll);
        text("Get 4 Golden Cliques",70,17870+achScroll);
        text("Get 5 Golden Cliques",70,17930+achScroll);
        text("Get 10 Golden Cliques",70,17990+achScroll);
        text("Get 15 Golden Cliques",70,18050+achScroll);
        text("Get 20 Golden Cliques",70,18110+achScroll);
        text("Get 25 Golden Cliques",70,18170+achScroll);
        text("Get 35 Golden Cliques",70,18230+achScroll);
        text("Get 50 Golden Cliques",70,18290+achScroll);
        text("Get 200 Golden Cliques",70,18350+achScroll);
        text("Get 500 Golden Cliques",70,18410+achScroll);
        text("Get 1000 Golden Cliques",70,18470+achScroll);
        text("Get 5000 Golden Cliques",70,18530+achScroll);
        text("Get 10000 Golden Cliques",70,18590+achScroll);
        text("Get 50000 Golden Cliques",70,18650+achScroll);
        text("Get 100000 Golden Cliques",70,18710+achScroll);
        text("Get 500000 Golden Cliques",70,18770+achScroll);
        text("Get 1000000 Golden Cliques",70,18830+achScroll);
        text("Win The Game",70,18890+achScroll);
        text("Get 1 Of Everything",70,18950+achScroll);
        text("Get 5 Of Everything",70,19010+achScroll);
        text("Get 10 Of Everything",70,19070+achScroll);
        text("Get 20 Of Everything",70,19130+achScroll);
        text("Get 30 Of Everything",70,19190+achScroll);
        text("Get 40 Of Everything",70,19250+achScroll);
        text("Get 50 Of Everything",70,19310+achScroll);
        text("Upgrade Everything To Level 2",70,19370+achScroll);
        text("Upgrade Everything To Level 3",70,19430+achScroll);
        text("Upgrade Everything To Level 4",70,19490+achScroll);
        text("Upgrade Everything To Level 5",70,19550+achScroll);
        text("Upgrade Everything To Level 6",70,19610+achScroll);
        text("Upgrade Everything To Level 8",70,19670+achScroll);
        text("Upgrade Everything To Level 10",70,19730+achScroll);
        text("Upgrade Everything To Level 20",70,19790+achScroll);
        rect(0,175,30,50);
        fill(0,255,0);
        text("Go",3,190);
        text("Back",3,210);
        text("You Have "+numberofachcheck()+"/329 Achievements! "+numberofachcheck()+"% CPS Boost!",70,achScroll);
  }
    }
    else if(won == true){
      if(gold == true){
        thing+=1;
        background(255,255,0);
        fill(0,0,0);
        textSize(12);
        text("Welcome To Golden Cliques! You Can Buy Them For", 20, 200);
        text("1000000000 clix each! That's expensive, but they reproduce,", 20, 220);
        text("If you have 50 or more.", 20, 240);
        text("Golden Cliques: "+gclix, 50, 50);
        text("                 Clix: "+clix,50,30);
        fill(0,0,255);
        rect(0,300,100,100);
        fill(0,0,0);
        text("Click Here To",10,330);
        text("Get A Golden",10,350);
        text("Clique!",10,370);
        if(thing >= 49){
        clix+=mice*miceCPS;
        thing = 0;
        gclix+=gclix/50;
        }
        if(thing == 0 || thing == 10 || thing == 20 || thing == 30 || thing == 40){
          clix+=buttons*buttonCPS;
        }
        if(thing == 0 || thing == 5 || thing == 10 || thing == 15 || thing == 20 || thing == 25 || thing == 30 || thing == 35 || thing == 40 || thing == 45){
          clix+=games*clickerCPS;
        }
        clix+=machs*machCPS;
        clix+=(farms*4*farmCPS);
        clix+=(facts*20*factCPS);
        clix+=(cmen*100*cmanCPS);
        }
        else if(mini == true){
          
        }
        else{
        background(0);
        fill(150,0,0);
        rect(50,100,300,100);
        fill(0,150,0);
        rect(50,210,300,100);
        fill(100,0,255);
        textSize(12);
        text("Congrats! You Won The Game!", 110, 50);
        text("Click Any Of The Buttons Below To Do Other Fun Cliquety Stuff!", 20, 70);
        textSize(50);
        text("MINIGAMES!",60,180);
        textSize(40);
        text("Golden Cliques",55,280);
    }
  }
    }
  }
void reset(){
  clix = 0;
  for(int i = 0; i < 329; i++){
  AchList[i] = false;
  }
  pointerUGLevel = 1;
  pointerCPC = 1;
  pointerUGprice = 50;
  
  mice = 0;
  miceUGLevel = 1;
  miceCPS = 1;
  miceprice = 50;
  miceUGprice = 500;
  
  buttons = 0;
  buttonUGLevel = 1;
  buttonCPS = 1;
  buttonprice = 300;
  buttonUGprice = 3000;
  
  games = 0;
  clickerUGLevel = 1;
  clickerCPS = 1;
  clickerprice = 1000;
  clickerUGprice = 10000;
  
  machs = 0;
  machUGLevel = 1;
  machCPS = 1;
  machprice = 20000;
  machUGprice = 200000;
  
  farms = 0;
  farmUGLevel = 1;
  farmCPS = 1;
  farmprice = 100000;
  farmUGprice = 1000000;
  
  facts = 0;
  factUGLevel = 1;
  factCPS = 1;
  factprice = 3000000;
  factUGprice = 30000000;
  
  cmen = 0;
  cmanUGLevel = 1;
  cmanCPS = 1;
  factprice = 50000000;
  cmanUGprice = 500000000;
  
  planets = 0;
  planetUGLevel = 1;
  planetCPS = 1;
  planetprice = 200000000;
  planetUGprice = 2000000000;
  
  cloners = 0;
  clonerUGLevel = 1;
  clonerCPS = 1;
  clonerprice = 500000000;
  clonerprice*=10;
  clonerUGprice = 500000000;
  clonerUGprice*=100;
  
  whiteholes = 0;
  whiteholeUGLevel = 1;
  whiteholeCPS = 1;
  whiteholeprice = 1000000000;
  whiteholeprice*=10;
  whiteholeUGprice = 1000000000;
  whiteholeUGprice *= 100;
  
  won = false;
  gclix = 0;
}
void loadStuff(){
  everything = loadJSONObject("everything.json");
  clix = everything.getLong("Clix");
  for(int i = 0; i < 329; i++){
  AchList[i] = everything.getBoolean("Achievements Gotten ("+i+")");
  }
  pointerUGLevel = everything.getInt("Clicker Upgrade Level");
  pointerCPC = everything.getLong("Clix Per Click");
  pointerUGprice = everything.getLong("Clicker Upgrade Price");
  
  mice = everything.getLong("Mice");
  miceUGLevel = everything.getInt("Mouse Upgrade Level");
  miceCPS = everything.getDouble("Clix Per Second From Mice");
  miceprice = everything.getLong("Mouse Price");
  miceUGprice = everything.getLong("Mouse Upgrade Price");
  
  buttons = everything.getInt("Buttons");
  buttonUGLevel = everything.getInt("button Upgrade Level");
  buttonCPS = everything.getDouble("Clix Per Second From buttons");
  buttonprice = everything.getLong("Button Price");
  buttonUGprice = everything.getLong("Button Upgrade Price");
  
  games = everything.getInt("Clicker Games");
  clickerUGLevel = everything.getInt("clicker game Upgrade Level");
  clickerCPS = everything.getDouble("Clix Per Second From clicker games");
  clickerprice = everything.getLong("clicker game Price");
  clickerUGprice = everything.getLong("clicker game Upgrade Price");
  
  machs = everything.getInt("Machines");
  machUGLevel = everything.getInt("machine Upgrade Level");
  machCPS = everything.getDouble("Clix Per Second From machines");
  machprice = everything.getLong("machine Price");
  machUGprice = everything.getLong("machine Upgrade Price");
  
  farms = everything.getInt("Farms");
  farmUGLevel = everything.getInt("farm Upgrade Level");
  farmCPS = everything.getDouble("Clix Per Second From farms");
  farmprice = everything.getLong("farm Price");
  farmUGprice = everything.getLong("farm Upgrade Price");
  
  facts = everything.getInt("Factories");
  factUGLevel = everything.getInt("factory Upgrade Level");
  factCPS = everything.getDouble("Clix Per Second From factory");
  factprice = everything.getLong("factory Price");
  factUGprice = everything.getLong("factory Upgrade Price");
  
  cmen = everything.getInt("Clicker Men");
  cmanUGLevel = everything.getInt("clicker man Upgrade Level");
  cmanCPS = everything.getDouble("Clix Per Second From clicker man");
  factprice = everything.getLong("clicker man Price");
  cmanUGprice = everything.getLong("clicker man Upgrade Price");
  
  planets = everything.getInt("Planets");
  planetUGLevel = everything.getInt("planet Upgrade Level");
  planetCPS = everything.getDouble("Clix Per Second From planets");
  planetprice = everything.getLong("planet Price");
  planetUGprice = everything.getLong("planet Upgrade Price");
  
  cloners = everything.getInt("Cloners");
  clonerUGLevel = everything.getInt("Cloner Upgrade Level");
  clonerCPS = everything.getDouble("Clix Per Second From Cloners");
  clonerprice = everything.getLong("Cloner Price");
  clonerUGprice = everything.getLong("Cloner Upgrade Price");
  
  whiteholes = everything.getInt("White Holes");
  whiteholeUGLevel = everything.getInt("White Hole Upgrade Level");
  whiteholeCPS = everything.getDouble("Clix Per Second From White Holes");
  whiteholeprice = everything.getLong("White Hole Price");
  whiteholeUGprice = everything.getLong("White Hole Upgrade Price");
  
  won = everything.getBoolean("Won");
  gclix = everything.getLong("Golden Clix");
}
void saveStuff(){
  JSONObject everything = new JSONObject();
  //achievements
  for(int i = 0; i < 329; i++){
  everything.setBoolean("Achievements Gotten ("+i+")", AchList[i]);
  }
  //clix
  everything.setLong("Clix", clix);
  //clicker stuff
  everything.setLong("Clicker Upgrade Level", pointerUGLevel);
  everything.setLong("Clix Per Click", pointerCPC);
  everything.setLong("Clicker Upgrade Price", pointerUGprice);
  //mouse stuff
  everything.setLong("Mice", mice);
  everything.setInt("Mouse Upgrade Level", miceUGLevel);
  everything.setDouble("Clix Per Second From Mice", miceCPS);
  everything.setLong("Mouse Price", miceprice);
  everything.setLong("Mouse Upgrade Price", miceUGprice);
  //button stuff
  everything.setLong("Buttons", buttons);
  everything.setInt("button Upgrade Level", buttonUGLevel);
  everything.setDouble("Clix Per Second From buttons", buttonCPS);
  everything.setLong("Button Price", buttonprice);
  everything.setLong("Button Upgrade Price", buttonUGprice);
  //clicker game stuff
  everything.setLong("Clicker Games", games);
  everything.setInt("clicker game Upgrade Level", clickerUGLevel);
  everything.setDouble("Clix Per Second From clicker games", clickerCPS);
  everything.setLong("clicker game Price", clickerprice);
  everything.setLong("clicker game Upgrade Price", clickerUGprice);
  //machine stuff
  everything.setLong("Machines", machs);
  everything.setInt("machine Upgrade Level", machUGLevel);
  everything.setDouble("Clix Per Second From machines", machCPS);
  everything.setLong("machine Price", machprice);
  everything.setLong("machine Upgrade Price", machUGprice);
  //farm stuff
  everything.setLong("Farms", farms);
  everything.setInt("farm Upgrade Level", farmUGLevel);
  everything.setDouble("Clix Per Second From farms", farmCPS);
  everything.setLong("farm Price", farmprice);
  everything.setLong("farm Upgrade Price", farmUGprice);
  //factory stuff
  everything.setLong("Factories", facts);
  everything.setInt("factory Upgrade Level", factUGLevel);
  everything.setDouble("Clix Per Second From factory", factCPS);
  everything.setLong("factory Price", factprice);
  everything.setLong("factory Upgrade Price", factUGprice);
  //clicker man stuff
  everything.setLong("Clicker Men", cmen);
  everything.setInt("clicker man Upgrade Level", cmanUGLevel);
  everything.setDouble("Clix Per Second From clicker man", cmanCPS);
  everything.setLong("clicker man Price", factprice);
  everything.setLong("clicker man Upgrade Price", cmanUGprice);
  //planet stuff
  everything.setLong("Planets", planets);
  everything.setInt("planet Upgrade Level", planetUGLevel);
  everything.setDouble("Clix Per Second From planets", planetCPS);
  everything.setLong("planet Price", planetprice);
  everything.setLong("planet Upgrade Price", planetUGprice);
  //cloner stuff
  everything.setLong("Cloners", cloners);
  everything.setInt("Cloner Upgrade Level", clonerUGLevel);
  everything.setDouble("Clix Per Second From Cloners", clonerCPS);
  everything.setLong("Cloner Price", clonerprice);
  everything.setLong("Cloner Upgrade Price", clonerUGprice);
  //white hole stuff
  everything.setLong("White Holes", whiteholes);
  everything.setInt("White Hole Upgrade Level", whiteholeUGLevel);
  everything.setDouble("Clix Per Second From White Holes", whiteholeCPS);
  everything.setLong("White Hole Price", whiteholeprice);
  everything.setLong("White Hole Upgrade Price", whiteholeUGprice);
  //win stuff
  everything.setBoolean("Won", won);
  everything.setLong("Golden Clix", gclix);
  
  saveJSONObject(everything,"everything.json");
}
void keyPressed(){
  if(key == ' '){
    start = true;
    textSize(10);
    animationPoint = 0;
  }
  if(key == 'w'){
    p = 1;
  }
  if(key == 'z'){
    p = 2;
  }
  if(key == 'r'){
    p = 3;
  }
  if(key == 'e'){
    p = 4;
  }
  if(key == 'n'){
    p = 5;
  }
  if(key == 'q' && p == 5){
    clix += clix;
    p = 0;
  }
  if(key == '1'){
    style = 1;
  }
  if(key == '2'){
    style = 2;
  }
  if(key == '3'){
    style = 3;
  }
  if(key == '4'){
    style = 4;
  }
  if(key == '5'){
    style = 5;
  }
  if(key == '6'){
    style = 6;
  }
  if(key == '7'){
    style = 7;
  }
  if(key == '8'){
    style = 8;
  }
  if(key == '9'){
    style = 9;
  }
  if(key == '0'){
    style = 10;
  }
  if(key == '-'){
    style = 11;
  }
  if(key == '='){
    style = 12;
  }
  if(key == 'u'){
    if(mouseX>300){
      if(mouseY<50+scrolly && clix >=miceUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=miceUGprice;
        miceCPS+=(miceCPS/3);
        miceUGprice+=(miceUGprice/2);
        miceUGLevel+=1;
      }
      else if(mouseY<100+scrolly && clix >=buttonUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=buttonUGprice;
        buttonCPS+=(buttonCPS/3);
        buttonUGprice+=(buttonUGprice/2);
        buttonUGLevel+=1;
      }
      else if(mouseY<150+scrolly && clix >=clickerUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=clickerUGprice;
        clickerCPS+=(clickerCPS/3);
        clickerUGprice+=(clickerUGprice/2);
        clickerUGLevel+=1;
      }
      else if(mouseY<200+scrolly && clix >=machUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=machUGprice;
        machCPS+=(machCPS/3);
        machUGprice+=(machUGprice/2);
        machUGLevel+=1;
      }
      else if(mouseY<250+scrolly && clix >=farmUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=farmUGprice;
        farmCPS+=(farmCPS/3);
        farmUGprice+=(farmUGprice/2);
        farmUGLevel+=1;
      }
      else if(mouseY<300+scrolly && clix >=factUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=factUGprice;
        factCPS+=(factCPS/3);
        factUGprice+=(factUGprice/2);
        factUGLevel+=1;
      }
      else if(mouseY<350+scrolly && clix >=cmanUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=cmanUGprice;
        cmanCPS+=(cmanCPS/3);
        cmanUGprice+=(cmanUGprice/2);
        cmanUGLevel+=1;
      }
      else if(mouseY<400+scrolly && clix >=planetUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=planetUGprice;
        planetCPS+=(planetCPS/3);
        planetUGprice+=(planetUGprice/2);
        planetUGLevel+=1;
      }
      else if(mouseY<450+scrolly && clix >=clonerUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=clonerUGprice;
        clonerCPS+=(clonerCPS/3);
        clonerUGprice+=(clonerUGprice/2);
        clonerUGLevel+=1;
      }
      else if(mouseY<500+scrolly && clix >=whiteholeUGprice){
        //player3.rewind();
        player3.trigger();
        clix-=whiteholeUGprice;
        whiteholeCPS+=(whiteholeCPS/3);
        whiteholeUGprice+=(whiteholeUGprice/2);
        whiteholeUGLevel+=1;
      }
    }
    if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150 && clix >= pointerUGprice){
      //player3.rewind();
        player3.trigger();
      clix -= pointerUGprice;
      pointerUGprice*=3;
      pointerCPC*=2;
      pointerUGLevel+=1;
    }
    if(mouseX>180 && mouseX<220 && mouseY>150 && mouseY<190 && clix >= pointerUGprice){
      //player3.rewind();
        player3.trigger();
      clix -= pointerUGprice;
      pointerUGprice*=3;
      pointerCPC*=2;
      pointerUGLevel+=1;
  }
  }
}
void mousePressed(){
  if(mouseY<50+scrolly && mouseY>scrolly && mouseX>300 && clix>=miceprice){
    smallupgrades[0] = true;
  }
  
  if(mouseY<100+scrolly && mouseY>50+scrolly && mouseX>300 && clix>=buttonprice){
    smallupgrades[1] = true;
  }
  if(mouseY<150+scrolly && mouseY>100+scrolly && mouseX>300 && clix>=clickerprice){
    smallupgrades[2] = true;
  }
  if(mouseY<200+scrolly && mouseY>150+scrolly && mouseX>300 && clix>=machprice){
    smallupgrades[3] = true;
  }
  if(mouseY<250+scrolly && mouseY>200+scrolly && mouseX>300 && clix>=farmprice){
    smallupgrades[4] = true;
  }
  if(mouseY<300+scrolly && mouseY>250+scrolly && mouseX>300 && clix>=factprice){
    smallupgrades[5] = true;
  }
  if(mouseY<350+scrolly && mouseY>300+scrolly && mouseX>300 && clix>=cmanprice){
    smallupgrades[6] = true;
  }
  if(mouseY<400+scrolly && mouseY>350+scrolly && mouseX>300 && clix>=planetprice && won == false){
    smallupgrades[7] = true;
  }
  if(mouseY<450+scrolly && mouseY>400+scrolly && mouseX>300 && clix>=clonerprice && won == false){
    smallupgrades[8] = true;
  }
  if(mouseY<500+scrolly && mouseY>450+scrolly && mouseX>300 && clix>=whiteholeprice && won == false){
    smallupgrades[9] = true;
  }
  if(mouseY<550+scrolly && mouseY>500+scrolly && mouseX>300 && clix>=winprice && won == false){
    smallupgrades[10] = true;
  }
  if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150 && x == true){
    //player4.rewind();
        player4.trigger();
    x = false;
    clix+=pointerCPC;
    done = false;
    for (int i = 1; i < micecoords.length/2; i++){
      if(micecoords[(2*i)] > 250 && done == false){
        micecoords[2*i] = -200;
        micecoords[(2*i)-1] = round(random(-200,200));
        done = true;
      }
    }
  }
  if(mouseX>180 && mouseX<220 && mouseY>150 && mouseY<190 && x == true){
    //player4.rewind();
        player4.trigger();
    x = false;
    clix+=pointerCPC;
    done = false;
    for (int i = 1; i < micecoords.length/2; i++){
      if(micecoords[(2*i)] > 250 && done == false){
        micecoords[2*i] = -200;
        micecoords[(2*i)-1] = round(random(-100,100));
        done = true;
      }
    }
  }
  if(mouseX<100 && mouseY<225 && mouseY>175){
    if(achievements == false){
      achievements = true;
    }
    else{
      achievements = false;
    }
  }
  if(mouseX>150 && mouseX<250 && mouseY>370){
    reset();
  }
}
void mouseReleased(){
  x = true;
  for(int i = 0; i < 11; i++){
    smallupgrades[i] = false;
  }
  if(mouseY<50+scrolly && mouseY>scrolly && mouseX>300 && clix>=miceprice){
    //player3.rewind();
        player3.trigger();
    mice+=1;
    clix-=miceprice;
    miceprice = round(miceprice+(miceprice/10));
  }
  
  if(mouseY<100+scrolly && mouseY>50+scrolly && mouseX>300 && clix>=buttonprice){
    //player3.rewind();
        player3.trigger();
    buttons+=1;
    clix-=buttonprice;
    buttonprice = round(buttonprice+(buttonprice/10));
  }
  if(mouseY<150+scrolly && mouseY>100+scrolly && mouseX>300 && clix>=clickerprice){
    //player3.rewind();
        player3.trigger();
    games+=1;
    clix-=clickerprice;
    clickerprice = round(clickerprice+(clickerprice/10));
  }
  if(mouseY<200+scrolly && mouseY>150+scrolly && mouseX>300 && clix>=machprice){
    //player3.rewind();
        player3.trigger();
    machs+=1;
    clix-=machprice;
    machprice = round(machprice+(machprice/10));
  }
  if(mouseY<250+scrolly && mouseY>200+scrolly && mouseX>300 && clix>=farmprice){
    //player3.rewind();
        player3.trigger();
    farms+=1;
    clix-=farmprice;
    farmprice = round(farmprice+(farmprice/10));
  }
  if(mouseY<300+scrolly && mouseY>250+scrolly && mouseX>300 && clix>=factprice){
    //player3.rewind();
        player3.trigger();
    facts+=1;
    clix-=factprice;
    factprice = round(factprice+(factprice/10));
  }
  if(mouseY<350+scrolly && mouseY>300+scrolly && mouseX>300 && clix>=cmanprice){
    //player3.rewind();
        player3.trigger();
    cmen+=1;
    clix-=cmanprice;
    cmanprice = round(cmanprice+(cmanprice/10));
  }
  if(mouseY<400+scrolly && mouseY>350+scrolly && mouseX>300 && clix>=planetprice && won == false){
    //player3.rewind();
        player3.trigger();
    planets+=1;
    clix-=planetprice;
    planetprice = round(planetprice+(planetprice/10));
  }
  if(mouseY<450+scrolly && mouseY>400+scrolly && mouseX>300 && clix>=clonerprice && won == false){
    //player3.rewind();
        player3.trigger();
    cloners+=1;
    clix-=clonerprice;
    clonerprice = round(clonerprice+(clonerprice/10));
  }
  if(mouseY<500+scrolly && mouseY>450+scrolly && mouseX>300 && clix>=whiteholeprice && won == false){
    //player3.rewind();
        player3.trigger();
    whiteholes+=1;
    clix-=whiteholeprice;
    whiteholeprice = round(whiteholeprice+(whiteholeprice/10));
  }
  if(mouseY<550+scrolly && mouseY>500+scrolly && mouseX>300 && clix>=winprice && won == false){
    //player3.rewind();
        player3.trigger();
    won = true;
    clix-=winprice;
  }
  if(won == true && mini == false && gold == false && mouseY>200 && mouseY<320){
    gold = true;
  }
  if(won == true && mini == false && gold == false && mouseY<200 && mouseY>80){
    mini = true;
  }
  if(won == true && mini == false && gold == true && mouseY>300 && mouseX<100 && clix >= 1000000000){
    //player3.rewind();
        player3.trigger();
    clix-=1000000000;
    gclix+=1;
  }
}