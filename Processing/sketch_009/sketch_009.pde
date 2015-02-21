int fc, num = 40, edge = 75;
ArrayList ballCollection; 
boolean save = false;
color c1 = #FF4D80;
color c2 = #890620;
color c3 = #FF1D15;
color c4 = #02FFB7;
color c5 = #FF3E41;
color c  = #FF3E41;
int time = 0;

void setup() {
  size(200, 200);
  ballCollection = new ArrayList();
  createStuff();
}

void draw() {
  background(#fffdf6);
  for (int i=0; i<ballCollection.size(); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }
}

void mouseReleased() {
  createStuff();
  time++;
  switch (time%5){
    case 1 : c = c1; break;
    case 2 : c = c2; break;
    case 3 : c = c3; break;
    case 4 : c = c4; break;
    case 0 : c = c5; break;
  } 
}

void createStuff() {
  ballCollection.clear();
  for (int i=0; i<num; i++) {
    PVector org = new PVector(random(edge, width-edge), random(edge, height-edge));
    float radius = random(20, 60);
    PVector loc = new PVector(org.x+radius, org.y);
    float offSet = random(TWO_PI);
    int dir = 1;
    float r = random(1);
    if (r>.5) dir =-1;
    Ball myBall = new Ball(org, loc, radius, dir, offSet);
    ballCollection.add(myBall);
  }
}

class Ball {

  PVector org, loc;
  float sz = 3;
  float theta, radius, offSet, distance;
  int s, dir, d = 10;

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
    loc.x = org.x + sin(theta+offSet)*radius;
    loc.y = org.y + cos(theta+offSet)*radius;
    theta += (0.0523/2*dir);
  }

  void lineBetween() {
    for (int i=0; i<ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        fill(c,50);
        stroke(255, 200);
        noStroke();
        ellipse(loc.x, loc.y, d+20-distance, d+20-distance);
      }
    }
  }

  void display() {
    noStroke();
    fill(c, 255);
    ellipse(loc.x, loc.y, sz, sz);
  }
}

