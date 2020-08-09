PImage background;
PImage NPC;
FloatList NPCCoords;
void setup(){
  NPCCoords = new FloatList();
  size(1024,576);
  background = loadImage("Lemonade BG.png");
  NPC = loadImage("Character.png");
  newNPC();
}
void draw(){
  image(background,0,0);
  updateNPC();
  for(int i = 0; i < 10; i++){
    newNPC();
  }
}
void newNPC(){
  NPCCoords.append(((random(pow(width,2))/width)+width/2)%width);
  NPCCoords.append(((random(pow(height,2))/height)+height/2)%height);
}
void updateNPC(){
  for(int i = 0; i < NPCCoords.size(); i++){
    NPCCoords.add(i,random(-5,5));
    if(NPCCoords.get(i) < 0){
      NPCCoords.set(i,0);
    }
    if(i % 2 == 0){
    if(NPCCoords.get(i) > width){
      NPCCoords.set(i,width);
    }
    }
    else{
      if(NPCCoords.get(i) > height){
        NPCCoords.set(i,height);
      }
    }
  }
  for(int i = 0; i < NPCCoords.size()/2; i++){
    image(NPC,NPCCoords.get(i*2),NPCCoords.get(i*2+1));
  }
}