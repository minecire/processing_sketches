IntList clix;
String style = "Color";
String clicked = "";
boolean Mac = true;
int[] col = new int[3];
void drawC(float x,float y,float r,float s,boolean mac){
  if(mac){
    stroke(255);
    fill(0);
  }
  else{
    stroke(0);
    fill(255);
  }
  strokeWeight(s);
  pushMatrix();
  translate(x,y);
  rotate(r);
  translate(-5.5*s,-8.5*s);
  beginShape();
  vertex(0,0);
  vertex(11*s,11*s);
  vertex(11*s,12*s);
  vertex(7*s,12*s);
  vertex(9*s,17*s);
  vertex(6*s,17*s);
  vertex(4*s,13*s);
  vertex(s,16*s);
  vertex(0,16*s);
  vertex(0,0);
  endShape();
  popMatrix();
 
}
void setup(){
  clix = new IntList();
  clix.append(999999999);
  col[0] = 0;
  col[1] = 0;
  col[2] = 0;
  fullScreen();
}
void draw(){
  if(style == "Color"){
  background(col[0],col[1],col[2]);
  }
  drawclix();
  if(clicked == ""){
  drawC(width/2,height/4,0,2*width/160,Mac);
  }
  else{
  drawC(width/2,height/4,0,2*width/200,Mac);
  }
  fill(255-col[0],255-col[1],255-col[2]);
}
void fixclix(){
  for(int i = 0; i < clix.size()-1;i++){
    while(clix.get(i) > 100000000){
      clix.sub(i,100000000);
      clix.add(i+1,1);
    }
  }
  if(clix.get(clix.size()-1) > 100000000){
    clix.sub(clix.size()-1,100000000);
    clix.append(1);
  }
}
void addclix(IntList amount){
  for(int i = 0; i < amount.size() && i < clix.size(); i++){
    clix.add(i,amount.get(i));
  }
  if(amount.size() > clix.size()){
    for(int i = clix.size(); i < amount.size(); i++){
      clix.append(amount.get(i));
    }
  }
  fixclix();
}
void drawclix(){
  text("Clix:",50,100);
  int w = 0;
  for(int i = 0; i < clix.size(); i++){
    if(clix.get(clix.size()-i-1) < 10000000){
      for(int j = 0; j < 7-floor(log(clix.get(clix.size()-i-1))); j++){
        text(0,100+w*8,100);
        w+=1;
      }
    }
    text(clix.get(clix.size()-i-1),100+w*8,100);
    w+=1;
    
  }
}
void mousePressed(){
  if(mouseX > 4*width/10 && mouseX < 6*width/10 && mouseY > height/10 && mouseY < height/2){
    clicked = "Cliquer";
  }
}
void mouseReleased(){
  if(clicked == "Cliquer"){
    clix.add(0,10000);
    fixclix();
  }
  clicked = "";
}