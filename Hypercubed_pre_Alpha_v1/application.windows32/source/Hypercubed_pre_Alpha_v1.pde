float r = 0;
Dselection Select;
ArrayList<world> clevel = new ArrayList<world>();
ArrayList<level> levels = new ArrayList<level>();
IntList current;
int x = 0;
int y = 0;
float xv = 0;
float yv = 0;
int cnum = 0;
int lnum = 0;
int z = 50;
int min_z = 0;
int endx;
int endy;
int endz;
int stime;
int ftime;
int ttime;
int etime;
int completed = 0;
boolean jump;
boolean now;
boolean fall;
boolean en = false;
boolean running = false;
boolean pages = true;
boolean help = false;
float v = 0;
void setup(){
  Select = new Dselection();
  current = new IntList();
  fullScreen(P3D);
  background(100);
  for(int i = -3; i < 4; i++){
    for(int j = -3; j < 4; j++){
      for(int k = -3; k < 1; k++){
        cube(i,j,k);
      }
    }
  }
  //cube(x,y,z) [note: z is the vertical axis]
  //addc() will create a new world and add that world to the array. The world will have
  //a 7x7x3 area of ground in the center, from (-3,-3,-3) to (3,3,0).
  
  cube(2,0,1);  //create a cube at x = 2, y = 0, and z = 1
  cube(0,0,4);  //create a cube at x = 0, y = 0, and z = 4
  cube(0,3,4);  //create a cube at x = 0, y = 3, and z = 4
  cube(3,3,5);  //create a cube at x = 3, y = 3, and z = 5
  cube(5,4,6);  //create a cube at x = 5, y = 4, and z = 6
  cube(5,3,8);  //create a cube at x = 5, y = 3, and z = 8
  cube(5,3,14); //create a cube at x = 5, y = 3, and z = 14
  addc();       //add that world and begin a new one
  cube(5,3,8);  //create a cube at x = 5, y = 3, and z = 8
  cube(5,4,10); //create a cube at x = 5, y = 4, and z = 10
  addc();       //add the world and begin a new one
  //[note: the world that is begun must be added or it will be deleted]
  //these set the x, y, and z positions of the end cube
  endset(5,7,11);   //set the z of the end cube to 11
  addl();
  cube(0,-2,3);  //create a cube at x = 2, y = 0, and z = 1
  cube(0,-4,6);  //create a cube at x = 0, y = 0, and z = 4
  cube(0,-6,9);  //create a cube at x = 0, y = 3, and z = 4
  cube(0,-8,12); //create a cube at x = 5, y = 3, and z = 14
  for(int i = -3; i < 4; i++){
    for(int j = 1;j < 6; j++){
      cube(i,3,j);
    }
  }
  addc();       //add that world and begin a new one
  cube(0,-8,-21);  //create a cube at x = 2, y = 0, and z = 1
  cube(0,-5,-18);  //create a cube at x = 0, y = 0, and z = 4
  cube(0,-2,-15);  //create a cube at x = 0, y = 3, and z = 4
  cube(0,1,-12); //create a cube at x = 5, y = 3, and z = 14
  for(int i = -3; i < 4; i++){
    for(int j = 1;j < 6; j++){
      cube(i,3,j);
    }
  }
  addc();       //add that world and begin a new one
  cube(0,4,-9);  //create a cube at x = 5, y = 3, and z = 8
  cube(0,7,-6);  //create a cube at x = 5, y = 3, and z = 8
  cube(0,10,-3); //create a cube at x = 5, y = 4, and z = 10
  endset(0,13,1);
  for(int i = -3; i < 4; i++){
    for(int j = 1;j < 6; j++){
      cube(i,3,j);
    }
  }
  addc();
  addl();
  cube(0,0,3);
  addc();
  cube(0,0,6);
  addc();
  cube(0,0,9);
  addc();
  cube(0,0,12);
  addc();
  endset(0,0,17);
  addl();
  cube(0,10,0);
  cube(0,15,0);
  cube(0,17,0);
  addc();
  cube(0,5,0);
  cube(0,7,0);
  cube(0,12,0);
  addc();
  endset(0,17,5);
  addl();
  block(-3,5,1,3,5,1);
  addc();
  block(-3,8,2,3,8,2);
  addc();
  block(-3,14,4,3,14,4);
  addc();
  block(-3,11,3,3,11,3);
  addc();
  endset(0,15,4);
  addl();
  block(5,-2,0,9,2,0);
  block(3,-3,2,3,3,8);
  addc();
  block(6,-2,1,10,2,1);
  block(3,-3,2,3,3,8);
  addc();
  block(7,-2,2,11,2,2);
  block(3,-3,2,3,3,8);
  addc();
  block(6,-2,3,10,2,3);
  block(3,-3,2,3,3,8);
  addc();
  endset(8,0,8);
  addl();
  //[note: the world that is begun must be added or it will be deleted]
  //these set the x, y, and z positions of the end cub
  Select = new Dselection();
  Select.makePages();
}
void cube(int x, int y, int z){
  //add the x, y and z coordinates to the current world array
  current.append(x);
  current.append(y);
  current.append(z);
  if(z < min_z){
    min_z = z;
  }
}
void block(int x1, int y1, int z1, int x2, int y2, int z2){
  for(int i = x1; i < x2+1; i++){
    for(int j = y1; j < y2+1; j++){
      for(int k = z1; k < z2+1; k++){
        cube(i,j,k);
      }
    }
  }
}
void endset(int x, int y, int z){
  endx = x;
  endy = y;
  endz = z;
}
void addc(){
  //create a new world object
  world w = new world();
  //set the current array as the array in that world
  w.s(current);
  //add that world to the universe ArrayList
  clevel.add(w);
  //Reset the current world array
  current = new IntList();
  //Some loops to fill in the block at the bottom of the screen
  block(-3, -3, -3, 3, 3, 0);
}
void addl(){
  //create a new world object
  level l = new level();
  //set the current array as the array in that world
  l.s(clevel,endx,endy,endz);
  //add that world to the universe ArrayList
  levels.add(l);
  //Reset the current world array
  clevel = new ArrayList<world>();
  endx = 0;
  endy = 7;
  endz = 1;
}
void draw(){
  if(pages == false){
  if(lnum < levels.size()){
    clevel = levels.get(lnum).places;
    endx = levels.get(lnum).endx;
    endy = levels.get(lnum).endy;
    endz = levels.get(lnum).endz;
  }
  if(en == true){
    etime = millis()-ttime;
  }
  pushMatrix();
  lights();
  current = clevel.get(cnum).places;
  noStroke();
  fill(100);
  background(51);
  translate(width/2,height/2);
  rotateX(1);
  rotateY(0.2);
  rotateZ(-PI/2);
  translate(-x,-y,-z);
  if(mousePressed){
    r = mouseX/100;
  }
  for(int i = 0; i < current.size()/3; i++){
    pushMatrix();
    translate(current.get(i*3)*30,current.get(i*3+1)*30,current.get(i*3+2)*30);
    box(30);
    popMatrix();
  }
  pushMatrix();
  translate(endx*30,endy*30,endz*30);
  fill(0,255,0);
  box(30);
  popMatrix();
  translate(x,y,z);
  fill(0,30,150);
  noStroke();
  sphere(15);
  if(keyPressed){
    if(key == CODED){
      if(keyCode == UP){
        xv += 0.5;
        if(running == false){
        running = true;
        stime = millis();
        }
      }
      if(keyCode == DOWN){
        xv -= 0.5;
        if(running == false){
        running = true;
        stime = millis();
      }
      }
      if(keyCode == RIGHT){
        yv += 0.5;
        if(running == false){
        running = true;
        stime = millis();
      }
      }
      if(keyCode == LEFT){
        yv -= 0.5;
        if(running == false){
        running = true;
        stime = millis();
      }
      }
    }
    if(key == ' ' && jump == false){
      jump = true;
      now = true;
      v = 10;
      if(running == false){
        running = true;
        stime = millis();
      }
    }
  }
  if(bcontact()){
    v = -v;
    fall();
    v += 2;
  }
  if(contact() && now == false){
    jump = false;
    fall = false;
    z = round(z/30)*30;
    while(econtact()){
      z += 30;
    }
  }
  else if(jump == false){
    fall();
    if(fall == false){
      fall = true;
    v=0;
    }
  }
  x += xv;
  if(econtact()){
    x -= xv;
  }
  y += yv;
  if(econtact()){
    y -= yv;
  }
  yv = 0.9*yv;
  xv = 0.9*xv;
  if(jump == true){
    fall();
  }
  if(now == true){
    now = false;
  }
  if(z < (min_z)*30 || (en == true && keyPressed)){
    z = 30;
    x = 0;
    y = 0;
    v = 0;
    fall = false;
    running = false;
    cnum = 0;
    if(etime > 500){
      en = false;
    }
    xv = 0;
    yv = 0;
  }
  fill(255);
  popMatrix();
  if(running == true){
  textSize(width/10);
  text((millis()-stime)/1000.0,50,width/10+50);
  }
  if(lnum >= levels.size()){
    background(51);
    ttime = millis();
    ftime = millis()-stime;
    x = 0;
    y = 0;
    z = 0;
    en = true;
  }
  if(en){
    background(51);
    textSize(30);
    text("You Win!",50,50);
    ftime = 0;
    for(int i = 0; i < levels.size(); i++){
      ftime += levels.get(i).time;
    }
    text("Your final time was: "+ftime/1000.0,50,100);
    text("Press any key to restart",50,150);
    text("Times:",50,200);
    for(int i = 0; i < levels.size(); i++){
      text("Level #"+(i+1)+": "+levels.get(i).time/1000.0,50,250+i*50);
    }
    //text(etime,50,200);
    if(keyPressed){
      lnum = 0;
      cnum = 0;
      x = 0;
      y = 0;
      z = 0;
      
    }
  }
  if(endcontact()){
    levels.get(lnum).end(millis()-stime);
    x = 0;
    y = 0;
    z = 0;
    pages = true;
  }
  }
  else{
    background(51);
    if(!help){
    Select.drawS(Select.current);
    Select.pages.get(Select.current).checkClick();
    Select.next();
    Select.prev();
    fill(255,50);
    if(mouseX < 55 && mouseX > 5 && mouseY < 55 && mouseY > 5){
      fill(255,100);
    }
    rect(5,5,50,50);
    fill(0);
    textSize(30);
    text("?",22,40);
    }
    else{
      fill(255,50);
    if(mouseX < 55 && mouseX > 5 && mouseY < 55 && mouseY > 5){
      fill(255,100);
    }
    rect(5,5,50,50);
    fill(0);
    textSize(30);
    text("<",20,36);
    textSize(width/20);
    text("How to Play:",width/4,height/8);
    textSize(20);
    text("Left arrow - move left",width/8,height/6);
    text("Right arrow - move right",width/8,height/6+20);
    text("Up arrow - move forward",width/8,height/6+40);
    text("Down arrow - move backward",width/8,height/6+60);
    text("Space - jump",width/8,height/6+80);
    text("A - Move through the fourth dimension",width/8, height/6+100);
    text("D - Move through the fourth dimension in the opposite direction",width/8, height/6+120);
    }
  }
  
}
boolean contact(){
  for(int i = 0; i < current.size()/3; i++){
    if(x >= current.get(3*i)*30-30 && x <= current.get(3*i)*30+30 && y >= current.get(3*i+1)*30-30 && y <= current.get(3*i+1)*30+30 && z >= current.get(3*i+2)*30-30 && z <= current.get(3*i+2)*30+30){
      return(true);
    }
  }
  return(false);
}
boolean bcontact(){
  for(int i = 0; i < current.size()/3; i++){
    if(x > current.get(3*i)*30-30 && x < current.get(3*i)*30+30 && y > current.get(3*i+1)*30-30 && y < current.get(3*i+1)*30+30 && z >= current.get(3*i+2)*30-30 && z < current.get(3*i+2)*30){
      return(true);
    }
  }
  return(false);
}
boolean endcontact(){
  if(x >= endx*30-30 && x <= endx*30+30 && y >= endy*30-30 && y <= endy*30+30 && z >= endz*30-30 && z <= endz*30+30){
    return(true);
  }
  return(false);
}
boolean econtact(){
  for(int i = 0; i < current.size()/3; i++){
    if(x >= current.get(3*i)*30-30 && x <= current.get(3*i)*30+30 && y >= current.get(3*i+1)*30-30 && y <= current.get(3*i+1)*30+30 && z > current.get(3*i+2)*30-30 && z < current.get(3*i+2)*30+30){
      return(true);
    }
  }
  return(false);
}
void fall(){
  z += v;
  v -= 0.5;
}
void keyPressed(){
  if(key == 'a' && cnum > 0){
    cnum -= 1;
  }
  else if(key == 'd' && cnum < clevel.size()-1){
    cnum += 1;
  }
}
void mousePressed(){
  if(mouseX < 55 && mouseX > 5 && mouseY < 55 && mouseY > 5 && pages){
    help = !help;
  }
}