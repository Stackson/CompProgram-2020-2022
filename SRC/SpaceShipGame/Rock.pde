PImage img4;
class Rock {
  //member variables
  int x, y, speed, rad,health;


  //constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    speed = int(random(3, 5));
    rad = 25;
    health = 100;
  }

  //display method
  void display() {
    img4 = loadImage("Rock1.png");
    imageMode(CENTER);
    image(img4, x, y);
  }

  void move() {
    y+=speed;
  }
  
  //rock vs collision
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
