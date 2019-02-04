class Hook
{
  //Declaration of variables
    int x, y;
    float NetPosX, NetPosY;

    Hook(int x, int y) {
        this.x = x;
        this.y = y;
        Hook = loadImage("Net.png");
        Hook.resize(50, 50);
    }
    
    void update()  {
      render();
    }
    
 //the render code below dictates that the hook/net appears on screen with the variables for it's position.
    void render()  {
        image(Hook, hookPosX, hookPosY);
    }
}