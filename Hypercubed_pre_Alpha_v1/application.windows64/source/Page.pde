class page{
  int num;
  int size;
  void drawStuff(){
  for(int i = 0; i < 5; i++){
      for(int j = 0; j < 4; j++){
        if(i+j*5 < size){
        if(num * 20 + i+j*5 <= completed){
          fill(255,50);
          stroke(0,50);
          if((mouseX > i*width/5.5+width/20) && (mouseY > j*height/4.5+height/20) && (mouseX < width/6+i*width/5.5+width/20) && (mouseY < height/5+j*height/4.5+height/20)){
            fill(255,100);
            stroke(0,150);
          }
        }
        else{
          fill(0,50);
          stroke(255,50);
        }
        rect(i*width/5.5+width/20,j*height/4.5+height/20,width/6,height/5);
        fill(0);
        textSize(20);
        text(num*20+i+j*5+1,i*width/5.5+width/8,j*height/4.5+height/8);
        if(levels.get(i+j*5+num*20).time > 0){
        text(levels.get(i+j*5+num*20).time/1000.0,i*width/5.5+width/8,j*height/4.5+height/5);
        }
        }
      }
  }
  }
  void setNum(int n){
    num = n;
  }
  void setSize(int s){
    size = s;
  }
  void checkClick(){
  if(mousePressed){
    for(int i = 0; i < 5; i++){
      for(int j = 0; j < 4; j++){
        if(i+j*5 < size){
        if(mouseX > i*width/5.5+width/20 && mouseY > j*height/4.5+height/20 && mouseX < width/6+i*width/5.5+width/20 && mouseY < height/5+j*height/4.5+height/20){
          lnum = i+j*5+num*20;
          if(lnum <= completed){
          pages = false;
          if(lnum >= completed){
            completed = lnum+1;
          }
          stime = millis();
          cnum = 0;
        }
        }
        }
      }
  }
  }
  }
}