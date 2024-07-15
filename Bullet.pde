class Bullet {
  float xpos; 
  float ypos;
  float dx;
  float dy;
  int radius;
  color bulletColor = color(255, 200, 200);
  PImage alienImg; 
/* You need: variables to store the position and appearance of the bullet.
A constructor */ 


 Bullet(float x, float y, PImage alienImage) 
  { 
    xpos = x;
    ypos = y;
    radius = 3;
    alienImg = alienImage;
  } 
/* A method to move the bullet
A method to draw the bullet
A method to check for collisions
*/

  void move()
  {
    ypos-=3;
  }
  
  void draw() 
  {
    fill(bulletColor);
    ellipse(int(xpos), int(ypos), radius, radius);
  } 
  
  void collide(Alien theAliens[]) 
  {
    for(int i = 0; i<theAliens.length ; i++) 
    {
      if (ypos+radius <= theAliens[i].y+alienImg.height && 
      ypos+radius >= theAliens[i].y && 
      xpos+radius >= theAliens[i].x && 
      xpos+radius <= theAliens[i].x+alienImg.width )
      {
        theAliens[i].explode(); 
      } 
    } 
  }  
}  
