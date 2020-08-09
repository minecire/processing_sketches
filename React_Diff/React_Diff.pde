float[][][] grid = new float[1000][1000][2];
float[][][] ngrid = new float[1000][1000][2];
void setup(){
  size(1000,1000);
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      grid[i][j][0] = random(1);
      grid[i][j][1] = random(1);
    }
  }
}
void draw(){
  drawgrid();
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      ngrid[i][j] = newGen(i,j);
    }
  }
  grid = ngrid;
}
float[] newGen(float x, float y){
  float[] i = {x,y};
  return(i);
}
void drawgrid(){
  for(int i = 0; i < grid.length; i++){
    for(int j = 0; j < grid[0].length; j++){
      stroke(grid[i][j][0]*255,grid[i][j][1]*255,0);
      point(i,j);
    }
  }
}