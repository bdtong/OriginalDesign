class Particle {
  int xPos; //offsets
  int yPos;
  int xCenter; //origin
  int yCenter;
  int xCombined; //origin +/- offset
  int yCombined;
 // int xCombined; //origin +/- offset
 // int yCombined;
  int quad;
  int slope;
  int id;
  
  public Particle(int xPos, int yPos, int xCenter, int yCenter, int quad, int id) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.xCenter = xCenter;
    this.yCenter = yCenter;
    this.quad = quad;
    this.id = id;
     if (quad == 1) {
      xCombined = xCenter + xPos;
      yCombined = yCenter + yPos;
    }
    if (quad == 2) {
      xCombined = xCenter - xPos;
      yCombined = yCenter + yPos;
    }
    if (quad == 3) {
      xCombined = xCenter + xPos;
      yCombined = yCenter - yPos;
    }
    if (quad == 4) {
      xCombined = xCenter - xPos;
      yCombined = yCenter - yPos;
    }
    //move quad calculations of combined here
    //borderdetection does not work
    int top = yPos - yCenter;
    int bottom = xPos - xCenter;
    slope = top/bottom;
  }
  
  public int getQuad() {
    return quad;
  }
  
  public void moveParticle(int xVel, int yVel) {
     borderDetection();
     xCombined += xVel; 
     yCombined += yVel;
  }
  
  public void drawParticle() {
    //if (quad == 1) {
      //xCombined = xCenter + xPos;
      //yCombined = yCenter + yPos;
      ellipse(xCombined, yCombined , 6, 6);
    /*}
    if (quad == 2) {
      xCombined = xCenter - xPos;
      yCombined = yCenter + yPos;
      ellipse(xCombined, yCombined, 6, 6);
    }
    if (quad == 3) {
      xCombined = xCenter + xPos;
      yCombined = yCenter - yPos;
      ellipse(xCombined, yCombined, 6, 6);
    }
    if (quad == 4) {
      xCombined = xCenter + xPos;
      yCombined = yCenter - yPos;
      ellipse(xCombined, yCombined, 6, 6);
    }*/
  }
  
  public void borderDetection() {
    if (id == 1) { //added 40
      if (xCombined < 0) {
        xCombined = 0;
      }
      if (xCombined >= 510) { //added 40
        xCombined = 510;
      }
      if (yCombined < 0) {
        yCombined = 0;
      }
      if (yCombined >= 500) {
        yCombined = 500;
      }
    }
    if (id == 2) {
      if (xCombined < 520) {
        xCombined = 520;
      }
      if (xCombined >= 1000) {
        xCombined = 1000;
      }
      if (yCombined < 0) {
        yCombined = 0;
      }
      if (yCombined >= 500) {
        yCombined = 500;
      }
    }
  }
  
}
