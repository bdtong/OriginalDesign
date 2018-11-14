import java.util.Random;

class Laser {
  int x;
  int y;
  int id;
  Particle particles[];
  int[] spawnX;
  int[] spawnY;
  int[] quad;
  
  public Laser(int x, int y, int id){
    this.id = id;
    this.x = x;
    this.y = y;
    
    particles = new Particle[12];
    spawnX = new int[12];
    spawnY = new int[12];
    quad = new int[12];
    
    for (int i = 0; i < 12; i++) {
      Random rand = new Random();
      int temp = rand.nextInt(20) + 5;
      spawnX[i] = temp;
      //System.out.println("X: " + temp);
    }
    
    for (int j = 0; j < 12; j++) {
      Random rand = new Random();
      int temp = rand.nextInt(20) + 5;
      spawnY[j] = temp;
      //System.out.println("Y: " + temp);
    }
    
    for (int k = 0; k < 12; k++) {
      Random rand = new Random();
      int temp = rand.nextInt(4) + 1;
      quad[k] = temp;
      //System.out.println("Quad: " + temp);
    }
    
    for (int l = 0; l < particles.length; l++) {
       Particle temp = new Particle(spawnX[l], spawnY[l], x, y, quad[l], id); 
       particles[l] = temp;  
       System.out.println("Player " + id + ": " + l + " particle made.");
    }
  }
  
  public void chargeLaser(int velX, int velY) {
    
    for (int i = 0; i < particles.length; i++) {
      
      particles[i].moveParticle(velX, velY);
      //MAKE A PARTICLE CLASS. PUT PARTICLES WITIN LASER
      fill(#ffffff);
      noStroke();
      
      //if (particles[i].getQuad() == 1) {
        particles[i].drawParticle();
     // }
        //ellipse(x + spawnX[i], y + spawnY[i], 6, 6);
          //int slope = (y - spawnY[i]) / (x - spawnX[i]);
      //if (particles[i].getQuad() == 2) {
     // }
        //ellipse(x + spawnX[i], y - spawnY[i], 6, 6);
      //if (particles[i].getQuad() == 3)
        //ellipse(x - spawnX[i], y + spawnY[i], 6, 6);
      //if (particles[i].getQuad() == 4)
        //ellipse(x - spawnX[i], y - spawnY[i], 6, 6);
     
      //popMatrix();
    }
    
    //chargeWidth--;
    //chargeLength--;
    
    //chargeX++;
    //chargeY++;
  }
  
  public void moveLaser(int velX, int velY) {
    borderDetection();
    x += velX;
    y += velY;  
  }
  
  public void drawLaser(int velX, int velY) {
    
      chargeLaser(velX, velY);
    
      fill(#ffffff);
      noStroke();
      ellipse(x, y, 10, 10); 
      rect(x + 25, y - 15, 1000, 30);
      triangle(x, y, x + 25, y + 15, x + 25, y - 15);
      
      //stroke(#8b0000);
      //noFill();
  }
  
  public void borderDetection() {
    if (id == 1) { //added 40
      if (x < 40) {
        x = 40;
      }
      if (x >= 510) { //added 40
        x = 510;
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
  
}
