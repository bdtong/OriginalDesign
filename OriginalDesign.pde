import java.util.LinkedList;

public class Player {
  int x;
  int y; 
  int velX;
  int velY;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  
  public Player() {
    setX(50);
    setY(50);
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
  
  public void setVelX(int x) {
    this.velX = x;
  }
  
  public void setVelY(int y) {
    this.velY = y;
  }
  
  public int getVelX() {
    return velX;
  }
  
  public int getVelY() {
    return velY;
  }
  
  public void setUp() {
    this.up = true;
  }
  
  public void setDown() {
    this.down = true;
  }
  
  public void setLeft() {
    this.left = true;
  }
  
  public void setRight() {
    this.right = true;
  }
  
  public void drawPlayer() {
    x += velX;
    y += velY;
    ellipse(x,y,50,50);
    borderDetection();
  }
  
  public void doAction() {
    handler.addObject(new Bullet(player.getX(), player.getY()));
  }
  
  public void borderDetection() {
    if (x < 0) {
      x = 0;
    }
    if (x >= 500) {
      x = 500;
    }
    if (y < 0) {
      y = 0;
    }
    if (y >= 500) {
      y = 500;
    }
  }
}

public class Bullet {
  int x;
  int y;
  int velX;
  int velY;
  short angle;
  
  public Bullet (int x, int y) {
    this.x = x;
    this.y = y;
    angle = 270;
  }
  
  void tickBullet() {
    forward(10);
    x += velX;
    y += velY;
    borderDetection();
  }
  
  void drawBullet() {
    ellipse(x, y, 10, 10);
  }
  
  void borderDetection() {
    if (x < 0) {
      handler.removeObject(this);
      //System.out.println("deleted");
    }
    if (x >= 500) {
      handler.removeObject(this);
      //System.out.println("deleted");
    }
    if (y < 0) {
      handler.removeObject(this);
      //System.out.println("deleted");
    }
    if (y >= 500) {
      handler.removeObject(this);
      //System.out.println("deleted");
    }
  }
  
  public void forward(int speed){
      velX = (int) Math.round(speed * Math.cos(Math.toRadians(angle)));
      velY = (int) Math.round(speed * Math.sin(Math.toRadians(angle)));
    }
    
}
public class Handler {
    LinkedList<Bullet> bulletList = new LinkedList<Bullet>();
    
    public void addObject(Bullet bullet) {
        bulletList.add(bullet);
    }
    
    public void removeObject(Bullet bullet) {
        bulletList.remove(bullet);
    }
    
    public void tickBullet() {
         for (int i = 0; i < bulletList.size(); i++) {
             Bullet temp = bulletList.get(i);
             temp.tickBullet(); 
         }
     }

     public void drawBullet() {
           for (int i = 0; i < bulletList.size(); i++) { 
             Bullet temp = bulletList.get(i);
             temp.drawBullet(); 
         }
     }
}

Player player = new Player();
Handler handler = new Handler();
boolean[] keyDown = new boolean[4];

void setup()
{
  keyDown[0] = false;
  keyDown[1] = false;
  keyDown[2] = false;
  keyDown[3] = false;
  size(500,500);
}
void draw()
{
  background(0);
  player.drawPlayer();
  handler.tickBullet();
  handler.drawBullet();
}

void keyPressed() {
  if (key == 'w') {
     player.setVelY(-5);
     keyDown[0] = true;
  }
  else if (key == 'a') {
     player.setVelX(-5);
     keyDown[2] = true;
  }
  else if (key == 's') {
     player.setVelY(5);
     keyDown[1] = true;
  }
  else if (key == 'd') {
     player.setVelX(5);
     keyDown[3] = true;
  }
}

void keyReleased() {
  if (key == 'w') {
     keyDown[0] = false;
  }
  else if (key == 'a') {
     keyDown[2] = false;
  }
  else if (key == 's') {
     keyDown[1] = false;
  }
  else if (key == 'd') {
     keyDown[3] = false;
  }
  if (!keyDown[0] && !keyDown[1]){
     player.setVelY(0);
  }
  if (!keyDown[2] && !keyDown[3]){
     player.setVelX(0);
  }
  if (key == 'b') {
    player.doAction();
  }
}
