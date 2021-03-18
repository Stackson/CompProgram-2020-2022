PImage img7;
class EnemyLaser {
  //member variables
  int x, y, speed, rad, damage;


  //constructor
  EnemyLaser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 8;
    rad = 15;
    damage = 50;
  }
    
  //display method
  void display() {
    img7 = loadImage("EnemyLaser.png");
    imageMode(CENTER);
    image(img7, x, y);
  }

  void fire() {
    y+=speed;
  }
  
  //laser vs rocket
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y<+10) {
      return true;
    } else {
      return false;
    }
  }
}
