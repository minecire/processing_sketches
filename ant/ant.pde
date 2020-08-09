int[][][] grid = new int[200][200][200];
boolean pause = true;
boolean show = true;
float zoom = 5;
float x = 0;
float y = 0;
float z = 0;
float a = 0;
int moves = 0;
IntList ant;
void setup(){
  ant = new IntList();
  ant.append(100);
  ant.append(100);
  ant.append(100);
  ant.append(0);
  ant.append(0);
  frameRate(1000);
  size(1000,1000, P3D);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      for(int k = 0; k < grid[0][0].length; k++){
        grid[i][j][k] = 0;
      }
    }
  }
}
void draw(){
  a += 0.01;
  background(180);
  if(show){
  noStroke();
  pushMatrix();
  translate(500,500,500);
  rotateX(a);
  rotateY(2*a);
  rotateZ(a/2);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      for(int k = 0; k < grid[0][0].length; k++){
      if(grid[i][j][k] == 1){
        pushMatrix();
        translate(i*zoom+x-500,j*zoom+y-500,k*zoom+z-500);
        fill(0,160);
        box(zoom);
        popMatrix();
      }
      else if(grid[i][j][k] == 2){
        pushMatrix();
        translate(i*zoom+x-500,j*zoom+y-500,k*zoom+z-500);
        fill(0,200,100,160);
        box(zoom);
        popMatrix();
        
      }
    }
    }
  }
  popMatrix();
  }
  else{
    background(255);
  }
  fill(255,0,0);
  for(int i = 0; i < ant.size()/5; i++){
  pushMatrix();
  translate(500,500,500);
  rotateX(a);
  rotateY(2*a);
  rotateZ(a/2);
  translate((ant.get(5*i+0)+x)*zoom-500,(ant.get(5*i+1)+y)*zoom-500,(ant.get(5*i+2)+z)*zoom-500);

  box(zoom);
  popMatrix();  
}
  if(!pause){
    move();
  }
  viewch();
  textSize(50);
  if(keyPressed && key == ' '){
    text("Moves: "+moves,400,500);
  }
}
void move(){
  moves += 1;
  for(int i = 0; i < ant.size()/5; i++){
  if(grid[ant.get(i*5)][ant.get(i*5+1)][ant.get(i*5+2)] == 1){
    ant.add(i*5+3,1);
    ant.sub(i*5+4,1);
  }
  else if(grid[ant.get(i*5)][ant.get(i*5+1)][ant.get(i*5+2)] == 0){
    ant.sub(i*5+3,1);
    ant.add(i*5+4,1);
  }
  else if(grid[ant.get(i*5)][ant.get(i*5+1)][ant.get(i*5+2)] == 2){
    ant.add(i*5+3,1);
    ant.add(i*5+4,1);
  }
  if(ant.get(i*5+3) < 0){
    ant.add(i*5+3,4);
  }
  if(ant.get(i*5+3) > 3){
    ant.sub(i*5+3,4);
  }
  if(ant.get(i*5+4) < 0){
    ant.add(i*5+4,4);
  }
  if(ant.get(i*5+4) > 3){
    ant.sub(i*5+4,4);
  }
  if(ant.get(i*3+3) == 0){
    ant.sub(i*5+1,1);
  }
  if(ant.get(i*5+3) == 1){
    ant.sub(i*5+0,1);
  }
  if(ant.get(i*5+3) == 2){
    ant.add(i*5+1,1);
  }
  if(ant.get(i*5+3) == 3){
    ant.add(i*5+0,1);
  }
  if(ant.get(i*5+4) == 0){
    ant.sub(i*5+2,1);
  }
  if(ant.get(i*5+4) == 1){
    ant.sub(i*5+1,1);
  }
  if(ant.get(i*5+4) == 2){
    ant.add(i*5+2,1);
  }
  if(ant.get(i*5+4) == 3){
    ant.add(i*5+1,1);
  }
  grid[ant.get(i*3+0)][ant.get(i*3+1)][ant.get(i*3+2)] = (grid[ant.get(i*3+0)][ant.get(i*3+1)][ant.get(i*3+2)]+1)%3;
  }
}
void viewch(){
  if(keyPressed){
    if(key == '='){
      zoom *= 1.1;
    }
    if(key == '-'){
      zoom /= 1.1;
    }
    if(key == 'w'){
      y -= 6/zoom;
    }
    if(key == 'a'){
      x -= 6/zoom;
    }
    if(key == 's'){
      y += 6/zoom;
    }
    if(key == 'd'){
      x += 6/zoom;
    }
    if(key == 'q'){
      z += 6/zoom;
    }
    if(key == 'e'){
      z -= 6/zoom;
    }
  }
}
void mousePressed(){
  ant.append(floor(mouseX/zoom+x));
  ant.append(floor(mouseY/zoom+y));
  ant.append(floor((mouseX+mouseY)/(2*zoom)+z));
  ant.append(0);
}
void keyPressed(){
  if(key == 'p'){
    pause = !pause;
  }
  if(key == 'v'){
    show = !show;
  }
}