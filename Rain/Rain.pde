IntList xs;
IntList ys;
IntList ws;
IntList hs;
IntList sps;
int den = 1;
float wind;
float xwind = 0;
void setup(){
  xs = new IntList();
  ys = new IntList();
  ws = new IntList();
  hs = new IntList();
  sps = new IntList();
  size(1500,1000);
  for(int i = 0; i < 20; i++){
    makedrop();
  }
}
void draw(){
  xwind += random(-3,3);
  if(xwind < -100){
    xwind = -100;
  }
  if(xwind > 100){
    xwind = 100;
  }
  wind = mouseX + xwind;
  background(0,50,100);
  for(int i = 0; i < random(0,den/4000); i++){
    makedrop();
  }
  stepdrop();
  checnremdrop();
  drawdrop();
  den = round(pow((-mouseY+height)/10,5));
}
void makedrop(){
  xs.append(round(random(-20000,width+20000)));
  ys.append(-100);
  ws.append(round(random(0,20)));
  hs.append(round(random(ws.get(ws.size()-1),100)));
  sps.append(hs.get(hs.size()-1)/3);
}
void stepdrop(){
  for(int i = 0; i < ys.size(); i++){
    ys.add(i,sps.get(i));
    sps.set(i, round(sps.get(i)*1.1));
    xs.add(i,(3*hs.get(i)*(round(wind)-width/2))/width);
  }
}
void checnremdrop(){
  for(int i = 0; i < ys.size(); i++){
    if(ys.get(i) > height){
      ys.remove(i);
      xs.remove(i);
      hs.remove(i);
      ws.remove(i);
      sps.remove(i);
    }
  }
}
void drawdrop(){
  noStroke();
  fill(250,50,200);
  for(int i = 0; i < ys.size(); i++){
    rect(xs.get(i),ys.get(i),ws.get(i),hs.get(i));
  }
}