int[][] exps = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
int[][] nexps = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
int[][] nnexps = {{0,0,0,0},{0,0,0,0},{0,0,0,0},{0,0,0,0}};
boolean ch = false;
void setup(){
  for(int i = 0; i < round(random(1,4)); i++){
    exps[round(random(0,3))][round(random(0,3))] = round(random(1,3));
  }
  size(600,600);
}
void draw(){
  background(255,0,0);
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      if(exps[i][j] != 0){
        fill(exps[i][j]*20);
      }
      noStroke();
      if(exps[i][j] != 0){
        rect(i*150+10,j*150+10,130,130);
      }
      fill(0,0,255);
      if(exps[i][j] != 0){
        textSize(20);
        text(round(pow(2,exps[i][j])),i*150+20,j*150+80);
      }
    }
    fill(0,255,0);
    if(exps == nexps){
      text("hi",200,200);
    }
  }
}
void keyPressed(){
  ch = false;
  if(key == 'w'){
    for(int k = 0; k < 3; k++){
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){

        if(j > 0 && exps[i][j-1] == 0 && exps[i][j] != 0){
          ch = true;
          exps[i][j-1] = exps[i][j];
          exps[i][j] = 0;
        }
        else if(j > 0 && exps[i][j-1] == exps[i][j] && exps[i][j] != 0){
          ch = true;
          exps[i][j-1] = exps[i][j]+1;
          exps[i][j] = 0;
        }
      }
    }
    }
  }
  if(key == 's'){
    for(int k = 0; k < 3; k++){
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){

        if(j < 3 && exps[i][j+1] == 0 && exps[i][j] != 0){
          ch = true;
          exps[i][j+1] = exps[i][j];
          exps[i][j] = 0;
        }
        else if(j < 3 && exps[i][j+1] == exps[i][j] && exps[i][j] != 0){
          ch = true;
          exps[i][j+1] = exps[i][j]+1;
          exps[i][j] = 0;
        }
      }
    }
    }
  }
  if(key == 'd'){
    for(int k = 0; k < 3; k++){
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){

        if(i < 3 && exps[i+1][j] == 0 && exps[i][j] != 0){
          ch = true;
          exps[i+1][j] = exps[i][j];
          exps[i][j] = 0;
        }
        else if(i < 3 && exps[i+1][j] == exps[i][j] && exps[i][j] != 0){
          ch = true;
          exps[i+1][j] = exps[i][j]+1;
          exps[i][j] = 0;
        }
      }
    }
    }
  }
if(key == 'a'){
    for(int k = 0; k < 3; k++){
    for(int i = 0; i < 4; i++){
      for(int j = 0; j < 4; j++){

        if(i > 0 && exps[i-1][j] == 0 && exps[i][j] != 0){
          ch = true;
          exps[i-1][j] = exps[i][j];
          exps[i][j] = 0;
        }
        else if(i > 0 && exps[i-1][j] == exps[i][j] && exps[i][j] != 0){
          ch = true;
          exps[i-1][j] = exps[i][j]+1;
          exps[i][j] = 0;
        }
      }
    }
    }
  }
  if(ch){
    ch = false;
    while(!ch){
    int a = round(random(0,3));
    int b = round(random(0,3));
    if(exps[a][b] == 0){
      ch = true;
      exps[a][b] = round(random(1,2));
    }
    }
  }
}