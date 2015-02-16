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

void setup()
{
  size(600, 600);
  smooth();
}
  
void draw() {
  background(255);
  noStroke();
  fill(30);
  pushMatrix();
  translate(80, 80);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
    
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          rect(xPos, yPos, blockSize, blockSize);
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
  translate(80, 360);
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
          rotate(radians(random(-12, 12)));
          rect(0, 0, blockSize, blockSize);
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
