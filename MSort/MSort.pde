IntList vals;
IntList nv;
int k = 0;
int s;
int s1 = 0;
int s2 = 0;
int s1b = 0;
int cs = 0;
int m = 0;
boolean show = true;
void setup(){
  frameRate(1000);
  size(1000,1000);
  s = width/50;
  vals = new IntList();
  nv = new IntList();
  while(vals.size() < s){
    k = round(round(random(1,s)));
    vals.append(k);
  }
}
void draw(){
  background(255,0,0);
  if(show){
  for(int i = 0; i < vals.size(); i+=1){
    stroke(map(vals.get(i),0,s,0,255));
    strokeWeight(10);
    line(i/0.1,height,i/0.1,height-map(vals.get(i),0,s,0,height));
  }
  }
  if(cs < s-1){
  sw(cs);
  m = millis();
  fill(0);
  text(map(cs,0,s,0,100)+"% complete",50,100);
  text("Estimated Time: "+millis()/(10.0*map(cs,0,s,0,100))+" Seconds",50,120);
  }
  else{
    text("done in "+m/1000.0+" seconds",50,100);
  }
}
void sw(int p){
  if(p == 1){
   for(int i = 0; i < vals.size()/2; i++){
    if(vals.get(i*2) > vals.get(i*2+1)){
      s1 = vals.get(i*2);
      s2 = vals.get(i*2+1);
      vals.set(i*2,s2);
      vals.set(i*2+1,s1);
    }
  }
  }
  else if(p == 2){
    for(int i = 0; i < floor(vals.size()/4)-4; i++){
      for(int j = 0; j < 4; j++){
        if(vals.get(4*i+j) != -1){
          if(vals.get(4*i+j+2) != -1){
            if(vals.get(4*i+j) < vals.get(4*i+j+2)){
              nv.append(vals.get(4*i+j+2));
              vals.set(4*i*j+2,-1);
            }
            else{
              nv.append(vals.get(4*i+j));
              vals.set(4*i*j,-1);
            }
          }
          else if(vals.get(4*i*j+3) != -1){
            if(vals.get(4*i+j) < vals.get(4*i+j+3)){
              nv.append(vals.get(4*i+j+3));
              vals.set(4*i*j+3,-1);
            }
            else{
              nv.append(vals.get(4*i+j));
              vals.set(4*i*j,-1);
            }
          }
          else{
            nv.append(vals.get(4*i+j));
            vals.set(4*i*j,-1);
          }
        }
        else{
          if(vals.get(4*i+j+2) != -1){
            if(vals.get(4*i+j+1) < vals.get(4*i+j+2)){
              nv.append(vals.get(4*i+j+2));
              vals.set(4*i*j+2,-1);
            }
            else{
              nv.append(vals.get(4*i+j+1));
              vals.set(4*i*j+1,-1);
            }
          }
          else if(vals.get(4*i*j+3) != -1){
            if(vals.get(4*i+j+1) < vals.get(4*i+j+3)){
              nv.append(vals.get(4*i+j+3));
              vals.set(4*i*j+3,-1);
            }
            else{
              nv.append(vals.get(4*i+j+1));
              vals.set(4*i*j+1,-1);
            }
          }
          else{
            nv.append(vals.get(4*i+j+1));
            vals.set(4*i+j+1,-1);
          }
        }
      }
    }
  }
  cs+=1;
}
void keyPressed(){
  if(key == ' '){
    show = !show;
  }
}