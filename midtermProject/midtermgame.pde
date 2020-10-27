//Katie Ferreol Midterm Project
//TITLE: AMONG US MINI GAME EDITION
//INSTRUCTIONS: Use the arrow keys to move, and press the kill button to kill the target.
// You have 30 seconds to kill as many as possible.

//star class to add animation in starting screen
class Star {
  float x = random(-800, -50);
  float y = random(height);
  float xspeed = random(5, 10);
  float l = random(10, 20);
  int startopacity = 255;

  //makes stars move from left to right
  void fall() {
    x = x + xspeed;
    if (x > width) {
      x = random(-800, -100);
    }
  }

  //makes stars appear or disappear
  void show() {
    //using ellipse
    fill(255, startopacity);
    ellipse(x, y, 10, 10);
  }

  //disappears if start or P is pressed
  void mousePressed() {
    //if the player starts the game, it starts down the timer and fades out
    if (mouseX > 255 && mouseX < 530 && mouseY > 485 && mouseY < 540 || keyPressed) {
      if (key == 'p' || key == 'P') {
        startopacity = 0;
      }
    }
  }
}
//end of star class

//declaring all sounds
import processing.sound.*;
SoundFile start;
SoundFile walk;
SoundFile kill;
SoundFile end;

//declaring fonts
PFont name;
PFont title;

//declaring photo arrays
PImage[] walks = new PImage[12];
PImage[] deads = new PImage[15];

//declaring photos
PImage bg;
PImage deadfloor;
PImage hat;
PImage hat2;
PImage killbutton;
PImage startingscreen;
PImage still;
PImage still2;

//declaring all variables
int countDown = 0;
int countDownStart = 30;
int die = 0;
int face = 0;
int fall = 0;
int full1;
int full2;
int full3;
int full4;
int instructionopacity = 0;
int randomx = int(random(300, 600));
int randomy = int(random(300, 600));
int score = 0;
int speed = 4;
int startoff = 0;
int startopacity = 255;
int step = 0;
int timer = 0;
int timerStart = 0;
int x = 350;
int y = 200;

//declaring boolean
boolean stills = false;

//STARTING SCREEN
void startingscreen() {
  tint(255, startopacity);
  image (startingscreen, 0, 0);
}

//INSTRUCTION SCREEN
void instructionscreen() {
  fill(255, instructionopacity);
  noStroke();
  //using rectangle
  rect(50, 50, 700, 700);
  fill(0, instructionopacity);
  textFont(name);
  textSize(30);
  text("This project is a modern spin on the Among Us game we all know and love. Instructions are simple: move to the target and kill them!", 80, 110, 600, 600);
  text("CONTROLS: Use the arrow keys to move. Your targets are the pink crewmates wearing the scary ski masks. To kill, press the KILL button on the lower right. You have 30 seconds to kill as many targets as possible.", 80, 310, 600, 600);
  text("That's it! I hope you enjoy this game, and GOOD LUCK!", 80, 570, 600, 600);
  text("(press the P key to start the game.)", 80, 690, 600, 600);
}

//fadeout starting screen
void down() {
  if (startopacity < 255) {
    startopacity = startopacity - 10;
  }
}

//30 second timer
void timer() {
  if (startopacity <= 0) {
    timer = int(millis()/ 1000 - timerStart);
    countDown = int(countDownStart - timer);
  }
  if (countDown == 2) {
    end.loop();
  }
  if (countDown < 0) {
    countDown = 0;
    end.stop();
    pushMatrix();
    //add new background so characters aren't seen
    image(bg, 0, 0);
    pushMatrix();
    tint(0, 147);
    image(bg, 0, 0);
    popMatrix();
    textSize(100);
    text("TIME'S UP!", 200, 400);
    text("SCORE: " + score, 235, 500);
    textSize(30);
    text("Replay? PRESS THE 'P' BUTTON!", 230, 550);
    walk.stop();
    kill.stop();
    popMatrix();
  }
}

