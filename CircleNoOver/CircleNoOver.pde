FloatList Blobs;
int[] newB = {0,0,0};
void setup(){
  size(1000,1000);
  Blobs = new FloatList();
}
void draw(){
  background(0);
  fill(255,0,0);
  noStroke();
  while(overlap(newB[0],newB[1],newB[2])){
    newB[0] = round(random(0, width));
    newB[1] = round(random(0, height));
    newB[2] = round(random(1,min(width,height)/2));
  }
  Blobs.append(newB[0]);
  Blobs.append(newB[1]);
  Blobs.append(newB[2]);
  Blobs.append(newB[2]*10);
  for(int i = 0; i < Blobs.size()/4; i++){
    ellipse(Blobs.get(i*4),Blobs.get(i*4+1),Blobs.get(i*4+2),Blobs.get(i*4+2));
    Blobs.sub(i*4+3,1);
    if(Blobs.get(i*4+3) < 0){
      for(int j = 0; j < 4; j++){
      Blobs.remove(i*4);
      }
    }
  }
  /*for(int i = 0; i < Blobs.size()/3; i++){
    Blobs.mult(i*3+2,0.999);
  }
  */
  fill(255);
  text(Percalc(),500,500);
}
boolean overlap(float x, float y, float s){
  for(int i = 0; i < Blobs.size()/4; i++){
    if(abs(Blobs.get(i*4) - x)*abs(Blobs.get(i*4) - x)+abs(Blobs.get(i*4+1) - y)*abs(Blobs.get(i*4+1) - y) <= (s/2+1+Blobs.get(i*4+2)/2)*(s/2+1+Blobs.get(i*4+2)/2)){
      return(true);
    }
  }
  return(false);
}
float Percalc(){
  float P = 0;
  for(int i = 0; i < Blobs.size()/4; i++){
    P += Blobs.get(i*4+2)*Blobs.get(i*4+2)*PI;
  }
  return(P/40000.0);
}