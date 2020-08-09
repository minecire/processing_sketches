int[][] colors = new int[50][50];
int startTime = -1;
int endTime = -1;
float x = 0;
float y = 0;
float zoom = 1;
void setup(){
  size(500,500);
  for(int i = 0; i < colors.length; i++){
    for(int j = 0; j < colors[i].length; j++){
      colors[i][j] = floor(random(1,8));
    }
  }
}
void draw(){
  if(keyPressed && keyCode == LEFT){
    x += 2/zoom;
  }
  if(keyPressed && keyCode == RIGHT){
    x -= 2/zoom;
  }
  if(keyPressed && keyCode == DOWN){
    y += 2/zoom;
  }
  if(keyPressed && keyCode == UP){
    y -= 2/zoom;
  }
  if(keyPressed && key == '-'){
    zoom /= 1.2;
  }
  if(keyPressed && key == '='){
    zoom *= 1.2;
  }
  background(51);
  strokeWeight(width/colors.length*0.9*zoom);
  fall();
  boolean lose = true;
  for(int i = 0; i < colors.length; i++){
    for(int j = 0; j < colors[i].length; j++){
      if(colors[i][j] == 0){
        stroke(51);
      }
      if(colors[i][j] == 1){
        stroke(255,0,0);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(255,128,128);
      }
      }
      if(colors[i][j] == 2){
        stroke(0,0,255);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(128,128,255);
      }
      }
      if(colors[i][j] == 3){
        stroke(0,255,0);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(128,255,128);
      }
      }
      if(colors[i][j] == 4){
        stroke(0,255,255);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(128,255,255);
      }
      }
      if(colors[i][j] == 5){
        stroke(255,255,0);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(255,255,128);
      }
      }
      if(colors[i][j] == 6){
        stroke(255,128,0);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(255,192,128);
      }
      }
      if(colors[i][j] == 7){
        stroke(255,0,255);
        if(
      i == floor(((mouseX/zoom-x)*colors.length/width))&&
      j == floor(((mouseY/zoom-y)*colors[i].length/height))
      ){
        stroke(255,128,255);
      }
      }
      point(((i+0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom);
      if(i > 0 && colors[i-1][j] == colors[i][j] && colors[i][j] > 0){
        lose = false;
        line(((i+0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom,((i-0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom);
      }
      if(i < colors.length-1 && colors[i+1][j] == colors[i][j] && colors[i][j] > 0){
        lose = false;
        line(((i+0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom,((i+1.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom);
      }
      if(j > 0 && colors[i][j-1] == colors[i][j] && colors[i][j] > 0){
        lose = false;
        line(((i+0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom,((i+0.5)*width/colors.length+x)*zoom,((j-0.5)*height/colors[0].length+y)*zoom);
      }
      if(j < colors[i].length-1 && colors[i][j+1] == colors[i][j] && colors[i][j] > 0){
        lose = false;
        line(((i+0.5)*width/colors.length+x)*zoom,((j+0.5)*height/colors[0].length+y)*zoom,((i+0.5)*width/colors.length+x)*zoom,((j+1.5)*height/colors[0].length+y)*zoom);
      }
    }
  }
  if(lose == true){
    if(endTime < 1){
      endTime = millis();
    }
    background(51);
    fill(255);
    textSize(50);
    int left = 0;
    for(int i = 0; i < colors.length; i++){
      for(int j = 0; j < colors[i].length; j++){
        if(colors[i][j] != 0){
          left++;
        }
      }
    }
    if(left > 0){
    text("You Lose!",50,200);
    textSize(20);
    text("Tiles Left: "+left,20,250);
    text("Tiles Broken: "+str(colors.length*colors[0].length-left),20,270);
    text("Time: "+(endTime-startTime)/1000.0,20,290);
    }
    else{
      text("You Win!",50,200);
      textSize(20);
      text("Time: "+(endTime-startTime)/1000.0,20,250);
    }
  }
}
void mouseReleased(){
  if(startTime < 0){
    startTime = millis();
  }
  ClearBoxes(true,0,0,0);
}
void ClearBoxes(boolean start,int i,int j, int col){
  if(start){
  i = floor(((mouseX/zoom-x)*colors.length/width));
  if(i < colors.length){
  j = floor(((mouseY/zoom-y)*colors[i].length/height));
  if(j < colors[i].length){
  if(colors[i][j] != 0){
  col = colors[i][j];
  }
  else{
    col = 8;
  }
  }
  }
  }
  else{
    colors[i][j] = 0;
  }
  if(i < colors.length && j < colors[i].length){
  if(i > 0 && colors[i-1][j] == col){
       colors[i][j] = 0;
       ClearBoxes(false,i-1,j,col);
   }
   if(i < colors.length-1 && colors[i+1][j] == col){
     colors[i][j] = 0;
     ClearBoxes(false,i+1,j,col);
   }
   if(j > 0 && colors[i][j-1] == col){
     colors[i][j] = 0;
     ClearBoxes(false,i,j-1,col);
   }
   if(j < colors[i].length-1 && colors[i][j+1] == col){
    colors[i][j] = 0;
    ClearBoxes(false,i,j+1,col);
  }
  }
}
void fall(){
  for(int i = 0; i < colors.length; i++){
    for(int j = 1; j < colors[i].length; j++){
      if(colors[i][j] == 0){
        colors[i][j] = colors[i][j-1];
        colors[i][j-1] = 0;
      }
    }
  }
  for(int i = 0; i < colors.length-1; i++){
    boolean move = true;
    for(int j = 0; j < colors[i].length; j++){
      if(colors[i][j] != 0){
        move = false;
      }
    }
    if(move){
      for(int j = 0; j < colors[i].length; j++){
        colors[i][j] = colors[i+1][j];
        colors[i+1][j] = 0;
      }
    }
  }
}