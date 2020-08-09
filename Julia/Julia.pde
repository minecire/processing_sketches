double[] z = {0,0,0,0};
double ztot = 0;
int tries = 0;
int x = 0;
int y = 0;
float xj = 0;
float yj = 0;
double[] pos = {0,0,1};
void setup(){
  frameRate(1000);
  size(1000,1000);
}
void draw(){
  for(int i = 0; i < 10000; i++){
  if(x < 1000){
    x+=1;
  }
  else{
    x = 0;
    y+=1;
  }
  fillp(pos[2]*x/250.0-2*pos[2]+pos[0],pos[2]*y/250.0-2*pos[2]+pos[1],x,y);
  }
  if(keyPressed){
    if(key == '='){
      pos[0] += (mouseX-500)*(pos[2]/500);
      pos[1] += (mouseY-500)*(pos[2]/500);
      pos[2] /= 1.2;
      x = 0;
      y = 0;
    }
    if(key == '-'){
      pos[2] *= 1.2;
      x = 0;
      y = 0;
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
    if(key == 'i'){
      xj+=0.01;
      x = 0;
      y = 0;
    }
    if(key == 'k'){
      xj-=0.01;
      x = 0;
      y = 0;
    }
    if(key == 'j'){
      yj+=0.01;
      x = 0;
      y = 0;
    }
    if(key == 'l'){
      yj-=0.01;
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
  while(ztot < 4 && tries < 100/pos[2]){
    z[2] = z[0]*z[0]-z[1]*z[1]+xj;
    z[3] = z[0]*z[1]*2+yj;
    z[0] = z[2];
    z[1] = z[3];
    tries+=1;
    ztot = z[0]*z[0]+z[1]*z[1];
  }
  if(ztot >= 4){
    if(tries%30 == 0){
      stroke(0,0,255);
    }
    if(tries%30 == 1){
      stroke(0,50,255);
    }
    if(tries%30 == 2){
      stroke(0,100,255);
    }
    if(tries%30 == 3){
      stroke(0,150,255);
    }
    if(tries%30 == 4){
      stroke(0,200,255);
    }
    if(tries%30 == 5){
      stroke(0,255,255);
    }
    if(tries%30 == 6){
      stroke(0,255,200);
    }
    if(tries%30 == 7){
      stroke(0,255,150);
    }
    if(tries%30 == 8){
      stroke(0,255,100);
    }
    if(tries%30 == 9){
      stroke(0,255,50);
    }
    if(tries%30 == 10){
      stroke(0,255,0);
    }
    if(tries%30 == 11){
      stroke(50,255,0);
    }
    if(tries%30 == 12){
      stroke(100,255,0);
    }
    if(tries%30 == 13){
      stroke(150,255,0);
    }
    if(tries%30 == 14){
      stroke(200,255,0);
    }
    if(tries%30 == 15){
      stroke(255,255,0);
    }
    if(tries%30 == 16){
      stroke(255,200,0);
    }
    if(tries%30 == 17){
      stroke(255,150,0);
    }
    if(tries%30 == 18){
      stroke(255,100,0);
    }
    if(tries%30 == 19){
      stroke(255,50,0);
    }
    if(tries%30 == 20){
      stroke(255,0,0);
    }
    if(tries%30 == 21){
      stroke(255,0,50);
    }
    if(tries%30 == 22){
      stroke(255,0,100);
    }
    if(tries%30 == 23){
      stroke(255,0,150);
    }
    if(tries%30 == 24){
      stroke(255,0,200);
    }
    if(tries%30 == 25){
      stroke(255,0,255);
    }
    if(tries%30 == 26){
      stroke(200,0,255);
    }
    if(tries%30 == 27){
      stroke(150,0,255);
    }
    if(tries%30 == 28){
      stroke(100,0,255);
    }
    if(tries%30 == 29){
      stroke(50,0,255);
    }
  }
  point(xs2,ys2);
}