float r = 0;
int l = 0;
sponge sponge = new sponge();
void setup(){
  size(1000,1000,P3D);
  sponge.setVars(0,0,0,400);
}
void draw(){
  background(51);
  lights();
  fill(255);
  stroke(0);
  translate(width/2,height/2);
  rotateX(r);
  rotateY(r/4);
  sponge.drawSponge();
  r+=0.3;
}
void keyPressed(){
  sponge.spawnChildren();
}