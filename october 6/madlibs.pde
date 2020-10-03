Table table;

String[] verbs = new String[127]; 
String[] bodyparts = new String[127];
String[] nouns = new String[127];
String[] adverbs = new String[127];
String[] places = new String[127];
String[] adjectives = new String[127];
String[] celebs = new String[127];
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
  table = loadTable("madlibs.csv", "header");

  verbs = table.getStringColumn("verbs");
  bodyparts = table.getStringColumn("body parts");
  nouns = table.getStringColumn("nouns");
  adverbs = table.getStringColumn("adverbs");
  places = table.getStringColumn("places");
  adjectives = table.getStringColumn("adjectives");
  celebs = table.getStringColumn("celebs");
}

void draw() {
  background(200, 200, 0);
  textAlign(CENTER, CENTER);
  text("hello my name is " + verbs[v] + " nice to meet you", width/2, height/2);
}

void mousePressed() {
  shuffle();
}
