Table table;

void setup() {
  size(600, 600);
  background(50, 100, 150);
  fill(0, 0, 200);
  textSize(20);
  table = loadTable("madlibs.csv", "header");

  for (TableRow row : table.rows()) {
    String verbs = row.getString("verbs");
    String bodyparts = row.getString("body parts");
    String nouns = row.getString("nouns");
    String adverbs = row.getString("adverbs");
    String places = row.getString("places");
    String adjectives = row.getString("adjectives");
    String celebs = row.getString("celebs");

     String[] verbsArray = new String[] {verbs}; 
     int v = int(random(verbsArray.length)); 
      println(verbsArray[v]); 
}
  }
