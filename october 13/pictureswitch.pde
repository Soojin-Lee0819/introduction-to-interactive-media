class Raindrop {
  float x = random(width);
  float y = random(-500, -50);
  float yspeed = random(10, 20);
  float l = random(10, 20);

  void fall() {
    y = y + yspeed;
    if (y > height) {
      y = random(-200, -100);
    }
  }

  void show() {
    strokeWeight(3);
    stroke(27, 204, 222, 147);
    line (x, y, x, y+l);
  }
}

import processing.sound.*;
SoundFile file;

PImage rain;
PImage lightning;
int value = 0;

Raindrop[] raindrops = new Raindrop [100];

void setup() {
  size (700, 700);
  rain = loadImage("rain.jpg");
  file = new SoundFile(this, "rain.mp3");
  file.loop();
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i] = new Raindrop();
  }
}

void draw() {
  background(rain);
  lightning= loadImage("lightning.jpg");
  PImage c = lightning.get(0, 0, value, height);
  image(c, 0, 0);
  stroke(255, 255, 0);
  strokeWeight(5);
  line(mouseX, 0, mouseX, height);
  for (int i = 0; i < raindrops.length; i++) {
    raindrops[i].fall();
    raindrops[i].show();
  }
}

void mouseMoved() {
  value = mouseX;
  if (value == width/2) {
    file = new SoundFile(this, "lightning.mp3");
    file.play();
  }
}
