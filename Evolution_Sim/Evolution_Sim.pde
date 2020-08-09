float[] visions = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] hearings = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] speeds = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] strengths = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] brains = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] carns = {random(-10,10), random(-10,10), random(-10,10), random(-10,10), random(-10,10)};
float[] healths = {random(1,10), random(1,10), random(1,10), random(1,10), random(1,10)};
float[] xs = {random(0,1000), random(0,1000), random(0,1000), random(0,1000), random(0,1000)};
float[] ys = {random(0,1000), random(0,1000), random(0,1000), random(0,1000), random(0,1000)};
float[] xs2 = {0,0,0,0,0};
float[] ys2 = {0,0,0,0,0};
float[] angles = {random(0,2*PI),random(0,2*PI),random(0,2*PI),random(0,2*PI),random(0,2*PI)};
float[] hungerls = {visions[0]*0.1+hearings[0]*0.1+speeds[0]*2+strengths[0]*3+brains[0]+carns[0]*0.5+healths[0]*2.5,visions[1]*0.1+hearings[1]*0.1+speeds[1]*2+strengths[1]*3+brains[1]+carns[1]*0.5+healths[1]*2.5,visions[2]*0.1+hearings[2]*0.1+speeds[2]*2+strengths[2]*3+brains[2]+carns[2]*0.5+healths[2]*2.5,visions[3]*0.1+hearings[3]*0.1+speeds[3]*2+strengths[3]*3+brains[3]+carns[3]*0.5+healths[3]*2.5,visions[4]*0.1+hearings[4]*0.1+speeds[4]*2+strengths[4]*3+brains[4]+carns[4]*0.5+healths[4]*2.5};
float[] hunger = {300,300,300,300,300};
int loopreps = 0;
int maxls = 0;
int[] lifespan = {0,0,0,0,0};
FloatList foodx;
FloatList foody;
int loop = 0;
float[] mforward(float x, float y, float angle){
  float[] answer = {x+tan(angle),y+cos(angle)};
  return(answer);
}
float tfood(float x, float y, int i){
  return(0.0);
}
void creblob(float vision, float hearing, float speed, float strength, float brain, float carn, float health, float x, float y){
  noFill();
  stroke(100,70,50);
  strokeWeight(health/4);
  fill(180,150,130);
  ellipse(x,y,strength*10,strength*10);
  strokeWeight(1);
  ellipse(x-strength*5-health/8-hearing, y, hearing*2, hearing*2);
  ellipse(x+strength*5+health/8+hearing, y, hearing*2, hearing*2);
  fill(0);
  noStroke();
  fill(0,150,255);
  ellipse(x-strength*2+health/8,y+strength*3-health/8,vision/2,vision/2);
  ellipse(x+strength*2-health/8,y+strength*3-health/8,vision/2,vision/2);
  fill(0,150,50);
  triangle(x-strength/2,y-strength*5,x+strength/2,y-strength*5,x,y-strength*5-speed);
  fill(255,100,100);
  noStroke();
  ellipse(x,y-strength*2,brain,brain);
  fill(100,0,0);
  ellipse(x,y+strength*4,strength*2,strength);
  fill(255);
  if(carn >= 0){
    triangle(x-strength/3,y+strength*3.5,x+strength/3,y+strength*3.5,x,y+strength*4);
  }
  else{
    rect(x-strength/3,y+strength*3.5,strength/1.5,strength/1.5);
  }
}
void setup(){
  size(1000,1000);
  foodx = new FloatList();
  foody = new FloatList();
  while(foodx.size() > 0){
    foodx.remove(0);
  }
  while(foody.size() > 0){
    foody.remove(0);
  }
  for(int i = 0; i < 20; i++){
  foodx.append(random(0,1000));
  foody.append(random(0,1000));
  }
  for(int i = 0; i < 5; i++){
    visions[i] = random(0,10);
    hearings[i] = random(0,10);
    speeds[i] = random(0,10);
    strengths[i] = random(0,10);
    brains[i] = random(0,10);
    carns[i] = random(-10,10);
    healths[i] = random(0,10);
    xs[i] = random(0,1000);
    ys[i] = random(0,1000);
    lifespan[i] = 0;
    hunger[i] = 300;
    hungerls[i] = visions[i]*0.1+hearings[i]*0.1+speeds[i]*2+strengths[i]*3+brains[i]+carns[i]*0.5+healths[i]*2.5;
    angles[i] = random(0,2*PI);  
  }
  loop = 0;
  loopreps = 0;
}
void draw(){
  background(0,255,0);
  for(int i = 0; i < visions.length; i++){
  if(lifespan[i] == 0){
    rotate(angles[i]);
    creblob(visions[i], hearings[i], speeds[i], strengths[i], brains[i], carns[i], healths[i], xs[i],ys[i]);
    rotate(-angles[i]);
  }
  }
  for(int i = 0; i < foodx.size(); i++){
    fill(0,100,0);
    noStroke();
    ellipse(foodx.get(i),foody.get(i),10,10);
  }
  loop+=1;
  for(int i = 0; i < 5; i++){
    if(xs[i] <= 0){
      xs[i] = 0;
      angles[i] = -angles[i]+PI/2;
    }
    if(xs[i] >= 1000){
      xs[i] = 1000;
      angles[i] = -angles[i]-PI/2;
    }
    if(ys[i] <= 0){
      ys[i] = 0;
      angles[i] = -angles[i]+PI;
    }
    if(ys[i] >= 1000){
      ys[i] = 0;
      angles[i] = -angles[i]-PI;
    }
  }
  if(loop == 50){
    hunger[0]-=hungerls[0];
    hunger[1]-=hungerls[1];
    hunger[2]-=hungerls[2];
    hunger[3]-=hungerls[3];
    hunger[4]-=hungerls[4];
    foodx.append(random(0,1000));
    foody.append(random(0,1000));
    for(int i = 0; i < hunger.length; i++){
      if(hunger[i] <= 0 && lifespan[i] == 0){
        lifespan[i] = loopreps;
      }
    }
    loopreps += 1;
    loop = 0;
  }
  fill(0);
  text(lifespan[0],20,100);
  text(lifespan[1],20,120);
  text(lifespan[2],20,140);
  text(lifespan[3],20,160);
  text(lifespan[4],20,180);
  text(maxls,20,200);
  if(lifespan[0] > 0 && lifespan[1] > 0 && lifespan[2] > 0 && lifespan[3] > 0 && lifespan[4] > 0){
    if(maxls < max(max(lifespan[0],lifespan[1],lifespan[2]),lifespan[3],lifespan[4])){
      maxls = max(max(lifespan[0],lifespan[1],lifespan[2]),lifespan[3],lifespan[4]);
    }
    setup();
  }
  for(int i = 0; i < 5; i++){
    xs2[i] = mforward(xs[i],ys[i],angles[i])[0];
    ys2[i] = mforward(xs[i],ys[i],angles[i])[1];
    xs[i] = xs2[i];
    ys[i] = ys2[i];
    for(int j = 0; j < foodx.size(); j++){
      if(xs[i]-10 > foodx.get(j) && xs[i]+10 < foodx.get(j) && ys[i]-10 > foody.get(j) && ys[i]+10 < foody.get(j)){
        foodx.remove(i);
        foody.remove(i);
        hunger[i]+=20;
      }
      if(xs[i]-10-visions[i] > foodx.get(j) && xs[i]+visions[i]+10 < foodx.get(j) && ys[i]-10-visions[i] > foody.get(j) && ys[i]+10+visions[i] < foody.get(j)){
        
      }
    }
  }
}