color col1=#2bd4e0, col2=#dfdfdf;
int columns = 71;
float stepX, theta, ot, fc, scal=1;
float[] offSets = new float[columns];
float[] offTheta = new float[columns];
boolean save = false;

void setup() {
  size(990, 190);

  stepX = width/columns;
  strokeWeight(stepX+1);

  for (int i=0; i<columns; i++) {
    offSets[i]=random(10,30);
    offTheta[i]= ot;
    ot += TWO_PI/columns;
  }

  drawWaves();
}

void draw() {
  drawWaves();
  theta -= 0.0523;
}

void mouseReleased() {
  for (int i=0; i<columns; i++) {
    offSets[i]=random(30);
  }
}

void keyPressed() {
  fc = frameCount;
  save = true;
}

void drawWaves() {

  for (int i=0; i<columns; i++) {
    scal = map(sin(theta+offTheta[i]), -1, 1, 0.5, 1.5);
    float x=stepX*(i+.5);
    if (i%2==1) {
      float y = height/2 - offSets[i]*scal;
      stroke(col1);
      line(x, 0, x, y);
      stroke(col2);
      line(x, y, x, height);
    } 
    else {
      float y = height/2 + offSets[i]*scal;
      stroke(col2);
      line(x, y, x, height); 
      stroke(col1);
      line(x, 0, x, y);
    }
  }
}

