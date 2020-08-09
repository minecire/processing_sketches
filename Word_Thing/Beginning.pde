
void begDraw(){
  background(50);
  fill(0);
  rect(0,0,width,height/6);
  fill(255);
  textSize(50);
  text("Create A New Word!",50,height/12+25);
}
void begstats(){
  int wsize = 0;
  background(50);
  fill(0);
  rect(0,0,width,height/6);
  fill(255);
  textSize(50);
  text("Word Length:"+wsize,50,height/12+25);
}
void keyPressed(){
  if(Phase == "begSt" && chL == true){
    
  }
}