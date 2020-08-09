IntList Platforms;
int[] Char = {50,450};
int[] Goal = {500,500};
int style = 0;
void setup(){
  Platforms = new IntList();
  size(600,600);
}
void draw(){
  background(100);
  if(style < 4){
  if(mousePressed){
    build();
  }
  makeWorldEdit();
  }
}
void makeWorldEdit(){
  stroke(0);
  strokeWeight(3);
  for(int i = 0; i < Platforms.size()/2; i++){
    point(Platforms.get(2*i),Platforms.get(2*i+1));
  }
  fill(0);
  stroke(0,255,0);
  strokeWeight(5);
  rect(Char[0]-5,Char[1]-10,20,20);
  fill(0,255,0);
  stroke(50);
  rect(Goal[0]-5,Goal[1]-10,20,20);
}
void build(){
  if(style == 0){
    Platforms.append(mouseX);
    Platforms.append(mouseY);
  }
  else if(style == 1){
    Char[0] = mouseX;
    Char[1] = mouseY;
  }
  else if(style == 2){
    Goal[0] = mouseX;
    Goal[1] = mouseY;
  }
}
void keyPressed(){
  if(key == 49){style = 0;}
  else if(key == 50){style = 1;}
  else if(key == 51){style = 2;}
  else if(key == ' '){style = 3;}
}