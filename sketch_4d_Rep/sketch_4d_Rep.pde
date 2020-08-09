float i = 0;
float m = 0;
float n = 0;
boolean f = false;
void setup(){
  noFill();
  stroke(255);
  size(1000,1000,P3D);
}
void draw(){
  background(0);
  i += 0.005;
  if(f == false){
  n += 1;
  if(n >= 150){
    f = true;
  }
  }
  if(f == true){
  n -= 1;
  if(n <= 0){
    f = false;
  }
  }
  if(n < 70){
  m = 0.01*n*n;
  }
  else{
  float n2 = -n;
  m = -0.01*n2*n2;
  }
  text(m,200,200);
  translate(500,500,500);
  rotateX(i); 
  rotateY(-3*i); 
  rotateZ(i*i/5);
  stroke(255);
  box(100);
  stroke(255,0,0);
  line(0,0,0,-50,-50,-50);
  line(100,0,0,50,-50,-50);
  line(0,100,0,-50,50,-50);
  line(0,0,100,-50,-50,50);
  line(100,100,100,50,50,50);
  line(0,100,100,-50,50,50);
  line(100,0,100,50,-50,50);
  line(100,100,0,50,50,-50);
  translate((m%100)-50,(m%100)-50,(m%100)-50);
  stroke(0,255,0);
  box(abs(((m%100-50)))+50);
}