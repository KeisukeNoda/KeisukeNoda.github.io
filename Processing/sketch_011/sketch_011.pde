/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/103511*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
class Walker {
  float x, y;
  float a = 0.0;
  float sz = 800;
  float size;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void display() {
    //a = map(mouseX, 0, width, 10, 50);
    a += .005;
    //println(a);    
    fill(random(100), 80, 90, a);
    size = random(sz*.75, sz);
    stroke(255);
    ellipse(x, y, size, size);
  }

  void step() {
    float stepx = random(-20, 20);
    float stepy = random(-20, 20);
    x += stepx;
    y += stepy;
  }
}

Walker w;
float sz;

void setup() {
  size(900, 600);
  w = new Walker();
  background(#fffdf7);
  colorMode(HSB, 100);
}

void draw() {
  w.step();
  w.display();
  }
