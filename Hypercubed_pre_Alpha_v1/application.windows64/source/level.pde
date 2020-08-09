class level{
  ArrayList<world> places;
  int endx;
  int endy;
  int endz;
  int time = -1;
  void s(ArrayList<world> p, int ex, int ey, int ez){
    places = p;
    endx = ex;
    endy = ey;
    endz = ez;
  }
  void end(int t){
    if(t < time || time < 0){
      time = t;
    }
  }
}