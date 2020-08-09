class level{
  ArrayList<world> places;
  int endx;
  int endy;
  int endz;
  int time;
  void s(ArrayList<world> p, int ex, int ey, int ez){
    places = p;
    endx = ex;
    endy = ey;
    endz = ez;
  }
  void end(int t){
    time = t;
  }
}