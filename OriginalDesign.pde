public class Player {
  int x = 50;
  int y = 50; 
  
  public Player() {
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
}



int x = 50;
int y = 50;

void setup()
{
  size(500,500);
}
void draw()
{
  ellipse(x,y,50,50);
}

void keyPressed() {
  if (key == 'w') {
     y = y - 10;
  }
  else if (key == 'a') {
     x = x - 10;
  }
  else if (key == 's') {
     y = y + 10;
  }
  else if (key == 'd') {
     x = x + 10;
  }
}
