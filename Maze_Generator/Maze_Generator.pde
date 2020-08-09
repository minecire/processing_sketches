boolean[][][] Cells = new boolean[100][100][4];
int[] Bug = {Cells.length/2,Cells.length/2,0,0};
void setup(){
  size(1000,1000);
  for(int i = 0; i < Cells.length; i++){
    for(int j = 0; j < Cells[0].length; j++){
      for(int k = 0; k < 4; k++){
        Cells[i][j][k] = false;
      }
    }
  }
}
void draw(){
  drawgrid();
  mBug(floor(random(4)));
}
void drawgrid(){
  for(int i = 0; i < Cells.length; i++){
    for(int j = 0; j < Cells[0].length; j++){
      noStroke();
      fill(255,0,0);
      rect(map(i,0,Cells.length,0,width),map(j,0,Cells[0].length,0,height),width/Cells.length,height/Cells[0].length);
      stroke(0);
      if(Cells[i][j][0] == true){
        line(map(i,0,Cells.length,0,width),map(j,0,Cells[0].length,0,height),map(i,0,Cells.length,0,width)+width/Cells.length,map(j,0,Cells[0].length,0,height));
      }
      if(Cells[i][j][1] == true){
        line(map(i,0,Cells.length,0,width)+width/Cells.length,map(j,0,Cells[0].length,0,height),map(i,0,Cells.length,0,width)+width/Cells.length,map(j,0,Cells[0].length,0,height)+height/Cells[0].length);
      }
      if(Cells[i][j][2] == true){
        line(map(i,0,Cells.length,0,width),map(j,0,Cells[0].length,0,height)+height/Cells[0].length,map(i,0,Cells.length,0,width)+width/Cells.length,map(j,0,Cells[0].length,0,height)+height/Cells[0].length);
      }
      if(Cells[i][j][3] == true){
        line(map(i,0,Cells.length,0,width),map(j,0,Cells[0].length,0,height),map(i,0,Cells.length,0,width),map(j,0,Cells[0].length,0,height)+height/Cells[0].length);
      }
    }
  }
}