int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  x = 10;
  y = 10;
}

void draw() {
  fill(0);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      moveUp(10);
    } else if (key == 'a' || key == 'A') {
      moveLeft(10);
    } else if (key == 's' || key == 'S') {
      moveDown(10);
    } else if (key == 'd' || key == 'D') {
      moveRight(10);
    }
  }
}

void mouseClicked() {
  saveFrame("image-######.png");
}

void drawName() {
  //J
  moveRight(60);
  moveLeft(30);
  moveDown(100);
  moveLeft(30);
  moveUp(30);
  moveDown(30);
  //A
  moveRight(45);
  moveRightUp(50);
  moveRight(60);
  moveLeft(60);
  moveRightUp(30);
  moveDownRight(80);
  //C
  moveRight(50);
  moveLeft(50);
  moveUp(100);
  moveRight(50);
  moveDown(5);
  moveRight(30);
  //K
  moveUp(5);
  moveDown(50);
  moveRightUp(45);
  moveDownLeft(45);
  moveDownRight(50);
  moveLeftUp(50);
  moveDown(50);
}
//moveRight(10); moveDown(10); moveLeft(10); moveUp(10); moveRightUp(10); moveLeftUp(10); moveDownRight(10); moveDownLeft(10);

//method to draw to the right
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

void moveRightUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}  

void moveLeftUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}

void moveDownRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  y=y+rep;
  x=x+rep;
}

void moveDownLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}
