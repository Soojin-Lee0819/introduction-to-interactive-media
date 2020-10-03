Table table; 
PFont font;
import processing.sound.*;
SoundFile file;

String[] verbs = new String[127]; 
String[] bodyparts = new String[127];
String[] nouns = new String[127];
String[] adverbs = new String[127];
String[] places = new String[127];
String[] adjectives = new String[127];
String[] celebs = new String[127];
int v, b, n, av, p, a, c;
int r = int(random(255));
int g = int(random(255));
int bl = int(random(255));
PImage bg;

void shuffle() {
  v = int(random(verbs.length)); 
  b = int(random(bodyparts.length));
  n = int(random(nouns.length));
  av = int(random(adverbs.length));
  p = int(random(places.length));
  a = int(random(adjectives.length));
  c = int(random(celebs.length));
}

void setup() {
  font = createFont("210 GGothyangki R.ttf", 30);
  textFont(font);
  size(800, 600);
  background(50, 100, 150);
  table = loadTable("madlibs.csv", "header");
  verbs = table.getStringColumn("verbs");
  bodyparts = table.getStringColumn("body parts");
  nouns = table.getStringColumn("nouns");
  adverbs = table.getStringColumn("adverbs");
  places = table.getStringColumn("places");
  adjectives = table.getStringColumn("adjectives");
  celebs = table.getStringColumn("celebs");
  bg = loadImage("paper copy.jpg");
}

void draw() {
  background(200, 200, 0);
  textAlign(CENTER, CENTER);
  pushMatrix();
  fill(0, 0, 200);
  background(bg);
  textSize(60);
  text("MY MADLIBS DIARY", width/2, 80);
  textSize(30);
  text("My Dream Man should, first of all be very " + adjectives[a] + " and " + adjectives[a] + ". He should have a physique like " + celebs[c] + ", a profile like " + celebs[c] +
    ", and the intelligence of a/an " + nouns[n] + ". He must be polite and must always remember to " + verbs[v] + " my " + bodyparts[b] + ", to tip his " + nouns[n] +
    ", and to take my " + bodyparts[b] + " when crossing the street. He should have a/an " + adjectives[a] + " voice, and should always dress " + adverbs[av] +
    ". I would also like him to be a/an " + adjectives[a] + " dancer, and when we are alone he should whisper " + adjectives[a] + " nothings into my " + bodyparts[b] +
    " and hold my " + adjectives[a] + " " + bodyparts[b] + ". I know a man with these " + nouns[n] + " is hard to find. In fact the only one I can think of is " + celebs[c] + ".", 50, 20, 700, 580);
  popMatrix();
}

void mousePressed() {
  shuffle();
  file = new SoundFile(this, "paper.mp3");
  file.play();
}
