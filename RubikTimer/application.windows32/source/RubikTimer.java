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

public class RubikTimer extends PApplet {

//make a list of floating point numbers representing the solve times
FloatList times;
StringList scramble;
//make an float to keep track of the current time
float current_time;
int a1 = 5;
int a2 = 12;
int a3 = 50;
int a4 = 100;
int a5 = 500;
int a6 = 1000;
int y = 0;
int x = 0;
float ch = 5;
//make an float to keep track of the inspection time
int inspect_time;
float inspectStart;
float runningStart;
//make a string variable to keep track of the screen
String screen = "time"; // time will show your last time
boolean inspection = false; //make a boolean variable to say if inspection has started
boolean running = false;
//setup
public void setup(){
  newScramble();
  //set the size of the window to 600x600 pixels
  
  //initialize the times array
  times = new FloatList();
  current_time = 0; // set the current time to 0
  loadStuff();
}
//draw
public void draw(){
  saveStuff();
  background(51);
  if(screen == "time"){ //check if the time screen should be shown
    drawTime(); //execute the draw time function  
  }
  if(screen == "list"){
    drawList();
  }
  if(screen == "graph"){
    drawGraph();
  }
  if(screen == "chart"){
    drawChart();
  }
}
public void drawTime(){ //make a function to draw when screen is time
  textSize(18);
  fill(255);
  String sc = "";
  for(int i = 0; i < scramble.size(); i++){
    sc+=scramble.get(i)+"  ";
  }
  text(sc,10,21);
  textSize(100); //resize the text size;
  if(inspection){ //if inspection time is on..
    fill(255,0,0);
    inspect_time = floor((15000+inspectStart-millis())/1000);
    if(inspect_time <= 0){
      inspection = false;
      running = true;
      
    }
    text(inspect_time,width*3/7,height*1/5); //put the inspection time in the middle of the screen
  }
  else{ //if it's not on..
  if(running){
    fill(255);
  current_time = (-runningStart+millis())/1000;
  }
  text(current_time,width*1/5,height*1/5); //put the current time in the middle of the screen
  }
  fill(255);
  textSize(30);
  if(times.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times),3,4),width*1/20,height*1/5+50);
  }
  if(times.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times),3,4),width*1/20,height*1/5+90);
  }
  if(times.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times),3,4),width*1/20,height*1/5+130);
  }
  if(times.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times),3,4),width*1/20,height*1/5+170);
  }if(times.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times),3,4),width*1/20,height*1/5+210);
  }if(times.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times),3,4),width*1/20,height*1/5+250);
  }
}
public void drawList(){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times.size()-18)*30){
      y -= (times.size()-18)/5;
    }
  }
  for(int i = 0; i < times.size(); i++){
    textSize(20);
    text(i+":  "+times.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times.size() > 1){
  float min = times.get(0);
  for(int i = 0; i < times.size(); i++){
    if(min > times.get(i)){
      min = times.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times.size()-1,times),width*1/20,90);
  }
  if(times.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
}
public void drawGraph(){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times.size()-200){
    x -= ceil((times.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(times.get(i),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times.get(i),times.min(),times.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a1,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times,i)),times.min(),times.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a2,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times,i)),times.min(),times.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a3,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times,i)),times.min(),times.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a4,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times,i)),times.min(),times.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a5,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times,i)),times.min(),times.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times.size() < 100){
  strokeWeight(10/sqrt(times.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times.size(); i++){
    if(times.size() < 100){
    vertex(width*i/times.size(),height-(map(ao(a6,ss(times,i)),times.min(),times.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times,i)),times.min(),times.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times.size() > 1){
  text((times.min()+times.max())/2,0,height/2);
  text((times.max()-times.min())*1/4+times.min(),0,height*3/4);
  text((times.max()-times.min())*3/4+times.min(),0,height*1/4);
  }
}
public void drawChart(){
  ch = (times.max()-times.min())/10;
  int ch1 = 0;
  int ch2 = 0;
  int ch3 = 0;
  int ch4 = 0;
  int ch5 = 0;
  int ch6 = 0;
  int ch7 = 0;
  int ch8 = 0;
  int ch9 = 0;
  int ch10 = 0;
  for(int i = 0; i < times.size(); i++){
    if(times.get(i) < times.min()+ch){
      ch1 += 1;
    }
    else if(times.get(i) < times.min()+2*ch){
      ch2 += 1;
    }
    else if(times.get(i) < times.min()+3*ch){
      ch3 += 1;
    }
    else if(times.get(i) < times.min()+4*ch){
      ch4 += 1;
    }
    else if(times.get(i) < times.min()+5*ch){
      ch5 += 1;
    }
    else if(times.get(i) < times.min()+6*ch){
      ch6 += 1;
    }
    else if(times.get(i) < times.min()+7*ch){
      ch7 += 1;
    }
    else if(times.get(i) < times.min()+8*ch){
      ch8 += 1;
    }
    else if(times.get(i) < times.min()+9*ch){
      ch9 += 1;
    }
    else if(times.get(i) < times.min()+10*ch){
      ch10 += 1;
    }
  }
  int chmax = 0;
  if(ch1 > chmax){
    chmax = ch1;
  }
  if(ch2 > chmax){
    chmax = ch2;
  }
  if(ch3 > chmax){
    chmax = ch3;
  }
  if(ch4 > chmax){
    chmax = ch4;
  }
  if(ch5 > chmax){
    chmax = ch5;
  }
  if(ch6 > chmax){
    chmax = ch6;
  }
  if(ch7 > chmax){
    chmax = ch7;
  }
  if(ch8 > chmax){
    chmax = ch8;
  }
  if(ch9 > chmax){
    chmax = ch9;
  }
  if(ch1 > chmax){
    chmax = ch10;
  }
  fill(255);
  chmax *= 2;
  noStroke();
  rect(100,0*height/10,(width-80)*ch1/chmax,height/11);
  rect(100,1*height/10,(width-80)*ch2/chmax,height/11);
  rect(100,2*height/10,(width-80)*ch3/chmax,height/11);
  rect(100,3*height/10,(width-80)*ch4/chmax,height/11);
  rect(100,4*height/10,(width-80)*ch5/chmax,height/11);
  rect(100,5*height/10,(width-80)*ch6/chmax,height/11);
  rect(100,6*height/10,(width-80)*ch7/chmax,height/11);
  rect(100,7*height/10,(width-80)*ch8/chmax,height/11);
  rect(100,8*height/10,(width-80)*ch9/chmax,height/11);
  rect(100,9*height/10,(width-80)*ch10/chmax,height/11);
  for(int i = 0; i < 10; i++){
    text(round(times.min()+ch*i)+"-"+round(times.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
}
public void keyReleased(){
  if(key == ' '){
    if(running == false){
    inspection = !inspection;
    if(inspection){
      newScramble();
      inspect_time = 15;
      inspectStart = millis();
    }
    else{
      running = true;
      runningStart = millis();
    }
  }
  else{
    running = false;
    times.append(current_time);
  }
  }
  if(keyCode == RIGHT){
    if(screen == "graph"){
      screen = "chart";
    }
    if(screen == "list"){
      screen = "graph";
      x = 0;
    }
    if(screen == "time"){
      screen = "list";
      y = 0;
    }
  }
  if(keyCode == LEFT){
    if(screen == "list"){
      screen = "time";
    }
    if(screen == "graph"){
      screen = "list";
      y = 0;
    }
    if(screen == "chart"){
      screen = "graph";
      x = 0;
    }
  }
}
public float ao(int n, FloatList ts){
  float best = 0;
  float worst = 0;
  float fin = 0;
  for(int i = 0; i < n; i++){
    if(times.get(ts.size()-i-1) < best){
      best = ts.get(ts.size()-i-1);
    }
    if(times.get(times.size()-i-1) > worst){
      worst = ts.get(ts.size()-i-1);
    }
  }
  for(int i = 0; i < n; i++){
    fin += ts.get(ts.size()-i-1);
  }
  fin /= n;
  //fin /= n-2;
  return(fin);
}
public FloatList ss(FloatList list, int end){
  FloatList result = new FloatList();
  for(int i = 0; i < end; i++){
    result.append(list.get(i));
  }
  return(result);
}
public float bao(int n){
  float fin = 0;
  fin = ao(n,times);
  for(int i = 0; i < times.size()-n; i++){
    if(ao(n,ss(times,times.size()-1-i)) < fin){
      fin = ao(n,ss(times,times.size()-1-i));
    }
  }
  return(fin);
}
public void newScramble(){
  scramble = new StringList();
  int prem = 0;
  for(int i = 0; i < 20; i++){
  String ad = "";
  int move = floor(random(1,7));
  while(move == prem){
  move = floor(random(1,7));
  }
  int direction = floor(random(1,4));
  if(move == 1){
    ad+="R";
  }
  if(move == 2){
    ad+="L";
  }
  if(move == 3){
    ad+="U";
  }
  if(move == 4){
    ad+="D";
  }
  if(move == 5){
    ad+="F";
  }
  if(move == 6){
    ad+="B";
  }
  if(direction == 2){
    ad+="'";
  }
  if(direction == 3){
    ad+="2";
  }
  scramble.append(ad);
  prem = move;
  }
}
public void saveStuff(){
  JSONObject time = new JSONObject();
  for(int i = 0; i < times.size(); i++){
    time.setFloat("Solve #"+i,times.get(i));
  }
  saveJSONObject(time,"time.json");
}
public void loadStuff(){
  JSONObject time = loadJSONObject("time.json");
  for(int i = 0; i < time.size();i++){
    times.append(time.getFloat("Solve #"+i));
  }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RubikTimer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
