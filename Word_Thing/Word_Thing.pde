StringList words;
String Phase = "Begin";
boolean chL = false;
void setup(){
  words = new StringList();
  size(800,600);
}
void draw(){
  if(Phase == "Begin"){
    begDraw();
  }
}