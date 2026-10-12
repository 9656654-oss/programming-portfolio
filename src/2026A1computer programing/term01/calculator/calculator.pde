// roman suprise| 9/14/26|calculator assignment
String displayVal;
float l, r, result;
char op;
boolean left;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];

void setup () {
  size(300, 300);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;

  numButtons[0] = new Button(20, 140, 20, 20, '0');
  numButtons[1] = new Button(20, 110, 20, 20, '1');
  numButtons[2] = new Button(50, 110, 20, 20, '2');
  numButtons[3] = new Button(80, 110, 20, 20, '3');
  numButtons[4] = new Button(20, 80, 20, 20, '4');
  numButtons[5] = new Button(50, 80, 20, 20, '5');
  numButtons[6] = new Button(80, 80, 20, 20, '6');
  numButtons[7] = new Button(50, 140, 20, 20, '7');
  numButtons[8] = new Button(50, 50, 20, 20, '8');
  numButtons[9] = new Button(80, 50, 20, 20, '9');


  opButtons[0] = new Button(20, 50, 20, 20, 'C');
  opButtons[1] = new Button(110, 50, 20, 20, '+');
  opButtons[2] = new Button(110, 80, 20, 20, '-');
  opButtons[3] = new Button(110, 110, 20, 20, 'x');
  opButtons[4] = new Button(110, 140, 20, 20, '/');
  opButtons[5] = new Button(80, 140, 20, 20, '±');
  opButtons[6] = new Button(150, 140, 20, 20, '=');
  opButtons[7] = new Button(150, 80, 20, 20, '.');
  opButtons[8] = new Button(150, 50, 20, 20, '%');
  opButtons[9] = new Button(180, 50, 20, 20, '?');
  opButtons[10] = new Button(200, 50, 20, 20, '?');
  opButtons[11] = new Button(220, 50, 20, 20, '?');
  opButtons[12] = new Button(150, 110, 20, 20, '?');
}
void draw() {
  background(33);
  updateDisplay();
  for (int i = 0; i< numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i< opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  //Background shape
  rectMode(CENTER);
  fill(#8D99B7);
  rect(width/2, height/2, height-20, 80, 8);

  //overlay text
  fill(255);
  textAlign(RIGHT, CENTER);
  textSize(14);
  text(displayVal, width-250, 20);
}
void mousePressed() {
  // Check Number Buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleNumber(numButtons[i].val);
      return;
    }
  }

  //Check Operator Buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleOperator(opButtons[i].val);
      return;
    }
  }
}
//  void mousePressed() {
//    // Check Number Buttons
//    for (int i = 0; i < numButtons.length; i++) {
//      if (numButtons[i].isHovered) {
//        handleNumber(numButtons[i].val);
//        return;
//      }
//    }
//  }

//  // Check Operator Buttons
//  for (int i = 0; i < opButtons.length; i++) {
//    if (opButtons[i].isHovered) {
//      handleOperator(opButtons[i].val);
//      return;
//    }
//  }
//}
void handleNumber(char num) {
  if (displayVal.equals("0.0") || displayVal.equals("0")) {
    displayVal = String.valueOf(num);
  } else {
    displayVal += num;
  }
}

void handleOperator(char opChar) {
  if (opChar == 'C') {
    displayVal = "0.0";
    l = 0;
    r = 0;
    op = ' ';
    left = true;
  } else if (opChar == '+' || opChar == '-' || opChar == 'x' || opChar == '/') {
    l = float(displayVal);
    op = opChar;
    displayVal = "0";
  } else if (opChar == '=') {
    r = float(displayVal);
    if (op == '+') result = l + r;
    if (op == '-') result = l - r;
    if (op == 'x') result = l * r;
    if (op == '/') result = (r != 0) ? l / r : 0; // Prevent dividing by zero

    displayVal = String.valueOf(result);
    op = ' ';
  } else if (opChar == '.') {
    if (!displayVal.contains(".")) {
      displayVal += ".";
    }
  }
}
