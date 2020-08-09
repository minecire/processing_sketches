char current = ' ';
String total = "";
StringList code;
void setup(){
  code = new StringList();
  fullScreen();
}
void draw(){
  background(50);
  fill(255);
  rect(20,20,width/3,height-40);
  putcode();
}
void keyPressed(){
  fill(255);
  if(key != ';' && key != 8 && key != 127 && key != '￿' && !(key == ENTER || key == RETURN)){
    current = key;
    total+=current;
  }
  else if(key == ';' || (key == ENTER || key == RETURN)){
    if(key == ';'){
    code.append(total+';');
    }
    else{
      code.append(total);
    }
    total = "";
  }
  else if(key == 8 || key == 127){
    if(total.length() > 0){
      total=total.substring(0,total.length()-1);
    }
  }
  char x = 13;
  print(x);
}
void putcode(){
  fill(0);
  for(int i = 0; i < code.size(); i++){
    fill(0);
    if(code.get(i).length() > 0){
    if(code.get(i).charAt(0) == '$'){
      fill(150);
    }
    }
    text(code.get(i),35,i*15+40);
  }
  fill(0);
  if(total.length() > 0){
  if(total.charAt(0) == '$'){
    fill(150);
  }
  }
  text(total,35,code.size()*15+40);
}
String readline(int num){
  String C = code.get(num);
  if(C.charAt(0) != '$'){
    if(C.charAt(C.length()-1) != ';' && C.charAt(C.length()-1) != '{'){
      return("Error");
    }
    else{
      if(C.charAt(0) == 'c'){
        if(C.charAt(1) == 'o' && C.charAt(2) == 'n'){
          if(C.charAt(3) == '.'){
            //con. commands
          }
          else if(C.charAt(3) == 's' && C.charAt(4) == 't' && C.charAt(5) == '.'){
            //const. commands
          }
        }
        else{
          return("Error");
        }
      }
      else if(C.charAt(0) == 's'){
        if(C.charAt(1) == 'y' && C.charAt(2) == 's' && C.charAt(3) == '.'){
          //sys. commands
        }
        else{
          return("Error");
        }
      }
      else if(C.charAt(0) == 'o'){
        if(C.charAt(1) == 'u' && C.charAt(2) == 't' && C.charAt(3) == '.'){
          //out. commands
        }
      }
      else if(C.charAt(0) == 'm'){
        if(C.charAt(1) == '.'){
          //m. commands
        }
        else{
          return("Error");
        }
      }
      else if(C.charAt(0) == 'g'){
        if(C.charAt(1) == 'x' && C.charAt(2) == '.'){
          //gx. commands
        }
        else{
          return("Error");
        }
      }
      else{
        return("Error");
      }
    }
  }
  else{
    return("");
  }
}