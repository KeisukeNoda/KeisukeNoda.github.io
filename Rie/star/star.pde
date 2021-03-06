int num=25, movers=5, d=55, d2=35, frames=300;
float angle, theta;

void setup() {
  size(120, 120);
  //smooth(5);
  stroke(#F0F8F8,180);
}

void draw() {
  background(#B7245C);
  for (int i=0; i<num; i++) {
    float outerX = width/2 + cos(angle)*d; 
    float outerY = height/2+sin(angle)*d;
    point(outerX, outerY);
    angle = TWO_PI/num*i;
    for (int j=0; j<movers; j++) {
      float offSet = TWO_PI/movers*j;
      float moverX = width/2+cos(theta+offSet)*d2;
      float moverY = height/2+sin(theta+offSet)*d2;
      line(outerX, outerY, moverX, moverY);
    }
  }
  theta += TWO_PI/frames;
  
  //if (frameCount<=(frames/movers)+1) saveFrame("image-###.gif");
}
