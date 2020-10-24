import processing.sound.*;
SoundFile walk;
SoundFile kill;
SoundFile start;
SoundFile end;

PFont name;
PFont title;

PImage[] walks = new PImage[12];
PImage[] deads = new PImage[15];
PImage startingscreen;
PImage bg;
PImage still;
PImage still2;
PImage deadfloor;
PImage hat;
PImage hat2;
PImage killbutton;

int face = 0;
int step = 0;
int fall = 0;
int x = 350;
int y = 200;
int randomx = int(random(300, 600));
int randomy = int(random(300, 600));
int full1;
int full2;
int full3;
int full4;
int startopacity = 255;
int instructionopacity = 0;
int speed = 4;
int score = 0;
int startoff = 0;

int countDown = 0;
int countDownStart = 30;
int timerStart = 0;
int timer = 0;

boolean stills = false;
int die = 0;

void movePlayer() {
  //impostor moving
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

void killing() {
  if (die == 1) {
    full3 = 255;
    full4 = 0;
    die = 2;
  }
}

void killanimation() {
  tint(255, full3);
  image(deads[fall], randomx, randomy);
  if (fall < 14 && die == 2) {
    fall++;
  } else if (fall >= 14) {
    die = 0;
  }
}

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

void startingscreen() {
  tint(255, startopacity);
  image (startingscreen, 0, 0);
}

void instructionscreen() {
  fill(255, instructionopacity);
  noStroke();
  rect(50, 50, 700, 700);
  fill(0, instructionopacity);
  textFont(name);
  textSize(30);
  text("This project is a modern spin on the Among Us game we all know and love. Instructions are simple: move to the target and kill them!", 80, 110, 600, 600);
  text("CONTROLS: Use the arrow keys to move. Your targets are the pink crewmates wearing the scary ski masks. To kill, press the KILL button on the lower right. You have 30 seconds to kill as many targets as possible.", 80, 310, 600, 600);
  text("That's it! I hope you enjoy this game, and GOOD LUCK!", 80, 570, 600, 600);
  text("(press the P key to start the game.)", 80, 690, 600, 600);
}

void down() {
  if (startopacity < 255) {
    startopacity = startopacity - 10;
  }
}

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

void setup() {
  size(800, 800);

  name = createFont("Gotham-Medium.otf", 15);
  title = createFont("Sunday Morning copy.otf", 50);

  for ( int i = 0; i < walks.length; i++ ) {
    walks[i] = loadImage("walk" + i + ".png" );
  }

  for ( int i = 0; i < deads.length; i++ ) {
    deads[i] = loadImage("dead" + i + ".png" );
  }

  countDown  = countDownStart;

  frameRate(30);
  still = loadImage("walk12.png");
  still2 = loadImage("walk13.png");
  deadfloor = loadImage("dead14.png");
  hat = loadImage("hat.png");
  hat2 = loadImage("hat2.png");
  killbutton = loadImage("killbutton.png");
  walk = new SoundFile(this, "walk.mp3");
  kill = new SoundFile(this, "kill.mp3");
  start = new SoundFile(this, "start.mp3");
  end = new SoundFile(this, "end.mp3");
  bg = loadImage("bg.jpg");
  startingscreen = loadImage("startingscreen.jpg");
}

void draw() {
  background(bg);

  tint(255, full4);
  image(still2, randomx, randomy);

  tint(255, full4);
  image(hat2, randomx+7, randomy-6);

  movePlayer();
  killing();
  killanimation();
  spawnNew();

  fill(255);
  textFont(name);
  text("spooki", x+20, y-40);

  textFont(title);
  text("Score: " + score, 600, 80);

  tint(255, 255);
  image(killbutton, 650, 650);

  textFont(title);
  text("Time left: " + countDown, 10, 80);

  timer();
  startingscreen();
  instructionscreen();
  restart();
  down();
}

void mousePressed() {
  if (mouseX > 255 && mouseX < 530 && mouseY > 485 && mouseY < 540) {
    startopacity = 254;
    instructionopacity = 0;
    start.play();
    timerStart = millis() / 1000;
  }

  if (mouseX > 215 && mouseX < 565 && mouseY > 350 && mouseY < 430) {
    instructionopacity = 255;
  }

  if (mouseX > 650 && mouseX < 750 && mouseY > 670 && mouseY < 750 && dist(x, y, randomx, randomy) < 100 && countDown != 0) { 
    die = 1;
    score += 1;
    kill.play();
  }
}
