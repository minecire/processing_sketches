IntList vals;
int k = 0;
int s;
int s1 = 0;
int s2 = 0;
int s1b = 0;
int cs = 0;
int m = 0;
boolean show = true;
boolean add = true;
void setup(){
  frameRate(1000);
  size(1000,1000);
  s = width*100;
  vals = new IntList();
  while(vals.size() < s){
    k = round(round(random(1,s)));
    add = true;
    /*for(int j = 0; j < vals.size(); j++){
      if(k == vals.get(j)){
        add = false;
      }
    }*/
    if(add == true){
      vals.append(k);
    }
  }
}
void draw(){
  background(255,0,0);
  if(show){
  for(int i = 0; i < vals.size(); i+=1){
    stroke(map(vals.get(i),0,s,0,255));
    strokeWeight(0.1);
    line(i/(s/width),height,i/(s/width),height-map(vals.get(i),0,s,0,height));
  }
  }
  if(cs < s-1){
  sw();
  m = millis();
  fill(0);
  text(map(cs,0,s,0,100)+"% complete",50,100);
  text("Estimated Time: "+millis()/(10.0*map(cs,0,s,0,100))+" Seconds",50,120);
  }
  else{
    text("done in "+m/1000.0+" seconds",50,100);
  }
}
void sw(){
  s1 = 0;
  s1b = 0;
  for(int i = 0; i < vals.size()-cs; i++){
    if(vals.get(i) > s1){
      s1=vals.get(i);
      s1b = i;
    }
  }
  s2 = vals.get(vals.size()-cs-1);
  vals.set(s1b,s2);
  vals.set(vals.size()-cs-1,s1);
  cs+=1;
}
void keyPressed(){
  if(key == ' '){
    show = !show;
  }
}