//favorite seeds:
/*




*/
//seed:
final int seed = 1337;
final int Complexity = 10;
float x = 0;
float y = 0;
float zoom = 1;
String Style = "Default";
FloatList points;
float bl;
float gr;
float re;
void drawFlake(){
  translate(width/2+x,height/2+y);
  for(int j = 0; j < 6; j++){
  beginShape();
  for(int i = 0; i < points.size(); i+=2){
    vertex(points.get(i)*zoom,points.get(i+1)*zoom);
  }
  vertex(points.get(0)*zoom,points.get(1)*zoom);
  endShape();
  beginShape();
  for(int i = 0; i < points.size(); i+=2){
    vertex(-(points.get(i))*zoom,points.get(i+1)*zoom);
  }
  vertex(-points.get(0)*zoom,points.get(1)*zoom);
  endShape();
  rotate(PI/3);
  }
}
void setup(){
  randomSeed(seed/2147000000);
  bl = random(255);
  gr = random(bl/2,5*bl/6);
  re = random(gr/2,5*gr/6);
  noFill();
  size(500,500);
  points = new FloatList();
  stroke(re,gr,bl);
  noFill();
  points.append(0);
  points.append(0);
  for(int i = 0; i < random(3*Complexity,60*Complexity); i++){
  float a = random(-width/2,width/2);
  float b = random(-height/2,height/2);
  while(sqrt(a*a+b*b) > min(width/2,height/2)){
    a = random(-width/2,width/2);
    b = random(-height/2,height/2);
  }
  points.append(a);
  points.append(b);
  }
}
void draw(){
  if(Style == "Default"){
  background(51);
  }
  else if(Style == "Christmas"){
    background(180,0,0);
  }
  drawFlake();
  saveFrame("saved/picture.png");
  stop();
  if(keyPressed && key == 'f'){
    if(Style == "Default"){
    fill(re,gr,bl);
    }
    else if(Style == "Christmas"){
      fill(re,bl,gr);
    }
    noStroke();
  }
  if(keyPressed && key == 's'){
    stroke(re,gr,bl);
    noFill();
  }
  if(keyPressed && key == '='){
    zoom *= 3;
  }
  if(keyPressed && key == '-'){
    zoom /= 3;
  }
  if(keyPressed && keyCode == LEFT){
    x -= 10;
  }
  if(keyPressed && keyCode == RIGHT){
    x += 10;
  }
  if(keyPressed && keyCode == UP){
    y += 10;
  }
  if(keyPressed && keyCode == DOWN){
    y -= 10;
  }
  strokeWeight(0.5);
}