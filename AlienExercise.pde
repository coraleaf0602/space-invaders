PImage alienImage; 
PImage explodeImage;
boolean notExploded;
PImage spaceship; 
PImage bombImage;
PImage blackImage; 
PFont myFont; 
int x;
int count;
Player thePlayer; 
Bullet theBullet;
Alien theAliens[];
Bomb theBomb; 
boolean playerWins; 

/* Declare an array of Aliens */

void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  myFont = loadFont("CourierNewPSMT-18.vlw");
  textFont(myFont);
  alienImage = loadImage("invader.gif");
  explodeImage = loadImage("exploding.gif");
  spaceship = loadImage("spaceship.jpg");
  bombImage = loadImage("bomb.png");
  blackImage = loadImage("giphy.gif"); 
  /* load the images */
  theAliens = new Alien[10];
  //Now it points at an empty array 
  noStroke();
  /* create a new alien array */
  init_aliens(theAliens);
  /* initialise the array */
  x = 0;
  thePlayer = new Player(SCREENY-SPACESHIPHEIGHT-MARGIN, spaceship);
  theBullet = new Bullet(410, 410, alienImage);
  theBomb = null;
  count = 0;
  playerWins = true;
  //theBomb = new Bomb(random(0, SCREENX), 20, bombImage, spaceship); 
}

void draw()
{
  background(0);
  thePlayer.move(mouseX);
  thePlayer.draw();
  move_array(theAliens);
  draw_array(theAliens);
  if (mousePressed) 
  {  
    mousePressed();
  }
  theBullet.draw();
  theBullet.move();
  //theBomb.draw();
  //theBomb.move();
  
  theBullet.collide(theAliens);
  alienDropBomb(theAliens);
  checkDeadAlien(theAliens);
  
    
  
}

void init_aliens (Alien theAliens[]/* pass in your array, plus the image to use */)
{
  for (int i = 0; i<theAliens.length; i++)
  {
    theAliens[i] = new Alien( x , 10 , alienImage, explodeImage, spaceship, bombImage, blackImage); 
    x += 30;
 /* for each position in the array,  create a new alien at an appropriate
 starting point on the screen */
  }
}
void move_array(Alien theAliens[])
{
  for(int i = 0; i<theAliens.length ; i++)
    theAliens[i].move();
}

void draw_array(Alien theAliens[])
{
  /* clear the screen */
  for (int i = 0; i<theAliens.length; i++)
  {
     theAliens[i].draw();
  }
  /* for each alien in the array - move the alien, then draw the alien */
}

 /* void explode_array(Alien theAliens[])
 {
  for (int i = 0; i <theAliens.length ; i++)
  {
     theAliens[i].explode(); 
  }
 } */ 

 void mousePressed()
 {
   theBullet.xpos = thePlayer.xpos + spaceship.width/2;
   theBullet.ypos = thePlayer.ypos;
 } 
 
 void alienDropBomb(Alien theAliens[]) //<>//
 {
   for (int i = 0; i <theAliens.length ; i++)
   {
     if (theAliens[i].createBomb())
     {
       theAliens[i].getBomb();
     }
     if (theAliens[i].theBomb != null)
     {
       theAliens[i].theBomb.draw();
       theAliens[i].theBomb.move();
       if (theAliens[i].theBomb.collide(thePlayer))
       {
          text("GAME OVER!", SCREENX/3, SCREENY/2);
          noLoop();
       }
     }
   }
 }
 
 /*void checkDeadAlien(Alien theAliens[]) //<>//
 {
   boolean theAlienArray[] = new boolean[theAliens.length];
   for (int i = 0; i<theAlienArray.length; i++)
   {
      theAlienArray[i] = theAliens[i].exploded;
      if (all(theAlienArray)) 
      {
         text("YOU WIN!", SCREENX/3, SCREENY/2);
         noLoop();
      }
   }
 } */ 
 
 void checkDeadAlien(Alien theAliens[])
 {
   playerWins = true;
    for (int i = 0; i <theAliens.length ; i++) 
    {
      if (!theAliens[i].exploded) 
      {
        playerWins = false; 
      } 
    } 
    if (playerWins)
    {
      text("YOU WIN!", SCREENX/3, SCREENY/2);
      noLoop();
    }
 }
      
   
 
 


 
   
 

      
