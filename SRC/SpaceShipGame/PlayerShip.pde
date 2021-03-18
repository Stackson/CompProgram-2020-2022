PImage img1;
class PlayerShip {
  //member variables
  int x, y, health, ammo, rad;

  //constructor
  PlayerShip() {
    x = 0;
    y = 0;
    health = 200;
    ammo = 1000;
    rad = 25;
  }

  //display method
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    img1 = loadImage("PlayerShip.png");
    imageMode(CENTER);
    image(img1, x, y);
  }

  //detect rock vs venator
  boolean rockIntersection(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y);
    if (distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }
  //detect rocket vs venator
  boolean rocketIntersection(EnemyLaser rocket) {
    float distance = dist(x, y, rocket.x, rocket.y);
    if (distance < rad + rocket.rad) {
      return true;
    } else {
      return false;
    }
  }
  //detect pelican vs venator
  boolean pelicanIntersection(EnemyShip pelican) {
    float distance = dist(x, y, pelican.x, pelican.y);
    if (distance < rad + pelican.rad) {
      return true;
    } else {
      return false;
    }
  }
}