//using arrow keys to move
void movePlayer() {
  if (keyPressed) {
    face = 0;
    full1 = 0;
    full2 = 255;
    tint(255, full2);
    if (keyCode == DOWN) {
      y+=speed;
      if (y == 700) {
        y-=speed;
      }
    }
    if (keyCode == LEFT) {
      face = 1;
      x-=speed;
      if (x <= 0) {
        x+=speed;
      }
    }
    if (keyCode == RIGHT) {
      x+=speed;
      if (x >= 730) {
        x-=speed;
      }
    }
    if (keyCode == UP) {
      y-=speed;
      if (y == 160) {
        y+=speed;
      }
    }
    //flip array horizontally when facing left
    if (face == 1) {
      pushMatrix();
      translate(x, y);
      scale(-1, 1);
      image(walks[step], -100, 0);
      popMatrix();
    } else {
      image(walks[step], x, y);
    }

    if (frameCount%speed>=1) {
      step = (step+1) % 12;
    }
    stills = ! stills;
  } else {
    walk.loop();
    full1 = 255;
    full2 = 0;
    tint(255, full1);
    if (face == 1) {
      pushMatrix();
      translate(x, y);
      scale(-1, 1);
      image(still, -100, 0);
      popMatrix();
    } else {
      image(still, x, y);
    }
  }
  if (face == 1) {
    pushMatrix();
    translate(x, y-30);
    scale(-1, 1);
    image(hat, -100, 0);
    popMatrix();
  } else {
    image(hat, x, y-30);
  }
}

//changing opacity to play killing animation
void killing() {
  if (die == 1) {
    full3 = 255;
    full4 = 0;
    die = 2;
  }
}

//killing and respawning
void killanimation() {
  tint(255, full3);
  image(deads[fall], randomx, randomy);
  if (fall < 14 && die == 2) {
    fall++;
  } else if (fall >= 14) {
    die = 0;
  }
}

//spawns target in new location
void spawnNew() {
  if (die == 0) {
    full3 = 0;
    full4 = 255;
    if (fall >= 14) {
      randomx = int(random(300, 600));
      randomy = int(random(300, 600));
      fall = 0;
    }
  }
}

//restarting game when P is pressed
void restart() {
  if (keyPressed) {
    if (key == 'p' || key == 'P') {
      score = 0;
      startopacity = 254;
      instructionopacity = 0;
      start.play();
      timerStart = millis() / 1000;
      x = 350;
      y = 200;
    }
  }
}

Star[] stars = new Star [10];

void setup() {
  size(800, 800);

  //setting size of fonts
  name = createFont("Gotham-Medium.otf", 15);
  title = createFont("Sunday Morning copy.otf", 50);

  //setting arrays for player
  for ( int i = 0; i < walks.length; i++ ) {
    walks[i] = loadImage("walk" + i + ".png" );
  }

  //setting arrays for target
  for ( int i = 0; i < deads.length; i++ ) {
    deads[i] = loadImage("dead" + i + ".png" );
  }

  //setting countdown
  countDown  = countDownStart;

  //importing all photos
  frameRate(30);
  bg = loadImage("bg.jpg");
  deadfloor = loadImage("dead14.png");
  hat = loadImage("hat.png");
  hat2 = loadImage("hat2.png");
  killbutton = loadImage("killbutton.png");
  startingscreen = loadImage("startingscreen.jpg");
  still = loadImage("walk12.png");
  still2 = loadImage("walk13.png");

  //importing all sounds
  end = new SoundFile(this, "end.mp3");
  kill = new SoundFile(this, "kill.mp3");
  start = new SoundFile(this, "start.mp3");
  walk = new SoundFile(this, "walk.mp3");

  //adding stars
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(bg);

  //respawn target at random location
  tint(255, full4);
  image(still2, randomx, randomy);

  //target's mask
  tint(255, full4);
  image(hat2, randomx+7, randomy-6);

  movePlayer();
  killing();
  killanimation();
  spawnNew();

  //name on top of player
  fill(255);
  textFont(name);
  text("spooki", x+20, y-40);

  //player's score
  textFont(title);
  text("Score: " + score, 600, 80);

  //killing button
  tint(255, 255);
  image(killbutton, 650, 650);

  //timer text
  textFont(title);
  text("Time left: " + countDown, 10, 80);

  timer();
  startingscreen();

  //adding stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].fall();
    stars[i].show();
    stars[i].mousePressed();
  }

  instructionscreen();
  restart();
  down();
}

void mousePressed() {
  //if the player starts the game, it starts down the timer and fades out
  if (mouseX > 255 && mouseX < 530 && mouseY > 485 && mouseY < 540) {
    startopacity = 254;
    instructionopacity = 0;
    start.play();
    timerStart = millis() / 1000;
  }

  //if the player clicks instructions, instruction screen appears
  if (mouseX > 215 && mouseX < 565 && mouseY > 350 && mouseY < 430) {
    instructionopacity = 255;
  }

  //when player kills target, it will increase score
  if (mouseX > 650 && mouseX < 750 && mouseY > 670 && mouseY < 750 && dist(x, y, randomx, randomy) < 100 && countDown != 0) { 
    die = 1;
    score += 1;
    kill.play();
  }
}
