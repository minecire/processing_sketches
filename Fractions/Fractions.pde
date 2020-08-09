int num = 0;
int den = 0;
int current = 0;
void setup(){
  size(600,600);
}
void draw(){
  background(0);
  fill(255);
  ellipse(300,300,400,400);
  stroke(0);
  fill(0);
  text(num,300,300);
  translate(300,300);
  for(int i = 1; i <= den; i++){
    for(int j = 0; j < 40000/den; j++){
    rotate(2*PI/(40000/den));
    line(0,0,0,-200);
    if(i <= num){
      stroke(255,0,0);
    }
    else{
      stroke(255);
    }
    }
  }
}
void keyPressed(){
  if(key >= 48 && key <= 57){
    current*=10;
    current+=key-48;
  }
  if(key == 'e'){
    if(num == 0){
      num = current;
    }
    else{
      den = current;
    }
    current = 0;
  }
}