String[] nouns_things = {"cat","dog","lamp","air","breath","bear","ice","hair","monster","fog","apple","banana","car","lock","rock","lavender","pie"};
String[] nouns_places = {"Jupiter","Mars","downtown","inside","outside","store","there","nowhere","store","home"};
String[] verbs = {"speak","eat","sleep","walk","run","breathe","think","Skype",""};
String[] adverbs = {"creatively","hilariously","swiftly","quickly","slowly"};
String[] adjectives_colors = {"blue","green","red","yellow","orange","pink","gray","black","white","purple"};
String[] adjectives_other = {"big","small","hot","cold","bright","dark","long","short"};
String[] other = {"the","and","it","are","is","he","she","they","you"};
String[] punctuation = {",",".","!","?","(",")"};
String[] p;

String[] poem(int lines){
  String[] Poem = new String[lines];
  for(int i = 0; i < lines; i++){
    Poem[i] = "";
    for(int j = 0; j < random(5,15); j++){
      int type = floor(random(1,9));
      if(type == 1){
        int which = floor(random(1,nouns_things.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + nouns_things[which-1];
      }
      if(type == 2){
        int which = floor(random(1,nouns_places.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + nouns_places[which-1];
      }
      if(type == 3){
        int which = floor(random(1,verbs.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + verbs[which-1];
      }
      if(type == 4){
        int which = floor(random(1,adverbs.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + adverbs[which-1];
      }
      if(type == 5){
        int which = floor(random(1,adjectives_colors.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + adjectives_colors[which-1];
      }
      if(type == 6){
        int which = floor(random(1,adjectives_other.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + adjectives_other[which-1];
      }
      if(type == 7){
        int which = floor(random(1,other.length+1));
        Poem[i] = Poem[i] + " ";
        Poem[i] = Poem[i] + other[which-1];
      }
      if(type == 8){
        int which = floor(random(1,punctuation.length+1));
        Poem[i] += punctuation[which-1];
      }
    }
  }
  return(Poem);
}
void setup(){
  size(600,600);
  p = poem(floor(random(3,15)));
  for(int i = 0; i < p.length; i++){
    print(p[i]);
  }
  print(" ");
}
void draw(){
  background(0);
  for(int i = 0; i < p.length; i++){
    text(p[i],50,50+i*20);
  }
}
void keyPressed(){
  if(key == ' '){
    p = poem(floor(random(3,15)));
  }
  for(int i = 0; i < p.length; i++){
    print(p[i]);
  }
  print(" ");
  print(" ");
}