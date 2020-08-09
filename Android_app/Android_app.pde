IntList[] xs;
IntList[] ys;
FloatList wids;
float wid = 30;
float[] col = {0, 255, 255};
float[] bg = {0, 255, 255};
FloatList[] cols;
ArrayList<Drawing> drawings;
String name;
Drawing cdrawing;
int current = -1;
int cedit = 0;
void sav() {
  drawings.add(cdrawing);
  for (int i = 0; i < 1000; i++) {
    while (xs[i].size() > 0) {
      xs[i].remove(0);
      ys[i].remove(0);
    }
  }
  for (int i = 0; i < 3; i++) {
    while (cols[i].size() > 0) {
      cols[i].remove(0);
    }
  }
  col[0] = 0;
  col[1] = 255;
  col[2] = 255;
  bg = col;
  while (wids.size() > 0) {
    wids.remove(0);
  }
  wid = 30;
  current = -1;
  cedit = 0;
  name = "Untitled";
}
void setup() {
  name = "Untitled";
  drawings = new ArrayList();
  cdrawing = new Drawing();
  drawings.add(cdrawing);
  wids = new FloatList();
  cols = new FloatList[3];
  xs = new IntList[1000];
  ys = new IntList[1000];
  cols[0] = new FloatList();
  cols[1] = new FloatList();
  cols[2] = new FloatList();
  colorMode(HSB);
  orientation(LANDSCAPE);
  //switch these (above and below) for android mode.
  //size(1440,810);
}
void draw() {
  cdrawing.def(xs, ys, wids, cols, bg, current, name);
  cdrawing.dra(0, 0, width, height);
  if (cedit == -1) {
    xs[current].append(mouseX);
    ys[current].append(mouseY);
  }
  fill(255);
  fill(50);
  noStroke();
  rect(0, 0, width/4, height);
  fill(150);
  textSize(30);
  text("Brush Width:", 20, 40);
  text("Background:", 20, 340);
  text("Brush:", 20, 140);
  text(name, 20, 650);
  fill(150);
  rect(40, 70, width/4-60, 10);
  fill(100);
  rect((wid*3)+30, 50, 20, 50);
  if (cedit == 1 && mouseX > 30 && mouseX < width/4-30) {
    wid = (mouseX - 30)/3;
  }
  fill(150);
  rect(40, 170, width/4-60, 10);
  fill(100);
  rect((col[0]/1.8*2)+30, 150, 20, 50);
  if (cedit == 2 && mouseX > 30 && mouseX < width/4-30) {
    col[0] = (mouseX - 30)*1.8/2;
  }
  fill(150);
  rect(40, 220, width/4-60, 10);
  fill(100);
  rect((col[1]/1.8*2)+30, 200, 20, 50);
  if (cedit == 3 && mouseX > 30 && mouseX < width/4-30) {
    col[1] = (mouseX - 30)*1.8/2;
  }
  fill(150);
  rect(40, 270, width/4-60, 10);
  fill(100);
  rect((col[2]/1.8*2)+30, 250, 20, 50);
  if (cedit == 4 && mouseX > 30 && mouseX < width/4-30) {
    col[2] = (mouseX - 30)*1.8/2;
  }
  fill(150);
  rect(40, 370, width/4-60, 10);
  fill(100);
  rect((bg[0]/1.8*2)+30, 350, 20, 50);
  if (cedit == 5 && mouseX > 30 && mouseX < width/4-30) {
    bg[0] = (mouseX - 30)*1.8/2;
  }
  fill(150);
  rect(40, 420, width/4-60, 10);
  fill(100);
  rect((bg[1]/1.8*2)+30, 400, 20, 50);
  if (cedit == 6 && mouseX > 30 && mouseX < width/4-30) {
    bg[1] = (mouseX - 30)*1.8/2;
  }
  fill(150);
  rect(40, 470, width/4-60, 10);
  fill(100);
  rect((bg[2]/1.8*2)+30, 450, 20, 50);
  if (cedit == 7 && mouseX > 30 && mouseX < width/4-30) {
    bg[2] = (mouseX - 30)*1.8/2;
  }
  stroke(col[0], col[1], col[2]);
  strokeWeight(wid);
  point(3*width/16, 125);
}
void mousePressed() {
  if (cedit == 8) {
    cedit = 0;
  }
  if (mouseX > width/4) {
    current += 1;
    xs[current] = new IntList();
    ys[current] = new IntList();
    wids.append(wid);
    cols[0].append(col[0]);
    cols[1].append(col[1]);
    cols[2].append(col[2]);
    cedit = -1;
  } else if (mouseY < 100 && mouseY > 50) {
    cedit = 1;
  } else if (mouseY < 200 && mouseY > 150) {
    cedit = 2;
  } else if (mouseY < 250 && mouseY > 200) {
    cedit = 3;
  } else if (mouseY < 300 && mouseY > 250) {
    cedit = 4;
  } else if (mouseY < 400 && mouseY > 350) {
    cedit = 5;
  } else if (mouseY < 450 && mouseY > 400) {
    cedit = 6;
  } else if (mouseY < 500 && mouseY > 450) {
    cedit = 7;
  } else if (mouseY < 700 && mouseY > 650) {
    cedit = 8;
    name = "";
  }
}

void mouseReleased() {
  if (cedit < 8) {
    cedit = 0;
  }
}
void keyPressed() {
  if (cedit == 8) {
    if ((key >= 'A' && key <= 'z') || key == ' ') {
      name = name+key;
    }
    if (key == 8 && name.length() > 0) {
      name = name.substring(0, name.length()-1);
    }
  }
}