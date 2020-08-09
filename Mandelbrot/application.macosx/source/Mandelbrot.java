import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Mandelbrot extends PApplet {

double[] z = {0,0,0,0};
double ztot = 0;
int tries = 0;
int x = 0;
int y = 0;
float[] pos = {0,0,1};
public void setup(){
  frameRate(1000);
  
}
public void draw(){
  for(int i = 0; i < 12800; i++){
  if(x < 1000){
    x+=1;
  }
  else{
    x = 0;
    y+=1;
  }
  fillp(pos[2]*x/250.0f-2*pos[2]+pos[0],pos[2]*y/250.0f-2*pos[2]+pos[1],x,y);
  }
  if(keyPressed){
    if(key == '='){
      pos[0] += (mouseX-500)*(pos[2]/500);
      pos[1] += (mouseY-500)*(pos[2]/500);
      pos[2] /= 1.2f;
      x = 0;
      y = 0;
    }
    if(key == '-'){
      pos[2] *= 1.2f;
      x = 0;
      y = 0;
    }
    if(key == 'w'){
      pos[1] += 0.1f*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 's'){
      pos[1] -= 0.1f*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 'a'){
      pos[0] -= 0.1f*pos[2];
      x = 0;
      y = 0;
    }
    if(key == 'd'){
      pos[0] += 0.1f*pos[2];
      x = 0;
      y = 0;
    }
  }
}
public void fillp(float xs,float ys, float xs2, float ys2){
  z[0] = xs;
  z[1] = ys;
  tries = 1;
  ztot = xs*xs+ys*ys;
  stroke(0);
  while(ztot < 4 && tries < 100/pos[2]){
    z[2] = z[0]*z[0]-z[1]*z[1]+xs;
    z[3] = z[0]*z[1]*2+ys;
    z[0] = z[2];
    z[1] = z[3];
    tries+=1;
    ztot = z[0]*z[0]+z[1]*z[1];
  }
  if(ztot >= 4){
    if(tries%30 == 0){
      stroke(0,0,255);
    }
    if(tries%30 == 1){
      stroke(0,50,255);
    }
    if(tries%30 == 2){
      stroke(0,100,255);
    }
    if(tries%30 == 3){
      stroke(0,150,255);
    }
    if(tries%30 == 4){
      stroke(0,200,255);
    }
    if(tries%30 == 5){
      stroke(0,255,255);
    }
    if(tries%30 == 6){
      stroke(0,255,200);
    }
    if(tries%30 == 7){
      stroke(0,255,150);
    }
    if(tries%30 == 8){
      stroke(0,255,100);
    }
    if(tries%30 == 9){
      stroke(0,255,50);
    }
    if(tries%30 == 10){
      stroke(0,255,0);
    }
    if(tries%30 == 11){
      stroke(50,255,0);
    }
    if(tries%30 == 12){
      stroke(100,255,0);
    }
    if(tries%30 == 13){
      stroke(150,255,0);
    }
    if(tries%30 == 14){
      stroke(200,255,0);
    }
    if(tries%30 == 15){
      stroke(255,255,0);
    }
    if(tries%30 == 16){
      stroke(255,200,0);
    }
    if(tries%30 == 17){
      stroke(255,150,0);
    }
    if(tries%30 == 18){
      stroke(255,100,0);
    }
    if(tries%30 == 19){
      stroke(255,50,0);
    }
    if(tries%30 == 20){
      stroke(255,0,0);
    }
    if(tries%30 == 21){
      stroke(255,0,50);
    }
    if(tries%30 == 22){
      stroke(255,0,100);
    }
    if(tries%30 == 23){
      stroke(255,0,150);
    }
    if(tries%30 == 24){
      stroke(255,0,200);
    }
    if(tries%30 == 25){
      stroke(255,0,255);
    }
    if(tries%30 == 26){
      stroke(200,0,255);
    }
    if(tries%30 == 27){
      stroke(150,0,255);
    }
    if(tries%30 == 28){
      stroke(100,0,255);
    }
    if(tries%30 == 29){
      stroke(50,0,255);
    }
  }
  point(xs2,ys2);
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Mandelbrot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
