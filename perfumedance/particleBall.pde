class particleBall
{
  particle[] Particles = new particle[NUM_PARTICLES];
  
  particleBall()
  {
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      float theta = random(0,TWO_PI);
      float u = random(-1,1);
      Particles[i] = new particle(theta,u); 
    }
  }
  
  void update()
  {
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      Particles[i].update(); 
    }
  }
  
    void render(int colorId)
  {
    fill(0,0,0,100);
    sphereDetail(10);
    sphere(radius-3);
    sphereDetail(5);
    
    if( colorId == 1 ){
      fill(#9BE5F2, 82);
      for(int i = 0; i < NUM_PARTICLES; i++)
      {
        Particles[i].render(); 
      }
    }
    if( colorId == 2 ){
      fill(#00FFD0, 82);
      for(int i = 0; i < NUM_PARTICLES; i++)
      {
        Particles[i].render(); 
      }
    }
    if( colorId == 3 ){
      fill(#00FFFF, 82);
      for(int i = 0; i < NUM_PARTICLES; i++)
      {
        Particles[i].render(); 
      }
    }
  }
}
