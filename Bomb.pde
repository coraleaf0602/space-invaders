class Bomb {
  PImage bomb; 
  PImage spaceShip; 
  float x;
  float y;
  boolean collided;
  
  Bomb(float xpos, float ypos, PImage bombImg, PImage playerImg) 
  {
    x = xpos;
    y = ypos; 
    bomb = bombImg;
    spaceShip = playerImg;
    bomb.resize(20,0);
    collided = false; 
  } 
  
  void move() 
  {
    y+=3;
  } 
  
  void draw()
  {
    image(bomb, x, y);
  } 
  
  boolean offScreen() 
  {
    boolean offScreen = false; 
    if (y >= SCREENY)
      offScreen = true;
    return offScreen; 
  }
  
  boolean collide(Player tp) 
  {
    if (collided) 
      return collided; 
    if (x + bomb.width >= tp.xpos  &&
    x <= tp.xpos+spaceShip.width &&
    y+bomb.height >= tp.ypos &&
    y <= tp.ypos+spaceShip.height) 
    {
      collided = true; 
    }
   
    return collided; 
  } 
    
}
