int num=20, dir=-1;
myArc[] arcs = new myArc[num];
float theta, start, maxsz=22, x, y;

void setup() {
  size(65, 65);
  stroke(255);
  smooth(4);
  background(0);
  noFill();
  strokeCap(SQUARE);
  strokeWeight(50);
  x = width/2;
  y = height/2;

  for (int i=0; i<num; i++) {
    float sz = maxsz - i*5;
    start = TWO_PI/num*i;
    dir*=-1;
    arcs[i] = new myArc(sz, dir, start);
  }
}

void draw() {
  background(0);
  for (int i=0; i<arcs.length; i++) {
    arcs[i].move();
  }
  theta += 0.0523;
}

class myArc {

  float sz, start;
  int dir;

  myArc(float _sz, int _dir, float _start) {
    sz= _sz;
    dir = _dir;
    start = _start;
  }

  void move() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta*dir);
    stroke(#2bd4e0, 55);
    arc(0, 0, sz, sz, start, start+PI);
    popMatrix();
  }
}
