IntList sold;
IntList kold;
IntList bnew;
int current = 0;
void setup(){
  size(400,400);
  sold = new IntList();
  kold = new IntList();
  bnew = new IntList();
  sold.append(0);
  kold.append(1);
  bnew.append(1);
}
void draw(){
  background(50);
  text("Which Number?",50,50);
  text(current,50,70);
  if(pow(10,bnew.size()) >= current && current > 0){
    while(sold.size() > 0){
      sold.remove(0);
    }
    while(kold.size() > 0){
      kold.remove(0);
    }
    while(bnew.size() > 0){
      bnew.remove(0);
    }
    sold.append(1);
    kold.append(1);
    for(int i = 0; i < current; i++){
      iterate();
    }
    for(int i = 0; i < bnew.size(); i++){
      text(bnew.get(i),50+i*15,90);
    }
  }
}
void keyPressed(){
  if(key >= 48 && key <= 58){
    current *= 10;
    current += key-48;
  }
}
void iterate(){
  sold = kold;
  kold = bnew;
  for(int i = 0; i < sold.size() || i < kold.size(); i++){
    if(i < sold.size() && i < kold.size()){
    bnew.set(i,kold.get(i)+sold.get(i));
    }
    else if(i < sold.size()){
      bnew.set(i,sold.get(i));
    }
    else{
      bnew.set(i,kold.get(i));
    }
  }
  for(int i = 0; i < bnew.size(); i++){
    if(bnew.get(bnew.size()-i-1) >= 10){
      if(i < bnew.size()-1){
        bnew.add(bnew.size()-i-2,1);
        bnew.sub(bnew.size()-i-1,10);
      }
      else{
        bnew.append(bnew.get(bnew.size()-1));
        for(int j = 0; j < bnew.size()-2; j++){
          bnew.set(bnew.size()-3-j,bnew.size()-2-j);
        }
        bnew.set(0,1);
        bnew.sub(1,10);
      }
    }
  }
}