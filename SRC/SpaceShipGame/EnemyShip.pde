PImage img2;
class EnemyShip {
  //member variables
  int x, y, health, ammo, rad, speed;
  int totalTime;
  int savedTime;

  //constructor
  EnemyShip(int x, int y, int t) {
    this.x = x;
    this.y = y;
    health = 100;
    ammo = 1000;
    rad = 25;
    speed = 3;
    this.totalTime = t;
  }

  //display method
  void display() {
    img2 = loadImage("EnemyShip.png");
    imageMode(CENTER);
    image(img2, x, y);
  }

  void move() {
    y += speed;
  }

  //laser vs pelican
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance < rad + laser.rad) {
      return true;
    } else {
      return false;
    }
  }
  //venator vs pelican
  boolean venatorIntersection(PlayerShip venator) {
    float distance = dist(x, y, venator.x, venator.y);
    if (distance < rad + venator.rad) {
      return true;
    } else {
      return false;
    }
  }

  void start() {
    savedTime = millis();
  }

  boolean isFinished() {
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
