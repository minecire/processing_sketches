String level = "Start_Page";
String InHand = "Nothing";
int ht = 0;
int towerbuyht = 0;
int scroll = 0;
int[][] gridOfSpaces = {{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
PImage lvl0;
PImage lvl1;
PImage lvl2;
PImage lvl3;
PImage lvl4;
PImage hurttower1;
PImage hurttower2;
PImage hurttower3;
PImage hurttower4;
PImage hurttower5;
PImage hurttower6;
PImage hurttower7;
PImage hurttower8;
PImage hurttower9;
PImage healtower1;
PImage healtower2;
void buytowerwall(int ht){
  noStroke();
  fill(100,100,100);
  rect(400,0,100,500);
  image(hurttower1,425,25+ht);
  image(hurttower2,425,125+ht);
  image(hurttower3,425,225+ht);
  image(hurttower4,425,325+ht);
  image(hurttower5,425,425+ht);
  image(hurttower6,425,525+ht);
  image(hurttower7,425,625+ht);
  image(hurttower8,425,725+ht);
  image(hurttower9,425,825+ht);
  image(healtower1,425,925+ht);
  image(healtower2,425,1025+ht);
}
void rangecir(int range, int x, int y){
   fill(255,0,0,175);
   ellipse(x*25,y*25,range*25,range*25);
}
void setup(){
  lvl0 = loadImage("TD Map 0.png");
  lvl1 = loadImage("TD Map 1.png");
  lvl2 = loadImage("TD Map 2.png");
  lvl3 = loadImage("TD Map 3.png");
  lvl4 = loadImage("TD Map 4.png");
  hurttower1 = loadImage("TD Tower 1 Base.png");
  hurttower2 = loadImage("TD Tower 2 Base.png");
  hurttower3 = loadImage("TD Tower 3 Base.png");
  hurttower4 = loadImage("TD Tower 4 Base.png");
  hurttower5 = loadImage("TD Tower 5 Base.png");
  hurttower6 = loadImage("TD Tower 6 Base.png");
  hurttower7 = loadImage("TD Tower 1 Base.png");
  hurttower8 = loadImage("TD Tower 8 Base.png");
  hurttower9 = loadImage("TD Tower 9 Base.png");
  healtower1 = loadImage("TD Tower 10.png");
  healtower2 = loadImage("TD Tower 11.png");
  size(500,500);
}
void draw(){
  if(level == "Start_Page"){
  if(keyPressed){
    if(key == 'w'){
      ht-=5;
    }
    if(key == 's'){
      ht+=5;
    }
  }
  background(255,0,255);
  noStroke();
  fill(0,255,255);
  rect(0,250+ht,500,250);
  fill(0,255,0);
  rect(0,500+ht,500,250);
  fill(255,255,0);
  rect(0,750+ht,500,250);
  fill(255,0,0);
  rect(0,1000+ht,500,250);
  fill(255,100,0);
  rect(0,1250+ht,500,250);
  textSize(100);
  fill(255,0,255);
  text("Easier", 50, 400+ht);
  text("Easy", 50, 650+ht);
  text("Medium", 50, 900+ht);
  text("Hard", 50, 1150+ht);
  text("Harder",50,1400+ht);
  }
  else if(level == "Easier"){
    image(lvl0,0+scroll,0);
    buytowerwall(towerbuyht);
    if(keyPressed){
    if(key == 'a' && scroll <= 0){
      scroll+=5;
    }
    if(key == 'd' && scroll >= -100){
      scroll-=5;
    }
    if(key == 'w' && towerbuyht > -600){
      towerbuyht-=5;
    }
    if(key == 's' && towerbuyht < 0){
      towerbuyht+=5;
    }
  }
  if(mouseX > 400){
    fill(50);
    stroke(0);
    rect(200,mouseY-50,200,100);
    if(mouseY < 100+towerbuyht){
      textSize(12);
      fill(0);
      text("Basic Tower",250,mouseY-30);
      text("Costs 50 Cash",220,mouseY-11);
      text("Does 5 Damage",220,mouseY+8);
      text("Has A Range Of 3",220,mouseY+27);
      text("Reloads in 0.5 Seconds",220,mouseY+46);
    }
  }
  }
  else if(level == "Easy"){
    image(lvl1,0,0);
  }
  else if(level == "Medium"){
    image(lvl2,0,0);
  }
  else if(level == "Hard"){
    image(lvl3,0,0);
  }
  else if(level == "Harder"){
    image(lvl4,0,0);
  }
  if(InHand == "Hu1"){
    image(hurttower1,round((mouseX-12.5)/25.0)*25,round((mouseY-12.5)/25.0)*25);
  }
}
void mousePressed(){
  if(mouseY < 100+towerbuyht && level != "Start_Page"){
    InHand = "Hu1";
  }
  if(mouseY>250+ht && level == "Start_Page"){
  if(mouseY<500+ht){
    level = "Easier";
    for(int i = 0; i < 20; i++){
       for(int j = 0; j < 20; j++){
        gridOfSpaces[i][j] = 0;
       }
    }
    gridOfSpaces[3][1] = -1;
    gridOfSpaces[4][1] = -1;
    gridOfSpaces[5][1] = -1;
    gridOfSpaces[6][1] = -1;
    gridOfSpaces[7][1] = -1;
    gridOfSpaces[8][1] = -1;
    gridOfSpaces[9][1] = -1;
    gridOfSpaces[10][1] = -1;
    gridOfSpaces[11][1] = -1;
    gridOfSpaces[12][1] = -1;
    gridOfSpaces[13][1] = -1;
    gridOfSpaces[14][1] = -1;
    gridOfSpaces[15][1] = -1;
    gridOfSpaces[16][1] = -1;
    gridOfSpaces[17][1] = -1;
    gridOfSpaces[18][1] = -1;
    gridOfSpaces[19][1] = -1;
    gridOfSpaces[3][2] = -1;
    gridOfSpaces[3][3] = -1;
    gridOfSpaces[3][4] = -1;
    gridOfSpaces[3][5] = -1;
    gridOfSpaces[3][6] = -1;
    gridOfSpaces[3][7] = -1;
    gridOfSpaces[3][8] = -1;
    gridOfSpaces[3][9] = -1;
    gridOfSpaces[3][10] = -1;
    gridOfSpaces[3][11] = -1;
    gridOfSpaces[3][12] = -1;
    gridOfSpaces[4][12] = -1;
    gridOfSpaces[5][12] = -1;
    gridOfSpaces[6][12] = -1;
    gridOfSpaces[7][12] = -1;
    gridOfSpaces[8][12] = -1;
    gridOfSpaces[9][12] = -1;
    gridOfSpaces[10][12] = -1;
    gridOfSpaces[11][12] = -1;
    gridOfSpaces[12][12] = -1;
    gridOfSpaces[12][11] = -1;
    gridOfSpaces[12][10] = -1;
  }
  else if(mouseY<750+ht){
    level = "Easy";
  }
  else if(mouseY<1000+ht){
    level = "Medium";
  }
  else if(mouseY<1250+ht){
    level = "Hard";
  }
  else if(mouseY<1500+ht){
    level = "Harder";
  }
  }
}