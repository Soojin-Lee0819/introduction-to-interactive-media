import processing.sound.*;
SoundFile walk;
SoundFile kill;

PFont name;
PFont title;

PImage[] walks = new PImage[12];
PImage[] deads = new PImage[15];
PImage bg;
PImage still;
PImage deadfloor;
PImage hat;
PImage killbutton;

int face = 0;
int step = 0;
int fall = 0;
int x = 350;
int y = 200;
int randomx;
int randomy;
int full1;
int full2;
int full3;
int full4;
int speed = 4;
int score = 0;
int startoff = 0;

int t;
int interval = 30;

boolean stills = false;
boolean die = false;


void movePlayer() {
  //impostor moving
  if (keyPressed) {
    face = 0;
    full1 = 0;
    full2 = 255;
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
      tint(255, full2);
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

  //accessory
  tint(255, 255);
  image(hat, x+40, y+10);
}

void killing() {
  if (die == true) {
    full3 = 255;
    full4 = 0;
    tint(255, full3);
    image(deads[fall], randomx, randomy);
    if (fall < 14) {
      fall++;
    } 
  } 
  die = false;
}

void spawnNew() {
  //killing
  if (full4 == 0) {
    full3 = 0;
    full4 = 255;
    randomx = int(random(100, 600));
    randomy = int(random(300, 600));
  }
}

void timer() {
  t = interval-int(millis()/1000);
  if (t == 0) {
    t = 0;
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

  frameRate(30);
  bg = loadImage("bg.jpg");
  still = loadImage("walk12.png");
  deadfloor = loadImage("dead14.png");
  hat = loadImage("hat.png");
  killbutton = loadImage("killbutton.png");
  walk = new SoundFile(this, "walk.mp3");
  kill = new SoundFile(this, "kill.mp3");
}

void draw() {
  background(bg);

  movePlayer();
  killing();
  spawnNew();
  timer();

  fill(255);
  textFont(name);
  text("spoopi", x+20, y-10);

  textFont(title);
  text("Score: " + score, 600, 80);
 
  tint(255, full4);
  image(still, randomx, randomy);

  tint(255, 255);
  image(killbutton, 650, 650);

  textFont(title);
  text("Time left: " + t, 10, 80);
}

void mousePressed() {
  if (mousePressed && mouseX > 650 && mouseX < 750 && mouseY > 670 && mouseY < 750 && dist(x, y, randomx, randomy) < 100) { 
    die = true;
    score += 1;
    kill.play();
  }
}
