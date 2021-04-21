class Button {
  // Member Variables
  int x, y, w, h;
  String val;
  boolean hover, isNumber;
  color c1, c2;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    hover = false;
    c1 = #2A50A0;
    c2 = #A521E8;
    this.isNumber = isNumber;
  }

  // Display the Button
  void display() {
    if(isNumber == true){ //number
      if (hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    //rectMode(CENTER);
    rect(x, y, w, h, 20);
    fill(255);
    textAlign(CENTER);
    textSize(45);
    text(val, x+w/2, y+58);
    } else { //non-number
      if (hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    //rectMode(CENTER);
    rect(x, y, w, h, 20);
    fill(255);
    textAlign(CENTER);
    textSize(45);
    text(val, x+w/2, y+58);
    }
  }

  // Edge Detection
  void hover() {
    hover = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y+h;
  }
}
