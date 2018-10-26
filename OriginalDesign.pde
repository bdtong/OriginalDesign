boolean[] keyDown = new boolean[8];
PImage tripleico;

void setup()
{
  tripleico = loadImage("tripleicon.png");
  keyDown[0] = false;
  keyDown[1] = false;
  keyDown[2] = false;
  keyDown[3] = false;
  keyDown[4] = false;
  keyDown[5] = false;
  keyDown[6] = false;
  keyDown[7] = false;
  size(1000,500);
}

Player player = new Player(50, 250,(short) 0, 1);
Player player2 = new Player(950, 250, (short) 180, 2);
boolean playerDeath = false;
boolean player2Death = false;
Handler handler = new Handler();

void draw()
{
  //Background
  background(0);
  stroke(#cc0000);
  fill(#000000);
  rect(2,2,496, 496);
  stroke(#0080ff);
  fill(#000000);
  rect(501,2, 496,495);
  
  //Player 1
  if (player.isDead() == 0) {
    player.drawPlayer();
  }
  else {
    textSize(32);
    fill(#ffffff);
    text("You Win", 695, 150); 
  }
  player.healthbar.drawHealth();
  image(tripleico, 250, 14);
  player.PU.displayCapacity();
  
  //Player 2
  if (player2.isDead() == 0) {
    player2.drawPlayer();
  } 
  else {
    textSize(32);
    fill(#ffffff);
    text("You Win", 175, 150); 
  }
  player2.healthbar.drawHealth();
  image(tripleico, 710, 14);
  player2.PU.displayCapacity();
  
  //Bullet Handling
  handler.tickBullet();
  handler.drawBullet();
}

void keyPressed() {
  
  //player
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
  
  //player2
  if (key == '8') {
     player2.setVelY(-5);
     keyDown[4] = true;
  }
  else if (key == '4') {
     player2.setVelX(-5);
     keyDown[6] = true;
  }
  else if (key == '5') {
     player2.setVelY(5);
     keyDown[5] = true;
  }
  else if (key == '6') {
     player2.setVelX(5);
     keyDown[7] = true;
  }
}

void keyReleased() {
  
  //player
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
  if (key == 'n') {
    player.doAction2();
  }
  
  //player2
  if (key == '8') {
     keyDown[4] = false;
  }
  else if (key == '4') {
     keyDown[6] = false;
  }
  else if (key == '5') {
     keyDown[5] = false;
  }
  else if (key == '6') {
     keyDown[7] = false;
  }
  if (!keyDown[4] && !keyDown[5]){
     player2.setVelY(0);
  }
  if (!keyDown[6] && !keyDown[7]){
     player2.setVelX(0);
  }
  if (key == '0') {
    player2.doAction();
  }
  if (key == '.') {
    player2.doAction2();
  }
}
