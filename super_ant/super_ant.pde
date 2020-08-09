int[][] grid = new int[2000][2000];
boolean pause = true;
boolean show = true;
boolean create = false;
int[] newR = {0,0,0};
int[] newC = {0,0,0};
int selected = 0;
IntList rules;
IntList colors;
float zoom = 5;
float x = -900;
float y = -900;
int moves = 0;
IntList ant;
void setup(){
  ant = new IntList();
  rules = new IntList();
  colors = new IntList();
  ant.append(1000);
  ant.append(1000);
  ant.append(0);
  rules.append(0);
  rules.append(1);
  rules.append(1);
  
  colors.append(255);
  colors.append(255);
  colors.append(255);
  
  colors.append(0);
  colors.append(0);
  colors.append(0);
  
  frameRate(1000);
  size(1200,1000);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j] = 0;
    }
  }
}
void draw(){
  background(100);
  if(show){
  noStroke();
  for(int i = -round(x)-1; i < grid.length && (i+x-1)*zoom < 1000; i++){
    if(i < 0){
      i = 0;
    }
    for(int j = -round(y)-1; j < grid[0].length && (j+y-1)*zoom < 1000; j++){
      if(j < 0){
        j = 0;
      }
      fill(colors.get(grid[i][j]*3),colors.get(grid[i][j]*3+1),colors.get(grid[i][j]*3+2));
      rect((i+x)*zoom,(j+y)*zoom,zoom,zoom);
    }
  }
  }
  noStroke();
  fill(255,0,0);
  for(int i = 0; i < ant.size()/3; i++){
  rect((ant.get(3*i+0)+x)*zoom+zoom/4,(ant.get(3*i+1)+y)*zoom+zoom/4,zoom/2,zoom/2);
  }
  if(!pause){
    //rep();
    move();
  }
  viewch();
  textSize(50);
  if(keyPressed && key == ' '){
    text("Moves: "+moves,400,500);
  }
  fill(100);
  stroke(50);
  rect(1000,0,200,1000);
  for(int i = 0; i < rules.size()/3; i++){
    fill(colors.get(rules.get(i*3)*3),colors.get(rules.get(i*3)*3+1),colors.get(rules.get(i*3)*3+2));
    rect(1020,200*i+100,30,30);
    fill(colors.get(rules.get(i*3+2)*3),colors.get(rules.get(i*3+2)*3+1),colors.get(rules.get(i*3+2)*3+2));
    rect(1150,200*i+100,30,30);
    if(rules.get(i*3+1) == -1 || rules.get(i*3+1) == 1){
      noFill();
      stroke(0);
      ellipse(1100,200*i+115,40,40);
    }
    if(rules.get(i*3+1) == -1){
      line(1120,200*i+115,1110,200*i+107);
      line(1120,200*i+115,1130,200*i+107);
    }
    if(rules.get(i*3+1) == 1){
      line(1120,200*i+115,1110,200*i+123);
      line(1120,200*i+115,1130,200*i+123);
    }
    if(rules.get(i*3+1) == 0){
      line(1100,200*i+130,1100,200*i+100);
      line(1100,200*i+100,1090,200*i+108);
      line(1100,200*i+100,1110,200*i+108);
    }
    if(rules.get(i*3+1) == 2){
      line(1100,200*i+130,1100,200*i+100);
      line(1100,200*i+130,1090,200*i+122);
      line(1100,200*i+130,1110,200*i+122);
    }
  }
  if(create == true){
    background(50,100,150);
    textSize(15);
    text("Old Color:",200,200);
    text("New Color:",200,220);
    fill(colors.get(newR[0]*3),colors.get(newR[0]*3+1),colors.get(newR[0]*3+2));
    rect(280,185,14,14);
    if(newR[2] > 0){
    fill(newC[0],newC[1],newC[2]);
    }
    else{
      fill(colors.get(0),colors.get(1),colors.get(2));
    }
    rect(280,205,14,14);
    if(newR[1] == -1 || newR[1] == 1){
      noFill();
      stroke(0);
      ellipse(300,200+115,40,40);
    }
    if(newR[1] == -1){
      line(320,200+115,310,200+107);
      line(320,200+115,330,200+107);
    }
    if(newR[1] == 1){
      line(320,200+115,310,200+123);
      line(320,200+115,330,200+123);
    }
    if(newR[1] == 0){
      line(300,200+130,300,200+100);
      line(300,200+100,290,200+108);
      line(300,200+100,310,200+108);
    }
    if(newR[1] == 2){
      line(300,200+130,300,200+100);
      line(300,200+130,290,200+122);
      line(300,200+130,310,200+122);
    }
    if(selected == 2 && (!keyPressed || key == 'w' || key == 's')){
    newC[0] = mouseX*255/1000;
    newC[1] = mouseY*255/1000;
    if(key == 'w'){
      newC[2] += 1;
    }
    if(key == 's'){
      newC[2] -= 1;
    }
    if(key == 49){
      newR[2] = 0;
    }
  }
  }
}
void move(){
  moves += 1;
  for(int i = 0; i < ant.size()/3; i++){
  if(grid[ant.get(i*3)][ant.get(i*3+1)] == 1){
    ant.add(i*3+2,rules.get(grid[ant.get(i*3)][ant.get(i*3+1)]+1));
  }
  else{
    ant.sub(i*3+2,1);
  }
  if(ant.get(i*3+2) < 0){
    ant.add(i*3+2,4);
  }
  if(ant.get(i*3+2) > 3){
    ant.sub(i*3+2,4);
  }
  if(ant.get(i*3+2) == 0){
    ant.sub(i*3+1,1);
  }
  if(ant.get(i*3+2) == 1){
    ant.sub(i*3+0,1);
  }
  if(ant.get(i*3+2) == 2){
    ant.add(i*3+1,1);
  }
  if(ant.get(i*3+2) == 3){
    ant.add(i*3+0,1);
  }
  grid[ant.get(i*3+0)][ant.get(i*3+1)] = rules.get(grid[ant.get(i*3+0)][ant.get(i*3+1)]*3+2);
  }
}
void viewch(){
  if(keyPressed && !create){
    if(key == '='){
      zoom *= 1.1;
    }
    if(key == '-'){
      zoom /= 1.1;
    }
    if(key == 'w'){
      y -= 35/zoom;
    }
    if(key == 'a'){
      x -= 35/zoom;
    }
    if(key == 's'){
      y += 35/zoom;
    }
    if(key == 'd'){
      x += 35/zoom;
    }
  }
}
void mousePressed(){
  if(create == false){
  ant.append(floor((mouseX)/zoom-x));
  ant.append(floor((mouseY)/zoom-y));
  ant.append(0);
  }
  else{
    if(mouseX < 400 && mouseX > 200){
      if(mouseY < 220){
        selected = 1;
      }
      else if(mouseY < 250){
        selected = 2;
      }
      else{
        selected = 3;
      }
    }
  }
}
void keyPressed(){
  if(key == 'p'){
    pause = !pause;
  }
  if(key == 'v'){
    show = !show;
  }
  if(key == 'n'){
    if(create){
      rules.append(newR[0]);
      rules.append(newR[1]);
      rules.append(newR[2]);
      colors.append(newC[0]);
      colors.append(newC[1]);
      colors.append(newC[2]);
    }
    else{
      newR[2] = colors.size()/3;
    }
    create = !create;
    selected = -1;
  }
  if(selected == 1){
    if(key == 'a'){
      newR[0]-= 1;
      if(newR[0] < 0){
        newR[0] = colors.size()/3-1;
      }
    }
    if(key == 'd'){
      newR[0]+= 1;
      if(newR[0] > colors.size()/3-1){
        newR[0] = 0;
      }
    }
  }
  else if(selected == 3){
    text("HI!",500,500);
    if(key == 'w'){
      newR[1] = 0;
    }
    if(key == 'd'){
      newR[1] = -1;
    }
    if(key == 's'){
      newR[1] = 2;
    }
    if(key == 'a'){
      newR[1] = 1;
    }
  }
}
void rep(){
  int k = ant.size()/3;
  for(int i = 0; i < k; i++){
    for(int j = 0; j < k; j++){
      if(abs(ant.get(i*3) - ant.get(j*3)) < 2 && abs(ant.get(i*3+1) - ant.get(j*3+1)) < 10 && j != i){
        ant.append(ant.get(i*3));
        ant.append(ant.get(i*3+1));
        ant.append(0);
        int r = floor(random(2));
        if(r == 0){
        ant.sub(i*3,20);
        ant.sub(i*3+1,20);
        ant.add(j*3,20);
        ant.add(j*3+1,20);
        }
        else{
          ant.add(i*3,20);
        ant.sub(i*3+1,20);
        ant.sub(j*3,20);
        ant.add(j*3+1,20);
        }
      }
    }
  }
}