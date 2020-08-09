FloatList grid;
IntList tcolors;
float[] pcoords = {0,0};
int pangle = 0;
int pl = 0;
float pml = 1;
int[] coords = {0,0};
int angle = 0;
int l = 0;
float ml = 1;
void sqp(float x,float y,float w){
  rect(floor(x-w/2),floor(y-w/2),w+1,w+1);
}
void setup(){
  frameRate(10000);
  size(1200,1000);
  grid = new FloatList();
  tcolors = new IntList();
}
void draw(){
  for(int i = 0; i < ((grid.size()*1.1)+2)/2; i++){
  grid.append(map(noise(pcoords[0],pcoords[1]),0,1,0,255));
  tcolors.append(round(map(noise(pcoords[0],pcoords[1],1),0,1,0,255)));
  tcolors.append(round(map(noise(pcoords[0],pcoords[1],2),0,1,0,255)));
  if(pangle == 0){
    pcoords[0] += 0.001;
  }
  if(pangle == 1){
    pcoords[1] -= 0.001;
  }
  if(pangle == 2){
    pcoords[0] -= 0.001;
  }
  if(pangle == 3){
    pcoords[1] += 0.001;
  }
  pl += 1;
  if(pl >= floor(pml)){
    pangle = (pangle+1)%4;
    pml += 0.5;
    pl = 0;
  }
}
  l = 0;
  angle = 0;
  ml = 1;
  coords[0] = (width-200)/2;
  coords[1] = height/2;
  for(int i = 0; i < grid.size(); i++){
    fill(grid.get(i),tcolors.get(2*i),tcolors.get(2*i+1));
    noStroke();
    sqp(((coords[0]-(width-200)/2)*(width-200)/floor(sqrt(grid.size())))+(width-200)/2,((coords[1]-height/2)*height/floor(sqrt(grid.size())))+height/2,(width-200)/sqrt(grid.size()));
    if(angle == 0){
    coords[0] += 1;
  }
  if(angle == 1){
    coords[1] -= 1;
  }
  if(angle == 2){
    coords[0] -= 1;
  }
  if(angle == 3){
    coords[1] += 1;
  }
  l += 1;
  if(l >= floor(ml)){
    angle = (angle+1)%4;
    ml += 0.5;
    l = 0;
  }
  }
  fill(100);
  noStroke();
  rect(1000,0,200,1000);
}