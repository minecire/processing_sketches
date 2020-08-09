//Input Variables
float[] data = {7, 5, 4, 3, 6}; //Insert Data
String chart_type = "Pie";
/*Write which data chart you want:
-Bar
-Pie
*/
int[][] colors = {{0,0,0},{255,0,0},{0,255,0},{0,0,255},{0,255,0}};
/*
Write the colors in RGB.
*/
//Other Variables
int xpos = 0;
int dvar = 0;
int cdeg = 0;
FloatList percentages;
int total = 0;
float totsf = 0;
void setup(){
  size(1000,1000);
  percentages = new FloatList();
  for(int i = 0; i < data.length; i++){
    total += data[i];
  }
  for(int i = 0; i < data.length; i++){
    percentages.append((data[i]*100)/total);
  }
}
void draw(){
  background(0,255,255);
  //text(total+"  "+data[0]+"  "+percentages.get(0),50,50);
  text(totsf,50,50);
  if(chart_type == "Bar"){
    noStroke();
    fill(colors[0][0],colors[0][1],colors[0][2]);
    dvar = 0;
    xpos = 0;
    xpos += width/((data.length+1)*2);
    for(int i = 0; i < data.length; i++){
      rect(xpos,0,width/((data.length+1)*2),height/max(data)*data[dvar]);
      xpos += width/(data.length+1);
      dvar += 1;
    }
  }
  else if(chart_type == "Pie"){
    strokeWeight(14);
    translate(width/2,height/2);
    cdeg = 0;
    for(int i = 0; i < 720; i++){
      cdeg += 1;
      rotate(0.5);
      totsf = 0;
      boolean chosen = false;
      for(int j = 0; j < data.length; j++){
        totsf += percentages.get(j)*7.2;
      if(totsf < cdeg && chosen == false){
        stroke(colors[j][0],colors[j][1],colors[j][2]);
        chosen = true;
      }
      }
      line(0,0,0,min(height,width)/2);
    }
  }
}