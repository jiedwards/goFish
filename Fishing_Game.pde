//PImage is used to store all the images used throughout the game

PImage background, Boat, Fish, Hook, startScreen, Fishreflected, Bubbles, endScreen;
Boat boat;
Fish fishes, fishes2, fishes3, fishes4;
Hook hook;
Bubbles bubbles;

 //Declaration of variables, mainly gamemodes, floating variables and hook drop states. 

int gameMode;
int start = 2;
int alive = 0;
int dead = 1;
int hookPressed = 0;
int edge;
float boatPosX, boatPosY, hookPosY, hookPosX;

  void setup() {
    size(503, 707);

 //background images to be displayed are loaded here
    
    startScreen = loadImage("BG new.jpg");
    background = loadImage("Playing.jpg");
    endScreen = loadImage("Start.jpg");
    
 //The values below are the numbers inputted for the variables which were created in each of the classes, e.g. x and y location.
    boat = new Boat(100, 300);
    fishes = new Fish(0, 500, 0, 0);
    fishes2 = new Fish(0, 525, 0, 0);
    fishes3 = new Fish(0, 550, 0, 0);
    fishes4 = new Fish(0, 575, 0, 0);
    bubbles = new Bubbles(0, 600, 0, 0);
    hook = new Hook(0, 0);

 //values to determine the starting location for the boat and hook.
    boatPosX = 25;
    boatPosY = 150;
    hookPosX = 135;
    hookPosY = 170;
    
 //the code below ensures the game starts on the splash screen.
    gameMode = start;
}

  void draw() {
    
 //this code below dictates what the user has to press for the game to begin, once they have seen the splash screen. 
    if (gameMode == start)
    {
      background(startScreen);
        if (key == ' ' && gameMode == start )
        {
         gameMode = alive;
        }
    }
    
 //this code below dictates how the game runs as well as what features are available during the game.     
    if (gameMode == alive) {
       background(background);
       boat.update();
       fishes.update();
       fishes2.update();
       fishes3.update();
       fishes4.update();
       bubbles.update();
       hook.update();
        
        
 //the code below is the functionality for the hook drop, especially dictation how it descends and rises on the sccreen.
        if (hookPressed == 1) {
            hookPosY = hookPosY + 2;
        } else if (hookPressed == 2) {
            hookPosY = hookPosY - 1;
        } else if (hookPressed == 3) {
            hookPosY = 170;
        }
        
 //the game ends when the fishes y value reaches the water level, as well as when the fishes x value touches the boat's x value.
        if (fishes.y <= 250 && fishes.x == boatPosX - 25) {
            gameMode = dead;
        }
        
 //the hook returns back to the boat when the Y value reaches the bottom of the screen
        if (hookPosY >= 650 - (edge * 2)) 
        {
            hookPressed = 2;
        }
        
 //the hook stops at the boat level whilst returning when the Y value reaches where it was before it was dropped.
        if (hookPosY == 170) {
            hookPressed = 3;
        }
    }
    
 //if the game ends, the game over image is displayed, when the spacebar is pressed the game will begin again.
    if (gameMode == dead) {

        background(endScreen);
        if (key == ' ' && gameMode == dead) {
            restart();
        }
    }
}

 //the keypress dictates what function occurs when a key is pressed on the keyboard.
  void keyPressed() {
    
 //the boat and hook move left when the left arrow key is pressed.
    if (key == CODED) {
        if (keyCode == LEFT && boatPosX > 2) {
            boatPosX = boatPosX - 10;
            hookPosX = hookPosX - 10;
        }    
        
 //the boat and hook move right when the right arrow key is pressed.
        if (keyCode == RIGHT && boatPosX < 340) {
            boatPosX = boatPosX + 10;
            hookPosX = hookPosX + 10;
        }
        
 //when the down key is pressed, the hookPressed dictates that the boat hook now descends on the screen.
        if (keyCode == DOWN) {
            hookPressed = 1;
        }
    }
  }
  
 //the restart function is what allows the game to constantly restart once the game ends.
  void restart() {
    setup();
    draw();
    keyPressed();
}