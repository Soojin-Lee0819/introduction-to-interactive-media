PFont letterGothic;

String[] nouns = {"monkey", "space", "cowboy", "King", "nut"};
String[]adjectives = {"crazy", "spinning", "bubbly", "stinky", "smelly", "unreal", "slow", "purple"};
String[]verbs = {"eat", "tip", "ride", "drink", "sleep"};
String[]celebs = {"Ghandi", "Batman", "BTS", "Messi", "Selena Gomez"};
int n, a, v, c, zero;

void shuffle() {
  n = int(random(nouns.length));
  a = int(random(adjectives.length));
  v = int(random(verbs.length));
  c = int(random(celebs.length));
  zero = 0;
}

void setup() {
  size(600, 600);
  background(50, 100, 150);
  fill(0, 0, 200);
  textSize(20);
}

void draw() {
  background(200, 200, 0);
  textAlign(CENTER, CENTER);
  pushMatrix();
  text("My Dream Man should, first of all be very " + adjectives[a] + " and " + adjectives[a] + ". He should have a physique like " + celebs[c] + ", a profile like " + celebs[c] +
  ", and the intelligence of a/an " + nouns[n] + ". He must be polite and must always remember to " + verbs[v] + " my " + nouns[n] + ", to tip his " + nouns[n] +
  ", and to take my " + nouns[n] + " when crossing the street. He should have a/an " + adjectives[a] + " voice, and should always dress " + adjectives[a] +
  ". I would also like him to be a/an " + adjectives[a] + " dancer, and when we are alone he should whisper " + adjectives[a] + " nothings into my " + nouns[n] +
  " and hold my " + adjectives[a] + " " + nouns[n] + ". I know a/an " + nouns[n] + " is hard to find. In fact the only one I can think of is " + celebs[c] + ".", 20, 10, 550, 580);
  popMatrix();
}

void mousePressed() {
  shuffle(); 
}

