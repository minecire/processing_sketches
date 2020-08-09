void mBug(int Dir){
  Bug[2] = Bug[3];
  Bug[3] = Dir;
  for(int i = 0; i < 4; i++){
    if(Bug[2] != (i) % 4 && Bug[3] != (i-2) % 4){
      Cells[Bug[0]][Bug[1]][i] = true;
    }
  }
  if(Bug[3] == 0){
    Bug[1] -= 1;
  }
  if(Bug[3] == 1){
    Bug[0] += 1;
  }
  if(Bug[3] == 2){
    Bug[1] += 1;
  }
  if(Bug[3] == 3){
    Bug[0] -= 1;
  }
}