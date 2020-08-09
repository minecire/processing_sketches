IntList blobs;
IntList connects;
boolean n;
int text = -1;
StringList texts;
void setup(){
  blobs = new IntList();
  texts = new StringList();
  connects = new IntList();
  size(1000,1000);
  background(0);
  fill(128);
  noStroke();
}
void makeCons(){
  for(int i = 0; i < floor(connects.size()/4); i++){
     stroke(250);
     line(connects.get(i*4),connects.get(i*4+1),connects.get(i*4+2),connects.get(i*4+3));
  }
}
void makeBlobs(){
  background(0);
  for(int i = 0; i < blobs.size()/2; i++){
    fill(128);
    if(mouseX < blobs.get(i*2)+25 && mouseX > blobs.get(i*2)-25 && mouseY > blobs.get(i*2+1)-25 && mouseY < blobs.get(i*2+1)+25){
      ellipse(blobs.get(i*2),blobs.get(i*2+1),70,70);
      fill(255);
      text(texts.get(i),blobs.get(i*2)-20,blobs.get(i*2+1)-20);
      if(key == 'd'){
        blobs.remove(i*2);
        blobs.remove(i*2);
        texts.remove(i);
      }
      if(key == 't' && text == -1){
        text = i;
      }
      if(key == 'c'){
        
        connects.append(blobs.get(i*2));
        connects.append(blobs.get(i*2+1));
        
      }
      if(mousePressed){
        blobs.set(i*2,mouseX);
        blobs.set(i*2+1,mouseY);
      }
    }
    else{
      ellipse(blobs.get(i*2),blobs.get(i*2+1),40,40);
    }
  }
  key = 0;
}
void draw(){
  makeBlobs();
  makeCons();
  if(mousePressed){
    n = true;
    for(int i = 0; i < blobs.size()/2; i++){
      if(blobs.get(2*i) == mouseX && blobs.get(2*i+1) == mouseY){
        n = false;
      }
    }
    if(n == true){
      blobs.append(mouseX);
      blobs.append(mouseY);
      texts.append("");
      
    }
  }
  stroke(128);
  if(text != -1){
    if(key == '+'){
      text = -1;
    }
    else if(keyPressed){
      texts.set(text,texts.get(text)+key);
    }
  }
}