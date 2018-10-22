public class Powerup {
  int capacity = 3;
  int id;
  
  public Powerup(int id) {
    this.id = id;
  }
  
  void displayCapacity() {
    fill(#ffffff);
    text(String.valueOf(capacity), 275, 29);
    //if (id == 1) {
     // image(img, 500, 100);
    //}
  }
 
}
