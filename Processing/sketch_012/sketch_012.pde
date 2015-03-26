class Walker {
  float x, y;
  float a = 0.0;
  float sz = 500;
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
    float stepx = random(-10, 10);
    float stepy = random(-10, 10);
    x += stepx;
    y += stepy;
  }
}

Walker w;
float sz;

void setup() {
  size(400, 600);
  w = new Walker();
  background(#fffdf7);
  colorMode(HSB, 100);
}

void draw() {
  w.step();
  w.display();
  }
