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

public class RubikTimer__Version_1_1_ALPHA_ extends PApplet {

//make a list of floating point numbers representing the solve times
FloatList times2;
FloatList times3;
FloatList times4;
FloatList times5;
FloatList times6;
FloatList times7;
FloatList times8;
FloatList times9;
FloatList times10;
FloatList times11;
FloatList times13;
FloatList timesPy;
FloatList timesSk;
FloatList timesMm;
FloatList timesCl;
FloatList timesMag;
FloatList timesMpy;
FloatList timesPpy;
FloatList timesGm;
FloatList timesTm;
FloatList timesPm;
StringList scramble;
String puzzle = "3x3";
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
  times2 = new FloatList();
  times3 = new FloatList();
  times4 = new FloatList();
  times5 = new FloatList();
  times6 = new FloatList();
  times7 = new FloatList();
  times8 = new FloatList();
  times9 = new FloatList();
  times10 = new FloatList();
  times11 = new FloatList();
  times13 = new FloatList();
  timesPy = new FloatList();
  timesSk = new FloatList();
  timesMm = new FloatList();
  timesCl = new FloatList();
  timesMag = new FloatList();
  timesMpy = new FloatList();
  timesPpy = new FloatList();
  timesGm = new FloatList();
  timesTm = new FloatList();
  timesPm = new FloatList();
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
  if(puzzle == "2x2"){
    textSize(25);
  }
  if(puzzle == "3x3"){
  textSize(18);
  }
  if(puzzle == "4x4"){
    textSize(10);
  }
  if(puzzle == "5x5"){
    textSize(10);
  }
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
  if(puzzle == "2x2"){
  if(times2.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times2),3,4),width*1/20,height*1/5+50);
  }
  if(times2.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times2),3,4),width*1/20,height*1/5+90);
  }
  if(times2.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times2),3,4),width*1/20,height*1/5+130);
  }
  if(times2.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times2),3,4),width*1/20,height*1/5+170);
  }if(times2.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times2),3,4),width*1/20,height*1/5+210);
  }if(times2.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times2),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "3x3"){
  if(times3.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times3),3,4),width*1/20,height*1/5+50);
  }
  if(times3.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times3),3,4),width*1/20,height*1/5+90);
  }
  if(times3.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times3),3,4),width*1/20,height*1/5+130);
  }
  if(times3.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times3),3,4),width*1/20,height*1/5+170);
  }if(times3.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times3),3,4),width*1/20,height*1/5+210);
  }if(times3.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times3),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "4x4"){
  if(times4.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times4),3,4),width*1/20,height*1/5+50);
  }
  if(times4.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times4),3,4),width*1/20,height*1/5+90);
  }
  if(times4.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times4),3,4),width*1/20,height*1/5+130);
  }
  if(times4.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times4),3,4),width*1/20,height*1/5+170);
  }if(times4.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times4),3,4),width*1/20,height*1/5+210);
  }if(times4.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times4),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "5x5"){
  if(times5.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times5),3,4),width*1/20,height*1/5+50);
  }
  if(times5.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times5),3,4),width*1/20,height*1/5+90);
  }
  if(times5.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times5),3,4),width*1/20,height*1/5+130);
  }
  if(times5.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times5),3,4),width*1/20,height*1/5+170);
  }if(times5.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times5),3,4),width*1/20,height*1/5+210);
  }if(times5.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times5),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "6x6"){
  if(times6.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times6),3,4),width*1/20,height*1/5+50);
  }
  if(times6.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times6),3,4),width*1/20,height*1/5+90);
  }
  if(times6.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times6),3,4),width*1/20,height*1/5+130);
  }
  if(times6.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times6),3,4),width*1/20,height*1/5+170);
  }if(times6.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times6),3,4),width*1/20,height*1/5+210);
  }if(times6.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times6),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "7x7"){
  if(times7.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times7),3,4),width*1/20,height*1/5+50);
  }
  if(times7.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times7),3,4),width*1/20,height*1/5+90);
  }
  if(times7.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times7),3,4),width*1/20,height*1/5+130);
  }
  if(times7.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times7),3,4),width*1/20,height*1/5+170);
  }if(times7.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times7),3,4),width*1/20,height*1/5+210);
  }if(times7.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times7),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "8x8"){
  if(times8.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times8),3,4),width*1/20,height*1/5+50);
  }
  if(times8.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times8),3,4),width*1/20,height*1/5+90);
  }
  if(times8.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times8),3,4),width*1/20,height*1/5+130);
  }
  if(times8.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times8),3,4),width*1/20,height*1/5+170);
  }if(times8.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times8),3,4),width*1/20,height*1/5+210);
  }if(times8.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times8),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "9x9"){
  if(times9.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times9),3,4),width*1/20,height*1/5+50);
  }
  if(times9.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times9),3,4),width*1/20,height*1/5+90);
  }
  if(times9.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times9),3,4),width*1/20,height*1/5+130);
  }
  if(times9.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times9),3,4),width*1/20,height*1/5+170);
  }if(times9.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times9),3,4),width*1/20,height*1/5+210);
  }if(times9.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times9),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "10x10"){
  if(times10.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times10),3,4),width*1/20,height*1/5+50);
  }
  if(times10.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times10),3,4),width*1/20,height*1/5+90);
  }
  if(times10.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times10),3,4),width*1/20,height*1/5+130);
  }
  if(times10.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times10),3,4),width*1/20,height*1/5+170);
  }if(times10.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times10),3,4),width*1/20,height*1/5+210);
  }if(times10.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times10),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "11x11"){
  if(times11.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times11),3,4),width*1/20,height*1/5+50);
  }
  if(times11.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times11),3,4),width*1/20,height*1/5+90);
  }
  if(times11.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times11),3,4),width*1/20,height*1/5+130);
  }
  if(times11.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times11),3,4),width*1/20,height*1/5+170);
  }if(times11.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times11),3,4),width*1/20,height*1/5+210);
  }if(times11.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times11),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "13x13"){
  if(times13.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,times13),3,4),width*1/20,height*1/5+50);
  }
  if(times13.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,times13),3,4),width*1/20,height*1/5+90);
  }
  if(times13.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,times13),3,4),width*1/20,height*1/5+130);
  }
  if(times13.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,times13),3,4),width*1/20,height*1/5+170);
  }if(times13.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,times13),3,4),width*1/20,height*1/5+210);
  }if(times13.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,times13),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Pyraminx"){
  if(timesPy.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesPy),3,4),width*1/20,height*1/5+50);
  }
  if(timesPy.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesPy),3,4),width*1/20,height*1/5+90);
  }
  if(timesPy.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesPy),3,4),width*1/20,height*1/5+130);
  }
  if(timesPy.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesPy),3,4),width*1/20,height*1/5+170);
  }if(timesPy.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesPy),3,4),width*1/20,height*1/5+210);
  }if(timesPy.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesPy),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Skewb"){
  if(timesSk.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesSk),3,4),width*1/20,height*1/5+50);
  }
  if(timesSk.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesSk),3,4),width*1/20,height*1/5+90);
  }
  if(timesSk.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesSk),3,4),width*1/20,height*1/5+130);
  }
  if(timesSk.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesSk),3,4),width*1/20,height*1/5+170);
  }if(timesSk.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesSk),3,4),width*1/20,height*1/5+210);
  }if(timesSk.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesSk),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Megaminx"){
  if(timesMm.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesMm),3,4),width*1/20,height*1/5+50);
  }
  if(timesMm.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesMm),3,4),width*1/20,height*1/5+90);
  }
  if(timesMm.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesMm),3,4),width*1/20,height*1/5+130);
  }
  if(timesMm.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesMm),3,4),width*1/20,height*1/5+170);
  }if(timesMm.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesMm),3,4),width*1/20,height*1/5+210);
  }if(timesMm.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesMm),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Clock"){
  if(timesCl.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesCl),3,4),width*1/20,height*1/5+50);
  }
  if(timesCl.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesCl),3,4),width*1/20,height*1/5+90);
  }
  if(timesCl.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesCl),3,4),width*1/20,height*1/5+130);
  }
  if(timesCl.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesCl),3,4),width*1/20,height*1/5+170);
  }if(timesCl.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesCl),3,4),width*1/20,height*1/5+210);
  }if(timesCl.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesCl),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Magic"){
  if(timesMag.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesMag),3,4),width*1/20,height*1/5+50);
  }
  if(timesMag.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesMag),3,4),width*1/20,height*1/5+90);
  }
  if(timesMag.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesMag),3,4),width*1/20,height*1/5+130);
  }
  if(timesMag.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesMag),3,4),width*1/20,height*1/5+170);
  }if(timesMag.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesMag),3,4),width*1/20,height*1/5+210);
  }if(timesMag.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesMag),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Master Pyraminx"){
  if(timesMpy.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesMpy),3,4),width*1/20,height*1/5+50);
  }
  if(timesMpy.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesMpy),3,4),width*1/20,height*1/5+90);
  }
  if(timesMpy.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesMpy),3,4),width*1/20,height*1/5+130);
  }
  if(timesMpy.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesMpy),3,4),width*1/20,height*1/5+170);
  }if(timesMpy.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesMpy),3,4),width*1/20,height*1/5+210);
  }if(timesMpy.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesMpy),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Professor Pyraminx"){
  if(timesPpy.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesPpy),3,4),width*1/20,height*1/5+50);
  }
  if(timesPpy.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesPpy),3,4),width*1/20,height*1/5+90);
  }
  if(timesPpy.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesPpy),3,4),width*1/20,height*1/5+130);
  }
  if(timesPpy.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesPpy),3,4),width*1/20,height*1/5+170);
  }if(timesPpy.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesPpy),3,4),width*1/20,height*1/5+210);
  }if(timesPpy.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesPpy),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Gigaminx"){
  if(timesGm.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesGm),3,4),width*1/20,height*1/5+50);
  }
  if(timesGm.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesGm),3,4),width*1/20,height*1/5+90);
  }
  if(timesGm.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesGm),3,4),width*1/20,height*1/5+130);
  }
  if(timesGm.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesGm),3,4),width*1/20,height*1/5+170);
  }if(timesGm.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesGm),3,4),width*1/20,height*1/5+210);
  }if(timesGm.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesGm),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Teraminx"){
  if(timesTm.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesTm),3,4),width*1/20,height*1/5+50);
  }
  if(timesTm.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesTm),3,4),width*1/20,height*1/5+90);
  }
  if(timesTm.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesTm),3,4),width*1/20,height*1/5+130);
  }
  if(timesTm.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesTm),3,4),width*1/20,height*1/5+170);
  }if(timesTm.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesTm),3,4),width*1/20,height*1/5+210);
  }if(timesTm.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesTm),3,4),width*1/20,height*1/5+250);
  }
  }
  if(puzzle == "Petaminx"){
  if(timesPm.size() >= a1){
  text("average of "+a1+" :"+nf(ao(a1,timesPm),3,4),width*1/20,height*1/5+50);
  }
  if(timesPm.size() >= a2){
  text("average of "+a2+" :"+nf(ao(a2,timesPm),3,4),width*1/20,height*1/5+90);
  }
  if(timesPm.size() >= a3){
  text("average of "+a3+" :"+nf(ao(a3,timesPm),3,4),width*1/20,height*1/5+130);
  }
  if(timesPm.size() >= a4){
  text("average of "+a4+" :"+nf(ao(a4,timesPm),3,4),width*1/20,height*1/5+170);
  }if(timesPm.size() >= a5){
  text("average of "+a5+" :"+nf(ao(a5,timesPm),3,4),width*1/20,height*1/5+210);
  }if(timesPm.size() >= a6){
  text("average of "+a6+" :"+nf(ao(a6,timesPm),3,4),width*1/20,height*1/5+250);
  }
  }
  fill(255,50);
  stroke(255,120);
  triangle(width/6,5*height/6,width/6+30,5*height/6+30,width/6+30,5*height/6-30);
  triangle(5*width/6,5*height/6,5*width/6-30,5*height/6+30,5*width/6-30,5*height/6-30);
  fill(255);
  text(puzzle,width/6+31,5*height/6+15);
  
  
}
public void drawList(){
  if(puzzle == "2x2"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times2.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times2.size()-18)*30){
      y -= (times2.size()-18)/5;
    }
  }
  for(int i = 0; i < times2.size(); i++){
    textSize(20);
    text(i+":  "+times2.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times2.size() > 1){
  float min = times2.get(0);
  for(int i = 0; i < times2.size(); i++){
    if(min > times2.get(i)){
      min = times2.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times2.size()-1,times2),width*1/20,90);
  }
  if(times2.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times2),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times2.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times2),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times2.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times2),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times2.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times2),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times2.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times2),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times2.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times2),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "3x3"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times2.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times3.size()-18)*30){
      y -= (times3.size()-18)/5;
    }
  }
  for(int i = 0; i < times3.size(); i++){
    textSize(20);
    text(i+":  "+times3.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times3.size() > 1){
  float min = times3.get(0);
  for(int i = 0; i < times3.size(); i++){
    if(min > times3.get(i)){
      min = times3.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times3.size()-1,times3),width*1/20,90);
  }
  if(times2.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times3),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times2.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times3),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times2.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times3),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times2.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times3),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times2.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times3),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times2.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times3),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "4x4"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times4.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times4.size()-18)*30){
      y -= (times4.size()-18)/5;
    }
  }
  for(int i = 0; i < times4.size(); i++){
    textSize(20);
    text(i+":  "+times4.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times4.size() > 1){
  float min = times4.get(0);
  for(int i = 0; i < times4.size(); i++){
    if(min > times4.get(i)){
      min = times4.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times4.size()-1,times4),width*1/20,90);
  }
  if(times4.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times4),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times4.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times4),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times4.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times4),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times4.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times4),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times4.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times4),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times4.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times4),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "5x5"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times5.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times5.size()-18)*30){
      y -= (times5.size()-18)/5;
    }
  }
  for(int i = 0; i < times5.size(); i++){
    textSize(20);
    text(i+":  "+times5.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times5.size() > 1){
  float min = times5.get(0);
  for(int i = 0; i < times5.size(); i++){
    if(min > times5.get(i)){
      min = times5.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times5.size()-1,times5),width*1/20,90);
  }
  if(times5.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times5),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times5.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times5),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times5.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times5),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times5.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times5),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times5.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times5),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times5.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times5),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "6x6"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times6.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times6.size()-18)*30){
      y -= (times6.size()-18)/5;
    }
  }
  for(int i = 0; i < times6.size(); i++){
    textSize(20);
    text(i+":  "+times6.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times6.size() > 1){
  float min = times6.get(0);
  for(int i = 0; i < times6.size(); i++){
    if(min > times6.get(i)){
      min = times6.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times6.size()-1,times6),width*1/20,90);
  }
  if(times6.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times6),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times6.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times6),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times6.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times6),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times6.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times6),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times6.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times6),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times6.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times6),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "7x7"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times7.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times7.size()-18)*30){
      y -= (times7.size()-18)/5;
    }
  }
  for(int i = 0; i < times7.size(); i++){
    textSize(20);
    text(i+":  "+times7.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times7.size() > 1){
  float min = times7.get(0);
  for(int i = 0; i < times7.size(); i++){
    if(min > times7.get(i)){
      min = times7.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times7.size()-1,times7),width*1/20,90);
  }
  if(times7.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times7),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times7.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times7),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times7.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times7),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times7.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times7),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times7.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times7),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times7.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times7),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "8x8"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times8.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times8.size()-18)*30){
      y -= (times8.size()-18)/5;
    }
  }
  for(int i = 0; i < times8.size(); i++){
    textSize(20);
    text(i+":  "+times8.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times8.size() > 1){
  float min = times8.get(0);
  for(int i = 0; i < times8.size(); i++){
    if(min > times8.get(i)){
      min = times8.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times8.size()-1,times8),width*1/20,90);
  }
  if(times8.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times8),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times8.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times8),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times8.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times8),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times8.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times8),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times8.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times8),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times8.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times8),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "9x9"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times9.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times9.size()-18)*30){
      y -= (times9.size()-18)/5;
    }
  }
  for(int i = 0; i < times9.size(); i++){
    textSize(20);
    text(i+":  "+times9.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times9.size() > 1){
  float min = times9.get(0);
  for(int i = 0; i < times9.size(); i++){
    if(min > times9.get(i)){
      min = times9.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times9.size()-1,times9),width*1/20,90);
  }
  if(times9.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times9),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times9.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times9),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times9.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times9),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times9.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times9),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times9.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times9),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times9.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times9),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "10x10"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times10.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times10.size()-18)*30){
      y -= (times10.size()-18)/5;
    }
  }
  for(int i = 0; i < times10.size(); i++){
    textSize(20);
    text(i+":  "+times10.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times10.size() > 1){
  float min = times10.get(0);
  for(int i = 0; i < times10.size(); i++){
    if(min > times10.get(i)){
      min = times10.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times10.size()-1,times10),width*1/20,90);
  }
  if(times10.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times10),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times10.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times10),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times10.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times10),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times10.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times10),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times10.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times10),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times10.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times10),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "11x11"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times11.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times11.size()-18)*30){
      y -= (times11.size()-18)/5;
    }
  }
  for(int i = 0; i < times11.size(); i++){
    textSize(20);
    text(i+":  "+times11.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times11.size() > 1){
  float min = times11.get(0);
  for(int i = 0; i < times11.size(); i++){
    if(min > times11.get(i)){
      min = times11.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times11.size()-1,times11),width*1/20,90);
  }
  if(times11.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times11),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times11.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times11),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times11.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times11),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times11.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times11),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times11.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times11),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times11.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times11),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "13x13"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((times13.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(times13.size()-18)*30){
      y -= (times13.size()-18)/5;
    }
  }
  for(int i = 0; i < times13.size(); i++){
    textSize(20);
    text(i+":  "+times13.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(times13.size() > 1){
  float min = times13.get(0);
  for(int i = 0; i < times13.size(); i++){
    if(min > times13.get(i)){
      min = times13.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(times13.size()-1,times13),width*1/20,90);
  }
  if(times13.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,times13),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(times13.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,times13),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(times13.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,times13),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(times13.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,times13),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(times13.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,times13),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(times13.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,times13),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Pyraminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesPy.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesPy.size()-18)*30){
      y -= (timesPy.size()-18)/5;
    }
  }
  for(int i = 0; i < timesPy.size(); i++){
    textSize(20);
    text(i+":  "+timesPy.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesPy.size() > 1){
  float min = timesPy.get(0);
  for(int i = 0; i < timesPy.size(); i++){
    if(min > timesPy.get(i)){
      min = timesPy.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesPy.size()-1,timesPy),width*1/20,90);
  }
  if(timesPy.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesPy),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesPy.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesPy),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesPy.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesPy),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesPy.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesPy),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesPy.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesPy),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesPy.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesPy),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Skewb"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesSk.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesSk.size()-18)*30){
      y -= (timesSk.size()-18)/5;
    }
  }
  for(int i = 0; i < timesSk.size(); i++){
    textSize(20);
    text(i+":  "+timesSk.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesSk.size() > 1){
  float min = timesSk.get(0);
  for(int i = 0; i < timesSk.size(); i++){
    if(min > timesSk.get(i)){
      min = timesSk.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesSk.size()-1,timesSk),width*1/20,90);
  }
  if(timesSk.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesSk),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesSk.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesSk),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesSk.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesSk),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesSk.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesSk),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesSk.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesSk),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesSk.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesSk),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Megaminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesMm.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesMm.size()-18)*30){
      y -= (timesMm.size()-18)/5;
    }
  }
  for(int i = 0; i < timesMm.size(); i++){
    textSize(20);
    text(i+":  "+timesMm.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesMm.size() > 1){
  float min = timesMm.get(0);
  for(int i = 0; i < timesMm.size(); i++){
    if(min > timesMm.get(i)){
      min = timesMm.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesMm.size()-1,timesMm),width*1/20,90);
  }
  if(timesMm.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesMm),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesMm.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesMm),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesMm.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesMm),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesMm.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesMm),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesMm.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesMm),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesMm.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesMm),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Clock"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesCl.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesCl.size()-18)*30){
      y -= (timesCl.size()-18)/5;
    }
  }
  for(int i = 0; i < timesCl.size(); i++){
    textSize(20);
    text(i+":  "+timesCl.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesCl.size() > 1){
  float min = timesCl.get(0);
  for(int i = 0; i < timesCl.size(); i++){
    if(min > timesCl.get(i)){
      min = timesCl.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesCl.size()-1,timesCl),width*1/20,90);
  }
  if(timesCl.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesCl),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesCl.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesCl),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesCl.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesCl),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesCl.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesCl),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesCl.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesCl),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesCl.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesCl),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Magic"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesMag.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesMag.size()-18)*30){
      y -= (timesMag.size()-18)/5;
    }
  }
  for(int i = 0; i < timesMag.size(); i++){
    textSize(20);
    text(i+":  "+timesMag.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesMag.size() > 1){
  float min = timesMag.get(0);
  for(int i = 0; i < timesMag.size(); i++){
    if(min > timesMag.get(i)){
      min = timesMag.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesMag.size()-1,timesMag),width*1/20,90);
  }
  if(timesMag.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesMag),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesMag.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesMag),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesMag.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesMag),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesMag.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesMag),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesMag.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesMag),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesMag.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesMag),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Master Pyraminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesMpy.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesMpy.size()-18)*30){
      y -= (timesMpy.size()-18)/5;
    }
  }
  for(int i = 0; i < timesMpy.size(); i++){
    textSize(20);
    text(i+":  "+timesMpy.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesMpy.size() > 1){
  float min = timesMpy.get(0);
  for(int i = 0; i < timesMpy.size(); i++){
    if(min > timesMpy.get(i)){
      min = timesMpy.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesMpy.size()-1,timesMpy),width*1/20,90);
  }
  if(timesMpy.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesMpy),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesMpy.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesMpy),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesMpy.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesMpy),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesMpy.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesMpy),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesMpy.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesMpy),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesMpy.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesMpy),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Professor Pyraminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesPpy.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesPpy.size()-18)*30){
      y -= (timesPpy.size()-18)/5;
    }
  }
  for(int i = 0; i < timesPpy.size(); i++){
    textSize(20);
    text(i+":  "+timesPpy.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesPpy.size() > 1){
  float min = timesPpy.get(0);
  for(int i = 0; i < timesPpy.size(); i++){
    if(min > timesPpy.get(i)){
      min = timesPpy.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesPpy.size()-1,timesPpy),width*1/20,90);
  }
  if(timesPpy.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesPpy),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesPpy.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesPpy),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesPpy.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesPpy),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesPpy.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesPpy),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesPpy.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesPpy),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesPpy.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesPpy),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Gigaminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesGm.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesGm.size()-18)*30){
      y -= (timesGm.size()-18)/5;
    }
  }
  for(int i = 0; i < timesGm.size(); i++){
    textSize(20);
    text(i+":  "+timesGm.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesGm.size() > 1){
  float min = timesGm.get(0);
  for(int i = 0; i < timesGm.size(); i++){
    if(min > timesGm.get(i)){
      min = timesGm.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesGm.size()-1,timesGm),width*1/20,90);
  }
  if(timesGm.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesGm),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesGm.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesGm),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesGm.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesGm),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesGm.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesGm),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesGm.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesGm),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesGm.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesGm),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Teraminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesTm.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesTm.size()-18)*30){
      y -= (timesTm.size()-18)/5;
    }
  }
  for(int i = 0; i < timesTm.size(); i++){
    textSize(20);
    text(i+":  "+timesTm.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesTm.size() > 1){
  float min = timesTm.get(0);
  for(int i = 0; i < timesTm.size(); i++){
    if(min > timesTm.get(i)){
      min = timesTm.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesTm.size()-1,timesTm),width*1/20,90);
  }
  if(timesTm.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesTm),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesTm.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesTm),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesTm.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesTm),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesTm.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesTm),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesTm.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesTm),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesTm.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesTm),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
  if(puzzle == "Petaminx"){
  if(keyPressed){
    if(keyCode == UP && y < 0){
      y += ceil((timesPm.size()-18)/5);
    }
    if(keyCode == DOWN && y > -(timesPm.size()-18)*30){
      y -= (timesPm.size()-18)/5;
    }
  }
  for(int i = 0; i < timesPm.size(); i++){
    textSize(20);
    text(i+":  "+timesPm.get(i),width*2/3+30,30+i*30+y);
  }
  textSize(30);
  if(timesPm.size() > 1){
  float min = timesPm.get(0);
  for(int i = 0; i < timesPm.size(); i++){
    if(min > timesPm.get(i)){
      min = timesPm.get(i);
    }
  }
  text("Best single: "+min,width*1/20,50);
  text("Average: "+ao(timesPm.size()-1,timesPm),width*1/20,90);
  }
  if(timesPm.size() >= a1){
  text("average of "+a1+": "+nf(ao(a1,timesPm),3,4),width*1/20,130);
  text("best: "+nf(bao(a1),3,4),width*1/20,170);
  }
  if(timesPm.size() >= a2){
  text("average of "+a2+": "+nf(ao(a2,timesPm),3,4),width*1/20,210);
  text("best: "+nf(bao(a2),3,4),width*1/20,250);
  }
  if(timesPm.size() >= a3){
  text("average of "+a3+": "+nf(ao(a3,timesPm),3,4),width*1/20,290);
  text("best: "+nf(bao(a3),3,4),width*1/20,340);
  }
  if(timesPm.size() >= a4){
  text("average of "+a4+": "+nf(ao(a4,timesPm),3,4),width*1/20,370);
  text("best: "+nf(bao(a4),3,4),width*1/20,410);
  }if(timesPm.size() >= a5){
  text("average of "+a5+": "+nf(ao(a5,timesPm),3,4),width*1/20,450);
  text("best: "+nf(bao(a5),3,4),width*1/20,490);
  }if(timesPm.size() >= a6){
  text("average of "+a6+": "+nf(ao(a6,timesPm),3,4),width*1/20,540);
  text("best: "+nf(bao(a6),3,4),width*1/20,590);
  }
  }
}
public void drawGraph(){
  if(puzzle == "2x2"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times2.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times2.size()-200){
    x -= ceil((times2.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(times2.get(i),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times2.get(i),times2.min(),times2.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a1,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a2,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a3,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a4,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a5,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times2.size() < 100){
  strokeWeight(10/sqrt(times2.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times2.size(); i++){
    if(times2.size() < 100){
    vertex(width*i/times2.size(),height-(map(ao(a6,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times2,i)),times2.min(),times2.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times2.size() > 1){
  text((times2.min()+times2.max())/2,0,height/2);
  text((times2.max()-times2.min())*1/4+times2.min(),0,height*3/4);
  text((times2.max()-times2.min())*3/4+times2.min(),0,height*1/4);
  }
  }
  if(puzzle == "3x3"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times3.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times3.size()-200){
    x -= ceil((times3.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(times3.get(i),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times3.get(i),times3.min(),times3.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a1,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a2,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a3,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a4,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a5,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times3.size() < 100){
  strokeWeight(10/sqrt(times3.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times3.size(); i++){
    if(times3.size() < 100){
    vertex(width*i/times3.size(),height-(map(ao(a6,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times3,i)),times3.min(),times3.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times3.size() > 1){
  text((times3.min()+times3.max())/2,0,height/2);
  text((times3.max()-times3.min())*1/4+times3.min(),0,height*3/4);
  text((times3.max()-times3.min())*3/4+times3.min(),0,height*1/4);
  }
  }
  if(puzzle == "4x4"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times4.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times4.size()-200){
    x -= ceil((times4.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(times4.get(i),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times4.get(i),times4.min(),times4.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a1,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a2,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a3,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a4,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a5,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times4.size() < 100){
  strokeWeight(10/sqrt(times4.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times4.size(); i++){
    if(times4.size() < 100){
    vertex(width*i/times4.size(),height-(map(ao(a6,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times4,i)),times4.min(),times4.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times4.size() > 1){
  text((times4.min()+times4.max())/2,0,height/2);
  text((times4.max()-times4.min())*1/4+times4.min(),0,height*3/4);
  text((times4.max()-times4.min())*3/4+times4.min(),0,height*1/4);
  }
  }
  if(puzzle == "5x5"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times5.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times5.size()-200){
    x -= ceil((times5.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(times5.get(i),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times5.get(i),times5.min(),times5.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a1,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a2,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a3,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a4,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a5,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times5.size() < 100){
  strokeWeight(10/sqrt(times5.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times5.size(); i++){
    if(times5.size() < 100){
    vertex(width*i/times5.size(),height-(map(ao(a6,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times5,i)),times5.min(),times5.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times5.size() > 1){
  text((times5.min()+times5.max())/2,0,height/2);
  text((times5.max()-times5.min())*1/4+times5.min(),0,height*3/4);
  text((times5.max()-times5.min())*3/4+times5.min(),0,height*1/4);
  }
  }
  if(puzzle == "6x6"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times6.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times6.size()-200){
    x -= ceil((times6.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(times6.get(i),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times6.get(i),times6.min(),times6.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a1,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a2,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a3,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a4,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a5,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times6.size() < 100){
  strokeWeight(10/sqrt(times6.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times6.size(); i++){
    if(times6.size() < 100){
    vertex(width*i/times6.size(),height-(map(ao(a6,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times6,i)),times6.min(),times6.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times6.size() > 1){
  text((times6.min()+times6.max())/2,0,height/2);
  text((times6.max()-times6.min())*1/4+times6.min(),0,height*3/4);
  text((times6.max()-times6.min())*3/4+times6.min(),0,height*1/4);
  }
  }
  if(puzzle == "7x7"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times7.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times7.size()-200){
    x -= ceil((times7.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(times7.get(i),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times7.get(i),times7.min(),times7.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a1,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a2,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a3,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a4,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a5,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times7.size() < 100){
  strokeWeight(10/sqrt(times7.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times7.size(); i++){
    if(times7.size() < 100){
    vertex(width*i/times7.size(),height-(map(ao(a6,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times7,i)),times7.min(),times7.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times7.size() > 1){
  text((times7.min()+times7.max())/2,0,height/2);
  text((times7.max()-times7.min())*1/4+times7.min(),0,height*3/4);
  text((times7.max()-times7.min())*3/4+times7.min(),0,height*1/4);
  }
  }
  if(puzzle == "8x8"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times8.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times8.size()-200){
    x -= ceil((times8.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(times8.get(i),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times8.get(i),times8.min(),times8.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a1,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a2,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a3,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a4,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a5,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times8.size() < 100){
  strokeWeight(10/sqrt(times8.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times8.size(); i++){
    if(times8.size() < 100){
    vertex(width*i/times8.size(),height-(map(ao(a6,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times8,i)),times8.min(),times8.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times8.size() > 1){
  text((times8.min()+times8.max())/2,0,height/2);
  text((times8.max()-times8.min())*1/4+times8.min(),0,height*3/4);
  text((times8.max()-times8.min())*3/4+times8.min(),0,height*1/4);
  }
  }
  if(puzzle == "9x9"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times9.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times9.size()-200){
    x -= ceil((times9.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(times9.get(i),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times9.get(i),times9.min(),times9.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a1,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a2,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a3,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a4,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a5,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times9.size() < 100){
  strokeWeight(10/sqrt(times9.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times9.size(); i++){
    if(times9.size() < 100){
    vertex(width*i/times9.size(),height-(map(ao(a6,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times9,i)),times9.min(),times9.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times9.size() > 1){
  text((times9.min()+times9.max())/2,0,height/2);
  text((times9.max()-times9.min())*1/4+times9.min(),0,height*3/4);
  text((times9.max()-times9.min())*3/4+times9.min(),0,height*1/4);
  }
  }if(puzzle == "10x10"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times10.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times10.size()-200){
    x -= ceil((times10.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(times10.get(i),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times10.get(i),times10.min(),times10.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a1,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a2,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a3,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a4,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a5,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times10.size() < 100){
  strokeWeight(10/sqrt(times10.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times10.size(); i++){
    if(times10.size() < 100){
    vertex(width*i/times10.size(),height-(map(ao(a6,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times10,i)),times10.min(),times10.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times10.size() > 1){
  text((times10.min()+times10.max())/2,0,height/2);
  text((times10.max()-times10.min())*1/4+times10.min(),0,height*3/4);
  text((times10.max()-times10.min())*3/4+times10.min(),0,height*1/4);
  }
  }if(puzzle == "11x11"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times11.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times11.size()-200){
    x -= ceil((times11.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(times11.get(i),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times11.get(i),times11.min(),times11.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a1,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a2,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a3,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a4,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a5,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times11.size() < 100){
  strokeWeight(10/sqrt(times11.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times11.size(); i++){
    if(times11.size() < 100){
    vertex(width*i/times11.size(),height-(map(ao(a6,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times11,i)),times11.min(),times11.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times11.size() > 1){
  text((times11.min()+times11.max())/2,0,height/2);
  text((times11.max()-times11.min())*1/4+times11.min(),0,height*3/4);
  text((times11.max()-times11.min())*3/4+times11.min(),0,height*1/4);
  }
  }if(puzzle == "13x13"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((times13.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -times13.size()-200){
    x -= ceil((times13.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(times13.get(i),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(times13.get(i),times13.min(),times13.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a1,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a2,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a3,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a4,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a5,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(times13.size() < 100){
  strokeWeight(10/sqrt(times13.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < times13.size(); i++){
    if(times13.size() < 100){
    vertex(width*i/times13.size(),height-(map(ao(a6,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(times13,i)),times13.min(),times13.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(times13.size() > 1){
  text((times13.min()+times13.max())/2,0,height/2);
  text((times13.max()-times13.min())*1/4+times13.min(),0,height*3/4);
  text((times13.max()-times13.min())*3/4+times13.min(),0,height*1/4);
  }
  }if(puzzle == "Pyra"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesPy.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesPy.size()-200){
    x -= ceil((timesPy.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(timesPy.get(i),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesPy.get(i),timesPy.min(),timesPy.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a1,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a2,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a3,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a4,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a5,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesPy.size() < 100){
  strokeWeight(10/sqrt(timesPy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesPy.size(); i++){
    if(timesPy.size() < 100){
    vertex(width*i/timesPy.size(),height-(map(ao(a6,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesPy,i)),timesPy.min(),timesPy.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesPy.size() > 1){
  text((timesPy.min()+timesPy.max())/2,0,height/2);
  text((timesPy.max()-timesPy.min())*1/4+timesPy.min(),0,height*3/4);
  text((timesPy.max()-timesPy.min())*3/4+timesPy.min(),0,height*1/4);
  }
  }if(puzzle == "Skewb"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesSk.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesSk.size()-200){
    x -= ceil((timesSk.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(timesSk.get(i),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesSk.get(i),timesSk.min(),timesSk.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a1,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a2,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a3,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a4,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a5,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesSk.size() < 100){
  strokeWeight(10/sqrt(timesSk.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesSk.size(); i++){
    if(timesSk.size() < 100){
    vertex(width*i/timesSk.size(),height-(map(ao(a6,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesSk,i)),timesSk.min(),timesSk.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesSk.size() > 1){
  text((timesSk.min()+timesSk.max())/2,0,height/2);
  text((timesSk.max()-timesSk.min())*1/4+timesSk.min(),0,height*3/4);
  text((timesSk.max()-timesSk.min())*3/4+timesSk.min(),0,height*1/4);
  }
  }if(puzzle == "Megaminx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesMm.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesMm.size()-200){
    x -= ceil((timesMm.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(timesMm.get(i),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesMm.get(i),timesMm.min(),timesMm.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a1,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a2,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a3,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a4,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a5,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesMm.size() < 100){
  strokeWeight(10/sqrt(timesMm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesMm.size(); i++){
    if(timesMm.size() < 100){
    vertex(width*i/timesMm.size(),height-(map(ao(a6,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesMm,i)),timesMm.min(),timesMm.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesMm.size() > 1){
  text((timesMm.min()+timesMm.max())/2,0,height/2);
  text((timesMm.max()-timesMm.min())*1/4+timesMm.min(),0,height*3/4);
  text((timesMm.max()-timesMm.min())*3/4+timesMm.min(),0,height*1/4);
  }
  }if(puzzle == "Clock"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesCl.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesCl.size()-200){
    x -= ceil((timesCl.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(timesCl.get(i),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesCl.get(i),timesCl.min(),timesCl.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a1,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a2,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a3,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a4,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a5,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesCl.size() < 100){
  strokeWeight(10/sqrt(timesCl.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesCl.size(); i++){
    if(timesCl.size() < 100){
    vertex(width*i/timesCl.size(),height-(map(ao(a6,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesCl,i)),timesCl.min(),timesCl.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesCl.size() > 1){
  text((timesCl.min()+timesCl.max())/2,0,height/2);
  text((timesCl.max()-timesCl.min())*1/4+timesCl.min(),0,height*3/4);
  text((timesCl.max()-timesCl.min())*3/4+timesCl.min(),0,height*1/4);
  }
  }if(puzzle == "Magic"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesMag.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesMag.size()-200){
    x -= ceil((timesMag.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(timesMag.get(i),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesMag.get(i),timesMag.min(),timesMag.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a1,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a2,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a3,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a4,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a5,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesMag.size() < 100){
  strokeWeight(10/sqrt(timesMag.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesMag.size(); i++){
    if(timesMag.size() < 100){
    vertex(width*i/timesMag.size(),height-(map(ao(a6,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesMag,i)),timesMag.min(),timesMag.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesMag.size() > 1){
  text((timesMag.min()+timesMag.max())/2,0,height/2);
  text((timesMag.max()-timesMag.min())*1/4+timesMag.min(),0,height*3/4);
  text((timesMag.max()-timesMag.min())*3/4+timesMag.min(),0,height*1/4);
  }
  }if(puzzle == "Professor Pyraminx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesPpy.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesPpy.size()-200){
    x -= ceil((timesPpy.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(timesPpy.get(i),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesPpy.get(i),timesPpy.min(),timesPpy.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a1,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a2,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a3,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a4,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a5,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesPpy.size() < 100){
  strokeWeight(10/sqrt(timesPpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesPpy.size(); i++){
    if(timesPpy.size() < 100){
    vertex(width*i/timesPpy.size(),height-(map(ao(a6,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesPpy,i)),timesPpy.min(),timesPpy.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesPpy.size() > 1){
  text((timesPpy.min()+timesPpy.max())/2,0,height/2);
  text((timesPpy.max()-timesPpy.min())*1/4+timesPpy.min(),0,height*3/4);
  text((timesPpy.max()-timesPpy.min())*3/4+timesPpy.min(),0,height*1/4);
  }
  }if(puzzle == "Master Pyrmainx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesMpy.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesMpy.size()-200){
    x -= ceil((timesMpy.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(timesMpy.get(i),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesMpy.get(i),timesMpy.min(),timesMpy.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a1,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a2,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a3,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a4,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a5,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesMpy.size() < 100){
  strokeWeight(10/sqrt(timesMpy.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesMpy.size(); i++){
    if(timesMpy.size() < 100){
    vertex(width*i/timesMpy.size(),height-(map(ao(a6,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesMpy,i)),timesMpy.min(),timesMpy.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesMpy.size() > 1){
  text((timesMpy.min()+timesMpy.max())/2,0,height/2);
  text((timesMpy.max()-timesMpy.min())*1/4+timesMpy.min(),0,height*3/4);
  text((timesMpy.max()-timesMpy.min())*3/4+timesMpy.min(),0,height*1/4);
  }
  }if(puzzle == "Gigaminx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesGm.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesGm.size()-200){
    x -= ceil((timesGm.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(timesGm.get(i),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesGm.get(i),timesGm.min(),timesGm.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a1,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a2,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a3,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a4,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a5,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesGm.size() < 100){
  strokeWeight(10/sqrt(timesGm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesGm.size(); i++){
    if(timesGm.size() < 100){
    vertex(width*i/timesGm.size(),height-(map(ao(a6,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesGm,i)),timesGm.min(),timesGm.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesGm.size() > 1){
  text((timesGm.min()+timesGm.max())/2,0,height/2);
  text((timesGm.max()-timesGm.min())*1/4+timesGm.min(),0,height*3/4);
  text((timesGm.max()-timesGm.min())*3/4+timesGm.min(),0,height*1/4);
  }
  }if(puzzle == "Teraminx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesTm.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesTm.size()-200){
    x -= ceil((timesTm.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(timesTm.get(i),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesTm.get(i),timesTm.min(),timesTm.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a1,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a2,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a3,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a4,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a5,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesTm.size() < 100){
  strokeWeight(10/sqrt(timesTm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesTm.size(); i++){
    if(timesTm.size() < 100){
    vertex(width*i/timesTm.size(),height-(map(ao(a6,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesTm,i)),timesTm.min(),timesTm.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesTm.size() > 1){
  text((timesTm.min()+timesTm.max())/2,0,height/2);
  text((timesTm.max()-timesTm.min())*1/4+timesTm.min(),0,height*3/4);
  text((timesTm.max()-timesTm.min())*3/4+timesTm.min(),0,height*1/4);
  }
  }if(puzzle == "Petaminx"){
  if(keyPressed && key == 'd'){
    if(x < 0){
      x += ceil((timesPm.size()-200)/30);
    }
  }
  else if(keyPressed && key == 'a'){
    if(x > -timesPm.size()-200){
    x -= ceil((timesPm.size()-200)/30);
    }
  }
  noFill();
  stroke(0);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = 0; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(timesPm.get(i),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(timesPm.get(i),timesPm.min(),timesPm.max(),0,height)));
    }
}
  endShape();
  noFill();
  stroke(255,0,0);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a1; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a1,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a1,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }}
  endShape();
  noFill();
  stroke(0,0,255);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a2; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a2,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a2,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,0);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a3; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a3,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a3,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,0,255);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a4; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a4,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a4,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(255,255,0);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a5; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a5,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a5,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }  }
  endShape();
  noFill();
  stroke(0,255,255);
  if(timesPm.size() < 100){
  strokeWeight(10/sqrt(timesPm.size()));
  }
  else{
    strokeWeight(1);
  }
  beginShape();
  for(int i = a6; i < timesPm.size(); i++){
    if(timesPm.size() < 100){
    vertex(width*i/timesPm.size(),height-(map(ao(a6,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
    else{
      vertex(width*i/200+x,height-(map(ao(a6,ss(timesPm,i)),timesPm.min(),timesPm.max(),0,height)));
    }
  }
  endShape();
  textSize(20);
  fill(255);
  if(timesPm.size() > 1){
  text((timesPm.min()+timesPm.max())/2,0,height/2);
  text((timesPm.max()-timesPm.min())*1/4+timesPm.min(),0,height*3/4);
  text((timesPm.max()-timesPm.min())*3/4+timesPm.min(),0,height*1/4);
  }
  }
}
public void drawChart(){
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
  if(puzzle == "2x2"){
  if(times2.size() > 0){
  ch = (times2.max()-times2.min())/10;
  for(int i = 0; i < times2.size(); i++){
    if(times2.get(i) < times2.min()+ch){
      ch1 += 1;
    }
    else if(times2.get(i) < times2.min()+2*ch){
      ch2 += 1;
    }
    else if(times2.get(i) < times2.min()+3*ch){
      ch3 += 1;
    }
    else if(times2.get(i) < times2.min()+4*ch){
      ch4 += 1;
    }
    else if(times2.get(i) < times2.min()+5*ch){
      ch5 += 1;
    }
    else if(times2.get(i) < times2.min()+6*ch){
      ch6 += 1;
    }
    else if(times2.get(i) < times2.min()+7*ch){
      ch7 += 1;
    }
    else if(times2.get(i) < times2.min()+8*ch){
      ch8 += 1;
    }
    else if(times2.get(i) < times2.min()+9*ch){
      ch9 += 1;
    }
    else if(times2.get(i) < times2.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times2.min()+ch*i)+"-"+round(times2.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "3x3"){
  if(times3.size() > 0){
  ch = (times3.max()-times3.min())/10;
  for(int i = 0; i < times3.size(); i++){
    if(times3.get(i) < times3.min()+ch){
      ch1 += 1;
    }
    else if(times3.get(i) < times3.min()+2*ch){
      ch2 += 1;
    }
    else if(times3.get(i) < times3.min()+3*ch){
      ch3 += 1;
    }
    else if(times3.get(i) < times3.min()+4*ch){
      ch4 += 1;
    }
    else if(times3.get(i) < times3.min()+5*ch){
      ch5 += 1;
    }
    else if(times3.get(i) < times3.min()+6*ch){
      ch6 += 1;
    }
    else if(times3.get(i) < times3.min()+7*ch){
      ch7 += 1;
    }
    else if(times3.get(i) < times3.min()+8*ch){
      ch8 += 1;
    }
    else if(times3.get(i) < times3.min()+9*ch){
      ch9 += 1;
    }
    else if(times3.get(i) < times3.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times3.min()+ch*i)+"-"+round(times3.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "4x4"){
  if(times4.size() > 0){
  ch = (times4.max()-times4.min())/10;
  for(int i = 0; i < times4.size(); i++){
    if(times4.get(i) < times4.min()+ch){
      ch1 += 1;
    }
    else if(times4.get(i) < times4.min()+2*ch){
      ch2 += 1;
    }
    else if(times4.get(i) < times4.min()+3*ch){
      ch3 += 1;
    }
    else if(times4.get(i) < times4.min()+4*ch){
      ch4 += 1;
    }
    else if(times4.get(i) < times4.min()+5*ch){
      ch5 += 1;
    }
    else if(times4.get(i) < times4.min()+6*ch){
      ch6 += 1;
    }
    else if(times4.get(i) < times4.min()+7*ch){
      ch7 += 1;
    }
    else if(times4.get(i) < times4.min()+8*ch){
      ch8 += 1;
    }
    else if(times4.get(i) < times4.min()+9*ch){
      ch9 += 1;
    }
    else if(times4.get(i) < times4.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times4.min()+ch*i)+"-"+round(times4.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "5x5"){
  if(times5.size() > 0){
  ch = (times5.max()-times5.min())/10;
  for(int i = 0; i < times5.size(); i++){
    if(times5.get(i) < times5.min()+ch){
      ch1 += 1;
    }
    else if(times5.get(i) < times5.min()+2*ch){
      ch2 += 1;
    }
    else if(times5.get(i) < times5.min()+3*ch){
      ch3 += 1;
    }
    else if(times5.get(i) < times5.min()+4*ch){
      ch4 += 1;
    }
    else if(times5.get(i) < times5.min()+5*ch){
      ch5 += 1;
    }
    else if(times5.get(i) < times5.min()+6*ch){
      ch6 += 1;
    }
    else if(times5.get(i) < times5.min()+7*ch){
      ch7 += 1;
    }
    else if(times5.get(i) < times5.min()+8*ch){
      ch8 += 1;
    }
    else if(times5.get(i) < times5.min()+9*ch){
      ch9 += 1;
    }
    else if(times5.get(i) < times5.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times5.min()+ch*i)+"-"+round(times5.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "6x6"){
  if(times6.size() > 0){
  ch = (times6.max()-times6.min())/10;
  for(int i = 0; i < times6.size(); i++){
    if(times6.get(i) < times6.min()+ch){
      ch1 += 1;
    }
    else if(times6.get(i) < times6.min()+2*ch){
      ch2 += 1;
    }
    else if(times6.get(i) < times6.min()+3*ch){
      ch3 += 1;
    }
    else if(times6.get(i) < times6.min()+4*ch){
      ch4 += 1;
    }
    else if(times6.get(i) < times6.min()+5*ch){
      ch5 += 1;
    }
    else if(times6.get(i) < times6.min()+6*ch){
      ch6 += 1;
    }
    else if(times6.get(i) < times6.min()+7*ch){
      ch7 += 1;
    }
    else if(times6.get(i) < times6.min()+8*ch){
      ch8 += 1;
    }
    else if(times6.get(i) < times6.min()+9*ch){
      ch9 += 1;
    }
    else if(times6.get(i) < times6.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times6.min()+ch*i)+"-"+round(times6.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "7x7"){
  if(times7.size() > 0){
  ch = (times7.max()-times7.min())/10;
  for(int i = 0; i < times7.size(); i++){
    if(times7.get(i) < times7.min()+ch){
      ch1 += 1;
    }
    else if(times7.get(i) < times7.min()+2*ch){
      ch2 += 1;
    }
    else if(times7.get(i) < times7.min()+3*ch){
      ch3 += 1;
    }
    else if(times7.get(i) < times7.min()+4*ch){
      ch4 += 1;
    }
    else if(times7.get(i) < times7.min()+5*ch){
      ch5 += 1;
    }
    else if(times7.get(i) < times7.min()+6*ch){
      ch6 += 1;
    }
    else if(times7.get(i) < times7.min()+7*ch){
      ch7 += 1;
    }
    else if(times7.get(i) < times7.min()+8*ch){
      ch8 += 1;
    }
    else if(times7.get(i) < times7.min()+9*ch){
      ch9 += 1;
    }
    else if(times7.get(i) < times7.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times7.min()+ch*i)+"-"+round(times7.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "8x8"){
  if(times8.size() > 0){
  ch = (times8.max()-times8.min())/10;
  for(int i = 0; i < times8.size(); i++){
    if(times8.get(i) < times8.min()+ch){
      ch1 += 1;
    }
    else if(times8.get(i) < times8.min()+2*ch){
      ch2 += 1;
    }
    else if(times8.get(i) < times8.min()+3*ch){
      ch3 += 1;
    }
    else if(times8.get(i) < times8.min()+4*ch){
      ch4 += 1;
    }
    else if(times8.get(i) < times8.min()+5*ch){
      ch5 += 1;
    }
    else if(times8.get(i) < times8.min()+6*ch){
      ch6 += 1;
    }
    else if(times8.get(i) < times8.min()+7*ch){
      ch7 += 1;
    }
    else if(times8.get(i) < times8.min()+8*ch){
      ch8 += 1;
    }
    else if(times8.get(i) < times8.min()+9*ch){
      ch9 += 1;
    }
    else if(times8.get(i) < times8.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times8.min()+ch*i)+"-"+round(times8.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "9x9"){
  if(times9.size() > 0){
  ch = (times9.max()-times9.min())/10;
  for(int i = 0; i < times9.size(); i++){
    if(times9.get(i) < times9.min()+ch){
      ch1 += 1;
    }
    else if(times9.get(i) < times9.min()+2*ch){
      ch2 += 1;
    }
    else if(times9.get(i) < times9.min()+3*ch){
      ch3 += 1;
    }
    else if(times9.get(i) < times9.min()+4*ch){
      ch4 += 1;
    }
    else if(times9.get(i) < times9.min()+5*ch){
      ch5 += 1;
    }
    else if(times9.get(i) < times9.min()+6*ch){
      ch6 += 1;
    }
    else if(times9.get(i) < times9.min()+7*ch){
      ch7 += 1;
    }
    else if(times9.get(i) < times9.min()+8*ch){
      ch8 += 1;
    }
    else if(times9.get(i) < times9.min()+9*ch){
      ch9 += 1;
    }
    else if(times9.get(i) < times9.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times9.min()+ch*i)+"-"+round(times9.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "10x10"){
  if(times10.size() > 0){
  ch = (times10.max()-times10.min())/10;
  for(int i = 0; i < times10.size(); i++){
    if(times10.get(i) < times10.min()+ch){
      ch1 += 1;
    }
    else if(times10.get(i) < times10.min()+2*ch){
      ch2 += 1;
    }
    else if(times10.get(i) < times10.min()+3*ch){
      ch3 += 1;
    }
    else if(times10.get(i) < times10.min()+4*ch){
      ch4 += 1;
    }
    else if(times10.get(i) < times10.min()+5*ch){
      ch5 += 1;
    }
    else if(times10.get(i) < times10.min()+6*ch){
      ch6 += 1;
    }
    else if(times10.get(i) < times10.min()+7*ch){
      ch7 += 1;
    }
    else if(times10.get(i) < times10.min()+8*ch){
      ch8 += 1;
    }
    else if(times10.get(i) < times10.min()+9*ch){
      ch9 += 1;
    }
    else if(times10.get(i) < times10.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times10.min()+ch*i)+"-"+round(times10.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "11x11"){
  if(times11.size() > 0){
  ch = (times11.max()-times11.min())/10;
  for(int i = 0; i < times11.size(); i++){
    if(times11.get(i) < times11.min()+ch){
      ch1 += 1;
    }
    else if(times11.get(i) < times11.min()+2*ch){
      ch2 += 1;
    }
    else if(times11.get(i) < times11.min()+3*ch){
      ch3 += 1;
    }
    else if(times11.get(i) < times11.min()+4*ch){
      ch4 += 1;
    }
    else if(times11.get(i) < times11.min()+5*ch){
      ch5 += 1;
    }
    else if(times11.get(i) < times11.min()+6*ch){
      ch6 += 1;
    }
    else if(times11.get(i) < times11.min()+7*ch){
      ch7 += 1;
    }
    else if(times11.get(i) < times11.min()+8*ch){
      ch8 += 1;
    }
    else if(times11.get(i) < times11.min()+9*ch){
      ch9 += 1;
    }
    else if(times11.get(i) < times11.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times11.min()+ch*i)+"-"+round(times11.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "13x13"){
  if(times13.size() > 0){
  ch = (times13.max()-times13.min())/10;
  for(int i = 0; i < times13.size(); i++){
    if(times13.get(i) < times13.min()+ch){
      ch1 += 1;
    }
    else if(times13.get(i) < times13.min()+2*ch){
      ch2 += 1;
    }
    else if(times13.get(i) < times13.min()+3*ch){
      ch3 += 1;
    }
    else if(times13.get(i) < times13.min()+4*ch){
      ch4 += 1;
    }
    else if(times13.get(i) < times13.min()+5*ch){
      ch5 += 1;
    }
    else if(times13.get(i) < times13.min()+6*ch){
      ch6 += 1;
    }
    else if(times13.get(i) < times13.min()+7*ch){
      ch7 += 1;
    }
    else if(times13.get(i) < times13.min()+8*ch){
      ch8 += 1;
    }
    else if(times13.get(i) < times13.min()+9*ch){
      ch9 += 1;
    }
    else if(times13.get(i) < times13.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(times13.min()+ch*i)+"-"+round(times13.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Pyraminx"){
  if(timesPy.size() > 0){
  ch = (timesPy.max()-timesPy.min())/10;
  for(int i = 0; i < timesPy.size(); i++){
    if(timesPy.get(i) < timesPy.min()+ch){
      ch1 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+2*ch){
      ch2 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+3*ch){
      ch3 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+4*ch){
      ch4 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+5*ch){
      ch5 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+6*ch){
      ch6 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+7*ch){
      ch7 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+8*ch){
      ch8 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+9*ch){
      ch9 += 1;
    }
    else if(timesPy.get(i) < timesPy.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesPy.min()+ch*i)+"-"+round(timesPy.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Skewb"){
  if(timesSk.size() > 0){
  ch = (timesSk.max()-timesSk.min())/10;
  for(int i = 0; i < timesSk.size(); i++){
    if(timesSk.get(i) < timesSk.min()+ch){
      ch1 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+2*ch){
      ch2 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+3*ch){
      ch3 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+4*ch){
      ch4 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+5*ch){
      ch5 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+6*ch){
      ch6 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+7*ch){
      ch7 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+8*ch){
      ch8 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+9*ch){
      ch9 += 1;
    }
    else if(timesSk.get(i) < timesSk.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesSk.min()+ch*i)+"-"+round(timesSk.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Megaminx"){
  if(timesMm.size() > 0){
  ch = (timesMm.max()-timesMm.min())/10;
  for(int i = 0; i < timesMm.size(); i++){
    if(timesMm.get(i) < timesMm.min()+ch){
      ch1 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+2*ch){
      ch2 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+3*ch){
      ch3 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+4*ch){
      ch4 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+5*ch){
      ch5 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+6*ch){
      ch6 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+7*ch){
      ch7 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+8*ch){
      ch8 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+9*ch){
      ch9 += 1;
    }
    else if(timesMm.get(i) < timesMm.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesMm.min()+ch*i)+"-"+round(timesMm.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Clock"){
  if(timesCl.size() > 0){
  ch = (timesCl.max()-timesCl.min())/10;
  for(int i = 0; i < timesCl.size(); i++){
    if(timesCl.get(i) < timesCl.min()+ch){
      ch1 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+2*ch){
      ch2 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+3*ch){
      ch3 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+4*ch){
      ch4 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+5*ch){
      ch5 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+6*ch){
      ch6 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+7*ch){
      ch7 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+8*ch){
      ch8 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+9*ch){
      ch9 += 1;
    }
    else if(timesCl.get(i) < timesCl.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesCl.min()+ch*i)+"-"+round(timesCl.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Magic"){
  if(timesMag.size() > 0){
  ch = (timesMag.max()-timesMag.min())/10;
  for(int i = 0; i < timesMag.size(); i++){
    if(timesMag.get(i) < timesMag.min()+ch){
      ch1 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+2*ch){
      ch2 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+3*ch){
      ch3 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+4*ch){
      ch4 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+5*ch){
      ch5 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+6*ch){
      ch6 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+7*ch){
      ch7 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+8*ch){
      ch8 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+9*ch){
      ch9 += 1;
    }
    else if(timesMag.get(i) < timesMag.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesMag.min()+ch*i)+"-"+round(timesMag.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Master Pyraminx"){
  if(timesMpy.size() > 0){
  ch = (timesMpy.max()-timesMpy.min())/10;
  for(int i = 0; i < timesMpy.size(); i++){
    if(timesMpy.get(i) < timesMpy.min()+ch){
      ch1 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+2*ch){
      ch2 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+3*ch){
      ch3 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+4*ch){
      ch4 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+5*ch){
      ch5 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+6*ch){
      ch6 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+7*ch){
      ch7 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+8*ch){
      ch8 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+9*ch){
      ch9 += 1;
    }
    else if(timesMpy.get(i) < timesMpy.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesMpy.min()+ch*i)+"-"+round(timesMpy.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Professor Pyraminx"){
  if(timesPpy.size() > 0){
  ch = (timesPpy.max()-timesPpy.min())/10;
  for(int i = 0; i < timesPpy.size(); i++){
    if(timesPpy.get(i) < timesPpy.min()+ch){
      ch1 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+2*ch){
      ch2 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+3*ch){
      ch3 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+4*ch){
      ch4 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+5*ch){
      ch5 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+6*ch){
      ch6 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+7*ch){
      ch7 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+8*ch){
      ch8 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+9*ch){
      ch9 += 1;
    }
    else if(timesPpy.get(i) < timesPpy.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesPpy.min()+ch*i)+"-"+round(timesPpy.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Gigaminx"){
  if(timesGm.size() > 0){
  ch = (timesGm.max()-timesGm.min())/10;
  for(int i = 0; i < timesGm.size(); i++){
    if(timesGm.get(i) < timesGm.min()+ch){
      ch1 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+2*ch){
      ch2 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+3*ch){
      ch3 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+4*ch){
      ch4 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+5*ch){
      ch5 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+6*ch){
      ch6 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+7*ch){
      ch7 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+8*ch){
      ch8 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+9*ch){
      ch9 += 1;
    }
    else if(timesGm.get(i) < timesGm.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesGm.min()+ch*i)+"-"+round(timesGm.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Teraminx"){
  if(timesTm.size() > 0){
  ch = (timesTm.max()-timesTm.min())/10;
  for(int i = 0; i < timesTm.size(); i++){
    if(timesTm.get(i) < timesTm.min()+ch){
      ch1 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+2*ch){
      ch2 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+3*ch){
      ch3 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+4*ch){
      ch4 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+5*ch){
      ch5 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+6*ch){
      ch6 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+7*ch){
      ch7 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+8*ch){
      ch8 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+9*ch){
      ch9 += 1;
    }
    else if(timesTm.get(i) < timesTm.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesTm.min()+ch*i)+"-"+round(timesTm.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
  }
  if(puzzle == "Petaminx"){
  if(timesPm.size() > 0){
  ch = (timesPm.max()-timesPm.min())/10;
  for(int i = 0; i < timesPm.size(); i++){
    if(timesPm.get(i) < timesPm.min()+ch){
      ch1 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+2*ch){
      ch2 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+3*ch){
      ch3 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+4*ch){
      ch4 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+5*ch){
      ch5 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+6*ch){
      ch6 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+7*ch){
      ch7 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+8*ch){
      ch8 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+9*ch){
      ch9 += 1;
    }
    else if(timesPm.get(i) < timesPm.min()+10*ch){
      ch10 += 1;
    }
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
    text(round(timesPm.min()+ch*i)+"-"+round(timesPm.min()+ch*(i+1)),30,(i+0.5f)*height/10);
  }
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
    if(puzzle == "2x2"){
    times2.append(current_time);
    }
    if(puzzle == "3x3"){
    times3.append(current_time);
    }
    if(puzzle == "4x4"){
    times4.append(current_time);
    }
    if(puzzle == "5x5"){
    times5.append(current_time);
    }
    if(puzzle == "6x6"){
    times6.append(current_time);
    }
    if(puzzle == "7x7"){
    times7.append(current_time);
    }
    if(puzzle == "8x8"){
    times8.append(current_time);
    }
    if(puzzle == "9x9"){
    times9.append(current_time);
    }
    if(puzzle == "10x10"){
    times10.append(current_time);
    }
    if(puzzle == "11x11"){
    times11.append(current_time);
    }
    if(puzzle == "13x13"){
    times13.append(current_time);
    }
    if(puzzle == "Pyraminx"){
    timesPy.append(current_time);
    }
    if(puzzle == "Skewb"){
    timesSk.append(current_time);
    }
    if(puzzle == "Megaminx"){
    timesMm.append(current_time);
    }
    if(puzzle == "Clock"){
    timesCl.append(current_time);
    }
    if(puzzle == "Magic"){
    timesMag.append(current_time);
    }
    if(puzzle == "Master Pyraminx"){
    timesMpy.append(current_time);
    }
    if(puzzle == "Professor Pyraminx"){
    timesPpy.append(current_time);
    }
    if(puzzle == "Gigaminx"){
    timesGm.append(current_time);
    }
    if(puzzle == "Terraminx"){
    timesTm.append(current_time);
    }
    if(puzzle == "Petaminx"){
    timesPm.append(current_time);
    }
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
    if(ts.get(ts.size()-i-1) < best){
      best = ts.get(ts.size()-i-1);
    }
    if(ts.get(ts.size()-i-1) > worst){
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
  if(puzzle == "2x2"){
  float fin = 0;
  fin = ao(n,times2);
  for(int i = 0; i < times2.size()-n; i++){
    if(ao(n,ss(times2,times2.size()-1-i)) < fin){
      fin = ao(n,ss(times2,times2.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "3x3"){
  float fin = 0;
  fin = ao(n,times3);
  for(int i = 0; i < times3.size()-n; i++){
    if(ao(n,ss(times3,times3.size()-1-i)) < fin){
      fin = ao(n,ss(times3,times3.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "4x4"){
  float fin = 0;
  fin = ao(n,times4);
  for(int i = 0; i < times4.size()-n; i++){
    if(ao(n,ss(times4,times4.size()-1-i)) < fin){
      fin = ao(n,ss(times4,times4.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "5x5"){
  float fin = 0;
  fin = ao(n,times5);
  for(int i = 0; i < times5.size()-n; i++){
    if(ao(n,ss(times5,times5.size()-1-i)) < fin){
      fin = ao(n,ss(times5,times5.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "6x6"){
  float fin = 0;
  fin = ao(n,times6);
  for(int i = 0; i < times6.size()-n; i++){
    if(ao(n,ss(times6,times6.size()-1-i)) < fin){
      fin = ao(n,ss(times6,times6.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "7x7"){
  float fin = 0;
  fin = ao(n,times7);
  for(int i = 0; i < times7.size()-n; i++){
    if(ao(n,ss(times7,times7.size()-1-i)) < fin){
      fin = ao(n,ss(times7,times7.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "8x8"){
  float fin = 0;
  fin = ao(n,times3);
  for(int i = 0; i < times8.size()-n; i++){
    if(ao(n,ss(times8,times8.size()-1-i)) < fin){
      fin = ao(n,ss(times8,times8.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "9x9"){
  float fin = 0;
  fin = ao(n,times9);
  for(int i = 0; i < times9.size()-n; i++){
    if(ao(n,ss(times3,times9.size()-1-i)) < fin){
      fin = ao(n,ss(times9,times9.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "10x10"){
  float fin = 0;
  fin = ao(n,times10);
  for(int i = 0; i < times10.size()-n; i++){
    if(ao(n,ss(times10,times10.size()-1-i)) < fin){
      fin = ao(n,ss(times10,times10.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "11x11"){
  float fin = 0;
  fin = ao(n,times11);
  for(int i = 0; i < times11.size()-n; i++){
    if(ao(n,ss(times11,times11.size()-1-i)) < fin){
      fin = ao(n,ss(times11,times11.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "13x13"){
  float fin = 0;
  fin = ao(n,times13);
  for(int i = 0; i < times13.size()-n; i++){
    if(ao(n,ss(times13,times13.size()-1-i)) < fin){
      fin = ao(n,ss(times13,times13.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Pyraminx"){
  float fin = 0;
  fin = ao(n,times3);
  for(int i = 0; i < timesPy.size()-n; i++){
    if(ao(n,ss(timesPy,timesPy.size()-1-i)) < fin){
      fin = ao(n,ss(timesPy,timesPy.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Skewb"){
  float fin = 0;
  fin = ao(n,times3);
  for(int i = 0; i < timesSk.size()-n; i++){
    if(ao(n,ss(timesSk,timesSk.size()-1-i)) < fin){
      fin = ao(n,ss(timesSk,timesSk.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Megaminx"){
  float fin = 0;
  fin = ao(n,times3);
  for(int i = 0; i < timesMm.size()-n; i++){
    if(ao(n,ss(timesMm,timesMm.size()-1-i)) < fin){
      fin = ao(n,ss(timesMm,timesMm.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Clock"){
  float fin = 0;
  fin = ao(n,timesCl);
  for(int i = 0; i < timesCl.size()-n; i++){
    if(ao(n,ss(timesCl,timesCl.size()-1-i)) < fin){
      fin = ao(n,ss(timesCl,timesCl.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Magic"){
  float fin = 0;
  fin = ao(n,timesMag);
  for(int i = 0; i < timesMag.size()-n; i++){
    if(ao(n,ss(timesMag,timesMag.size()-1-i)) < fin){
      fin = ao(n,ss(timesMag,timesMag.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Master Pyraminx"){
  float fin = 0;
  fin = ao(n,timesMpy);
  for(int i = 0; i < timesMpy.size()-n; i++){
    if(ao(n,ss(timesMpy,timesMpy.size()-1-i)) < fin){
      fin = ao(n,ss(timesMpy,timesMpy.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Professor Pyraminx"){
  float fin = 0;
  fin = ao(n,timesPpy);
  for(int i = 0; i < timesPpy.size()-n; i++){
    if(ao(n,ss(timesPpy,timesPpy.size()-1-i)) < fin){
      fin = ao(n,ss(timesPpy,timesPpy.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Gigaminx"){
  float fin = 0;
  fin = ao(n,timesGm);
  for(int i = 0; i < timesGm.size()-n; i++){
    if(ao(n,ss(times3,timesGm.size()-1-i)) < fin){
      fin = ao(n,ss(timesGm,timesGm.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Teraminx"){
  float fin = 0;
  fin = ao(n,timesTm);
  for(int i = 0; i < timesTm.size()-n; i++){
    if(ao(n,ss(timesTm,timesTm.size()-1-i)) < fin){
      fin = ao(n,ss(timesTm,timesTm.size()-1-i));
    }
  }
  return(fin);
  }
  if(puzzle == "Petaminx"){
  float fin = 0;
  fin = ao(n,timesPm);
  for(int i = 0; i < timesPm.size()-n; i++){
    if(ao(n,ss(timesPm,timesPm.size()-1-i)) < fin){
      fin = ao(n,ss(timesPm,timesPm.size()-1-i));
    }
  }
  return(fin);
  }
  else{
    return(0);
  }
}
public void newScramble(){
  scramble = new StringList();
  int prem = 0;
  if(puzzle == "2x2"){
  for(int i = 0; i < 11; i++){
  String ad = "";
  int move = floor(random(1,4));
  while(move == prem){
  move = floor(random(1,4));
  }
  int direction = floor(random(1,4));
  if(move == 1){
    ad+="R";
  }
  if(move == 2){
    ad+="F";
  }
  if(move == 3){
    ad+="U";
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
  if(puzzle == "3x3"){
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
    ad+="F";
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
  if(puzzle == "4x4"){
  for(int i = 0; i < 30; i++){
    String ad = "";
  int move = floor(random(1,7));
  while(move == prem){
  move = floor(random(1,13));
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
  if(move == 7 || move == 10){
    ad+="Rw";
  }
  if(move == 8 || move == 11){
    ad+="Uw";
  }
  if(move == 9 || move == 12){
    ad+="Fw";
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
  scramble.append("\n");
  for(int i = 0; i < 7; i++){
    String ad = "";
  int move = floor(random(1,7));
  while(move == prem){
  move = floor(random(1,13));
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
  if(move == 7 || move == 10){
    ad+="Rw";
  }
  if(move == 8 || move == 11){
    ad+="Uw";
  }
  if(move == 9 || move == 12){
    ad+="Fw";
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
  if(puzzle == "5x5"){
  for(int i = 0; i < 30; i++){
  String ad = "";
  int move = floor(random(1,7));
  while(move == prem){
  move = floor(random(1,13));
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
  if(move == 7){
    ad+="Rw";
  }
  if(move == 8){
    ad+="Uw";
  }
  if(move == 9){
    ad+="Fw";
  }
  if(move == 10){
    ad += "Lw";
  }
  if(move == 11){
    ad += "Dw";
  }
  if(move == 12){
    ad += "Bw";
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
  scramble.append("\n");
  for(int i = 0; i < 30; i++){
    String ad = "";
  int move = floor(random(1,7));
  while(move == prem){
  move = floor(random(1,13));
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
  if(move == 7){
    ad+="Rw";
  }
  if(move == 8){
    ad+="Uw";
  }
  if(move == 9){
    ad+="Fw";
  }
  if(move == 10){
    ad += "Lw";
  }
  if(move == 11){
    ad += "Dw";
  }
  if(move == 12){
    ad += "Bw";
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
  }
public void saveStuff(){
  JSONObject time = new JSONObject();
  for(int i = 0; i < times2.size(); i++){
    time.setFloat("2x2 Solve #"+i,times2.get(i));
  }
  for(int i = 0; i < times3.size(); i++){
    time.setFloat("3x3 Solve #"+i,times3.get(i));
  }
  for(int i = 0; i < times4.size(); i++){
    time.setFloat("4x4 Solve #"+i,times4.get(i));
  }
  for(int i = 0; i < times5.size(); i++){
    time.setFloat("5x5 Solve #"+i,times5.get(i));
  }
  for(int i = 0; i < times6.size(); i++){
    time.setFloat("6x6 Solve #"+i,times6.get(i));
  }
  for(int i = 0; i < times7.size(); i++){
    time.setFloat("7x7 Solve #"+i,times7.get(i));
  }
  for(int i = 0; i < times8.size(); i++){
    time.setFloat("8x8 Solve #"+i,times8.get(i));
  }
  for(int i = 0; i < times9.size(); i++){
    time.setFloat("9x9 Solve #"+i,times9.get(i));
  }
  for(int i = 0; i < times10.size(); i++){
    time.setFloat("10x10 Solve #"+i,times10.get(i));
  }
  for(int i = 0; i < times11.size(); i++){
    time.setFloat("11x11 Solve #"+i,times11.get(i));
  }
  for(int i = 0; i < times13.size(); i++){
    time.setFloat("13x13 Solve #"+i,times13.get(i));
  }
  for(int i = 0; i < timesPy.size(); i++){
    time.setFloat("Pyraminx Solve #"+i,timesPy.get(i));
  }
  for(int i = 0; i < timesSk.size(); i++){
    time.setFloat("Skewb Solve #"+i,timesSk.get(i));
  }
  for(int i = 0; i < timesMm.size(); i++){
    time.setFloat("Megaminx Solve #"+i,timesMm.get(i));
  }
  for(int i = 0; i < timesCl.size(); i++){
    time.setFloat("Clock Solve #"+i,timesCl.get(i));
  }
  for(int i = 0; i < timesMag.size(); i++){
    time.setFloat("Magic Solve #"+i,timesMag.get(i));
  }
  for(int i = 0; i < timesMpy.size(); i++){
    time.setFloat("Master Pyraminx Solve #"+i,timesMpy.get(i));
  }
  for(int i = 0; i < timesPpy.size(); i++){
    time.setFloat("Professor Pyraminx Solve #"+i,timesPpy.get(i));
  }
  for(int i = 0; i < timesGm.size(); i++){
    time.setFloat("Gigaminx Solve #"+i,timesGm.get(i));
  }
  for(int i = 0; i < timesTm.size(); i++){
    time.setFloat("Teraminx Solve #"+i,timesTm.get(i));
  }
  for(int i = 0; i < timesPm.size(); i++){
    time.setFloat("Petaminx Solve #"+i,timesPm.get(i));
  }
  time.setInt("2x2 Length",times2.size());
  time.setInt("3x3 Length",times3.size());
  time.setInt("4x4 Length",times4.size());
  time.setInt("5x5 Length",times5.size());
  time.setInt("6x6 Length",times6.size());
  time.setInt("7x7 Length",times7.size());
  time.setInt("8x8 Length",times8.size());
  time.setInt("9x9 Length",times9.size());
  time.setInt("10x10 Length",times10.size());
  time.setInt("11x11 Length",times11.size());
  time.setInt("13x13 Length",times13.size());
  time.setInt("Pyraminx Length",timesPy.size());
  time.setInt("Skewb Length",timesSk.size());
  time.setInt("Megaminx Length",timesMm.size());
  time.setInt("Clock Length",timesCl.size());
  time.setInt("Magic Length",timesMag.size());
  time.setInt("Master Pyraminx Length",timesMpy.size());
  time.setInt("Professor Pyraminx Length",timesPpy.size());
  time.setInt("Gigaminx Length",timesGm.size());
  time.setInt("Teraminx Length",timesTm.size());
  time.setInt("Petaminx Length",timesPm.size());
  saveJSONObject(time,"time.json");
}
public void loadStuff(){
  JSONObject time = loadJSONObject("time.json");
  for(int i = 0; i < time.getInt("2x2 Length"); i++){
    times2.append(time.getFloat("2x2 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("3x3 Length"); i++){
    times3.append(time.getFloat("3x3 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("4x4 Length"); i++){
    times4.append(time.getFloat("4x4 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("5x5 Length"); i++){
    times5.append(time.getFloat("5x5 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("6x6 Length"); i++){
    time.getFloat("6x6 Solve #"+i,times6.get(i));
  }
  for(int i = 0; i < time.getInt("7x7 Length"); i++){
    times7.append(time.getFloat("7x7 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("8x8 Length"); i++){
    times8.append(time.getFloat("8x8 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("9x9 Length"); i++){
    times9.append(time.getFloat("9x9 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("10x10 Length"); i++){
    times10.append(time.getFloat("10x10 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("11x11 Length"); i++){
    times11.append(time.getFloat("11x11 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("13x13 Length"); i++){
    times13.append(time.getFloat("13x13 Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Pyraminx Length"); i++){
    timesPy.append(time.getFloat("Pyraminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Skewb Length"); i++){
    timesSk.append(time.getFloat("Skewb Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Megaminx Length"); i++){
    timesMm.append(time.getFloat("Megaminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Clock Length"); i++){
    timesCl.append(time.getFloat("Clock Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Magic Length"); i++){
    timesMag.append(time.getFloat("Magic Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Master Pyraminx Length"); i++){
    timesMpy.append(time.getFloat("Master Pyraminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Professor Pyraminx Length"); i++){
    timesPpy.append(time.getFloat("Professor Pyraminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Gigaminx Length"); i++){
    timesGm.append(time.getFloat("Gigaminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Teraminx Length"); i++){
    timesTm.append(time.getFloat("Teraminx Solve #"+i));
  }
  for(int i = 0; i < time.getInt("Petaminx Length"); i++){
    timesPm.append(time.getFloat("Petaminx Solve #"+i));
  }
}
public void mousePressed(){
  if(mouseY > 5*height/6-30 && mouseX < 5*height/6+30){
    if(mouseX > width/6 && mouseX < width/6+30){
      
      if(puzzle == "3x3"){
        puzzle = "2x2";
      }
      if(puzzle == "4x4"){
        puzzle = "3x3";
      }
      if(puzzle == "5x5"){
        puzzle = "4x4";
      }
      if(puzzle == "6x6"){
        puzzle = "5x5";
      }
      if(puzzle == "7x7"){
        puzzle = "6x6";
      }
      if(puzzle == "8x8"){
        puzzle = "7x7";
      }
      if(puzzle == "9x9"){
        puzzle = "8x8";
      }
      if(puzzle == "10x10"){
        puzzle = "9x9";
      }
      if(puzzle == "11x11"){
        puzzle = "10x10";
      }
      if(puzzle == "13x13"){
        puzzle = "11x11";
      }
      if(puzzle == "Pyraminx"){
        puzzle = "13x13";
      }
      if(puzzle == "Skewb"){
        puzzle = "Pyraminx";
      }
      if(puzzle == "Megaminx"){
        puzzle = "Skewb";
      }
      if(puzzle == "Clock"){
        puzzle = "Megaminx";
      }
      if(puzzle == "Magic"){
        puzzle = "Clock";
      }
      if(puzzle == "Master Pyraminx"){
        puzzle = "Magic";
      }
      if(puzzle == "Professor Pyraminx"){
        puzzle = "Master Pyraminx";
      }
      if(puzzle == "Gigaminx"){
        puzzle = "Professor Pyraminx";
      }
      if(puzzle == "Teraminx"){
        puzzle = "Gigaminx";
      }
      if(puzzle == "Petaminx"){
        puzzle = "Teraminx";
      }
      newScramble();
    }
    else if(mouseX < 5*width/6 && mouseX > 5*width/6-30){
      if(puzzle == "Teraminx"){
        puzzle = "Petaminx";
      }
       if(puzzle == "Gigaminx"){
        puzzle = "Teraminx";
      }
      if(puzzle == "Professor Pyraminx"){
        puzzle = "Gigaminx";
      }
      if(puzzle == "Master Pyraminx"){
        puzzle = "Professor Pyraminx";
      }
      if(puzzle == "Magic"){
        puzzle = "Master Pyraminx";
      }
      if(puzzle == "Clock"){
        puzzle = "Magic";
      }
      if(puzzle == "Megaminx"){
        puzzle = "Clock";
      }
      if(puzzle == "Skewb"){
        puzzle = "Megaminx";
      }
      if(puzzle == "Pyraminx"){
        puzzle = "Skewb";
      }
      if(puzzle == "13x13"){
        puzzle = "Pyraminx";
      }
      if(puzzle == "11x11"){
        puzzle = "13x13";
      }
      if(puzzle == "10x10"){
        puzzle = "11x11";
      }
      if(puzzle == "9x9"){
        puzzle = "10x10";
      }
      if(puzzle == "8x8"){
        puzzle = "9x9";
      }
      if(puzzle == "7x7"){
        puzzle = "8x8";
      }
      if(puzzle == "6x6"){
        puzzle = "7x7";
      }
      if(puzzle == "5x5"){
        puzzle = "6x6";
      }
      if(puzzle == "4x4"){
        puzzle = "5x5";
      }
      if(puzzle == "3x3"){
        puzzle = "4x4";
      }
      if(puzzle == "2x2"){
        puzzle = "3x3";
      }
      newScramble();
    }
  }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RubikTimer__Version_1_1_ALPHA_" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
