boolean[][] Grid = new boolean[200][200];
boolean[][] NewGrid = new boolean[200][200];
Float zoom = 100.0;
int outp = 0;
Float[] coords = {0.0,0.0};
void setup(){
  size(600,600);
  for(int i = 0; i < 200; i++){
    for(int j = 0; j < 200; j++){
      float k = random(0,1);
      if(round(k) == 0){
        Grid[i][j] = false;
      }
      else{
        Grid[i][j] = true;
      }
    }
  }
}
void draw(){
  for(int i = 0; i < 200; i++){
    for(int j = 0; j < 200; j++){
      if(Grid[i][j]){
        fill(255);
      }
      else{
        fill(0);
      }
      rect(i*zoom-coords[0],j*zoom-coords[1],i*zoom+zoom-coords[0],j*zoom+zoom-coords[1]);
    }
  }
  if(keyPressed){
    if(key == '-' && zoom < 200){
      zoom *= 0.75;
    }
    if(key == '=' && zoom > 1){
      zoom /= 0.75;
    }
    if(key == 'w'){
      coords[1]-=zoom/2;
    }
    if(key == 's'){
      coords[1]+=zoom/2;
    }
    if(key == 'a'){
      coords[0]-=zoom/2;
    }
    if(key == 'd'){
      coords[0]+=zoom/2;
    }
    if(key == ' '){
      iterate();
    }
  }
}
void iterate(){
  for(int i = 0; i < 200; i++){
    for(int j = 0; j < 200; j++){
      outp = 0;
      if(i > 0 && j > 0 && Grid[i-1][j-1] == true){
        outp += 1;
      }
      if(j > 0 && Grid[i][j-1] == true){
        outp += 1;
      }
      if(i < 199 && j > 0 && Grid[i+1][j-1] == true){
        outp += 1;
      }
      if(i > 0 && Grid[i-1][j] == true){
        outp += 1;
      }
      if(i < 199 && Grid[i+1][j] == true){
        outp += 1;
      }
      if(i > 0 && j < 199 && Grid[i-1][j+1] == true){
        outp += 1;
      }
      if(j < 199 && Grid[i][j+1] == true){
        outp += 1;
      }
      if(i < 199 && j < 199 && Grid[i+1][j+1] == true){
        outp += 1;
      }
      if(Grid[i][j] == false){
        if(outp == 3){
          NewGrid[i][j] = true;
        }
        else{
          NewGrid[i][j] = false;
        }
      }
      if(Grid[i][j] == true){
        if(outp <= 3 && outp >= 2){
          NewGrid[i][j] = true;
        }
        else{
          NewGrid[i][j] = false;
        }
      }
    }
  }
  Grid = NewGrid;
}
void mousePressed(){
  if(Grid[mouseX/3][mouseY/3]){
    Grid[mouseX/3][mouseY/3] = false;
  }
  else{
    Grid[mouseX/3][mouseY/3] = true;
  }
}