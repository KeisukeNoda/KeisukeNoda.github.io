int num = 20;
float step, sz, offSet, theta, angle;

void setup() {
  size(250, 250);
  strokeWeight(12);
  step = 12;
  colorMode(HSB, 255, 100, 100);
}

void draw() {
  background(36);
  translate(width/2, height*.5);
  angle = 0;
  for (int i = 0; i < num; i++) {
    stroke(255 * i/num, 65, 80);
    noFill();
    sz = i*step;
    float offSet = TWO_PI/num*i;
    float arcEnd = map(sin(theta+offSet), -1, 1, PI, TWO_PI + PI*3/2);
    arc(0, 0, sz, sz, PI, arcEnd);
  }
  resetMatrix();
  theta += .0523;  
}
