class Player {
  PImage spaceshipImg;
  int xpos;
  int ypos;
  color spaceshipcolor = color(255);
  
  
  Player(int pos, PImage image) 
  {
    xpos = SCREENX/2;
    ypos = pos;
    spaceshipImg = image; 
    spaceshipImg.resize(35,0);
  }
  
  void move(int x) 
  {
    if(x >SCREENX-SPACESHIPWIDTH) 
    {
      xpos = SCREENX-SPACESHIPWIDTH;
    }
    else xpos = x;
  }
  
  void draw() 
  {
    image(spaceshipImg, xpos, ypos);
  }
} 
