Butterfly butterfly;

void setup() {
  size(1000, 700);
  butterfly = new Butterfly();
  background(0);
}

void draw() {
  scale(0.3);
  butterfly.pattern();
}
