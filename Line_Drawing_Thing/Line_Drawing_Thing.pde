FloatList grid;
int[] cube = {-1,0,1,-1,1,0,-1,1,0,1,1,-1,0,-1,-1,1,0,1,-1,0,0,-1,1,0};
Float mult = sqrt(1.0/5.0);
String[] command = {"",""};
int[] move = {-1,-1};
float[] movereal = {0,0};
int num = 0;
boolean[] minus = {false,false};
boolean PUP = true;
boolean cbe = false;
void drawgrid(){
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < (grid.size()-2)/3; i++){
    if(grid.get((3*i)+2) == 1){
    line(grid.get(3*i)*20,grid.get((3*i)+1)*20,grid.get((3*i)+3)*20,grid.get((3*i)+4)*20);
    }
  }
}
void setup(){
  size(500,500);
  grid = new FloatList();
  grid.append(12);
  grid.append(12);
}
void draw(){
  background(100,100,100);
  text("Type A Command",100,100);
  text(command[0]+" "+command[1],200,200);
  if(command[0] == "Cube" && num > 0){
    text(num,264,200);
  }
  if(command[0] == "M" && move[1] >= 0){
    if(minus[0] == false){
    if(minus[1] == false){
    text(move[0]+" "+move[1],216,200);
    }
    else{
      text(move[0]+" -"+move[1],216,200);
    }
    }
    else{
      if(minus[1] == false){
    text("-"+move[0]+" "+move[1],216,200);
    }
    else{
      text("-"+move[0]+" -"+move[1],216,200);
    }
    }
  }
  else if(move[0] >= 0){
    if(minus[0] == false){
    text(move[0],216,200);
    }
    else{
      text("-"+move[0],216,200);
    }
  }
  drawgrid();
}
void keyPressed(){
  if(key == 'p'){
    command[0] = "P";
  }
  if(key == 'm'){
    command[0] = "M";
  }
  if(key == 'u' && command[0] == "P"){
    command[1] = "Up";
  }
  if(key == 'd' && command[0] == "P"){
    command[1] = "Down";
  }
  if(command[0] == "M" && key == '-'){
    if(move[0] == -1){
      minus[0] = true;
    }
    else if(move[1] == -1){
      minus[1] = true;
    }
  }
  if(key <= 57 && key >= 48 && cbe == true){
    num*=10;
      num+=key-48;
  }
  if(key == 'e' && cbe == true){
    cbe = false;
    if(grid.size() < 3){
      grid.append(1);
    }
    for(int i = 0; i < cube.length/2; i++){
    move[0] = cube[2*i]*num;
    move[1] = cube[2*i+1]*num;
    movereal[0] = mult*move[1]+move[0];
    movereal[1] = -2*mult*move[1];
    grid.append(movereal[0]+grid.get(grid.size()-3));
    grid.append(movereal[1]+grid.get(grid.size()-3));
    grid.append(grid.get(grid.size()-3));
    }
    command[0] = "";
    command[1] = "";
    move[0] = -1;
    move[1] = -1;
  }
  if(key <= 57 && key >= 48 && command[0] == "M"){
    if(move[1] == -1){
      num*=10;
      num+=key-48;
    }
  }
  if(key == 'e' && command[0] == "M"){
    if(move[0] == -1){
      move[0] = num;
    }
    else if(move[1] == -1){
      move[1] = num;
    }
    else{
      command[0] = "";
      num = 0;
      if(minus[0] == true){
        move[0] = -move[0];
      }
      if(minus[1] == true){
        move[1] = -move[1];
      }
      minus[0] = false;
      minus[1] = false;
      if(grid.size() % 3 == 0){
        movereal[0] = mult*move[1]+move[0];
        movereal[1] = mult*-2*move[1];
        grid.append(movereal[0]+grid.get(grid.size()-3));
        grid.append(movereal[1]+grid.get(grid.size()-3));
        move[0] = -1;
        move[1] = -1;
      }
      else{
        movereal[0] = mult*move[1]+move[0];
        movereal[1] = -2*mult*move[1];
        if(grid.size() >= 3){
        grid.append(grid.get(grid.size()-3));
        }
        else{
          grid.append(1);
        }
        grid.append(movereal[0]+grid.get(grid.size()-3));
        grid.append(movereal[1]+grid.get(grid.size()-3));
        move[0] = -1;
        move[1] = -1;
      }
    }
    num = 0;
  }
  if(key == 'c'){
    command[0] = "Cube";
    cbe = true;
    num = 0;
  }
    
  
  if(key == 'e' && command[0] == "P"){
    if(command[1] == "Up"){
      grid.append(0);
      command[0] = "";
      command[1] = "";
    }
    if(command[1] == "Down"){
      grid.append(1);
      command[0] = "";
      command[1] = "";
    }
  }
}