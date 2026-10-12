class Button {
  // Member variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    w = 100;
    h = 30;
    c1 = color(60);
    c2 = color(177);
    this. val = val;
    hover = false;
  }

  //Member methods
  void display() {
    if (hover==true) {
      fill(c1);
    } else {

      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    textAlign(CENTER,CENTER);
    text(val, x, y);
  }

  void mouseOver(int tempX, int tempY) {
    if (tempX>x-w/2 && tempX<x+w/2 && tempY>y-h/2 && tempY<y+h/2) {
      hover=true;
    } else {
      hover=false;
    }
  }
}
