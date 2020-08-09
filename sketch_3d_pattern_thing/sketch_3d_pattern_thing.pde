int[] rule1 = {30,60,30,90,30,50};
float[] rule2 = {round(random(0,100)),round(random(0,100)),round(random(0,100)),round(random(0,100)),round(random(0,100)),round(random(0,100))};
float zoom = 0.5;
int[] xyz = {0,0,0};
IntList draws;
boolean backtostart = false;
int repetitions = 0;
int angledeg1 = 0;
int angledeg2 = 0;
float rotatex = 0;
float rotatey = 0;
float rotatez = 0;
float angle1 = 0;
float angle2 = 0;
void patternUnit(float[] rl, int x, int y){
  for(int i = 0; i < rl.length/2; i++){
    x+=(rl[2*i]*cos(angle1));
    y+=(rl[2*i]*sin(angle1));
    angledeg1+=rl[2*i+1];
    angle1 = angledeg1*2*PI/360;
    draws.append(x);
    draws.append(y);
  }
}
void drawgrid(){
  background(50);
  stroke(255);
  strokeWeight(1*zoom);
  translate(400,400);
  rotateX(rotatex);
  rotateY(rotatey);
  rotateZ(rotatez);
  translate(-400,-400);
  for(int i = 0; i < (draws.size()-2)/2; i++){
    line(xyz[0]+(draws.get(2*i)*1/zoom)+400,xyz[1]+(draws.get((2*i)+1)*1/zoom)+400,0,xyz[0]+(draws.get((2*i)+2)*1/zoom)+400,xyz[1]+(draws.get((2*i)+3)*1/zoom)+400,0);
    stroke(255);
    strokeWeight(1);
    noFill();
  }
}
void setup(){
  frameRate(1000);
  draws = new IntList();
  draws.append(0);
  draws.append(0);
  size(800,800,P3D);
}
void draw(){
  if(backtostart == false){
    patternUnit(rule2, draws.get(draws.size()-2),draws.get(draws.size()-1));
    repetitions+=1;
    if(draws.get(draws.size()-1) == draws.get(1) && draws.get(draws.size()-2) == draws.get(0)){
      backtostart = true;
    }
  }
  drawgrid();
  if(backtostart == true){
    text("It Took "+repetitions+" Repetitions To Return To The Original Position.",400,300); 
  }
  if(keyPressed){
    if(key == '-'){
      zoom*=1.05;
      xyz[0]/=1.05;
      xyz[1]/=1.05;
    }
    if(key == '='){
      zoom/=1.05;
      xyz[0]*=1.05;
      xyz[1]*=1.05;
    }
    if(key == 'w'){
      xyz[1] += 30;
    }
    if(key == 's'){
      xyz[1] -= 30;
    }
    if(key == 'a'){
      xyz[0] += 30;
    }
    if(key == 'd'){
      xyz[0] -= 30;
    }
    if(key == 'z'){
      rotatex+=0.1;
    }
    if(key == 'x'){
      rotatey+=0.1;
    }
    if(key == 'c'){
      rotatez+=0.1;
    }
    
  }
}