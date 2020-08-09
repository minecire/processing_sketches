final float margin = 10;
final float slider_height = 8;
final color Slider_Color = color(127);
final color Background = color(51);
final color MarginColor = color(255);
final float FrameRate = 60;

float slide = 0;
boolean sliderPressed = false;
void setup(){
  fullScreen();
  frameRate(FrameRate);
  noStroke();
}
void draw(){
  background(Background);
  fill(MarginColor);
  rect(0,0,margin,height);
  rect(width-margin,0,margin,height);
  rect(0,0,width,margin);
  rect(0,height-margin,width,margin);
  rect(0,height-2*margin-slider_height,width,margin);
  fill(Slider_Color);
  rect(width/2-slider_height/2-margin/2+slide,height-margin-slider_height,slider_height+margin,slider_height);
  if(sliderPressed){
    moveSlider();
  }
}
void mousePressed(){
  if(mouseY < height-margin && mouseY > height-margin-slider_height){
    sliderPressed = true;
  }
}
void mouseReleased(){
  sliderPressed = false;
}
void moveSlider(){
  slide = ((slide+width/2)*20 + mouseX)/21 - width/2;
  if(slide+width/2 < margin + slider_height/2 + margin/2){
    slide = margin + slider_height/2 + margin/2 - width/2;
  }
  if(slide+width/2 > width-margin-slider_height/2-margin/2){
    slide = width-margin-slider_height/2-margin/2 - width/2;
  }
}