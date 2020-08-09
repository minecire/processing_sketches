float m = 0;
float m2 = 0;
boolean started;
void setup(){
  started = false;
  size(1680,1024);
}
void draw(){
  background(0);
  if(started){
    m2 = millis();
  }
  fill(255);
  textSize(200);
  text((m2 - m)/1000.0,500,600);
}
void keyPressed(){
  if(started == false){
      m = millis();
      started = true;
    }
    else{
      started = false;
  }
}