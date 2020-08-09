PImage Caff_Mol;
void setup(){
  Caff_Mol = loadImage("Caffeine Image.png");
  size(1200,1200);
}
void draw(){
  background(50);
  image(Caff_Mol,300,300);
}