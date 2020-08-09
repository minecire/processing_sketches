int[] bag = {0,1,2,3,4,5,6,7};
void setup(){
  size(400,700);
  newbag();
}
void draw(){
  background(0);
  text(bag[0]+" "+bag[1]+" "+bag[2]+" "+bag[3]+" "+bag[4]+" "+bag[5]+" "+bag[6]+" ",200,200);
}
void newbag(){
  for(int i = 0; i < 7; i++){
    bag[i] = -1;
  }
  for(int i = 0; i < 7; i++){
  int k = 0;
  while(k < 7){
  bag[i] = floor(random(1,8));
  for(int j = 0; j < 7; j++){
  if(bag[i] == bag[j] && i != j){
    bag[i] = floor(random(1,8));
  }
  else{
    if(k == j-1){
      k = j;
    }
  }
  }
  }
}