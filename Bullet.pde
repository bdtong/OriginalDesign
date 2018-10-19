import java.awt.Rectangle;

public class Bullet {
  int x;
  int y;
  int velX;
  int velY;
  short angle;
  int id;
  
  public Bullet (int x, int y, short bulletAngle, int id) {
    this.x = x;
    this.y = y;
    angle = bulletAngle;
    this.id = id;
  }
  
  void tickBullet() {
    forward(10);
    x += velX;
    y += velY;
    borderDetection();
  }
  
  void drawBullet() {
    if (id == 1) {
      fill(#cc0000);
    }
    else {
      fill(#0080ff);
    }
    ellipse(x, y, 10, 10);
  }
  
  public Rectangle getBounds() {
        return new Rectangle(x - 3, y - 3, 5, 5);    
  }
  
  void borderDetection() {
    if (x < 0) {
      handler.removeObject(this);
      //System.out.println("deleted");
    }
    if (x >= 1000) {
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
