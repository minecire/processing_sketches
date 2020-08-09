IntList Path;
int curx = 0;
int cury = 0;
void setup(){
  Path = new IntList();
  Path.append(round(random(0,3)));
  size(500,500);
  frameRate(3);
}
void draw(){
  drawPath();
  Path.append(round(random(0,3)));
}
void drawPath(){
  curx = 200; cury= 200;
  for(int i = 0; i < Path.size(); i++){
  fill(50,0,255);
  noStroke();
  rect(curx,cury,20,20);
  stroke(0);
  if(Path.get(i) == 0){
    if(i == 0){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      cury+=20;
    }
    else if(Path.get(i-1) == 0){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      cury+=20;
    }
    else if(Path.get(i-1) == 1){
      line(curx+20,cury,curx+20,cury+20);
      line(curx,cury,curx+20,cury);
      cury+=20;
    }
    else if(Path.get(i-1) == 2){
      line(curx+20,cury,curx+20,cury+20);
      line(curx,cury,curx,cury+20);
      line(curx,cury,curx,cury+20);
      cury+=20;
    }
    else if(Path.get(i-1) == 3){
      line(curx,cury,curx+20,cury);
      line(curx+20,cury,curx+20,cury+20);
      cury+=20;
    }
  }
  if(Path.get(i) == 1){
    if(i == 0){
      line(curx,cury+20,curx+20,cury+20);
      line(curx,cury,curx,cury+20);
      curx+=20;
    }
    else if(Path.get(i-1) == 0){
      line(curx,cury,curx,cury+20);
      line(curx,cury+20,curx+20,cury+20);
      curx+=20;
    }
    else if(Path.get(i-1) == 1){
      line(curx,cury,curx+20,cury);
      line(curx,cury+20,curx+20,cury+20);
      curx+=20;
    }
    else if(Path.get(i-1) == 2){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury+20,curx,cury+20);
      curx+=20;
    }
    else if(Path.get(i-1) == 3){
      line(curx,cury,curx+20,cury);
      line(curx,cury,curx,cury+20);
      line(curx+20,cury+20,curx,cury+20);
      curx+=20;
    }
  }
  if(Path.get(i) == 2){
    if(i == 0){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      cury-=20;
    }
    else if(Path.get(i-1) == 0){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      cury-=20;
    }
    else if(Path.get(i-1) == 1){
      line(curx+20,cury,curx+20,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      cury-=20;
    }
    else if(Path.get(i-1) == 2){
      line(curx+20,cury,curx+20,cury+20);
      line(curx,cury,curx,cury+20);
      cury-=20;
    }
    else if(Path.get(i-1) == 3){
      line(curx,cury,curx+20,cury);
      line(curx+20,cury,curx+20,cury+20);
      cury-=20;
    }
  }
  if(Path.get(i) == 3){
    if(i == 0){
      line(curx,cury+20,curx+20,cury+20);
      line(curx,cury,curx,cury+20);
      curx-=20;
    }
    else if(Path.get(i-1) == 0){
      line(curx,cury,curx,cury+20);
      line(curx,cury+20,curx+20,cury+20);
      curx-=20;
    }
    else if(Path.get(i-1) == 1){
      line(curx,cury,curx+20,cury);
      line(curx,cury+20,curx+20,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      curx-=20;
    }
    else if(Path.get(i-1) == 2){
      line(curx,cury,curx,cury+20);
      line(curx+20,cury,curx+20,cury+20);
      curx-=20;
    }
    else if(Path.get(i-1) == 3){
      line(curx,cury,curx+20,cury);
      line(curx,cury+20,curx+20,cury+20);
      curx-=20;
    }
  }
 }
}