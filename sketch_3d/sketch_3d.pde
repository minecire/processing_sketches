float a = 0;
float b = 0;
float c = 0;
int[][][] colors = {{{1,1,1},{1,1,1},{1,1,1}},{{1,1,1},{1,1,1},{1,1,1}},{{1,1,1},{1,1,1},{1,1,1}},{{1,1,1},{1,1,1},{1,1,1}},{{1,1,1},{1,1,1},{1,1,1}},{{1,1,1},{1,1,1},{1,1,1}}};
void setup(){
  size(400,400,P3D);
}
void draw(){
  background(0);
  stroke(255);
  noStroke();
  translate((width/2)-66,(height/2)-66,-500);
  rotateX(a);
  rotateY(b);
  rotateZ(c);
  for(int i = 0; i < 2; i++){
    translate(198,-66);
    for(int j = 0; j < 2; j++){
      translate(-66,0,198);
      for(int k = 0; k < 2; k++){
        if(colors[i][j][k] == 1){
          fill(255);
        }
        else if(colors[i][j][k] == 2){
          fill(255,0,0);
        }
        else if(colors[i][j][k] == 3){
          fill(0,255,0);
        }
        else if(colors[i][j][k] == 4){
          fill(0,0,255);
        }
        else if(colors[i][j][k] == 5){
          fill(255,255,0);
        }
        else if(colors[i][j][k] == 6){
          fill(255,100,0);
        }
        translate(0,0,-66);
        box(10);
      }
    }
  }
  if(keyPressed){
    if(key == 'y'){
      a+=0.1;
    }
    if(key == 'j'){
      b+=0.1;
    }
    if(key == 'h'){
      a-=0.1;
    }
    if(key == 'g'){
      b-=0.1;
    }
    if(key == 't'){
      c+=0.1;
    }
    if(key == 'u'){
      c-=0.1;
    }
    if(key == 'w'){
      
    }
  }
}