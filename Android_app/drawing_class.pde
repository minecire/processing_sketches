class Drawing{
  IntList[] xs;
  IntList[] ys;
  FloatList wids;
  FloatList[] cols;
  float[] bg;
  int current;
  String name;
  void def(IntList[] xsi,IntList[] ysi,FloatList widsi,FloatList[] colsi,float[] bgi, int currenti, String namei){
    this.xs = xsi;
    this.ys = ysi;
    this.wids = widsi;
    this.cols = colsi;
    this.bg = bgi;
    this.current = currenti;
    this.name = namei;
  }
  void dra(float x, float y, float w,float h){
    noStroke();
    fill(this.bg[0],this.bg[1],this.bg[2]);
    rect(x,y,w,h);
    for(int i = 0; i < this.current+1; i++){
      for(int j = 1; j < this.xs[i].size(); j++){
        stroke(this.cols[0].get(i),this.cols[1].get(i),this.cols[2].get(i));
        strokeWeight(this.wids.get(i));
        line(this.xs[i].get(j-1)*w/width+x,this.ys[i].get(j-1)*h/height+y,this.xs[i].get(j)*w/width+x,this.ys[i].get(j)*h/height+y);
      }
    }
  }
}