IntList els;
int sw1;
int sw2;
int s = 10;
void setup(){
  size(1024,1024);
  els = new IntList();
  for(int i = 0; i < s; i++){
    els.append(round(random(0,s)));
  }
}
void draw(){
  background(0);
  for(int i = 0; i < s; i++){
    stroke(255,255-els.get(i),255-els.get(i));
    strokeWeight(width/s);
    line(map(i,0,s,0,width),height,map(i,0,s,0,width),height-map(els.get(i),0,s,0,height));
  }
  sort(s-1);
}
void sort(int p){
  int w = 0;
  for(int i = 0; i < s; i++){
    if(els.get(i) < els.get(p)){
      sw(w,p);
      w+=1;
    }
  }
  sw(w+1,p);
}
void sw(int in1, int in2){
  sw1 = els.get(in1);
  sw2 = els.get(in2);
  els.set(in1, sw2);
  els.set(in2, sw1);
}