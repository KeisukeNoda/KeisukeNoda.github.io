int[][] letters = {
  
  { 0, 1, 1, 0, // A
    1, 0, 0, 1,
    1, 1, 1, 1,
    1, 0, 0, 1,
    1, 0, 0, 1 },
 
 { 1, 1, 1, 0, // B
   1, 0, 0, 1,
   1, 1, 1, 0,
   1, 0, 0, 1,
   1, 1, 1, 0 },   
   
 { 0, 1, 1, 1, // C
   1, 0, 0, 0,
   1, 0, 0, 0,
   1, 0, 0, 0,
   0, 1, 1, 1 }

};

int blockSize = 30;
float theta;

void setup(){
  size(600, 600);
  smooth(); 
}

int fakir(int numberFrames, int step, int border, int dmax) {
  stroke(0);
  int cx = 0;
  for (int x = border; x < border + blockSize; x += step) {
    int cy = 0;
    int n = (int) sq((border + blockSize) / step);
    for (int y = border; y < border + blockSize; y += step) {
      float offSet = (TWO_PI / n * cx * cy);
      float distance = dist(0, 0, x, y);
      float max = map(distance, 0, sqrt(sq(width) + sq(height)), 0, dmax);
      pushMatrix();
        translate(x, y);
        float d  = map(sin(theta+offSet), -1, 1, max, 5);  
        float x1 = cos(theta) * d;
        float y1 = sin(theta) * d;
        line(0, 0, x1, y1);
      popMatrix();
      cy++;
    }
    cx++;
  }
  theta -= TWO_PI / numberFrames;
  return 0;
}


void draw() {
  background(255);
  noStroke();
  fill(30);

  pushMatrix();
  translate(50, 20);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
     
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          pushMatrix();
          translate(xPos, yPos);
          fakir(1980, 5, 10 ,150);
          popMatrix();
        }
        
        xPos += blockSize;
        
        if(j % 4 == 3)
        {
          xPos = 0;
          yPos += blockSize; 
        }
     }
     translate(blockSize * 6, 0);
  }
  popMatrix();

  pushMatrix();
  translate(50, 220);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
     
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          pushMatrix();
          translate(xPos, yPos);
          fakir(1980, 5, 10 , 300);
          popMatrix();
        }
        
        xPos += blockSize;
        
        if(j % 4 == 3)
        {
          xPos = 0;
          yPos += blockSize; 
        }
     }
     translate(blockSize * 6, 0);
  }
  popMatrix();
  
  pushMatrix();
  translate(50, 420);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
     
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          pushMatrix();
          translate(xPos, yPos);
          fakir(1980, 5, 10 , 880);
          popMatrix();
        }
        
        xPos += blockSize;
        
        if(j % 4 == 3)
        {
          xPos = 0;
          yPos += blockSize; 
        }
     }
     translate(blockSize * 6, 0);
  }
  popMatrix();
}


