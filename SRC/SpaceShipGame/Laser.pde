PImage img5;
class Laser {
  //member variables
  int x, y, speed, rad, damage;

  //constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    speed = 8;
    rad = 15;
    damage = 50;
  }

  //display method
  void display() {
    img5 = loadImage("Projectile2.png");
    imageMode(CENTER);
    image(img5, x, y);
  }

  void fire() {
    y-=speed;
  }
  
  //rocket vs laser
  boolean rocketIntersection(EnemyLaser rocket) {
    float distance = dist(x, y, rocket.x, rocket.y);
    if (distance < rad + rocket.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
}
