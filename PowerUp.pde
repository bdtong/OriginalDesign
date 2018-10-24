public class Powerup {
  int capacity = 10;
  int id;
  
  public Powerup(int id) {
    this.id = id;
  }
  
  void displayCapacity() {
    if (id == 1) {
      fill(#ffffff);
      text(String.valueOf(capacity), 275, 28);
    } 
    else {
      fill(#ffffff);
      text(String.valueOf(capacity), 735, 28);
    }
  }
  
  void decreaseCapacity() {
    capacity--;
  }
  
  int getCapacity() {
    return capacity;
  }
 
}
