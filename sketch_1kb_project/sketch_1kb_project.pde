int s=0;
float a=0;
float[] e = new float[300];
boolean n = false;
void setup(){
  size(800,800);
  for(int i = 0; i < 300; i+=2){
  e[i]=(6+i);
  e[i+1]=(random(2*PI));
  }
}
void draw(){
  background(0);
  fill(255);
  textSize(50);
  text(s,375,425);
  stroke(255);
  noFill();
  for(int i = 0; i < 9; i++){
      ellipse(400,400,i*100+500,i*100+500);
  }
  fill(0);
  translate(400,400);
  rotate(a);
  noStroke();
  fill(255,0,0);
  rect(0,-270,50,50);
  rotate(-a);
  for(int i=0; i<e.length;i+=2){
      fill(0,255,255);
      rotate(e[i+1]);
      noStroke();
      fill(0,255,255);
      rect(0,-270-e[i]*50,50,50);
      rotate(-e[i+1]);
      if(n == false){
          e[i+1]+=random(0.01,0.02)*s/5+0.01;
          if(e[i+1] > 2*PI){
              e[i+1]-=2*PI;
          }
          if(e[i+1]<0){
              e[i+1]+=2*PI;
          }if(e[i]==0 && abs(e[i+1]-a)<0.3){
              n=true;}
      }
  }
  if(n==false){
      a-=random(0.01,0.02)*s/5+0.01;
      if(a>2*PI){
          a-=2*PI;
      }
      if(a<0){
          a+=2*PI;
      }
  }
}void keyPressed(){
    if(n==false){
        if(key==' '){
            s+=1;
        }
        for(int i=0; i<e.length; i+=2){
            e[i]-=1;
            if(e[i] < 0){
                e[i]=-10;
                
            }
        }
    }
}