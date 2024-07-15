class Alien {
 /* declare variables for alien position, direction of movement and appearance */
  PImage myImage; //<>//
  PImage explodeImage;
  PImage spaceshipImg;
  PImage bombImg;
  PImage blackImage;
  Bomb theBomb; 
  float x;
  float y;
  int c;
  int d;
  boolean exploded;
  boolean bomb;
  boolean bombOffScreen;
  
 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(float xpos, float ypos, PImage alienImage, PImage explodingImage, 
 PImage spaceship, PImage bombImage, PImage blackImg)
 {
   c = 0;
   d = 0;
   x = xpos;
   y = ypos;
   spaceshipImg = spaceship;
   myImage = alienImage;
   explodeImage = explodingImage;
   blackImage = blackImg;
   blackImage.width = myImage.width;
   blackImage.height = myImage.height; 
   bombImg = bombImage; 
   exploded = false;
   theBomb = null;
   bomb = false;
   bombOffScreen = true;
 }
 
 void move()
 {

  if (x+myImage.width < SCREENX && c < myImage.height)
    x++;
  if (x+myImage.width >= SCREENX && c < myImage.height )
  {
    y++;
    c++;
  }
  if (c >= myImage.height && x > 0)
  {
    x--;
  }
  if (x <= 0)
  {
    y++; 
    d++;
  }
  if (d >= myImage.height)
  {
    d = 0;
    c = 0;
  }
  /* Move the alien according to the instructions in the exercise */
 }
 
  boolean createBomb()
  {
    if (bomb)
    {
      return bomb = false;
    }
    else if (random(0,100) > 99.5) 
    {
       bomb = true;
    }
    return bomb;
  } 
   
   void getBomb()
   {
     if(!exploded && bomb && bombOffScreen)
     {
       theBomb = new Bomb(x,y+myImage.height, bombImg, spaceshipImg);
       bombOffScreen = false;
     }
     else if (!bombOffScreen && theBomb.offScreen())
     {
       bombOffScreen = true;
     }
   }
  
    void draw()
    {
      image(myImage, x, y);
      
      if (exploded) 
      {
        myImage = blackImage;
      }
    }
  
  /* boolean randomExplode()
  {
    if (exploded == true)
      return exploded;
    else if (random(0,100) > 99.7) 
      exploded = true;
    return exploded;
  } */ 
  
  void explode()
  {
     // if (randomExplode())
     if (!exploded)
     {
       myImage = explodeImage;
       exploded = true; 
       image(myImage, x, y);
     }
  }
} 
