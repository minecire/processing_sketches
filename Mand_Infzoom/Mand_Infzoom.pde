FloatList z0;
FloatList z1;
FloatList z21;
FloatList z31;
float ztot = 0.3;
float ztot2 = 0.3;
int tries = 0;
int x = 0;
int y = 0;
IntList X;
IntList Y;
IntList zoom;
FloatList xl1;
FloatList yl1;
IntList xl;
IntList yl;
void setup(){
  z21 = new FloatList();
  z31 = new FloatList();
  z0 = new FloatList();
  z1 = new FloatList();
  X = new IntList();
  Y = new IntList();
  xl1 = new FloatList();
  yl1 = new FloatList();
  xl = new IntList();
  yl = new IntList();
  zoom = new IntList();
  X.append(0);
  Y.append(0);
  zoom.append(1);
  frameRate(4000);
  size(1000,1000);
}
void draw(){
  for(int i = 0; i < 1; i++){
  if(x < 1000){
    x+=1;
  }
  else{
    x = 0;
    y+=1;
  }
  while(xl1.size() > 0){
    xl1.remove(0);
  }
  while(yl1.size() > 0){
    yl1.remove(0);
  }
  while(xl.size() > 0){
    xl.remove(0);
  }
  while(yl.size() > 0){
    yl.remove(0);
  }
  stroke(0);
  for(int j = 0; j < zoom.size() || j < X.size(); j++){
    if(j < X.size() && j < zoom.size()){
      xl1.append(zoom.get(j)*(x/250.0-2.0)+X.get(j));
    
    }
    else if(j < X.size()){
      xl1.append(X.get(j));
    }
    else{
      xl1.append(zoom.get(j)*(x/250.0-2.0));
    }
  }
  for(int j = 0; j < zoom.size() || j < Y.size(); j++){
    if(j < Y.size() && j < zoom.size()){
      yl1.append(zoom.get(j)*(y/250.0-2.0)+Y.get(j));
    }
    else if(j < Y.size()){
      yl1.append(Y.get(j));
    }
    else{
      yl1.append(zoom.get(j)*(y/250.0-2.0));
    }
  }
  for(int j = 0; j < xl1.size(); j++){
    xl.append(round(xl1.get(j)));
    for(int k = 1; k <= j; k++){
      xl.add(j,round(xl1.get(j-1)*pow(10,k)));
      for(int l = 1; l <= k; l++){
        xl.sub(j,int(round(xl1.get(j-1))*pow(10,l)));
      }
    }
  }
  for(int j = 1; j < 4; j++){
    xl.append(int(round((xl1.get(xl1.size()-1)*pow(10,j)))-round(xl1.get(xl1.size()-1)*pow(10,j-1))*10));
  }
  for(int j = 0; j < yl1.size(); j++){
    yl.append(round(yl1.get(j)));
    for(int k = 1; k <= j; k++){
      yl.add(j,round(yl1.get(j-1)*pow(10,k)));
      for(int l = 1; l <= k; l++){
        yl.sub(j,int(round(yl1.get(j-1))*pow(10,l)));
      }
    }
  }
  for(int j = 1; j < 4; j++){
    yl.append(int(round((yl1.get(yl1.size()-1)*pow(10,j)))-round(yl1.get(yl1.size()-1)*pow(10,j-1))*10));
  }
  fillp(xl,yl,x,y);
  }
}
void fillp(IntList xs,IntList ys, int xs2, int ys2){
  tries = 0;
  ztot = 0;
  while(z0.size() > 0){
    z0.remove(0);
  }
  while(z1.size() > 0){
    z1.remove(0);
  }
  z0.append(0.0);
  z1.append(0.0);
  tries = 0;
  stroke(0);
  while(ztot < 4 && tries < 1){
    while(z21.size() > 0){
    z21.remove(0);
    }
    while(z31.size() > 0){
    z31.remove(0);
    }
    
    for(int j = 0; j <= z0.size() || j <= z1.size() || j <= xs.size(); j++){
        if(xs.size() > j){
          z21.append(xs.get(j));
        }
        else{
          z21.append(0.0);
        }
        for(int k = 0; k <= z0.size() || k <= z1.size(); k++){
          
          if(z0.size() > k && z0.size() > j){
            z21.add(j,z0.get(j)*z0.get(k)/pow(10,k));
          }
          
          if(z1.size() > k && z1.size() > j){
            z21.sub(j,z1.get(j)*z1.get(k)/pow(10,k));
          }
          
        }
    }
    for(int j = 0; j <= z0.size() || j <= z1.size() || j <= ys.size(); j++){
        
        if(ys.size() > j){
          z31.append(float(ys.get(j)));
        }
        else{
          z31.append(0.0);
        }
        
        for(int k = 0; k <= z0.size() || k <= z1.size(); k++){
          if(z0.size() > k && z1.size() > k && z1.size() > j && z0.size() > j){
            z31.add(j,z0.get(j)*z1.get(k)*2.0/pow(10,k));
          }
        }
    }
  tries += 1;
  ztot = 0.0;
  ztot2 = 0.0;
  for(int j = 0; j < z21.size(); j++){
    ztot += z21.get(j)/pow(10.0,j);
  }
  for(int j = 0; j < z31.size(); j++){
    ztot2 += z31.get(j)/pow(10.0,j);
  }
  ztot *= ztot;
  ztot += ztot2*ztot2;
  z0 = z21;
  z1 = z31;
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
  /*  background(0);
    text(max(z0.size(),z1.size(),xs.size()),20,60);
    text(x/250.0-2.0,20,80);*/
}