// FINAL PROJECT: Katie Ferreol
// December 10, 2020
// Use the R key to start the game, or press C to customize your game!
// Use the Arduino buttons to change your bird's color, and the potentiometer to change your background!
// Press the spacebar and fly into the pipes! If you hit any or hit the ground, you lose!

//importing communication
import processing.serial.*;
Serial myPort;      // The serial port
int[] serialInArray = new int[2]; // Where we'll put what we receive
int serialCount = 0;     // A count of how many bytes we receive
boolean firstContact = false;

//declaring picture variables
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage sun;
PImage moon;
PImage rainbow;
PImage ghost;
PImage ground;
PImage topPipe;
PImage botPipe;
PImage yellowbird;
PImage redbird;
PImage bluebird;
PImage gameover;
PImage startscreen;
PImage getreadyscreen;
PImage customizationscreen;

//declaring all distance variables
int x1 = -5;
int x2 = 500;
float birdx = 200;
float birdy = 400;

//declaring variables for bird's flight
int gravity = 1;
int velocity;
int total = 0;
float lift = -9;

//declaring player's choice variables for bg and bird color
int whichbird = 0;
int whichbg = 0;

//declaring score variable
int score = 0;

//declaring time variable
int time = millis();
int countdown = 300;

//declaring array for pipes
int[] pipeX, pipeY;

//declaring boolean variables
boolean did_print = false;
boolean player_lose = false;
boolean player_start = false;
boolean start_screen = true;
boolean custom_screen = false;
boolean get_ready = false;

//declaring font variable
PFont title;

void setup() {
  size(500, 800);

  //Arduino-Processing code
  String portName = Serial.list()[6];
  myPort = new Serial(this, portName, 9600);

  //importing font
  title = createFont("emulogic.ttf", 50);

  //importing picture
  bg1 = loadImage("bg.png");
  bg2 = loadImage("bg2.png");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.png");
  sun = loadImage("sun.png");
  moon = loadImage("moon.png");
  rainbow = loadImage("rainbow.png");
  ghost = loadImage("ghost.png");
  ground = loadImage("ground.png");
  botPipe = loadImage("botPipe.png");
  topPipe = loadImage("topPipe.png");
  yellowbird = loadImage("yellowbird.png");
  redbird = loadImage("redbird.png");
  bluebird = loadImage("bluebird.png");
  gameover = loadImage("gameover.png");
  startscreen = loadImage("start.png");
  getreadyscreen = loadImage("getready.png");
  customizationscreen = loadImage("customize.png");

  //declaring a bunch of pipes
  pipeX = new int[1000000];
  pipeY = new int[pipeX.length];

  for (int i = 0; i < pipeX.length; i++)
  {
    pipeX[i] = width + 200*i;
    pipeY[i] = (int)random(-350, 0);
  }
}

void draw() {
  background(0);

  //if potentiometer is at 0 or Arduino shows A, show dayMode
  if (whichbg == 0) {
    dayMode();
  }

  //if potentiometer is at 1, show dayMode
  if (whichbg == 1) {
    nightMode();
  }

  //if potentiometer is at 2, show dayMode
  if (whichbg == 2) {
    neonMode();
  }

  //if potentiometer is at 3, show dayMode
  if (whichbg == 3) {
    knightMode();
  }

  //if the player presses R, start the game
  //used so that the player has time to change the background
  if (player_start == true)
  {
    if (frameCount % 80 == 0) {
      total = total + 1;
    }
    pipesMove();
    groundMove();
    score();
  }

  getreadyScreen();
  birdMove();
  playerLose();
  customizeScreen();
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
  for (int i = 0; i < total; i++)
  {
    image(topPipe, pipeX[i], pipeY[i]);
    image(botPipe, pipeX[i], pipeY[i] + 680);
    pipeX[i]-= 2;

    //Check for Collision
    if (birdx > (pipeX[i]-35) && birdx < pipeX[i] + 92) {
      if (!(birdy > pipeY[i] + 449 && birdy < pipeY[i] + (449 + 231-49))) {
        player_lose = true;
      } else {
        if (did_print == false && pipeX[i] == 210) {
          myPort.write('4');
          score = score + 1;
          did_print = true;
        } else if (did_print == true && pipeX[i] == 190) {
          myPort.write('5');
          did_print = false;
        }
      }
    }
  }
}

//Background #1
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

//Background #2
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

