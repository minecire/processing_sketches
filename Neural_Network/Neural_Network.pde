final int lines = 20;
final int nodes = 50;

final float[][] data = 
{
  {1},
  {0.5},
  {0.8},
  {0.64}
};
final float[][] output = {
  {1},
  {1},
  {0},
  {0}
};



class node{
  FloatList paths = new FloatList();
  float value;
  void newPath(float i){
    paths.append(i);
  }
  void reset(){
    paths = new FloatList();
  }
}
class NodeLine{
  ArrayList<node> nodes = new ArrayList();
  void newNode(node i){
    nodes.add(i);
  }
  void reset(){
    nodes = new ArrayList();
  }
}
node current;
NodeLine currentLine;
ArrayList<NodeLine> network = new ArrayList();

void setup(){
  for(int j = 0; j < nodes; j++){
  for(int i = 0; i < data[0].length; i++){
    current.newPath(random(1));
  }
  currentLine.newNode(current);
  current.reset();
  }
  network.add(currentLine);
  currentLine.reset();
  for(int k = 0; k < lines; k++){
  for(int j = 0; j < nodes; j++){
  for(int i = 0; i < nodes; i++){
    current.newPath(random(1));
  }
  currentLine.newNode(current);
  current.reset();
  }
  network.add(currentLine);
  currentLine.reset();
  }
  for(int i = 0; i < output[0].length; i++){
    for(int j = 0; j < nodes; j++){
      current.newPath(random(1));
    }
    currentLine.newNode(current);
  current.reset();
  }
  network.add(currentLine);
  currentLine.reset();
}
void draw(){
  float[] input = {random(1)};
  test(input);
}
void test(float[] input){
  
}