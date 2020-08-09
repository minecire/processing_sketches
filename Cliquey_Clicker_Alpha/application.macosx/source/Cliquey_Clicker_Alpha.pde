boolean start = false;
boolean x = true;
long clix = 0;
long mice = 0;
int thing = 0;
int miceprice = 50;
int buttonprice = 300;
int buttons = 0;
int clickerprice = 1000;
int games = 0;
int machprice = 20000;
int machs = 0;
int farms = 0;
int farmprice = 100000;
int factprice = 3000000;
int facts = 0;
int cmanprice = 50000000;
int cmen = 0;
boolean p = false;
boolean won = false;
boolean mini = false;
boolean gold = false;
void setup() {
  frameRate(50);
  size(400, 400);
}
void draw() {
  
  if(start == false){
  background(0);
  text("Cliquey Clicker Alpha!",150,200);
  text("Press Space To Begin!",150,220);
  }
  else if(start == true){
    if(won == false){
    thing+=1;
    background(255, 0, 0);
    stroke(255);
    fill(0);
    rect(185, 150, 30, 30);
    triangle(150, 150, 250, 150, 200, 50);
    noStroke();
    rect(185, 121, 30, 30);
    text("Clix: "+clix,50,50);
    text("CPS: "+(mice + (buttons*5) + (games*10) + (machs * 50) + (farms*200) + (facts*1000) + (cmen*50000)), 50, 70);
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
    clix+=mice;
    thing = 0;
    }
    if(thing == 0 || thing == 10 || thing == 20 || thing == 30 || thing == 40){
      clix+=buttons;
    }
    if(thing == 0 || thing == 5 || thing == 10 || thing == 15 || thing == 20 || thing == 25 || thing == 30 || thing == 35 || thing == 40 || thing == 45){
      clix+=games;
    }
    clix+=machs;
    clix+=(farms*4);
    clix+=(facts*20);
    clix+=(cmen*100);
    text("Buy A Mouse "+mice, 305, 20);
    text("For "+miceprice+" Clix!  ", 305, 40);
    text("Buy A Button "+buttons, 305, 70);
    text("For "+buttonprice+" Clix!  ", 305, 90);
    text("Buy A Game  "+games, 305, 120);
    text("For "+clickerprice+" Clix!", 305, 140);
    text("Buy A Machine  ", 305, 163);
    text("For "+machprice+" Clix! ", 305, 178);
    text(machs, 305, 193);
    text("Buy A Farm  "+farms, 305, 220);
    text("For "+farmprice+" Clix!", 305, 240);
    text("Buy A Factory  ", 305, 263);
    text("For "+factprice, 305, 278);
    text("Clix!  "+facts,301,293);
    text("Buy A ClickerMan  ", 301, 313);
    text("For "+cmanprice+" ", 301, 328);
    text("Clix!  "+cmen, 301, 343);
    fill(255);
    text("Win The Game  ", 301, 363);
    text("For 2.1474x10^9 Clix!", 301, 378);
    text("Clix!", 301, 393);
    }
    else if(won == true){
      if(gold == true){
        
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
  }
  if(key == 'w'){
    p = true;
  }
  if(key == 'q' && p == true){
    clix += 1234567890;
    p = false;
  }
}
void mousePressed(){
  if(mouseX>150 && mouseX<250 && mouseY>50 && mouseY<150 && x == true){
    x = false;
    clix+=1;
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
  if(mouseY>350 && mouseX>300 && clix>=2147483000){
    won = true;
  }
}