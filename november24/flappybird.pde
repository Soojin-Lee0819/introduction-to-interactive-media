// Arduino-Processing Assignment: Katie Ferreol
// November 24, 2020
// Use the R key to start the game, and use the J key to move past the pipes!

//importing communication
import processing.serial.*;
Serial myPort;
String val;
boolean firstContact = false;

//declaring picture variables
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage ground;
PImage pipes;
PImage bird;
PImage gameover;
PImage startscreen;

//declaring all distance variables
int x1 = -5;
int x2 = 500;
int pipesx1 = 500;
int pipesx2 = 850;
int pipesy1 = -700;
int pipesy2 = -500;
int rectx1 = 500;
int rectx2 = 850;
int recty1 = -700;
int recty2 = -500;
int birdx = 200;
int birdy = 400;
int boxx1 = 555;
int boxx2 = 905;

//declaring score variable
int score = 0;

//declaring time variable
int time = millis();

//declaring boolean variables
boolean did_print = false;
boolean player_lose = false;
boolean player_start = false;

//declaring font variable
PFont title;

void setup() {
  size(500, 800);
  
  //Arduino-Processing code
  myPort = new Serial(this, Serial.list()[6], 9600);
  myPort.bufferUntil('\n'); 
  
  //importing font
  title = createFont("emulogic.ttf", 50);

  //importing picture
  bg1 = loadImage("bg.png");
  bg2 = loadImage("bg2.png");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.png");
  ground = loadImage("ground.png");
  pipes = loadImage("pipes.png");
  bird = loadImage("bird0.png");
  gameover = loadImage("gameover.png");
  startscreen = loadImage("start.png");
}

void draw() {
  background(0);

  //if potentiometer is at 0 or Arduino shows A, show dayMode
  if ((val.equals("0")) || (val.equals("A"))) {
    dayMode();
  }

  //if potentiometer is at 1, show dayMode
  if (val.equals("1")) {
    nightMode();
  }

  //if potentiometer is at 2, show dayMode
  if (val.equals("2")) {
    neonMode();
  }

  //if potentiometer is at 3, show dayMode
  if (val.equals("3")) {
    knightMode();
  }

  //if the player presses R, start the game
  //used so that the player has time to change the background
  if (player_start == true)
  {
    pipesMove();
    rectMove();
    boxMove();
    groundMove();
    score();
  }

  birdMove();
  playerLose();
  startScreen();
}

//moving the ground
void groundMove() {
  image(ground, x1, 0, 508, 800);
  x1--;
  if (x1 != -5) {
    image(ground, x2, 0, 508, 800);
    x2--;
  }
  if (x1 == -510) {
    x1 = 500;
  }
  if (x1 == -5) {
    x2 = 500;
  }
}

//moving the pipes
void pipesMove() {
  image(pipes, pipesx1, pipesy1, 200, 1985);
  pipesx1-=3;
  if (pipesx1 == -196) {
    pipesx1 = 500;
    pipesy1 = int(random(-850, -450));
  }

  image(pipes, pipesx2, pipesy2, 200, 1985);
  pipesx2-=3;
  if ((pipesx1 == 119 && pipesx2 == -227) || (pipesx1 == 119 && pipesx2 == -186)) {
    pipesx2 = 510;
    pipesy2 = int(random(-850, -450));
  }
}

//moving rectangles that are used to determine if bird touches pipe, as image collision does not exist
void rectMove() {
  noFill();
  noStroke();
  rect(rectx1+52, recty1, 95, 1985);
  rectx1-=3;
  if (rectx1 == -196) {
    rectx1 = 500;
    recty1 = int(random(-850, -450));
  }

  rect(rectx2+52, recty2, 95, 1985);
  rectx2-=3;
  if ((rectx1 == 119 && rectx2 == -227) || (rectx1 == 119 && rectx2 == -186)) {
    rectx2 = 510;
    recty2 = int(random(-850, -450));
  }
}

