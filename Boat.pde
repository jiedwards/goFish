class Boat
{
 //Declaration of variables and loading boat image.
    int x, y;

 //initialising variables
    Boat(int x, int y) {
        this.x = x;
        this.y = y;
        Boat = loadImage("Boat.png");
        Boat.resize(120, 110);
    }
         /* Updated for practicing purposes - Subtracting.*/

     
    void update() {
      render();
    }

     /* Updated for practicing purposes.*/

 //the render code below dictates that the boat appears on screen with the variables for it's position.
    void render()  {
            image(Boat, boatPosX, boatPosY);
    }

    /* Git testing practice*/
}