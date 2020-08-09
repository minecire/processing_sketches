IntList vals;
int size = 4;
int swstore1 = 0;
int swstore2 = 0;
int x = 0;
int y = 0;
int z = 1;
boolean edit = false;
String Piece = "Setup";
void setup(){
  vals = new IntList();
  size(1800,1000);
}
void draw(){
  if(Piece == "Setup"){
    background(0,0,255);
    fill(0,255,0);
    noStroke();
    rect(0,0,width,height/6);
    fill(255,0,0);
    rect(0,5*height/6,width,height/6);
    fill(0);
    text(size,50,height/12+12);
    if(mousePressed){
      if(mouseY < height/6){
        edit = true;
        size = 0;
      }
      else{
        edit = false;
        if(mouseY > 5*height/6){
          for(int i = 0; i < size*size-1; i++){
            vals.append(i+1);
          }
          vals.append(0);
          Piece = "Play";
        }
      }
    }
  }
  else{
    for(int i = 0; i < size; i++){
      for(int j = 0; j < size; j++){
        if(vals.get(i+j*size) == 0){
          noStroke();
          fill(50);
        }
        else{
          stroke(200,0,0);
          fill(100);
          strokeWeight(80/size);
        }
        rect(i*width/size,j*height/size,width/size,height/size);
        if(vals.get(i+j*size) != 0){
          fill(255);
          text(vals.get(i+j*size),(i+0.5)*width/size,(j+0.5)*height/size);
        }
      }
    }
  }
}
void keyPressed(){
  if(edit == true){
    if(key >= 48 && key < 58){
      size *= 10;
      size += key-48;
    }
  }
  else{
    if(key == '+'){
      z *= 1.1;
    }
    if(key == '-'){
      z *= 1.1;
    }
  }
}
void mousePressed(){
  if(Piece == "Play"){
    if(vals.get(floor(mouseX*size/height)+size*floor(mouseY*size/height))+1 == 0){
    swstore1 = vals.get(floor(mouseX*size/height)+size*floor(mouseY*size/height));
    swstore2 = 0;
    for(int i = 0; i < size; i++){
      for(int j = 0; j < size; j++){
        if(vals.get(i+size*j) == 0){
          swstore2 = i+size*j;
        }
      }
    }
    vals.set(floor(mouseX*size/height)+size*floor(mouseY*size/height),0);
    vals.set(swstore2,swstore1);
  }
  }
}