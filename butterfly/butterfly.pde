float[] xs;
float[] ys;
float linelength = 40;
void setup(){
  size(800,800);
  xs = new float[10];
  ys = new float[10];
  for(int i = 0; i < xs.length; i++){
    xs[i] = 0;
    ys[i] = i*linelength;
  }
}
void draw(){
  background(51);
  drawStuff();
  if(mousePressed){
  if(sqrt(pow(mouseX - width/2,2)+pow(mouseY - height/2,2)) < linelength*(xs.length-1)){
  xs[xs.length-1] = mouseX-width/2;
  ys[ys.length-1] = mouseY-height/2;
  
  }
  else{
    for(int i = 0; i < xs.length; i++){
      xs[i] = (mouseX - width/2) * linelength * i / sqrt(pow(mouseX - width/2,2)+pow(mouseY - height/2,2));
      ys[i] = (mouseY - width/2) * linelength * i / sqrt(pow(mouseX - width/2,2)+pow(mouseY - height/2,2));
    }
  }
}
}
void drawStuff(){
  translate(width/2,height/2);
  noFill();
  stroke(255,100);
  strokeWeight(30);
  for(int i = 0; i < xs.length-1; i++){
    line(xs[i],ys[i],xs[i+1],ys[i+1]);
  }
}