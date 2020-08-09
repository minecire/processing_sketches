double[] z = {0,0,0,0};
double ztot = 0;
int tries = 0;
int x = 0;
int y = 0;
int nm = 0;
long maxtr = 100;
int detail = 1000;
double[] pos = {0,0,1};
void setup(){
  frameRate(1000);
  size(1000,1000);
}
void draw(){
  loadPixels();
  int t = 0;
  while(nm > millis()-200 || t < 100){
  t++;
  if(x < detail){
    x+=1;
  }
  else{
    x = 0;
    y+=1;
  }
  float n = 1000/detail;
  //((x/detail)*1000)
  fillp(pos[2]*x*n/250.0-2*pos[2]+pos[0],pos[2]*y*n/250.0-2*pos[2]+pos[1],x*n,y*n);
  }
  nm = millis();
  fill(128);
  text(maxtr,200,200);
  if(mousePressed){
    pos[0] += map(mouseX,0,1000,-500,500)*(pos[2]/250);
    pos[1] += map(mouseY,0,1000,-500,500)*(pos[2]/250);
    pos[2] /= 3;
    x = 0;
    y = 0;
    maxtr *= 2;
  }
  if(keyPressed){
    if(key == '='){
      pos[2] /= 3;
      x = 0;
      y = 0;
      maxtr *= 2;
    }
    if(key == '-'){
      pos[2] *= 3;
      x = 0;
      y = 0;
      maxtr /= 2;
    }
    if(key == 'w'){
      pos[1] += 0.1*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 's'){
      pos[1] -= 0.1*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 'a'){
      pos[0] -= 0.1*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 'd'){
      pos[0] += 0.1*pos[2];
      x = 0;
      y = 0;
    }
  }
}
void fillp(double xs,double ys, float xs2, float ys2){
  z[0] = xs;
  z[1] = ys;
  tries = 1;
  ztot = xs*xs+ys*ys;
  stroke(0);
  while(ztot < 4 && tries < maxtr){
    z[2] = z[0]*z[0]-z[1]*z[1]+xs;
    z[3] = z[0]*z[1]*2+ys;
    z[0] = z[2];
    z[1] = z[3];
    tries+=1;
    ztot = z[0]*z[0]+z[1]*z[1];
  }
  if(ztot >= 4){
    if(tries %1200 < 200){
      stroke(tries%1200,tries%1200/2,100-tries%1200/2);
    }
    else if(tries % 1200 < 400){
      stroke(400-tries%1200,tries%1200/2,0);
    }
    else if(tries % 1200 < 600){
      stroke(tries%200-400,200-tries%200-400,0);
    }
    else if(tries % 1200 < 800){
      stroke(tries%1200-545,55,255);
    }
    else if(tries % 1200 < 1000){
      stroke(255,55,255-tries%1200+745);
    }
    else{
      stroke(255-tries%1200+945,55,55);
    }
  }
  strokeWeight(1000/detail);
  point(xs2,ys2);
}