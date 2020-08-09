IntList Image1a;
IntList Image1b;
IntList Image2a;
IntList Image2b;
IntList Image3a;
IntList Image3b;
IntList Image4a;
IntList Image4b;
IntList Image5a;
IntList Image5b;
IntList Image6a;
IntList Image6b;
IntList Image7a;
IntList Image7b;
IntList Image8a;
IntList Image8b;
IntList scores;
int editing = 0;
void setup(){
  size(1200,800);
  Image1a = new IntList();
  Image1b = new IntList();
  Image2a = new IntList();
  Image2b = new IntList();
  Image3a = new IntList();
  Image3b = new IntList();
  Image4a = new IntList();
  Image4b = new IntList();
  Image5a = new IntList();
  Image5b = new IntList();
  Image6a = new IntList();
  Image6b = new IntList();
  Image7a = new IntList();
  Image7b = new IntList();
  Image8a = new IntList();
  Image8b = new IntList();
  scores = new IntList();
  Image1a = newdna();
  Image2a = newdna();
  Image3a = newdna();
  Image4a = newdna();
  Image5a = newdna();
  Image6a = newdna();
  Image7a = newdna();
  Image8a = newdna();
  for(int i = 0; i < 8; i++){
    scores.append(0);
  }
}
void draw(){
  translate(75,100);
  background(0);
  makeimg(Image1a);
  translate(300,0);
  makeimg(Image2a);
  translate(300,0);
  makeimg(Image3a);
  translate(300,0);
  makeimg(Image4a);
  translate(-975,300);
  translate(75,0);
  makeimg(Image5a);
  translate(300,0);
  makeimg(Image6a);
  translate(300,0);
  makeimg(Image7a);
  translate(300,0);
  makeimg(Image8a);
  translate(-975,-400);
  fill(255);
  for(int i = 0; i < 8; i++){
    if(i < 4){
      text(scores.get(i),150+i*300,350);
    }
    else{
      text(scores.get(i),150+(i-4)*300,700);
    }
  }
  text(editing, 50,50);
}
void makeimg(IntList dna){
  for(int i = 0; i < dna.size(); i++){
    if(dna.get(i) == 1 && dna.size() > i+10){
      fill(dna.get(i+1),dna.get(i+2),dna.get(i+3));
      stroke(dna.get(i+4),dna.get(i+5),dna.get(i+6));
      rect(dna.get(i+7),dna.get(i+8),dna.get(i+9),dna.get(i+10));
      i+=10;
    }
    else if(dna.get(i) == 2 && dna.size() > i+12){
      fill(dna.get(i+1),dna.get(i+2),dna.get(i+3));
      stroke(dna.get(i+4),dna.get(i+5),dna.get(i+6));
      triangle(dna.get(i+7),dna.get(i+8),dna.get(i+9),dna.get(i+10),dna.get(i+11),dna.get(i+12));
      i+=12;
    }
    else if(dna.get(i) == 3 && dna.size() > i+10){
      fill(dna.get(i+1),dna.get(i+2),dna.get(i+3));
      stroke(dna.get(i+4),dna.get(i+5),dna.get(i+6));
      ellipse(dna.get(i+7),dna.get(i+8),dna.get(i+9),dna.get(i+10));
      i+=10;
    }
  }
}
IntList newdna(){
  IntList Image5;
  Image5 = new IntList();
  for(int i = 0; i < 50; i++){
    Image5.append(ceil(random(3)));
      for(int j = 0; j < 6; j++){
        Image5.append(round(random(0,255)));
      }
      if(Image5.get(Image5.size()-7) == 1 || Image5.get(Image5.size()-7) == 3){
      for(int j = 0; j < 2; j++){
        Image5.append(round(random(200)));
      }
      for(int j = 0; j < 2; j++){
        Image5.append(round(random(0,200-Image5.get(Image5.size()-2))));
      }
    }
    else if(Image5.get(Image5.size()-7) == 2){
      for(int j = 0; j < 6; j++){
        Image5.append(round(random(0,200)));
      }
    }
  }
  return(Image5);
}
void mousePressed(){
  if(editing != 0){
    editing = 0;
  }
  else{
    if(mouseY < 400){
      editing = round(mouseX/300)+1;
    }
    else{
      editing = round(mouseX/300)+5;
    }
    scores.set(editing-1, 0);
  }
}
void keyPressed(){
  if(key >= 48 && key < 58 && editing > 0){
    scores.set(editing-1, scores.get(editing-1)*10+(key-48));
  }
  if(key == ' ' || key == 'i' || key == 's' || key == 'g'){
    iterate();
  }
}
void iterate(){
  int x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image1b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image1b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image1b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image1b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image1b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image1b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image1b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image1b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image1b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image1b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image1b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image1b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image1b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image1b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image1b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image1b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image2b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image2b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image2b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image2b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image2b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image2b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image2b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image2b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image3b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image3b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image3b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image3b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image3b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image3b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image3b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image3b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image4b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image4b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image4b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image4b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image4b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image4b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image4b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image4b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image5b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image5b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image5b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image5b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image5b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image5b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image5b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image5b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image6b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image6b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image6b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image6b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image6b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image6b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image6b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image6b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image7b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image7b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image7b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image7b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image7b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image7b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image7b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image7b = mutate(Image8a);
  }
  
  x = round(random(64));
  x = round(sqrt(x));
  if(scores.get(0) == x){
    Image8b = mutate(Image1a);
  }
  else if(scores.get(1) == x){
    Image8b = mutate(Image2a);
  }
  else if(scores.get(2) == x){
    Image8b = mutate(Image3a);
  }
  else if(scores.get(3) == x){
    Image8b = mutate(Image4a);
  }
  else if(scores.get(4) == x){
    Image8b = mutate(Image5a);
  }
  else if(scores.get(5) == x){
    Image8b = mutate(Image6a);
  }
  else if(scores.get(6) == x){
    Image8b = mutate(Image7a);
  }
  else if(scores.get(7) == x){
    Image8b = mutate(Image8a);
  }
  Image1a = Image1b;
  Image2a = Image2b;
  Image3a = Image3b;
  Image4a = Image4b;
  Image5a = Image5b;
  Image6a = Image6b;
  Image7a = Image7b;
  Image8a = Image8b;
}
IntList mutate(IntList old){
  IntList n = new IntList();
  for(int i = 0; i < old.size(); i++){
    n.append(old.get(i)+round(random(-1,1)));
    if(n.size() > 10 && n.get(n.size()-11) == 2){
    n.append(round(random(0,200-n.get(n.size()-2))));
    n.append(round(random(0,200-n.get(n.size()-2))));
  }
  }
  return(n);
}