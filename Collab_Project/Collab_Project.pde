FloatList[] networks = new FloatList[100];
String place = "Beginning";
void setup(){
  //Set the size
  size(1000,1000);
  for(int i = 0; i < networks.length; i++){
   networks[i] = new FloatList();
  }
}
void draw(){
  //Set the background color
  if(place == "Beginning"){
    background(0);
    noFill();
    stroke(255,0,0);
    if(mouseX > 250 && mouseX < 750 && mouseY > 100 && mouseY < 450){
      fill(255,0,0);
    }
    rect(250,100,500,350);
    noFill();
    if(mouseX > 250 && mouseX < 750 && mouseY > 550 && mouseY < 900){
      fill(255,0,0);
    }
    rect(250,550,500,350);
    textSize(100);
    fill(255,0,0);
    if(mouseX > 250 && mouseX < 750 && mouseY > 100 && mouseY < 450){
      fill(0);
    }
    text("Game",350,300);
    textSize(70);
    fill(255,0,0);
    if(mouseX > 250 && mouseX < 750 && mouseY > 550 && mouseY < 900){
      fill(0);
    }
    text("Simulation",320,730);
  }
  if(place == "game"){
   background(50);
  }
  if(place == "simulation"){
   background(255);
}
}
void mousePressed(){
 if(place == "Beginning"){
  if(mouseY < 450){
   place = "game";
  }
  else{
   place = "simulation";
  }
 }
}