//moving boxes that are used to determine if bird passes through pipe
void boxMove() {
  noFill();
  noStroke();
  rect(boxx1, 945+pipesy1, 90, 140);
  boxx1-=3;
  if ((boxx1 == -108) || (pipesx1 == -163)) {
    boxx1 = 590;
  }

  rect(boxx2, 945+pipesy2, 90, 140);
  boxx2-=3;
  if (boxx2 == -118) {
    boxx2 = 620;
  } else if (pipesx2 == -177) {
    boxx2 = 575;
  }
}

void dayMode() {
  image(bg1, x1, 0, 508, 800);
  x1--;
  if (x1 != -5) {
    image(bg1, x2, 0, 508, 800);
    x2--;
  }
  if (x1 == -510) {
    x1 = 500;
  }
  if (x1 == -5) {
    x2 = 500;
  }
}

void nightMode() {
  image(bg2, x1, 0, 508, 800);
  x1--;
  if (x1 != -5) {
    image(bg2, x2, 0, 508, 800);
    x2--;
  }
  if (x1 == -510) {
    x1 = 500;
  }
  if (x1 == -5) {
    x2 = 500;
  }
}

void neonMode() {
  image(bg3, x1, 0, 508, 800);
  x1--;
  if (x1 != -5) {
    image(bg3, x2, 0, 508, 800);
    x2--;
  }
  if (x1 == -510) {
    x1 = 500;
  }
  if (x1 == -5) {
    x2 = 500;
  }
}

void knightMode() {
  image(bg4, x1, 0, 508, 800);
  x1--;
  if (x1 != -5) {
    image(bg4, x2, 0, 508, 800);
    x2--;
  }
  if (x1 == -510) {
    x1 = 500;
  }
  if (x1 == -5) {
    x2 = 500;
  }
}

//moving bird
void birdMove() {
  image(bird, birdx, birdy, 100, 100);
  print(height-birdy);

  //if bird touches floor, lose
  if (player_start == true) {
    if (height-birdy <= 130) {
      player_lose = true;
    }
    if (keyPressed) {
      if (key == 'j') {
        //if bird touches pipes, player loses
        birdy = birdy - 5;
        if (((rectx1 - birdx < -9) && (rectx1 - birdx > -150) && (dist(birdx, birdy, boxx1, 945+pipesy1) >= 95))
          || ((rectx2 - birdx < -4) && (rectx2 - birdx > -115) && (dist(birdx, birdy, boxx2, 945+pipesy2) >= 95))) {
          player_lose = true;
        } else if ((dist(birdx, birdy, boxx1, 945+pipesy1) < 30) || (dist(birdx, birdy, boxx2, 945+pipesy2) < 30)) { 
          if (did_print == false) {
            myPort.write('4');
            score += 1;
            //boolean function that helps play 1-UP sound effect
            did_print = true;
          }
        } else {
          if (did_print == true) {
            myPort.write('5');
            //boolean function that helps play 1-UP sound effect
            did_print = false;
          }
        }
      }
    } else {
      birdy = birdy + 5;
    }
  }
}

void score() {
  textFont(title);
  textSize(20);
  text("Score: " + score, 20, 40);
}

void startScreen() {
  if (player_start == false) {
    image(startscreen, 0, 0, 508, 800);
  }
  if (keyPressed) {
    if (key == 'r') {
      player_start = true;
    }
  }
}

void playerLose() {
  if (player_lose == true) {
    image(gameover, 0, 0, 508, 800);
    textSize(30);
    text(score, 300, 440);
    noLoop();
  }
}

//function that connects to Arduino
void serialEvent( Serial myPort) {
  val = myPort.readStringUntil('\n');
  if (val != null) {
    val = trim(val);

    if (firstContact == false) {
      if (val.equals("A")) {
        myPort.clear();
        firstContact = true;
      }
    } else { 
      println(val);
      myPort.write("A");
    }
  }
}
