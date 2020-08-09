boolean start = false;
boolean x = true;
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
long pointerCPC = 1;
double miceCPS = 1;
double buttonCPS = 1;
double clickerCPS = 1;
double machCPS = 1;
double farmCPS = 1;
double factCPS = 1;
double cmanCPS = 1;
long pointerUGprice = 50;
long miceUGprice = 500;
long buttonUGprice = 3000;
long clickerUGprice = 10000;
long machUGprice = 200000;
long farmUGprice = 1000000;
long factUGprice = 30000000;
long cmanUGprice = 500000000;
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
long gclix = 0;
int p = 0;
boolean won = false;
boolean mini = false;
boolean gold = false;
void setup() {
  frameRate(50);
  size(400, 400);
}
void draw() {
  
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
    if(won == false){
    thing+=1;
    background(255, 0, 0);
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
    text("Clix: "+clix,50,50);
    CP = (mice*(miceCPS)) + (buttons*5*(buttonCPS)) + (games*10*(clickerCPS)) + (machs * 50*(machCPS)) + (farms*200*(farmCPS)) + (facts*1000*(factCPS)) + (cmen*50000*(cmanCPS));
    CPS = String.format("%.2f",CP);
    text("CPS: "+CPS, 50, 70);
    fill(0,0,255);
    rect(300,00,100,50);
    fill(0,255,0);
    rect(300,50,100,50);
    fill(0,255,255);
    rect(300,100,100,50);
    fill(255,0,255);
    rect(300,150,100,50);
    fill(255,255,0);
    rect(300,200,100,50);
    fill(255,255,255);
    rect(300,250,100,50);
    fill(255,150,0);
    rect(300,300,100,50);
    fill(0);
    rect(300,350,100,50);
    fill(0);
    if(thing == 50){
    clix+=mice*miceCPS;
    thing = 0;
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
    text("Buy A Mouse ", 305, 20);
    text("Buy A Button ", 305, 70);
    text("Buy A Clicker", 305, 120);
    text("Game",305,140);
    text("Buy A Machine  ", 305, 170);
    text("Buy A Farm  ", 305, 220);
    text("Buy A Factory  ", 305, 270);
    text("Buy A", 305, 320);
    text("ClickerMan",305,340);
    fill(255);
    text("Win The Game  ", 305, 370);
    if(mouseX>300){
      text("Click to buy!",20,260);
      if(mouseY<350){
      text("Press 'u' to upgrade!",20,280);
      }
      if(mouseY<50){
        text("Costs "+miceprice+" clix.",20, 300);
        text("You have "+mice+" mice",20,320);
        text("+"+String.format("%.2f",miceCPS)+" CPS per mouse",20,340);
        text("Costs "+miceUGprice+" clix to upgrade to level "+(miceUGLevel+1),20, 360);
      }
      else if(mouseY<100){
        text("Costs "+buttonprice+" clix.",20, 300);
        text("You have "+buttons+" buttons",20,320);
        text("+"+String.format("%.2f",buttonCPS*5)+" CPS per button",20,340);
        text("Costs "+buttonUGprice+" clix to upgrade to level "+(buttonUGLevel+1),20, 360);
      }
      else if(mouseY<150){
        text("Costs "+clickerprice+" clix.",20, 300);
        text("You have "+games+" clicker games",20,320);
        text("+"+String.format("%.2f",clickerCPS*10)+" CPS per clicker game",20,340);
        text("Costs "+clickerUGprice+" clix to upgrade to level "+(clickerUGLevel+1),20, 360);
      }
      else if(mouseY<200){
        text("Costs "+machprice+" clix.",20, 300);
        text("You have "+machs+" machines",20,320);
        text("+"+String.format("%.2f",machCPS*50)+"CPS per machine",20,340);
        text("Costs "+machUGprice+" clix to upgrade to level "+(machUGLevel+1),20, 360);
      }
      else if(mouseY<250){
        text("Costs "+farmprice+" clix.",20, 300);
        text("You have "+farms+" farms",20,320);
        text("+"+String.format("%.2f",farmCPS*200)+" CPS per farm",20,340);
        text("Costs "+farmUGprice+" clix to upgrade to level "+(farmUGLevel+1),20, 360);
      }
      else if(mouseY<300){
        text("Costs "+factprice+" clix.",20, 300);
        text("You have "+facts+" factories",20,320);
        text("+"+String.format("%.2f",factCPS*1000)+" CPS per factory",20,340);
        text("Costs "+factUGprice+" clix to upgrade to level "+(buttonUGLevel+1),20, 360);
      }
      else if(mouseY<350){
        text("Costs "+cmanprice+" clix.",20, 300);
        text("You have "+cmen+" ClickerMen",20,320);
        text("+"+String.format("%.2f",cmanCPS*50000)+" CPS per ClickerMan",20,340);
        text("Costs "+cmanUGprice+" clix to upgrade to level "+(cmanUGLevel+1),20, 360);
      }
      else if(mouseY<400){
        text("Costs 2147483000 clix.",20, 300);
      }
    }
    if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150){
      text("Gives you "+pointerCPC+" clix per click.",20, 300);
      text("Press 'u' to upgrade to level "+(pointerUGLevel+1),20,320);
      text("For "+pointerUGprice+" clix!",20,340);
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
void keyPressed(){
  if(key == ' '){
    start = true;
    textSize(12);
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
    clix += 1234567890;
    p = 0;
  }
  if(key == 'u'){
    if(mouseX>300){
      if(mouseY<50 && clix >=miceUGprice){
        clix-=miceUGprice;
        miceCPS+=(miceCPS/3);
        miceUGprice+=(miceUGprice/2);
        miceUGLevel+=1;
      }
      else if(mouseY<100 && clix >=buttonUGprice){
        clix-=buttonUGprice;
        buttonCPS+=(buttonCPS/3);
        buttonUGprice+=(buttonUGprice/2);
        buttonUGLevel+=1;
      }
      else if(mouseY<150 && clix >=clickerUGprice){
        clix-=clickerUGprice;
        clickerCPS+=(clickerCPS/3);
        clickerUGprice+=(clickerUGprice/2);
        clickerUGLevel+=1;
      }
      else if(mouseY<200 && clix >=machUGprice){
        clix-=machUGprice;
        machCPS+=(machCPS/3);
        machUGprice+=(machUGprice/2);
        machUGLevel+=1;
      }
      else if(mouseY<250 && clix >=farmUGprice){
        clix-=farmUGprice;
        farmCPS+=(farmCPS/3);
        farmUGprice+=(farmUGprice/2);
        farmUGLevel+=1;
      }
      else if(mouseY<300 && clix >=factUGprice){
        clix-=factUGprice;
        factCPS+=(factCPS/3);
        factUGprice+=(factUGprice/2);
        factUGLevel+=1;
      }
      else if(mouseY<350 && clix >=cmanUGprice){
        clix-=cmanUGprice;
        cmanCPS+=(cmanCPS/3);
        cmanUGprice+=(cmanUGprice/2);
        cmanUGLevel+=1;
      }
    }
    if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150 && clix >= pointerUGprice){
      clix -= pointerUGprice;
      pointerUGprice*=3;
      pointerCPC*=2;
      pointerUGLevel+=1;
    }
  }
}
void mousePressed(){
  if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150 && x == true){
    x = false;
    clix+=pointerCPC;
  }
}
void mouseReleased(){
  x = true;
  if(mouseY<50 && mouseX>300 && clix>=miceprice){
    mice+=1;
    clix-=miceprice;
    miceprice = round(miceprice+(miceprice/10));
  }
  if(mouseY<100 && mouseY>50 && mouseX>300 && clix>=buttonprice){
    buttons+=1;
    clix-=buttonprice;
    buttonprice = round(buttonprice+(buttonprice/10));
  }
  if(mouseY<150 && mouseY>100 && mouseX>300 && clix>=clickerprice){
    games+=1;
    clix-=clickerprice;
    clickerprice = round(clickerprice+(clickerprice/10));
  }
  if(mouseY<200 && mouseY>150 && mouseX>300 && clix>=machprice){
    machs+=1;
    clix-=machprice;
    machprice = round(machprice+(machprice/10));
  }
  if(mouseY<250 && mouseY>200 && mouseX>300 && clix>=farmprice){
    farms+=1;
    clix-=farmprice;
    farmprice = round(farmprice+(farmprice/10));
  }
  if(mouseY<300 && mouseY>250 && mouseX>300 && clix>=factprice){
    facts+=1;
    clix-=factprice;
    factprice = round(factprice+(factprice/10));
  }
  if(mouseY<350 && mouseY>300 && mouseX>300 && clix>=cmanprice){
    cmen+=1;
    clix-=cmanprice;
    cmanprice = round(cmanprice+(cmanprice/10));
  }
  if(mouseY>350 && mouseX>300 && clix>=2147483000 && won == false){
    won = true;
    clix-=2147483000;
  }
  if(won == true && mini == false && gold == false && mouseY>200 && mouseY<320){
    gold = true;
  }
  if(won == true && mini == false && gold == false && mouseY<200 && mouseY>80){
    mini = true;
  }
  if(won == true && mini == false && gold == true && mouseY>300 && mouseX<100 && clix >= 1000000000){
    clix-=1000000000;
    gclix+=1;
  }
}