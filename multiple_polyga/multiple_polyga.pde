IntList x;
IntList y;
IntList sep;
void setup(){
  size(500,500);
  x = new IntList();
  y = new IntList();
  sep = new IntList();
}
void draw(){
  background(51);
  fill(255,50);
  stroke(255,100);
  beginShape();
  for(int i = 0; i < x.size(); i++){
    vertex(x.get(i),y.get(i));
    for(int j = 0; j < sep.size(); j++){
    if(i == sep.get(j)){
      if(j > 0){
        vertex(x.get(sep.get(j-1)+1),y.get(sep.get(j-1)+1));
      }
      else{
        vertex(x.get(0), y.get(0));
      }
      endShape();
      beginShape();
    }
    }
  }
  if(sep.size() > 0){
        vertex(x.get(sep.get(sep.size()-1)+1),y.get(sep.get(sep.size()-1)+1));
      }
      else if(x.size() > 0){
        vertex(x.get(0), y.get(0));
      }
  endShape();
}
void mousePressed(){
  x.append(mouseX);
  y.append(mouseY); 
}
void keyPressed(){
  sep.append(x.size()-1);
}