//Background #3
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

//Background #4
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
  //if bird touches floor, lose
  if (player_start == true) {
    if (whichbird == 0) {
      image(yellowbird, birdx, birdy, 100, 100);
    }
    if (whichbird == 1) {
      image(redbird, birdx, birdy, 100, 100);
    }
    if (whichbird == 2) {
      image(bluebird, birdx, birdy, 100, 100);
    } 
    if (height-birdy <= 130) {
      player_lose = true;
    }
    if (birdy < 0) {
      birdy = 0;
      velocity = 0;
    }
    birdy = birdy + velocity;
    velocity = velocity + gravity;
  }
}

//pressing spacebar
void keyPressed() {
  if (key == ' ') {
    velocity = -8;
  }
}

//putting score on upper left corner
void score() {
  fill(255);
  textFont(title);
  textSize(20);
  text("Score: " + score, 20, 40);
}

//starting screen
void startScreen() {
  if (player_start == false && start_screen == true) {

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

    image(startscreen, 0, 0, 508, 800);
    image(yellowbird, birdx, birdy, 100, 100);
  }
  //you can't press anything until the starting melody is finished playing
  if ((millis() > time + 8000) && (keyPressed)) {
    if (key == 'r') {
      time = millis();
      start_screen = false;
      get_ready = true;
    }
  }
}

//customization screen
void customizeScreen() {
  textFont(title);
  textSize(10);
  fill(85, 55, 70);

  //you can't press anything until the starting melody is finished playing
  if ((millis() > time + 8000) && keyPressed) {
    if (key == 'c') {
      custom_screen = true;
      start_screen = false;
      time = millis();
    } 
  }
  if (keyPressed) {
    if ((custom_screen == true) && (key == 'r')) {
      custom_screen = false;
      get_ready = true;
      birdx = 200;
      birdy = 400;
      time = millis();
    }
  }
  if (custom_screen == true) {
    image(customizationscreen, 0, 0, 508, 800);
    birdx = 80;
    birdy = 280;

    if (whichbg == 0) {
      image(sun, 80, 580, 100, 100);
      text("Morning", 95, 730);
    } else if (whichbg == 1) {
      image(moon, 80, 580, 100, 100);
      text("Evening", 95, 730);
    } else if (whichbg == 2) {
      image(rainbow, 60, 580, 156, 100);
      text("Rainbow", 95, 730);
    } else if (whichbg == 3) {
      image(ghost, 80, 580, 100, 100);
      text("Medieval", 90, 730);
    }

    if (whichbird == 0) {
      image(yellowbird, birdx, birdy, 100, 100);
      text("Yellow", 100, 410);
    }
    if (whichbird == 1) {
      image(redbird, birdx, birdy, 100, 100);
      text("Red", 115, 410);
    }
    if (whichbird == 2) {
      image(bluebird, birdx, birdy, 100, 100);
      text("Blue", 110, 410);
    }
  }
}

//player losing screen
void playerLose() {
  if (player_lose == true) {
    image(gameover, 0, 0, 508, 800);
    fill(255);
    textSize(25);
    text(score, 290, 463);
    x1 = 0;
    x2 = 0;
    //pauses everything
    noLoop();
  }
}

//get ready screen
void getreadyScreen() {
  if (get_ready == true) {
    image(getreadyscreen, 0, 0, 508, 800); 
    if (whichbird == 0) {
      image(yellowbird, birdx, birdy, 100, 100);
    }
    if (whichbird == 1) {
      image(redbird, birdx, birdy, 100, 100);
    }
    if (whichbird == 2) {
      image(bluebird, birdx, birdy, 100, 100);
    } 
    //starts countdown when player presses 'R'
    countdown--;
  }
  if (countdown <= 0) {
    get_ready = false;
    player_start = true;
  }
}

//communication of Processing and Arduino
void serialEvent(Serial myPort) {
  int arduinoCommunication = myPort.read();
  if (firstContact == false) {
    if (arduinoCommunication == 'A') {
      myPort.clear();
      firstContact = true;
      myPort.write('A');
    }
  } else {
    serialInArray[serialCount] = arduinoCommunication;
    serialCount++;
    if (serialCount > 1) {
      whichbg = serialInArray[1];
      whichbird = serialInArray[0];
      println(whichbg + ", " + whichbird);
      myPort.write('A');
      serialCount = 0;
    }
  }
}
