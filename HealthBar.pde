public class HealthBar {
  int health = 100;
  int id;
  
  public HealthBar (int id) {
    this.id = id;
  }
  
  public void tick() {
    health = checkborder(health, 0, 100);
  }
  
  public void drawHealth() {
    
    this.tick(); 
    stroke(#000000);
    
    if (id == 1) {
      fill(#d3d3d3);
      rect(10, 10, 200, 25);
      if (health >= 70) {
        fill(0,200,0);
      }
      else if (health <= 69 && health >= 30) {
        fill(#ffae42);
      }
      else if (health < 30) {
        fill(#BA4646);
      }
      rect(10, 10, health * 2, 25);
    }
    else {
      fill(#d3d3d3);
      rect(785, 10, 200, 25);
      if (health >= 70) {
        fill(0,200,0);
      }
      else if (health <= 69 && health >= 30) {
        fill(#ffae42);
      }
      else if (health < 30) {
        fill(#BA4646);
      }
      rect(785, 10, health * 2, 25);
    }
  }
  
  public int checkborder(int var, int min, int max) {
        if (var >= max) 
            return max;
        else if (var <= min)
            return min;
        else 
            return var;
    }
  
}
