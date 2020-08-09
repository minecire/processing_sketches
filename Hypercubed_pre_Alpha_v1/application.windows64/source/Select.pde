class Dselection{
  int size = levels.size();
  int current = 0;
  int goN;
  int goP;
  int goNS;
  int goPS;
  ArrayList<page> pages = new ArrayList(); 
  void makePages(){
  for(int i = 0; i < size/20.0; i++){
    page p = new page();
    p.setNum(i);
    if(i == ceil(size/20.0-1)){
      p.setSize(size % 20);
    }
    else{
      p.setSize(20);
    }
    pages.add(p);
    println(p.size);
  }
}
void drawS(int num){
  pages.get(num).drawStuff();
}
void next(){
  if(mouseX > width-30){
    goN += 1;
    if(goN > goNS){
      if(current < pages.size()-1){
        current += 1;
        goN = 0;
        goNS *= 0.8;
      }
    }
  }
  else{
    goN = 0;
    goNS = 20;
  }
}
void prev(){
  if(mouseX < 10){
    goP += 1;
    if(goP > goPS){
      if(current > 0){
        current -= 1;
        goP = 0;
        goPS *= 0.8;
      }
    }
  }
  else{
    goP = 0;
    goPS = 20;
  }
}
}