int button = 0;
void setup(){
  size(800,800);
}
void draw(){
  background(51);
  if(button == 0){
    fill(255,50);
    stroke(0,50);
    if(mouseX > 250 && mouseX < 550){
      if(mouseY > 300 && mouseY < 500){
        fill(255,100);
        stroke(0,100);
      }
    }
    rect(250,300,300,200);
  }
  if(button == 1){
    fill(255,50);
    stroke(0,50);
    if(sqrt((mouseX-400)*(mouseX-400)+(mouseY-400)*(mouseY-400)) < 75){
      fill(255,100);
      stroke(0,100);
    }
    ellipse(400,400,150,150);
  }
  if(button == 2){
    fill(255,50);
    stroke(0,50);
    if(mouseY < mouseX/3+350 && mouseY > mouseX/3+200-50/3){
      if(mouseX < mouseY/3+350 && mouseX > mouseY/3+200-50/3){
        fill(255,100);
        stroke(0,100);
      }
    }
    beginShape();
    vertex(350,300);
    vertex(500,350);
    vertex(450,500);
    vertex(300,450);
    vertex(350,300);
    endShape();
  }
}
void mouseReleased(){
  if(button == 0){
    if(mouseX > 250 && mouseX < 550){
      if(mouseY > 300 && mouseY < 500){
        button++;
      }
    }
  }
  else if(button == 1){
    if(sqrt((mouseX-400)*(mouseX-400)+(mouseY-400)*(mouseY-400)) < 75){
      button++;
    }
  }
  else if(button == 2){
    if(mouseY < mouseX/3+350 && mouseY > mouseX/3+200-50/3){
      if(mouseX < mouseY/3+350 && mouseX > mouseY/3+200-50/3){
        button++;
      }
    }
  }
}