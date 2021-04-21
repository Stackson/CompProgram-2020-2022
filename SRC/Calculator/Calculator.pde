/*/////
 2020 Calculator for Programming 1
 Jackson Campbell
 Nov 2020
 /////*/

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal, op;
boolean left;
float l, r, result;

void setup() {
  size(400, 550);
  dVal = "0";
  op = "";
  left = true;
  l = 0.0;
  r = 0.0;
  result = 0.0;
  opButtons[0] = new Button(10, 105, 68, 84, "+", false);
  opButtons[1] = new Button(88, 105, 68, 84, "-", false);
  opButtons[2] = new Button(166, 105, 68, 84, "x", false);
  opButtons[3] = new Button(244, 105, 68, 84, "÷", false);
  opButtons[4] = new Button(322, 105, 68, 84, "%", false);
  opButtons[5] = new Button(244, 194, 68, 84, ".", false);
  opButtons[6] = new Button(322, 194, 68, 84, "√", false);
  opButtons[7] = new Button(244, 283, 68, 84, "±", false);
  opButtons[8] = new Button(322, 283, 68, 84, "x²", false);
  opButtons[9] = new Button(244, 372, 146, 84, "Rand", false);
  opButtons[10] = new Button(88, 461, 146, 84, "CLEAR", false);
  opButtons[11] = new Button(244, 461, 146, 84, "=", false);

  numButtons[0] = new Button(10, 194, 68, 84, "7", true);
  numButtons[1] = new Button(88, 194, 68, 84, "8", true);
  numButtons[2] = new Button(166, 194, 68, 84, "9", true);
  numButtons[3] = new Button(10, 283, 68, 84, "4", true);
  numButtons[4] = new Button(88, 283, 68, 84, "5", true);
  numButtons[5] = new Button(166, 283, 68, 84, "6", true);
  numButtons[6] = new Button(10, 372, 68, 84, "1", true);
  numButtons[7] = new Button(88, 372, 68, 84, "2", true);
  numButtons[8] = new Button(166, 372, 68, 84, "3", true);
  numButtons[9] = new Button(10, 461, 68, 84, "0", true);
}  

void draw() {
  background(#25F2DF);

  updateDisplay();

  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
}

void updateDisplay() {
  rectMode(CORNER);
  fill(80);
  rect(10, 10, width-20, 90);

  fill(255);
  textAlign(RIGHT);

  if (dVal.length()<13) {
    textSize(45);
  } else if (dVal.length()<14) {
    textSize(40);
  } else if (dVal.length()<15) {
    textSize(35);
  } else if (dVal.length()<17) {
    textSize(33);
  } else if (dVal.length()<19) {
    textSize(30);
  } else if (dVal.length()<21) {
    textSize(27);
  } else if (dVal.length()<23) {
    textSize(22);
  } else if (dVal.length()<25) {
    textSize(20);
  } else {
    textSize(18);
  }
  text(dVal, width-20, 70);
}

void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }
  }

  println("L:" + l + "R:" + r + "Op:" + op);
  println("Result:" + result + "Left:" + left);
}

void keyPressed() {
  println("KEY:" + key + " KeyCode:" + keyCode);

  if (key == '0' && dVal.length()<20) {
    handleEvent("0", true);
  } else if (key == '1' && dVal.length()<20) {
    handleEvent("1", true);
  } else if (key == '2' && dVal.length()<20) {
    handleEvent("2", true);
  } else if (key == '3' && dVal.length()<20) {
    handleEvent("3", true);
  } else if (key == '4' && dVal.length()<20) {
    handleEvent("4", true);
  } else if (key == '5' && dVal.length()<20) {
    handleEvent("5", true);
  } else if (key == '6' && dVal.length()<20) {
    handleEvent("6", true);
  } else if (key == '7' && dVal.length()<20) {
    handleEvent("8", true);
  } else if (key == '8' && dVal.length()<20) {
    handleEvent("8", true);
  } else if (key == '9' && dVal.length()<20) {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == '%') {
    handleEvent("%", false);
  } else if (key == '^') {
    handleEvent("x²", false);
  } else if (key == '~') {
    handleEvent("√", false);
  } else if (key == 'r') {
    handleEvent("Rand", false);
  } else if (key == 'c' || key == DELETE || key == BACKSPACE) {
    handleEvent("CLEAR", false);
  } 
  if (key == ENTER || key == RETURN) {
    handleEvent("=", false);
  }
}

String handleEvent(String val, boolean num) {
  if (left && num) {
    if (dVal.equals("0")) {
      dVal = val;
      l = float(dVal);
    } else {
      dVal += val;
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0")) {
      dVal = val;
      r = float(dVal);
    } else {
      dVal += val;
      r = float(dVal);
    }
  } else if (val.equals("CLEAR")) {
    dVal = "0";
    op = "";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
  } else if (val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("x")) {
    if (!left) {
      performCalc();
    } else {
      op = "x";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("÷")) {
    if (!left) {
      performCalc();
    } else {
      op = "÷";
      left = false;
      dVal = "0";
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    if (!left) {
      dVal = str(l);
      l = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("±")) {
    if (left) {
      l*= -1;
      dVal = str(l);
    } else {
      r*= -1;
      dVal = str(r);
    }
  } else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("x²")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("Rand")) {
    if (!left) {
      l = random(0, 20);
      dVal = str(l);
    } else {
      r = random(0, 20);
      dVal = str(r);
    }
  } else if (val.equals("=")) {
    performCalc();
  }
  return val;
}

void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l =result;
  dVal = str(result);
  left = true;
}
