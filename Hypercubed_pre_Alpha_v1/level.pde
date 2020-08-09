class level{
  ArrayList<world> places;
  int minz;
  int endx;
  int endy;
  int endz;
  int time = -1;
  void s(ArrayList<world> p, int ex, int ey, int ez, int mz){
    places = p;
    endx = ex;
    endy = ey;
    endz = ez;
    minz = mz;
  }
  void end(int t){
    if(t < time || time < 0){
      time = t;
    }
  }
}