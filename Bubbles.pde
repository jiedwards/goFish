class Bubbles

{
 //Declaration of variables
    int x, y, dx, dy;

    Bubbles(int x, int y, int dx, int dy) {
        this.x = x;
        this.y = y;
        this.dx = dx;
        this.dy = dy;
        Bubbles = loadImage("Bubbles.png");
        Bubbles.resize(70, 45);
    }

    void update() {
        render();
        move();
    }

 //the render code below dictates that the bubble appears on screen with the variables for it's position.
    void render() {
            image(Bubbles, x, y);
    }

   void checkCollisions() {
 // below code allows game to end if bubble hits the boat's x location. Code doesn't function correctly thus it has been commented out.
    /*    if (bubbles.y == boatPosX - 5) {
            gameMode = dead;
        }
        else if  (bubbles.y == boatPosX + 30) {
            gameMode = dead;
        } */
    }  
 //allows the bubbles to rise on the screen.
    void move() {
        checkCollisions();
        y += dy - 1;
    }

}