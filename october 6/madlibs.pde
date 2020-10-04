Table table; 
import processing.sound.*;
SoundFile file;

String[] verbs = new String[127]; 
String[] bodyparts = new String[127];
String[] nouns = new String[127];
String[] adverbs = new String[127];
String[] places = new String[127];
String[] adjectives = new String[127];
String[] celebs = new String[127];

int zero1 = 255;
int zero2 = 255;
int full = 0;
int number_of_presses = 0;
int v1, v2, v3, v4, v5, v6, v7, b1, b2, b3, b4, b5, n1, n2, n3, n4, n5, av1, av2, av3, av4, 
  av5, p1, p2, p3, p4, p5, a1, a2, a3, a4, a5, a6, c1, c2, c3, c4, c5, m;

PImage bg;
PImage trash;
PImage cover;
PImage envelope;
PFont desc;
PFont title;
PFont start;

boolean trashClicked = false;


void shuffle() {
  v1 = int(random(verbs.length));
  v2 = int(random(verbs.length)); 
  v3 = int(random(verbs.length)); 
  v4 = int(random(verbs.length)); 
  v5 = int(random(verbs.length));
  v6 = int(random(verbs.length));
  v7 = int(random(verbs.length));

  b1 = int(random(bodyparts.length));
  b2 = int(random(bodyparts.length));
  b3 = int(random(bodyparts.length));
  b4 = int(random(bodyparts.length));
  b5 = int(random(bodyparts.length));

  n1 = int(random(nouns.length));
  n2 = int(random(nouns.length));
  n3 = int(random(nouns.length));
  n4 = int(random(nouns.length));
  n5 = int(random(nouns.length));

  av1 = int(random(adverbs.length));
  av2 = int(random(adverbs.length));
  av3 = int(random(adverbs.length));
  av4 = int(random(adverbs.length));
  av5 = int(random(adverbs.length));

  p1 = int(random(places.length));
  p2 = int(random(places.length));
  p3 = int(random(places.length));
  p4 = int(random(places.length));
  p5 = int(random(places.length));

  a1 = int(random(adjectives.length));
  a2 = int(random(adjectives.length));
  a3 = int(random(adjectives.length));
  a4 = int(random(adjectives.length));
  a5 = int(random(adjectives.length));
  a6 = int(random(adjectives.length));

  c1 = int(random(celebs.length));
  c2 = int(random(celebs.length));
  c3 = int(random(celebs.length));
  c4 = int(random(celebs.length));
  c5 = int(random(celebs.length));

  m = int(random(100000));
}

void setup() {
  size(800, 600);

  desc = createFont("210 GGothyangki R.ttf", 30);
  title = createFont("Sunday Morning.otf", 80);
  start = createFont("Brev Script.ttf", 130);

  table = loadTable("madlibs.csv", "header");
  verbs = table.getStringColumn("verbs");
  bodyparts = table.getStringColumn("body parts");
  nouns = table.getStringColumn("nouns");
  adverbs = table.getStringColumn("adverbs");
  places = table.getStringColumn("places");
  adjectives = table.getStringColumn("adjectives");
  celebs = table.getStringColumn("celebs");

  cover = loadImage("cover.jpg");
  bg = loadImage("paper.jpg");
  trash = loadImage("trash.png");
  envelope = loadImage("envelope.jpg");
}

void draw() {
  textAlign(CENTER, CENTER);
  fill(200, 0, 0, zero2);
  background(bg);
  tint(255, zero2);
  image(trash, 50, 470, 130, 110);

  textSize(80);
  textFont(title);
  text("Attempt " + number_of_presses, width/2, 80);

  textSize(30);
  textFont(desc);
  if (trashClicked) {
    text("My Dream Man should, first of all, be very " + adjectives[a1] + " and " + adjectives[a2] + ". He should have a physique like " + celebs[c1] + ", a profile like " + celebs[c2] +
      ", and the intelligence of a hundred " + nouns[n1] + ". He must be polite and must always remember to " + verbs[v1] + " my " + bodyparts[b1] + ", to tip his " + nouns[n2] +
      ", and to take my " + bodyparts[b2] + " when crossing the street. He should have a/an " + adjectives[a3] + " voice, and should always dress " + adverbs[av1] +
      ". I would also like him to be a/an " + adjectives[a4] + " dancer, and when we are alone he should whisper " + adjectives[a5] + " nothings into my " + bodyparts[b3] +
      " and hold my " + adjectives[a6] + " " + bodyparts[b4] + ". I know a man with these " + nouns[n3] + " is hard to find. In fact, the only one I can think of is " + celebs[c3] + ".", 50, 20, 700, 580);
  } else {
    text("Dear " + celebs[c1] + ", It has come to my " + nouns[n1] + " that you are the most " + adjectives[a2] + " girl/boy in " + places[p1] + ". My " +
      bodyparts[b1] + " starts " + verbs [v1] + " " + adverbs[av1] + " every time you speak. Ever since I have laid my " + bodyparts[b2] +
      " on you, I have fallen madly in love with you. I wish that you will be the " + nouns[n2] + " of my " + nouns[n3] + " and that someday we will " +
      verbs[v2] + " happily ever after. I work as an assistant for " + celebs[c2] + " and I earn $" + m + " each month. I promise to " + 
      adverbs[av2] + " " + verbs[v3] + " you with kindness and respect. I would like to " + verbs[v4] + " if you want to go to " + places[p2] + " with me next weekend. If you " +
      verbs[v5] + ", please " + verbs[v6] + " me at " + places[p3] + " in 2 days. I " + verbs[v7] + " you and everything about you.", 50, 20, 700, 580);
  }

  tint(255, zero1);
  image(cover, 0, 0, 800, 600);
  fill(200, 200, 0, zero1);
  textSize(130);
  textFont(start);
  text("Make Your Own", width/2, height/2-30);
  text("Love Letter!", width/2, height/2+90);

  tint(255, full);
  image(envelope, 0, 0, 800, 600);
  fill(121, 95, 53, full);
  textSize(130);
  textFont(start);
  rotate(radians(-10));
  text("Letter is", width/2-150, height/2-20);
  text("ready to send!", width/2-100, height/2+70);
  text("Thank you!", width/2, height/2+170);
}

void mousePressed() {
  if (zero1 == 255) {
    zero1 = 0;
    file = new SoundFile(this, "flip.mp3");
    file.play();
    shuffle();
  }

  if (mouseX >= 50 && mouseX <=130 && mouseY >= 475) {
    shuffle();
    number_of_presses = number_of_presses + 1;
    file = new SoundFile(this, "paper.mp3");
    file.play();
    trashClicked = ! trashClicked;
  }

  if (mouseX >= 620 && mouseY >= 475) {
    full = 255;
    zero2 = 0;
    file = new SoundFile(this, "flip.mp3");
    file.play();
  }

  if (mouseX >= 50 && mouseX <=130 && mouseY >= 75) {
    full = 0;
    zero2 = 255;
    file = new SoundFile(this, "flip.mp3");
    file.play();
  }
}
