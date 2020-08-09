String type = "NORMAL";
int w = 9;
int h = 9;
int b = 15;
int s;
int milli;
boolean win = false;
boolean lose = false;
PImage Mine;
PImage Flag;
int[][] board;
boolean go = false;
boolean editheight = false;
boolean editbombs = false;
float time = 0;
int mf = 0;
int ef = 0;
int fm = 0;
void setup(){
  size(800,800);
  frameRate(8);
  Mine = loadImage("Mine.png");
  Flag = loadImage("Flag.png");
}
void draw(){
  if(go == false){
    background(192);
  if(mouseX > 50 && mouseX < 350 && mouseY > 50 && mouseY < 350){
    fill(128);
    noStroke();
    rect(50,50,300,300);
    textSize(60);
    fill(192);
    text("MODE:",100,100);
    textSize(40);
    text(type,70,220);
  }
  else{
    stroke(150);
    noFill();
    rect(50,50,300,300);
    fill(128);
    textSize(60);
    text("MODE:",100,100);
    textSize(40);
    text(type,70,220);
  }
  if(mouseX > 450 && mouseX < 750 && mouseY > 50 && mouseY < 350){
    fill(128);
    noStroke();
    rect(450,50,300,300);
    editheight = true;
    textSize(60);
    fill(192);
    text("SIZE:",540,100);
    textSize(40);
    text("WIDTH: "+w,470,180);
    text("HEIGHT: "+h,470,260);
  }
  else{
    stroke(128);
    noFill();
    rect(450,50,300,300);
    editheight = false;
    textSize(60);
    fill(128);
    text("SIZE:",540,100);
    textSize(40);
    text("WIDTH: "+w,470,180);
    text("HEIGHT: "+h,470,260);
  }
  if(mouseX > 150 && mouseX < 350 && mouseY > 450 && mouseY < 750){
    fill(128);
    noStroke();
    rect(50,450,300,300);
    fill(192);
    textSize(60);
    text("MINES:",90,500);
    text(b,70,620);
    editbombs = true;
  }
  else{
    stroke(128);
    noFill();
    rect(50,450,300,300);
    fill(128);
    textSize(60);
    text("MINES:",90,500);
    text(b,70,630);
    editbombs = false;
  }
  if(mouseX > 450 && mouseX < 750 && mouseY > 450 && mouseY < 750){
    fill(128);
    noStroke();
    rect(450,450,300,300);
    fill(192);
    text("START!",490,620);
  }
  else{
    stroke(128);
    noFill();
    rect(450,450,300,300);
    fill(128);
    text("START!",490,620);
  }
  if(keyPressed && editheight == true){
  if(key == 'w' && h < 80){
    h+=1;
  }
  if(key == 's' && h > 3){
    h-=1;
  }
  if(key == 'd' && w < 80){
    w+=1;
  }
  if(key == 'a' && w > 3){
    w-=1;
  }
  if(w*h-1 < b){
    b = w*h-1;
  }
  }
  if(keyPressed && editbombs == true){
    if(key == 'w' && b < w*h-1){
      b += ceil(w*h/100.0);
    }
    if(key == 's' && b > 2){
      b -= ceil(w*h/100.0);
    }
    if(key == 'd' && b < w*h-1){
      b += 1;
    }
    if(key == 'a' && b > 2){
      b -= 1;
    }
    if(b < 2){
      b = 2;
    }
    if(b > w*h-1){
      b = w*h-1;
    }
  }
  }
  else{
    makeBoard();
    win = checkwin();
    lose = checklose();
    if(win == true){
      background(128);
      textSize(160);
      for(int i = 0; i < w; i++){
        for(int j = 0; j < h; j++){
          if(findnumb(i,j) == -10){
            tint(255,100);
            image(Flag,(i+0.05)*s,(j+0.05)*s,s*0.9,s*0.9);
            tint(255);
          }
          else{
            if(findnumb(i,j) > 0){
            numbcol(board[i][j],true);
            textSize(s/2);
            text(findnumb(i,j),(i+0.3)*s,(j+0.7)*s);
            }
          }
        }
      }
      fill(0,255);
      textSize(150);
      text("YOU WIN!",10,450);
      textSize(75);
      text("MINES FOUND:"+mf,10,550);
      textSize(50);
      text("EMPTY SPACES FOUND:"+ef,10,650);
      textSize(75);
      text("FALSE MINES:"+fm,10,750);
      textSize(15);
      float sec = milli / 1000.0;
      if(sec < 60){
      text("TIME: "+sec,10,798);
      text("WIDTH: "+w,160,798);
      text("HEIGHT: "+h,280,798);
      text("MODE: "+type,520,798);
      text("MINES#: "+b,420,798);
      }
      else{
        if(sec%60 < 10){
          text("TIME: "+floor(sec/60.0)+":0"+String.format("%.3f",sec%60),10,798);
        }
        else{
          text("TIME: "+floor(sec/60.0)+":"+String.format("%.3f",sec%60),10,798);
        }
        text("WIDTH: "+w,200,798);
        text("HEIGHT: "+h,320,798);
        text("MODE: "+type,560,798);
        text("MINES#: "+b,460,798);
      }
    }
    if(lose == true){
      background(128);
      fill(0,100);
      for(int i = 0; i < w; i++){
        for(int j = 0; j < h; j++){
          fill(192);
          rect((i+0.05)*s,(j+0.05)*s,0.9*s,0.9*s);
          if(findnumb(i,j) == -10){
            tint(255,100);
            image(Mine,(i+0.05)*s,(j+0.05)*s,s*0.9,s*0.9);
            tint(255);
          }
          else{
            if(findnumb(i,j) > 0){
            numbcol(findnumb(i,j),true);
            textSize(s/2);
            text(findnumb(i,j),(i+0.3)*s,(j+0.7)*s);
            }
          }
        }
      }
      fill(0,255);
      textSize(150);
      text("YOU LOSE.",10,450);
      textSize(75);
      text("MINES FOUND: "+mf,10,550);
      textSize(50);
      text("EMPTY SPACES FOUND: "+ef,10,650);
      textSize(75);
      text("FALSE MINES: "+fm,10,750);
      textSize(15);
      float sec = milli / 1000.0;
      if(sec < 60){
      text("TIME: "+sec,10,798);
      text("WIDTH: "+w,160,798);
      text("HEIGHT: "+h,280,798);
      text("MODE: "+type,520,798);
      text("MINES#: "+b,420,798);
      }
      else{
        if(sec%60 < 10){
          text("TIME: "+floor(sec/60.0)+":0"+String.format("%.3f",sec%60),10,798);
        }
        else{
          text("TIME: "+floor(sec/60.0)+":"+String.format("%.3f",sec%60),10,798);
        }
        text("WIDTH: "+w,200,798);
        text("HEIGHT: "+h,320,798);
        text("MODE: "+type,560,798);
        text("MINES#: "+b,460,798);
      }
    }
  }
}
void mousePressed(){
  if(go == false){
  if(mouseX > 50 && mouseX < 350 && mouseY > 50 && mouseY < 350){
    nextMode();
  }
  if(mouseX > 450 && mouseX < 750 && mouseY > 450 && mouseY < 750){
    go = true;
    Go();
  }
  }
  else{
    if(floor(mouseX/s) < w && floor(mouseY/s) < h && lose == false && win == false){
    if(board[floor(mouseX/s)][floor(mouseY/s)] < 0){
      board[floor(mouseX/s)][floor(mouseY/s)] = findnumb(floor(mouseX/s),floor(mouseY/s));
      recfindnumb(floor(mouseX/s),floor(mouseY/s));
      if(findnumb(floor(mouseX/s),floor(mouseY/s)) > 0){
        ef += 1;
      }
    }
  }
  }
}
void keyPressed(){
  if(key == 't'){
    milli += 20000;
  }
  if(key == ' ' && go == true && lose == false && win == false){
    if(floor(mouseX/s) < w && floor(mouseY/s) < h){
    if(board[floor(mouseX/s)][floor(mouseY/s)] == -1){
      board[floor(mouseX/s)][floor(mouseY/s)] = -3;
      fm += 1;
    }
    else if(board[floor(mouseX/s)][floor(mouseY/s)] == -2){
      board[floor(mouseX/s)][floor(mouseY/s)] = -4;
      mf += 1;
    }
    else if(board[floor(mouseX/s)][floor(mouseY/s)] == -3){
      board[floor(mouseX/s)][floor(mouseY/s)] = -1;
      fm -= 1;
    }
    else if(board[floor(mouseX/s)][floor(mouseY/s)] == -4){
      board[floor(mouseX/s)][floor(mouseY/s)] = -2;
      mf -= 1;
    }
  }
  }
  if(key == ' ' && (lose == true || win == true)){
    go = false;
    lose = false;
    win = false;
     mf = 0;
     ef = 0;
     fm = 0;
  }
}
void nextMode(){
  boolean done = false;
  if(type == "NORMAL"){
    type = "EDGES";
    done = true;
  }
  if(type == "EDGES" && done == false){
    type = "CORNERS";
    done = true;
  }
  if(type == "CORNERS" && done == false){
    type = "KNIGHTS";
    done = true;
  }
  if(type == "KNIGHTS" && done == false){
    type = "EXTENDED";
    done = true;
  }
  if(type == "EXTENDED" && done == false){
    type = "EXT EDGES";
    done = true;
  }
  if(type == "EXT EDGES" && done == false){
    type = "EXT CORNERS";
    done = true;
  }
  if(type == "EXT CORNERS" && done == false){
    type = "OUTER";
    done = true;
  }
  if(type == "OUTER" && done == false){
    type = "NORMAL";
    done = true;
  }
}
void Go(){
  s = 800/max(w,h);
  board = new int[w][h];
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      board[i][j] = -1;
    }
  }
  for(int i = 0; i < b; i++){
    int x = floor(random(w));
    int y = floor(random(h));
    while(board[x][y] == -2){
    x = floor(random(w));
    y = floor(random(h));
    }
    board[x][y] = -2;
  }
  milli = millis();
}
void makeBoard(){
  background(128);
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      if(board[i][j] < 0){
        fill(192);
        rect((i+0.05)*s,(j+0.05)*s,s*0.9,s*0.9);
        fill(128);
        beginShape();
        vertex((i+0.04)*s,(j+0.96)*s);
        vertex((i+0.15)*s,(j+0.85)*s);
        vertex((i+0.85)*s,(j+0.85)*s);
        vertex((i+0.85)*s,(j+0.15)*s);
        vertex((i+0.96)*s,(j+0.04)*s);
        vertex((i+0.96)*s,(j+0.96)*s);
        endShape();
        fill(255);
        beginShape();
        vertex((i+0.04)*s,(j+0.96)*s);
        vertex((i+0.15)*s,(j+0.85)*s);
        vertex((i+0.15)*s,(j+0.15)*s);
        vertex((i+0.85)*s,(j+0.15)*s);
        vertex((i+0.96)*s,(j+0.04)*s);
        vertex((i+0.04)*s,(j+0.04)*s);
        endShape();
        if(board[i][j] == -3 || board[i][j] == -4){
          image(Flag,(i+0.12)*s,(j+0.05)*s,s*0.9,s*0.9);
        }
      }
      else{
        fill(192);
        rect((i+0.05)*s,(j+0.05)*s,s*0.9,s*0.9);
        
        if(board[i][j] > 0){
          numbcol(board[i][j],false);
          
          textSize(s/2);
          text(board[i][j],(i+0.3)*s,(j+0.7)*s);
        }
        if(board[i][j] == -10){
          image(Mine,(i+0.05)*s,(j+0.05)*s,s*0.9,s*0.9);
          showbombs();
        }
      }
    }
  }
}
int findnumb(int x, int y){
  int n = 0;
  if(type == "NORMAL"){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      if(x+i-1 >= 0 && y+j-1 >= 0 && x+i <= w && y+j <= h){
      if(board[x+i-1][y+j-1] == -2 || board[x+i-1][y+j-1] == -10 || board[x+i-1][y+j-1] == -4){
        if(i == 1 && j == 1){
          return(-10);
        }
        else{
          n+=1;
        }
      }
      }
    }
  }
  }
  else if(type == "EDGES"){
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h){
      if(board[x+i][y+j] == -2 || board[x+i][y+j] == -10 || board[x+i][y+j] == -4){
        if(i == 0 && j == 0){
          return(-10);
        }
        else if(abs(i) != abs(j)){
          n+=1;
        }
      }
      }
    }
  }
  }
  else if(type == "CORNERS"){
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h){
      if(board[x+i][y+j] == -2 || board[x+i][y+j] == -10 || board[x+i][y+j] == -4){
        if(i == 0 && j == 0){
          return(-10);
        }
        else if(abs(i) == abs(j)){
          n+=1;
        }
      }
      }
    }
  }
  }
  else if(type == "KNIGHTS"){
    for(int i = 1; i < 3; i++){
      int j = 3-i;
      if(x+i >= 0 && x+i < w && y+j >= 0 && y+j < h){
        if(board[x+i][y+j] == -2 || board[x+i][y+j] == -4 || board[x+i][y+j] == -10){
          n+=1;
        }
      }
      if(x-i >= 0 && x-i < w && y+j >= 0 && y+j < h){
        if(board[x-i][y+j] == -2 || board[x-i][y+j] == -4 || board[x-i][y+j] == -10){
          n+=1;
        }
      }
      if(x+i >= 0 && x+i < w && y-j >= 0 && y-j < h){
        if(board[x+i][y-j] == -2 || board[x+i][y-j] == -4 || board[x+i][y-j] == -10){
          n+=1;
        }
      }
      if(x-i >= 0 && x-i < w && y-j >= 0 && y-j < h){
        if(board[x-i][y-j] == -2 || board[x-i][y-j] == -4 || board[x-i][y-j] == -10){
          n+=1;
        }
      }
    }
    if(x >= 0 && x < w && y >= 0 && y < h){
    if(board[x][y] == -2 || board[x][y] == -4 || board[x][y] == -10){
      return(-10);
    }
    }
  }
  if(type == "EXTENDED"){
  for(int i = 0; i < 5; i++){
    for(int j = 0; j < 5; j++){
      if(x+i-2 >= 0 && y+j-2 >= 0 && x+i-1 <= w && y+j-1 <= h){
      if(board[x+i-2][y+j-2] == -2 || board[x+i-2][y+j-2] == -10 || board[x+i-2][y+j-2] == -4){
        if(i == 2 && j == 2){
          return(-10);
        }
        else{
          n+=1;
        }
      }
      }
    }
  }
  }
  if(type == "EXT EDGES"){
  for(int i = -2; i < 3; i++){
    for(int j = -2; j < 3; j++){
      if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h){
      if(board[x+i][y+j] == -2 || board[x+i][y+j] == -10 || board[x+i][y+j] == -4){
        if(i == 0 && j == 0){
          return(-10);
        }
        else if(i == 0 || j == 0){
          n+=1;
        }
      }
      }
    }
  }
  }
  if(type == "EXT CORNERS"){
  for(int i = -2; i < 3; i++){
    for(int j = -2; j < 3; j++){
      if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h){
      if(board[x+i][y+j] == -2 || board[x+i][y+j] == -10 || board[x+i][y+j] == -4){
        if(i == 0 && j == 0){
          return(-10);
        }
        else if(abs(i) == abs(j)){
          n+=1;
        }
      }
      }
    }
  }
  }
  if(type == "OUTER"){
  for(int i = -2; i < 3; i++){
    for(int j = -2; j < 3; j++){
      if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h){
      if(board[x+i][y+j] == -2 || board[x+i][y+j] == -10 || board[x+i][y+j] == -4){
        if(i == 0 && j == 0){
          return(-10);
        }
        else if(max(abs(i),abs(j)) == 2){
          n+=1;
        }
      }
      }
    }
  }
  }
  return(n);
}
void recfindnumb(int x, int y){
  if(type == "NORMAL"){
  if(findnumb(x,y) == 0){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        if((i != 1 || j!= 1) && x+i-1 >= 0 && y+j-1 >= 0 && x+i <= w && y+j <= h && board[x+i-1][y+j-1] < 0){
          ef += 1;
          board[x+i-1][y+j-1] = findnumb(x+i-1,y+j-1);
          recfindnumb(x+i-1,y+j-1);
        }
      }
    }
  }
  }
  else if(type == "EDGES"){
    if(findnumb(x,y) == 0){
    for(int i = -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        if(x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h && board[x+i][y+j] < 0 && abs(i) != abs(j)){
          ef += 1;
          board[x+i][y+j] = findnumb(x+i,y+j);
          recfindnumb(x+i,y+j);
        }
      }
    }
  }
  }
  else if(type == "CORNERS"){
    if(findnumb(x,y) == 0){
    for(int i = -1; i < 2; i++){
      for(int j = -1; j < 2; j++){
        if((i != 0 || j!= 0) && x+i >= 0 && y+j >= 0 && x+i+1 <= w && y+j+1 <= h && board[x+i][y+j] < 0 && abs(i) == abs(j)){
          ef += 1;
          board[x+i][y+j] = findnumb(x+i,y+j);
          recfindnumb(x+i,y+j);
        }
      }
    }
  }
  }
  else if(type == "KNIGHTS"){
    if(findnumb(x,y) == 0){
    for(int i = 1; i < 3; i++){
      int j = 3-i;
      if(x+i >= 0 && x+i < w && y+j >= 0 && y+j < h && board[x+i][y+j] < 0){
      ef += 1;
      board[x+i][y+j] = findnumb(x+i,y+j);
      recfindnumb(x+i,y+j);
      }
      if(x-i >= 0 && x-i < w && y+j >= 0 && y+j < h && board[x-i][y+j] < 0){
      ef += 1;
      board[x-i][y+j] = findnumb(x-i,y+j);
      recfindnumb(x-i,y-j);
      }
      if(x+i >= 0 && x+i < w && y-j >= 0 && y-j < h && board[x+i][y-j] < 0){
      ef += 1;
      board[x+i][y-j] = findnumb(x+i,y-j);
      recfindnumb(x-i,y-j);
      }
      if(x-i >= 0 && x-i < w && y-j >= 0 && y-j < h && board[x-i][y-j] < 0){
      ef += 1;
      board[x-i][y-j] = findnumb(x-i,y-j);
      recfindnumb(x-i,y-j);
      }
    }
  }
  }
  if(type == "EXTENDED"){
  if(findnumb(x,y) == 0){
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 5; j++){
        if((i != 2 || j!= 2) && x+i-2 >= 0 && y+j-2 >= 0 && x+i <= w && y+j <= h && board[x+i-2][y+j-2] < 0){
          ef += 1;
          board[x+i-2][y+j-2] = findnumb(x+i-2,y+j-2);
          recfindnumb(x+i-2,y+j-2);
        }
      }
    }
  }
  }
  else if(type == "EXT EDGES"){
    if(findnumb(x,y) == 0){
    for(int i = -2; i < 3; i++){
      for(int j = -2; j < 3; j++){
        if(x+i >= 0 && y+j >= 0 && x+i+2 <= w && y+j+2 <= h && board[x+i][y+j] < 0 && (i == 0 || j == 0)){
          ef += 1;
          board[x+i][y+j] = findnumb(x+i,y+j);
          recfindnumb(x+i,y+j);
        }
      }
    }
  }
  }
  else if(type == "EXT CORNERS"){
    if(findnumb(x,y) == 0){
    for(int i = -2; i < 3; i++){
      for(int j = -2; j < 3; j++){
        if(x+i >= 0 && y+j >= 0 && x+i+2 <= w && y+j+2 <= h && board[x+i][y+j] < 0 && abs(i) == abs(j)){
          ef += 1;
          board[x+i][y+j] = findnumb(x+i,y+j);
          recfindnumb(x+i,y+j);
        }
      }
    }
  }
  }
  else if(type == "OUTER"){
    if(findnumb(x,y) == 0){
    for(int i = -2; i < 3; i++){
      for(int j = -2; j < 3; j++){
        if(x+i >= 0 && y+j >= 0 && x+i+2 <= w && y+j+2 <= h && board[x+i][y+j] < 0 && max(abs(i),abs(j)) == 2){
          ef += 1;
          board[x+i][y+j] = findnumb(x+i,y+j);
          recfindnumb(x+i,y+j);
        }
      }
    }
  }
  }
}
void showbombs(){
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      if(board[i][j] == -2 || board[i][j] == -4){
        board[i][j] = -10;
      }
    }
  }
}
boolean checkwin(){
  boolean wi = true;
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      if(board[i][j] == -1 || board[i][j] == -3){
        wi = false;
      }
    }
  }
  if(wi == true && win == false){
    milli = millis()-milli;
  }
  return(wi);
}boolean checklose(){
  boolean lo = false;
  for(int i = 0; i < w; i++){
    for(int j = 0; j < h; j++){
      if(board[i][j] == -10){
        lo = true;
      }
    }
  }
  if(lo == true && lose == false){
    milli = millis()-milli;
  }
  return(lo);
}
void numbcol(int numb, boolean op){
  if(numb == 1){
    if(op){
      fill(0,0,255,100);
    }
    else{
      fill(0,0,255);
    }
  }
  else if(numb == 2){
    if(op){
      fill(0,128,0,100);
    }
    else{
      fill(0,128,0);
    }
  }
  else if(numb == 3){
    if(op){
    fill(255,0,0,100);
    }
    else{
      fill(255,0,0);
    }
  }
  else if(numb == 4){
    if(op){
    fill(0,0,130,100);
    }
    else{
      fill(0,0,130);
    }
  }
  else if(numb == 5){
    if(op){
    fill(131,0,0,100);
    }
    else{
      fill(131,0,0);
    }
  }
  else if(numb == 6){
    if(op){
    fill(0,128,130,100);
    }
    else{
      fill(0,128,130);
    }
  }
  else if(numb == 7){
    if(op){
    fill(0,0,0,100);
    }
    else{
      fill(0,0,0);
    }
  }
  else if(numb == 8){
    if(op){
    fill(128,128,128,100);
    }
    else{
      fill(128,128,128);
    }
  }
  else if(numb == 9){
    if(op){
    fill(256,256,0,100);
    }
    else{
      fill(256,256,0);
    }
  }
  else if(numb == 10){
    if(op){
    fill(256,128,0,100);
    }
    else{
      fill(256,128,0);
    }
  }
  else if(numb == 11){
    if(op){
    fill(128,0,256,100);
    }
    else{
      fill(128,0,256);
    }
  }
  else if(numb == 12){
    if(op){
    fill(256,0,256,100);
    }
    else{
      fill(256,0,256);
    }
  }
  else if(numb == 13){
    if(op){
    fill(256,0,256,100);
    }
    else{
      fill(256,256,256);
    }
  }
  else if(numb == 14){
    if(op){
    fill(0,256,256,100);
    }
    else{
      fill(0,256,256);
    }
  }
  else if(numb == 15){
    if(op){
    fill(0,128,256,100);
    }
    else{
      fill(0,128,256);
    }
  }
  else if(numb == 16){
    if(op){
    fill(128,128,256,100);
    }
    else{
      fill(128,128,256);
    }
  }
  else if(numb == 17){
    if(op){
    fill(255,128,256,100);
    }
    else{
      fill(255,128,256);
    }
  }
  else if(numb == 18){
    if(op){
    fill(255,128,256,100);
    }
    else{
      fill(255,128,256);
    }
  }
  else if(numb == 19){
    if(op){
    fill(128,256,0,100);
    }
    else{
      fill(128,255,0);
    }
  }
  else if(numb == 20){
    if(op){
    fill(255,255,128,100);
    }
    else{
      fill(255,255,128);
    }
  }
  else if(numb == 21){
    if(op){
    fill(128,255,128,100);
    }
    else{
      fill(128,255,128);
    }
  }
  else if(numb == 22){
    if(op){
    fill(128,0,128,100);
    }
    else{
      fill(128,0,128);
    }
  }
  else if(numb == 23){
    if(op){
    fill(128,0,0,100);
    }
    else{
      fill(128,0,0);
    }
  }
  else if(numb == 24){
    if(op){
    fill(128,0,0,100);
    }
    else{
      fill(0,128,128);
    }
  }
}