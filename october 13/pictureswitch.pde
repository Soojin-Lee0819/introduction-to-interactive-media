PImage rain;
PImage lightning;

void setup() {
  size (700, 700);
  rain = loadImage("rain.jpg");
  lightning= loadImage("lightning.jpg");
}

void draw() {
  image(lightning, 0, 0);
  image(rain, 0, 0);
  noStroke();
  rect(0, 0, mouseX, height);
}
