import java.util.Random;

class Laser {
  int x;
  int y;
  short[] spawnAngles;
  int spawnDistance = 10;
  
  public Laser(int x, int y){
    
    this.x = x;
    this.y = y;
    
    spawnAngles = new short[10];
    
    for (int i = 0; i < 10; i++) {
      Random rand = new Random();
      int n = rand.nextInt(360) + 0;
      spawnAngles[i] = (short) n;
      System.out.println(n);
    }
  }
  
  public void chargeLaser() {
    
    //translation
    //rotation
    
    for (int i = 0; i <= spawnAngles.length; i++) {
      pushMatrix();
      
      ellipse(x + 40, y , 6, 6);
    }
  }
  
  public void moveLaser(int velX, int velY) {
    x += velX;
    y += velY;  
  }
  
  public void drawLaser() {
    ellipse(x, y, 6, 6);
  }
  
}
