float x, y, strokeW, pointCount;
int frameCheck = 0;

void setup() {
  size(displayWidth, displayHeight);
  background(128);
  x = random(width);
  y = random(height);
}

void draw() {
  frameCheck++;
  int rand = int(random(100));
  strokeW = random(1, 6);
  pointCount = random(2, 20);
  stroke(random(50), random(200), random(255));
  if (frameCheck < 500) {
    if (x>width || x<0 || y>height || y<0) {
      x = random(width);
      y = random(height);
    } else {
      strokeWeight(strokeW);
      if (rand>70) {
        moveLeft(x, y, pointCount);
      } else if (rand>50) {
        moveRight(x, y, pointCount);
      } else if (rand>30) {
        moveDown(x, y, pointCount);
      } else if (rand>10) {
        moveUp(x, y, pointCount);
      } else if (rand>80) {
        moveRightUp(x, y, pointCount);
      } else if (rand>60) {
        moveLeftDown(x, y, pointCount);
      } else if (rand>40) {
        moveLeftUp(x, y, pointCount);
      } else if (rand>20) {
        moveRightDown(x, y, pointCount);
      }
    }
  } else {
    frameCheck = 0;
    background(200, random(196), random(16));
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY);
    x = startX+i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY);
    x = startX-i;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY-i);
    y = startY-i;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX, startY+i);
    y = startY+i;
  }
}

void moveRightUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY-i);
    x = startX+i;
    y = startY-i;
  }
}

void moveRightDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX+i, startY+i);
    x = startX+i;
    y = startY+i;
  }
}

void moveLeftUp(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY-i);
    x = startX-i;
    y = startY-i;
  }
}

void moveLeftDown(float startX, float startY, float moveCount) {
  for (float i=0; i<moveCount; i++) {
    point(startX-i, startY+i);
    x = startX-i;
    y = startY+i;
  }
}
