import ddf.minim.*;
import ddf.minim.analysis.*;

BvhParser parserA = new BvhParser();
PBvh bvh1, bvh2, bvh3;

AudioPlayer player, player1,  player2;
Minim minim;
FFT fft;

float soundLevel = 0;
int Delay = 0;
int stopTime = 0;
boolean start = false;
//----
int NUM_PARTICLES = 256;
particleBall ParticleBall;
float startingRadius = 100, radius = 5;
int centerX, centerY;

//-----
int numPoints = 1200; // 点の数
int numSpheres = 4;   // 球体の数
int lengthLimit = 256; // 距離制限

Point[] points;
Sphere[] spheres;

//----
int num = 15;
int circles = 40;
int steps = 80;
float theta, r;

public void setup(){
  size(1280, 720, P3D);
  background(0);
  noStroke();
  frameRate(40);
  
  bvh1 = new PBvh( loadStrings( "A_test.bvh" ), 1 );
  bvh2 = new PBvh( loadStrings( "B_test.bvh" ), 2 );
  bvh3 = new PBvh( loadStrings( "C_test.bvh" ), 3 );
  
  minim = new Minim(this);
  player1 = minim.loadFile("wait.mp3");
  player2 = minim.loadFile("Perfume_globalsite_sound.wav");
  player = player1;
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
  fft.linAverages( 30 );
  
  Delay = millis();
  player.play();
  //player.loop();
  
  ParticleBall  = new particleBall();

//----
  spheres = new Sphere[numSpheres];
  for(int i = 0; i < numSpheres; i++){
    spheres[i] = new Sphere();
  }
  // 点を作る
  points = new Point[numPoints];
  for(int i = 0; i < numPoints; i++){
    points[i] = new Point();
  } 
}
 
public void draw(){
  int currentTime = player.position();
  
  fft.forward(player.mix);
  background(0);
  soundLevel = 0;
  for (int i=0; i<fft.specSize(); i++) {
    soundLevel += fft.getBand(i);
  }
  fft.forward( player.mix );
  
  //camera
  float _cos = cos(currentTime / 5000.f);
  float _sin = sin(currentTime / 5000.f);
  camera(width/4.f + width/4.f * _cos +200, height/2.0f-100, 550 + 150 * _sin, width/2.0f, height/2.0f, -400, 0, 1, 0);

  //ground 
  pushMatrix();
    translate(width/2, height/2-10, 0);
    rotateX(PI);
    pushMatrix();
      translate(0, -10, 0);
      rotateX(PI/2);
      rotate(r);
      for (int i=0; i<num; i++) {
        int d = i%2 == 0 ? -1 : 1;
        createCircle(30+i*50, d, i);
      }
      popMatrix();
      theta += (TWO_PI/steps);
      r = theta/circles;

    sphereDetail(10);
    lights();
    directionalLight(100, 100, 100, -1, -1, 0);

    //model
    bvh1.update(currentTime);
    bvh2.update(currentTime);
    bvh3.update(currentTime);
    bvh1.draw();
    bvh2.draw();
    bvh3.draw();
  popMatrix();
  
  neural_sphere();
  
  if (start == true) {
    if ((frameCount % 100 == 99) || frameCount % 500 == 499) {
    setupAgain();
    }
  }
} 

void keyPressed(){  
  if (key == ' ')
    start = true;   
}

void setupAgain(){
   bvh1 = new PBvh(loadStrings("kashiyuka.bvh"), 1);
   bvh2 = new PBvh(loadStrings("nocchi.bvh"), 2);
   bvh3 = new PBvh(loadStrings("aachan.bvh"), 3);
   player = player2;
   player.play();
}


void createCircle(int x, int dir, int col) {
  for (int i=0; i<circles; i++) {
    pushMatrix();
    float offSet = TWO_PI/circles*i;
    rotate(offSet);
    float max = map(x, 0, width/2, 5, 15);
    float min = max/10; 
    float sz = map(sin(r+theta*dir+offSet), -1, 1, min, max);
    float a = map(sin(r+theta*dir+offSet), -1, 1, 100, 255);
    fill(#FCFDEB, a);
    
    if( fft.getAvg(0) < 4 ){
      translate(0, 0, -10 * sz);
        ellipse(x, 0, sz, sz);
      translate(0, 0, -20 * sz);
       ellipse(x, 0, sz*3/4, sz*3/4);
      translate(0, 0, -30*sz);
       ellipse(x, 0, sz*2/4, sz*2/4);
      translate(0, 0, -40*sz);
        ellipse(x, 0, sz/4, sz/4);
     } else {
       ellipse(x, 0, sz, sz);
      translate(0, 0, soundLevel/3000*sz);
       ellipse(x, 0, sz*3/4, sz*3/4);
      translate(0, 0, soundLevel/2500*sz);
       ellipse(x, 0, sz*2/4, sz*2/4);
      translate(0, 0, soundLevel/2000*sz);
       ellipse(x, 0, sz/4, sz/4);
     }
    popMatrix();
  }
}

