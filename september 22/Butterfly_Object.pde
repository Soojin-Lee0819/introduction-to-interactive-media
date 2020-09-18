Butterfly butterfly;

void setup() {
  size(600, 300);
  butterfly = new Butterfly();
  background(0);
}

int xstartingpoint = int(random(900));
int ystartingpoint = int(random(300));

void draw() {
  scale(0.2);
  
  while (xstartingpoint < width) {
   butterfly.wings(xstartingpoint, ystartingpoint);
   butterfly.wings(xstartingpoint, ystartingpoint);
   butterfly.wings(xstartingpoint, ystartingpoint);
   xstartingpoint = xstartingpoint + 1;
}

while (ystartingpoint < height) {
   ystartingpoint = ystartingpoint + 1;
}
}
