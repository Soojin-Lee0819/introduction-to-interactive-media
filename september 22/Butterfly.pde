class Butterfly {

  Butterfly() {
  }

  void wings(int xstartingpoint, int ystartingpoint) {
    translate(xstartingpoint, ystartingpoint);
    strokeWeight (5);
    stroke(255, random(255), random(255));
    fill (255, random(255), random(255));
    //left butterfly wing
    rotate(radians(-20));
    curve(100, 52, 80, 52, 216, 48, 216, 122);
    curve(80, 52, 216, 48, 150, 132, 80, 130); 
    curve(152, 48, 152, 132, 75, 120, 80, 120);
    rotate(radians(35));
    curve(130, 52, 125, 60, 216, 35, 216, 122);
    curve(46, 50, 216, 35, 200, 90, 150, 80); 
    curve(190, -42, 200, 90, 130, 80, 180, 120);
    //body
    rotate(radians(-25));
    line(50, 70, 50, 170);
    line(70, 170, 105, 70);
    line(50, 70, 85, 30);
    line(105, 70, 85, 30);
    rotate(radians(5));
    line(63, 145, 86, 145);
    line(64, 165, 84, 165);
    line(60, 130, 93, 130);
    line(60, 115, 96, 115);
    line(63, 100, 98, 100);
    //left butterfly wing
    rotate(radians(20));
     curve(20, 2, 88, 0, -45, -5, 150, 150);
     curve(20, 2, -45, -5, 10, 80, 150, 130);
     curve(20, 20, 10, 80, 90, 70, 40, 40);
    rotate(radians(-35));
     curve(80, 52, 28, 130, -48, 135, -26, 20);
     curve(-46, 80, -48, 135, -50, 80, 50, 80);
     curve(90, 112, 30, 110, -50, 80, -20, 150);
    //decorations
    rotate(radians(15));
    line(150, 10, 170, 40);
    line(150, 100, 170, 40);
     ellipse(200, 15, 30, 15);
     ellipse(190, 45, 25, 10);
     ellipse(180, 75, 20, 5);
  }
}
