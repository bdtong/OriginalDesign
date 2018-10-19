import java.util.LinkedList;

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
