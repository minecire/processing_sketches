int[] v;
int S = 4,w, x, t, e, P,W,H,m;
void setup(){
  size(1600,1000);
  W = width;
  H = height;
}
void draw(){
  m = floor(mouseY);
  if(P == 1){
    for(int k = 0; k < S*S; k++){
    for(int i = 0; i < S*S; i++){
      if(v[i] == 0){
        w = i;
      }
    }
    t = round(random(w-1,w+1));
    if(t >= S*S){
      t = S*S-1;
    }
    if(t < 0){
      t = 0;
    }
    x = round(random(0,1));
    if(x == 1){
      if(t == w-1 && w > S-1){
        t = w-S;
      }
      if(t == w+1 && w < S*(S-1)){
        t = w+S;
      }
    }
    if((t < S*S-1 && v[t+1] == 0 && t % S != S-1) || (t > 0 && v[t-1] == 0 && t % S != 0) || (t < S*(S-1) && v[t+S] == 0) || (t > S-1 && v[t-S] == 0)){
    w = v[t];
    x = 0;
    for(int i = 0; i < S; i++){
      for(int j = 0; j < S; j++){
        if(v[i+S*j] == 0){
          x = i+S*j;
        }
      }
    }
    v[t] = 0;
    v[x] = w;
  }
  }
  }
  if(P == 0){
    background(0,0,255);
    fill(0,255,0);
    noStroke();
    rect(0,0,W,H/6);
    fill(255,0,0);
    rect(0,5*H/6,W,H/6);
    fill(0);
    textSize(50);
    text("Put The Size Here: "+S,50,H/12+12);
    text("Begin",50,11*H/12);
    if(mousePressed){
      if(m < H/6){
        e = 1;
        S = 0;
      }
      else{
        e = 0;
        if(m > 5*H/6){
          v = new int[S*S];
          for(int i = 0; i < S*S-1; i++){
            v[i] = i+1;
          }
          v[S*S-1] = 0;
          P = 1;
        }
      }
    }
  }
  else{
    for(int i = 0; i < S; i++){
      for(int j = 0; j < S; j++){
        if(v[i+j*S] == 0){
          noStroke();
          fill(50);
        }
        else{
          stroke(200,0,0);
          fill(100);
          strokeWeight(80/S);
        }
        rect(i*W/S,j*H/S,W/S,H/S);
        if(v[i+j*S] != 0){
          fill(255);
          textSize(180/S);
          text(v[i+j*S],(i+0.5)*W/S-90/S,(j+0.5)*H/S+90/S);
        }
      }
    }
  }
}
void keyPressed(){
  if(e == 1){
    if(key >= 48 && key < 58){
      S *= 10;
      S += key-48;
    }
  }
  if(P == 2 && key == 'r'){
    P = 1;
  }
}
void mousePressed(){
  if(P == 2){
      t = floor(mouseX*S/W)+S*floor(m*S/H);
      if((t < S*S-1 && v[t+1] == 0 && t % S != S-1) || (t > 0 && v[t-1] == 0 && t % S != 0) || (t < S*(S-1) && v[t+S] == 0) || (t > S-1 && v[t-S] == 0)){
    w = v[t];
    x = 0;
    for(int i = 0; i < S; i++){
      for(int j = 0; j < S; j++){
        if(v[i+S*j] == 0){
          x = i+S*j;
        }
      }
    }
    v[t]=0;
    v[x] = w;
  }
  }
  else if(P == 1){
    P = 2;
  }
}