int frames = 150, num=20;
float theta, d;

void setup() {
  size(240, 240);
}

void draw() {
  background(223);
  translate(width/2, height/2);
  for (int i = 0; i < num; i++) {
    pushMatrix();
    fill(15, 60);
    stroke(15, 80);
    float offSet = TWO_PI * i/num;
    rotate(offSet);
    float sz = width*.19;
    float x = map(sin(theta), -1, 1, sz, width*.3);
    translate(x, 0);
    pushMatrix();
      rotate(theta);
      ellipse(0, 0, sz, sz * 2);
      ellipse(0, 0, sz*.7, sz * 2*.7);
      popMatrix();
    popMatrix(); 
    
    d = sqrt((mouseX - 120)*(mouseX - 120) + (mouseY - 120)*(mouseY - 120)) / 10;
    textAlign(CENTER);
    textSize(20);
    fill(0, 209, 234, d);
    text("Hello", -7, -5);
    text("World", 7, 14);
  }
  theta += TWO_PI/frames;
}


