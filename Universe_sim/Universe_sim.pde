float seed = 0.12346;
float speed = 0.001;
float gravity = 10000;
FloatList points;
void setup(){
  noStroke();
  points = new FloatList();
  fullScreen();
  randomSeed(round(seed*2147000000));
  for(int i = 0; i < random(100,200); i++){
    points.append(random(0,width));
    points.append(random(0,height));
    points.append(random(0.0000001,5));
    points.append(random(-20*points.get(i+2),20*points.get(i+2)));
    points.append(random(-20*points.get(i+2),20*points.get(i+2)));
  }
  for(int i = 0; i < random(1,50); i++){
    points.append(random(0,width));
    points.append(random(0,height));
    points.append(random(10,40));
    points.append(random(-20*points.get(points.size()-1),20*points.get(points.size()-1)));
    points.append(random(-20*points.get(points.size()-2),20*points.get(points.size()-2)));
  }
}
void draw(){
  background(51);
  fill(255);
  for(int i = 0; i < points.size(); i+=5){
    if(points.get(i+2) < 10){
      fill(255,0,0);
    ellipse(points.get(i),points.get(i+1),points.get(i+2),points.get(i+2));
    }
    else{
      fill(0);
      ellipse(points.get(i),points.get(i+1),points.get(i+2),points.get(i+2));
    }
  }
  for(int i = 0; i < speed*10000; i++){
    move();
  }
  text(points.get(0),200,200);
  text(points.get(1),200,250);
  if(keyPressed){
    if(keyCode == UP){
      speed *= 1.1;
    }
    if(keyCode == DOWN){
      speed /= 1.1;
    }
  }
}
void move(){
  FloatList newPoints = new FloatList();
  for(int i = 0; i < points.size(); i+= 5){
    float xv = points.get(i+3);
    float yv = points.get(i+4);
    for(int j = 0; j < points.size(); j += 5){
      if(i != j){
        float dx = points.get(j)-points.get(i);
        float dy = points.get(j+1)-points.get(i+1);
        float dis = dx*dx + dy*dy;
        dis = sqrt(dis);
        if(dis != 0){
          xv += (points.get(j+2)*(points.get(j)-points.get(i))*10*gravity/(dis*points.get(i+2)));
          yv += (points.get(j+2)*(points.get(j+1)-points.get(i+1))*10*gravity/(dis*points.get(i+2)));
        }
    }
    }
    xv *= 0.99999999;
    yv *=  0.99999999;
    newPoints.append(points.get(i));
    newPoints.append(points.get(i+1));
    newPoints.append(points.get(i+2));
    newPoints.append(xv);
    newPoints.append(yv);
  }
  points = newPoints;
  
  for(int i = 0; i < points.size(); i+=5){
    points.add(i,points.get(i+3)/200000000);
    if(points.get(i) > width){
      points.mult(i+3,-1);
      points.add(i,points.get(i+3)/200000000);
    }
    if(points.get(i) < 0){
      points.mult(i+3,-1);
      points.add(i,points.get(i+3)/200000000);
    }
    points.add(i+1,points.get(i+4)/200000000);
    if(points.get(i+1) > height){
      points.mult(i+4,-1);
      points.add(i+1,points.get(i+4)/200000000);
    }
    if(points.get(i+1) < 0){
      points.mult(i+4,-1);
      points.add(i+1,points.get(i+4)/200000000);
    }
  }
}