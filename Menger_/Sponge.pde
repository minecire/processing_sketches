class sponge{
  float x;
  float y;
  float z;
  float size;
  ArrayList<sponge> children;
  void drawSponge(){
    if(children.isEmpty()){
      pushMatrix();
      translate(x,y,z);
      noStroke();
      fill(150);
      
      box(size);
      popMatrix();
    }
    else{
      for(int i = 0; i < children.size(); i++){
        children.get(i).drawSponge();
      }
    }
  }
  void setVars(float newx,float newy,float newz,float newsize){
    x = newx;
    y = newy;
    z = newz;
    size = newsize;
    children = new ArrayList();
  }
  void spawnChildren(){
    if(children.isEmpty()){
    for(int l = -1; l < 2; l++){
      for(int j = -1; j < 2; j++){
        for(int k = -1; k < 2; k++){
          sponge s = new sponge();
          s.setVars(x+l*size/3,y+j*size/3,z+k*size/3,size/3);
          if((l != 0 || j != 0) && (k != 0 || j != 0) && (l != 0 || k != 0)){
            children.add(s);
          }
        }
      }
    }
    }
    else{
      for(int i = 0; i < children.size(); i++){
        children.get(i).spawnChildren();
      }
    }
    
  }
}