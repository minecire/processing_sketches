int[] colors = {0,0,0};
int which = 1;
int digit = 0;
int y = 0;
int tenpow(int x){
  y = 1;
  for(int i = 0; i < x; i++){
    y*=10;
  }
  return(y);
}
void setup(){
  size(400,400);
}
void draw(){
  if(which < 4){
  background(0,0,0);
  }
  else{
     background(colors[0], colors[1], colors[2]);
     text("r: "+colors[0],200,200);
     text("g: "+colors[1],200,220);
     text("b: "+colors[2],200,240);
  }
  if(which == 1){
  text("Type In Red Content",50,200);
  text(colors[0],50,220);
  }
  if(which == 2){
  text("Type In Green Content",50,200);
  text(colors[1],50,220);
  }
  if(which == 3){
  text("Type In Blue Content",50,200);
  text(colors[2],50,220);
  }
}
void keyPressed(){
  if(key == 10){
    which += 1;
    digit = 0;
  }
  if(key <= 57 && key >= 48){
  if(which == 1){
  colors[0] += ((key-48)*tenpow(digit));
  }
  if(which == 2){
  colors[1] += ((key-48)*tenpow(digit));
  }
  if(which == 3){
  colors[2] += ((key-48)*tenpow(digit));
  }
  
  digit+=1;
  }
}