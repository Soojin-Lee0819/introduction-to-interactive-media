class Cube {

  Cube() {
  }

  //initial position
  int x = 0;
  int y =  0;
  //random color generator
  float r = random(117, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  //random star position
  int star1 = int(random(10, 500));
  int star2 = int(random(10, 500));
  //gradient variables
  int gradientwidth = 20;
  int gradientheight = 20;
  final color purple = color(65, 4, 90);
  final color black = color(0);

  //cubes will move farther from each other with mouse position
  void right() {
    rotate(radians(20));
    x = mouseX;
    y = mouseY;
  }

  //cubes will rotate and move farther from each other with mouse position
  void left() {
    rotate(radians(20));
    x = -mouseX;
    y = -mouseY;
  }

  //random stars that will surround the cube
  void star() {
    fill(r, g, b);
    stroke(r, g, b);
    ellipse(star1, star2, 10, 10);
  }

  //drawing the cube
  void drawcube() {
    translate(x, y);
    strokeWeight(3);
    stroke(r, g, b);
    noFill();
    rect(0, 30, 80, 80);
    //back
    rect(30, 0, 80, 80);
    //left
    quad(30, 0, 30, 80, 0, 110, 0, 30);
    //bottom
    quad(0, 110, 80, 110, 110, 80, 30, 80);
    //right
    quad(110, 0, 110, 80, 80, 110, 80, 30);
    //top
    quad(0, 30, 80, 30, 110, 0, 30, 0);
  }

  //gradient background
  void backgroundcolor() {
    noStroke();
    for (int x=0; x<width; x+=gradientwidth) {
      for (int y=0; y<height; y+=gradientheight)
      {
        int location=x+y*width;
        float ratio=float(location)/(width*height);
        color gradient=lerpColor(purple, black, ratio);
        fill(gradient);
        rect(x, y, gradientwidth, gradientheight);
      }
    }
  }
}
//end of cube class

//Adding two arrays for each circle
Cube[] myCubeArray = new Cube[20];
Cube[] myCubeArray2 = new Cube[20];

void setup() {
  size(600, 600);
  for (int i=0; i < myCubeArray.length; i++) {
    myCubeArray[i] = new Cube();
  }
  for (int i=0; i < myCubeArray2.length; i++) {
    myCubeArray2[i] = new Cube();
  }
}

void draw() {
  background(0);
  //putting background as 1 "cube" only so it doesn't repeat with every cube and lag the system
  myCubeArray[1].backgroundcolor();
  //scaling down the cube and translating it to the center
  scale(0.4);
  translate(500, 300);
  for (int i=0; i < myCubeArray.length; i++) {
    myCubeArray[i].star();
    myCubeArray[i].drawcube();
    myCubeArray[i].right();
  }
  translate(700, 300);
  for (int i=0; i < myCubeArray2.length; i++) {
    myCubeArray2[i].star();
    myCubeArray2[i].drawcube();
    myCubeArray2[i].left();
  }
}
