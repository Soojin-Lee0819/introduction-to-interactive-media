float eyebrowsmove;
float armfillmove;
float armoutlinemove;
float handmove;

//size
void setup() {
  //change canvas size to 400 pixels
  size(400, 400);
  rectMode(CENTER);
  //writing initial positions of animated objects
  eyebrowsmove = 95;
  armfillmove = 322;
  armoutlinemove = 315;
  handmove = 320;
}

void draw() {

  //I wanted the background to show only pastel colors, hence the range of RGB
  frameRate(1.5);
  float redColor = random(180, 255);
  float greenColor = random(180, 255);
  float blueColor = random(180, 255);
  //Animating multicolored pastel background
  background(redColor, greenColor, blueColor);

  //shortcuts for used colors, in case I wanted to change them
  color skin = color(247, 220, 185);
  color hair = color(170, 88, 33);
  color pants = color(100, 197, 255);
  color shirt = color(255, 162, 223);
  color shoes = color(243, 255, 152);
  color shirtaccents = color(255, 85, 204);
  color blush = color(255, 167, 170, 150);

  //Following body parts are not in order of top to bottom,
  //but in order of their order (back to front) of visibility

  //hair
  fill(hair);
  strokeWeight(2); 
  ellipse(200, 140, 180, 220);

  //neck
  fill(skin);
  rect(200, 198, 40, 25);

  //legs
  fill(pants);
  rect(176, 330, 50, 80);
  rect(226, 330, 50, 80);

  //left pocket
  line(150, 305, 170, 305);
  line(170, 305, 170, 320);
  line(170, 320, 150, 330);

  //right pocket
  line(230, 305, 250, 305);
  line(230, 305, 230, 320);
  line(230, 320, 250, 330);

  //shoes
  fill(shoes);
  rect(166, 370, 70, 16);
  rect(236, 370, 70, 16);

  //shoelaces
  fill(255);
  rect(145, 367, 5, 10);
  rect(155, 367, 5, 10);
  rect(165, 367, 5, 10);
  rect(240, 367, 5, 10);
  rect(250, 367, 5, 10);
  rect(260, 367, 5, 10);

  //ears
  fill(skin);
  ellipse(130, 130, 30, 30);
  ellipse(270, 130, 30, 30);

  //earrings
  fill(255);
  ellipse(130, 150, 10, 10);
  ellipse(270, 150, 10, 10);

  //face
  fill(skin);
  ellipse(200, 120, 140, 140);

  //bangs (had to use arcs for black outline, then ellipses to fill in bald spots with brown)
  rotate(radians(-20));
  fill(hair);
  arc(120, 120, 120, 80, 0, radians(140), OPEN);
  rotate(radians(70));
  arc(180, -160, 120, 80, 0, radians(120), OPEN);
  //removing stroke from ellipses to remove harsh lines when filling in bald spots 
  noStroke();
  rotate(radians(-90));
  ellipse (80, 160, 110, 45);
  rotate(radians(40));

  //blush
  fill(blush);
  ellipse(155, 150, 30, 30); 
  ellipse(245, 150, 30, 30);

  //eyes
  stroke(0);
  fill(255);
  ellipse(170, 120, 40, 40); 
  ellipse(230, 120, 40, 40);

  //pupils
  fill(0);
  ellipse(160, 114, 20, 20); 
  ellipse(220, 114, 20, 20);

  //tinier pupils
  fill(255);
  ellipse(165, 114, 10, 10); 
  ellipse(225, 114, 10, 10);

  //left eyelashes
  line(194, 106, 190, 110);
  line(184, 98, 180, 102);
  line(170, 94, 170, 100);
  line(144, 106, 150, 110);
  line(154, 98, 160, 102);

  //right eyelashes
  line(254, 106, 250, 110);
  line(244, 98, 240, 102);
  line(230, 94, 230, 100);
  line(204, 106, 210, 110);
  line(214, 98, 220, 102);

  //nose
  fill(skin);
  arc(200, 145, 20, 20, radians(30), radians(150), OPEN);

  //mouth
  line(175, 160, 170, 168);
  arc(200, 155, 60, 40, radians(50), radians(150), OPEN);

  //left arm
  stroke(skin);
  strokeWeight(14);
  line(140, 245, 128, 290);

  //right arm
  line(250, 235, 298, 260);
  line(armfillmove, 200, 298, 260);
  //animation to make arm wave
  if (armfillmove <= 340) { 
    armfillmove = armfillmove + 20;
  } else {
    armfillmove = armfillmove - 20;
  }

  //left arm (outline)
  stroke(0);
  strokeWeight(2);
  line(135, 240, 120, 290);
  line(150, 240, 135, 290);

  //right arm (outline)
  line(270, 235, 295, 250);
  line(253, 245, 300, 270);
  line(armoutlinemove, 200, 295, 250);
  line(armoutlinemove+15, 200, 300, 270);
  //animation to make arm outline move with the arm fill, making it look like I'm waving
  if (armoutlinemove <= 330) { 
    armoutlinemove = armoutlinemove + 20;
  } else {
    armoutlinemove = armoutlinemove - 20;
  }

  //left hand
  fill(skin);
  ellipse(120, 300, 30, 30);

  //right hand
  ellipse(handmove, 200, 30, 30);
  //animation to make hand move with the arm, making it look like I'm waving
  if (handmove <= 330) { 
    handmove = handmove + 20;
  } else {
    handmove = handmove - 20;
  }

  //phone
  rotate(radians(-30));
  fill(255);
  rect(-75, 300, 40, 60);
  //filling screen with different black shades to make it look like phone is glitching/working
  fill(random(0, 255));
  rect(-75, 295, 30, 40);
  fill(255);
  ellipse(-74, 323, 8, 8);
  rect(-99, 280, 3, 10);
  rect(-99, 295, 3, 10);
  rect(-52, 298, 3, 17);

  //body
  rotate(radians(30));
  fill(shirt);
  rect(200, 250, 100, 80);
  triangle(120, 240, 150, 210, 150, 240);
  triangle(250, 240, 250, 210, 290, 240);

  //shirt
  fill(shirtaccents);
  triangle(165, 210, 200, 235, 235, 210);
  fill(skin);
  triangle(175, 210, 200, 227, 225, 210);

  //buttons
  fill(shirtaccents);
  ellipse(200, 250, 10, 10);
  ellipse(200, 270, 10, 10);

  //speech bubble
  fill(255);
  triangle (50, 33, 90, 73, 130, 65);
  arc(60, 70, 90, 80, 0, radians(330), OPEN);
  fill(0);
  textSize(32);
  text("Hi!", 40, 80); 

  //eyebrows, made it last so the stroke weight wouldn't affect anything else
  noFill();
  strokeWeight(4);
  arc(180, eyebrowsmove, 60, 20, radians(180), radians(270), OPEN);
  arc(225, eyebrowsmove, 60, 20, radians(260), radians(350), OPEN);
  //animation to make eyebrows move up and down
  if (eyebrowsmove == 95) { 
    eyebrowsmove = eyebrowsmove - 10;
  } else {
    eyebrowsmove = eyebrowsmove + 10;
  }

  //music notes
  fill(0);
  ellipse(50, 250, 20, 10);
  line(60, 220, 60, 250);

  //excitement lines
  line (270, 45, 275, 30);
  line (280, 60, 295, 50);
  line (290, 80, 305, 80);
}
