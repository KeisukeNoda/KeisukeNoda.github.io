int[][] letters = {
 
 { 1, 1, 0, 0, 1, // N
   1, 0, 1, 0, 1,
   1, 0, 1, 0, 1,
   1, 0, 1, 0, 1,
   1, 0, 0, 1 ,1}, 
   
 { 0, 0, 0, 0, 0, // o
   0, 0, 1, 1, 0,
   0, 1, 0, 0, 1,
   0, 1, 0, 0, 1,
   0, 0, 1, 1 ,0},
 
   
 { 0, 0, 0, 0, 1, // d
   0, 0, 1, 1, 1,
   0, 1, 0, 0, 1,
   0, 1, 0, 0, 1,
   0, 0, 1, 1 ,1},
   
 { 0, 0, 0, 0, 0, // a
   0, 0, 1, 1, 1,
   0, 1, 0, 0, 1,
   0, 1, 0, 0, 1,
   0, 0, 1, 1 ,1},
   
 { 0, 0, 0, 0, 0, // 
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0, 0,
   0, 0, 0, 0 ,0}, 
   
 { 1, 0, 0, 1, 1, // K
   1, 0, 1, 0, 0,
   1, 1, 0, 0, 0,
   1, 0, 1, 0, 0,
   1, 0, 0, 1 ,1},
  
 { 0, 0, 1, 1, 0, // e
   0, 1, 0, 0, 1,
   0, 1, 1, 1, 0,
   0, 1, 0, 0, 0,
   0, 0, 1, 1 ,1},
   
 { 0, 0, 1, 0, 0, // i
   0, 0, 0, 0, 0,
   0, 0, 1, 0, 0,
   0, 0, 1, 0, 0,
   0, 0, 1, 0 ,0},
   
 { 0, 0, 1, 1, 1, // s
   0, 1, 0, 0, 0,
   0, 1, 1, 1, 0,
   0, 0, 0, 0, 1,
   0, 1, 1, 1 ,0},
   
 { 0, 0, 0, 0, 0, // u
   0, 1, 0, 0, 1,
   0, 1, 0, 0, 1,
   0, 1, 0, 0, 1,
   0, 0, 1, 1 ,1},
   
 { 0, 1, 0, 0, 0, // k
   0, 1, 0, 1, 1,
   0, 1, 1, 0, 0,
   0, 1, 0, 1, 0,
   0, 1, 0, 0 ,1},
   
 { 0, 0, 1, 1, 0, // e
   0, 1, 0, 0, 1,
   0, 1, 1, 1, 0,
   0, 1, 0, 0, 0,
   0, 0, 1, 1 ,1}
};

int blockSize = 13;
int num = 20, frames = 120;
float theta;

void circle() {
  stroke(40);
  noFill();

  for (int i=0; i<num; i++) {
    float d = width*.8/num;
    float sz = i*d;
    float sw = map(sin(theta+TWO_PI/num*i), -1, 1, 1, d*.8);
    strokeWeight(sw);
    ellipse(width/2, height/2, sz, sz);
  }
  theta -= TWO_PI/frames;
}

void setup()
{
  size(715, 75);
  smooth();
}


void draw() {
  background(223);
  noStroke();
  fill(30);

  pushMatrix();
  translate(0, 8);
  rectMode(CENTER);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
    
     // for each letter, draw pixel dots
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          pushMatrix();
          translate(xPos, yPos);
          scale(0.03);
          circle();
          popMatrix();
        }
        
        xPos += blockSize;
        
        if(j % 5 == 4)
        {
          xPos = 0;
          yPos += blockSize; 
        }
     }
     
     translate(blockSize * 4.5, 0);
  }
  popMatrix();
}
