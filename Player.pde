import java.awt.Rectangle;

public class Player {
  int x;
  int y; 
  int velX;
  int velY;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  short bulletAngle;
  int id;
  int dead;
  HealthBar healthbar;
  
  public Player(int x, int y, short bulletAngle, int id) {
    setX(x);
    setY(y);
    this.bulletAngle = bulletAngle;
    this.id = id;
    healthbar = new HealthBar(id);
    dead = 0;
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
    
    if (id == 1) {
      stroke(#990000);
      fill(#cc0000);
    } else {
      stroke(#005ab3);
      fill(#0080ff);
    }
    
    ellipse(x,y,50,50);
    collision();
    borderDetection();
    
    if (healthbar.health == 0) {
      setDead();
    }
  }
  
  public Rectangle getBounds() {
        return new Rectangle(x - 17, y - 17, 35, 35);    
  }
  
  public void doAction() {
    if (dead == 0)
      handler.addObject(new Bullet(this.getX(), this.getY(), bulletAngle, this.id));
  }
  
  public void borderDetection() {
    if (id == 1) {
      if (x < 0) {
        x = 0;
      }
      if (x >= 470) {
        x = 470;
      }
      if (y < 0) {
        y = 0;
      }
      if (y >= 500) {
        y = 500;
      }
    }
    if (id == 2) {
      if (x < 520) {
        x = 520;
      }
      if (x >= 1000) {
        x = 1000;
      }
      if (y < 0) {
        y = 0;
      }
      if (y >= 500) {
        y = 500;
      }
    }
  }
  
  public void collision() {
    for (int i = 0; i < handler.bulletList.size(); i++) {
      Bullet temp = handler.bulletList.get(i);
      if (getBounds().intersects(temp.getBounds())) {
          if (temp.id != this.id) {
            this.healthbar.health = this.healthbar.health - 5;
            handler.removeObject(temp);
          }
      }
    }
  }
  
  public void setDead() {
    dead = 1;
  }
  
  public int isDead() {
    return dead;
  }
}
