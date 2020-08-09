String word = "readers";
String function = "+";


IntList lettervals;
void setup(){
  size(400,400);
  lettervals = new IntList();
  for(int i = 0; i < word.length(); i++){
    char letter = word.charAt(i);
    float temp = float(letter);
    lettervals.append(int(temp)-96);
  }
  
}
void draw(){
  background(0);
  fill(255,255,0);
  if(function == "+"){
    int num = 0;
    for(int i = 0; i < lettervals.size(); i++){
      num += lettervals.get(i);
    }
    text(num,200,200);
  }
  else if(function == "*" || function == "x"){
    int num = 0;
    for(int i = 0; i < lettervals.size(); i++){
      num += lettervals.get(i);
    }
    text(num,200,200);
  }
}