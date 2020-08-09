void drawbranch(int size,int x,int y,float rot){
  line(0,0,0,-size);
  translate(x,y);
  rotate(rot);
  if(size > 2){
    drawbranch(size/2,x-size/2,y+size/2,rot+PI/4);
    drawbranch(size/2,x+size/2,y+size/2,rot-PI/4);
  }
}
void setup(){
  size(1000,1000);
  drawbranch(100,500,500,0);
}