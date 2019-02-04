class Fish
{
   //Declaration of variables
    int x, y, dx, dy;
    float FishPosY;

    Fish(int x, int y, int dx, int dy) {
        this.x = x;
        this.y = y;
        this.dx = dx;
        this.dy = dy;
        Fish = loadImage("Fish.png");
        Fish.resize(45, 25);
        Fishreflected = loadImage("FishReflected.png");
        Fishreflected.resize(45, 25);
    }

    void update() {
        render();
        move();
    }

 // allows the fish to move both accross the x and y axis.
    void move() {
        checkCollisions();
        x += dx;
        y += dy;
    }

 //the render code below dictates that the fish appear on screen, the images reverse as the fish hit either border of the screen.
    void render() {
        if (dx == -1)
            image(Fishreflected, x, y);

        else if (dx == 1)
            image(Fish, x, y);
    }

    void checkCollisions() {
        int edge = 10; 
        
 //as the fish hit the border of the screen, their direction changes and thus does their position, they subsequently move up the screen towards the boat.
        if (x <= edge - edge) {
            dx = 1;
            y = y - 50; // dicates how much they rise up the screen, in px.
        }
        
        if (x >= 500 - (edge * 2))
        {
            dx = -1;
            y = y - 50;
        }
    }
}