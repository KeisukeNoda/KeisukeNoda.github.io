int fc, num = 900;
ArrayList ballCollection; 
boolean save = false;
float scal, theta;
PGraphics letter;
PFont font;
String l = "Y"; 

void setup() {
  background(183, 36, 92);
  size(180, 180);
  letter = createGraphics(width, height);
  font = loadFont("Arial-Black-250.vlw");
  ballCollection = new ArrayList();
  createStuff();
  //frameRate(1);
}

void draw() {
  background(183, 36, 92);

  for (int i=0; i<ballCollection.size (); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }  

  theta += .0523;

  if (save) {
    if (frameCount%1==0 && frameCount < fc + 30) saveFrame("image-####.gif");
  }
}

void mouseReleased() {
  //createStuff();
  //fc = frameCount;
  //sa/ve = true;
  //saveFrame("image-###.gif");
}

void createStuff() {
  ballCollection.clear();
  
  letter.beginDraw();
  letter.noStroke();
  letter.background(255);
  letter.fill(0);
  letter.textFont(font, 230);
  letter.text(l, 0, 170);
  letter.endDraw();
  letter.loadPixels();

  for (int i=0; i<num; i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    //color c = letter.get(x, y);
    int c = letter.pixels[x+y*width];
    if (brightness(c)<255) {
      PVector org = new PVector(x, y);
      float radius = random(2, 5);
      PVector loc = new PVector(org.x+radius, org.y);
      float offSet = random(TWO_PI);
      int dir = 1;
      float r = random(1);
      if (r>.5) dir =-1;
      Ball myBall = new Ball(org, loc, radius, dir, offSet);
      ballCollection.add(myBall);
    }
  }
}
class Ball {

  PVector org, loc;
  float sz = 2;
  float radius, offSet, a;
  int s, dir, countC, d = 20;
  boolean[] connection = new boolean[num];

  Ball(PVector _org, PVector _loc, float _radius, int _dir, float _offSet) {
    org = _org;
    loc = _loc;
    radius = _radius;
    dir = _dir;
    offSet = _offSet;
  }

  void run() {
    display();
    move();
    lineBetween();
  }

  void move() {
    loc.x = org.x + sin(theta*dir+offSet)*radius;
    loc.y = org.y + cos(theta*dir+offSet)*radius;
  }

  void lineBetween() {
    countC = 1;
    for (int i=0; i<ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        a = map(countC,0,10,10,255);
        stroke(255, a);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        connection[i] = true;
      } 
      else {
        connection[i] = false;
      }
    }
    for (int i=0; i<ballCollection.size(); i++) {
      if (connection[i]) countC++;
    }
  }

  void display() {
    noStroke();
    fill(255, 200);
    ellipse(loc.x, loc.y, sz, sz);
  }
}