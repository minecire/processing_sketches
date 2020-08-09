int score = 0;
int somethings = 0;
int times = 1;
int rep = 0;
void setup(){
  size(1000,1000);
}
void draw(){
  if(rep >= 50/(somethings+1)){
    times += 1;
    rep = 0;
  }
  rep+=1;
  background(255,0,0);
  text(score,50,50);
  noStroke();
  fill(100);
  rect(0,500,1000,500);
  textSize(50);
  text("Buy Something! 20 score!",20,750);
}
void mousePressed(){
  score+=1;
  if(mouseY > 500 && score >= 20){
    somethings+=1;
    score-=20;
  }
}
void keyPressed(){
  if(key=='a' && times > 1){
    times-=1;
  }
  else if(key == 'd'){
    times+=1;
  }
}