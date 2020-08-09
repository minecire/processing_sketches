class world{
  IntList places;
  void d(){
    translate(250,250);
    rotateX(0.5);
    rotateY(0.2);
    rotateZ(-PI/2);
    r=-1;
    for(int i = 0; i < places.size()/3; i++){
      pushMatrix();
      translate(places.get(i*3)*30,places.get(i*3+1)*30,places.get(i*3+2)*30);
      box(30);
      popMatrix();
    }
  }
  void s(IntList p){
    places = p;
  }
}