int[] rule1 = {30,60,30,90,30,50};
float[] rule2 = {round(random(0,100)),round(random(0,100)),round(random(0,100)),round(random(0,100))};
float zoom = 0.5;
int[] xy = {0,0};
IntList draws;
boolean backtostart = false;
int repetitions = 0;
int angledeg = 0;
float angle = 0;
void patternUnit(float[] rl, int x, int y){
  for(int i = 0; i < rl.length/2; i++){
    x+=(rl[2*i]*cos(angle));
    y+=(rl[2*i]*sin(angle));
    angledeg+=rl[2*i+1];
    angle = angledeg*2*PI/360;
    draws.append(x);
    draws.append(y);
  }
}
void drawgrid(){
  background(50);
  stroke(255);
  strokeWeight(1);
  for(int i = 0; i < (draws.size()-2)/2; i++){
    line(xy[0]+(draws.get(2*i)*1/zoom)+400,xy[1]+(draws.get((2*i)+1)*1/zoom)+400,xy[0]+(draws.get((2*i)+2)*1/zoom)+400,xy[1]+(draws.get((2*i)+3)*1/zoom)+400);
  }
}
void setup(){
  frameRate(1000);
  draws = new IntList();
  draws.append(0);
  draws.append(0);
  size(800,800);
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
      xy[0]/=1.05;
      xy[1]/=1.05;
    }
    if(key == '='){
      zoom/=1.05;
      xy[0]*=1.05;
      xy[1]*=1.05;
    }
    if(key == 'w'){
      xy[1] += 30;
    }
    if(key == 's'){
      xy[1] -= 30;
    }
    if(key == 'a'){
      xy[0] += 30;
    }
    if(key == 'd'){
      xy[0] -= 30;
    }
  }
}