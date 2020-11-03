//Katie Ferreol
//November 3 Arduino Project 1: LED Button Game
//Instructions: Press any button to start. Press the buttons in the sequence the program gives you. If you pass 7 rounds, you win!
//Make sure to press the desired pattern before 2 seconds runs out, or you'll lose the game!

//declaring boolean to trigger start of game
boolean start = false;

//declaring all int variables
int winningRounds = 7;
int patterns[15];
int noPress = 4;
int roundNum = 1;

//declaring time/long variables
long startTime = 0;
long timesUp = 2000;

//declaring arrays/pins that have specified parts
int button[] = {2, 4, 6, 8};
int led[] = {3, 5, 7, 9};

void setup() {
  //declaring buttons as input
  pinMode(button[0], INPUT_PULLUP);
  pinMode(button[1], INPUT_PULLUP);
  pinMode(button[2], INPUT_PULLUP);
  pinMode(button[3], INPUT_PULLUP);

  //declaring LED's as output of button
  pinMode(led[0], OUTPUT);
  pinMode(led[1], OUTPUT);
  pinMode(led[2], OUTPUT);
  pinMode(led[3], OUTPUT);
}

void loop() {

  //Indicates start of the game when program first loads
  if (start == false) {
    playerStart();
    roundNum = 0;
    delay(2000);
    start = true;
  }

  for (int i = 0; i <= roundNum; i++) {
    LEDon(patterns[i]);
    delay(200);
    LEDoff();
    delay(200);
  }

  for (int i = 0; i <= roundNum; i++) {
    startTime = millis();
    while (start == true) {
      noPress = buttonCheck();
      if (noPress < 4) {
        LEDon(noPress);
        if (noPress == patterns[i]) {
          delay(250);
          LEDoff();
          break;
        } else {
          playerLose();
          break;
        }

      } else {
        LEDoff();
      }

      //checking if player pressed button within time limit
      if (millis() - startTime > timesUp) {
        playerLose();
        break;
      }
    }
  }

  //indicates when player will win if they get through all the rounds
  if (start == true) {
    roundNum = roundNum + 1;
    if (roundNum >= winningRounds) {
      playerWin();
    }
    delay(500);
  }
}



void LEDon(int ledNumber) {
  digitalWrite(led[ledNumber], HIGH);
}

//turns LED's off
void LEDoff () {
  //turn all the LEDs off
  digitalWrite(led[0], LOW);
  digitalWrite(led[1], LOW);
  digitalWrite(led[2], LOW);
  digitalWrite(led[3], LOW);
}

//checking which button is pressed, and returns a value
int buttonCheck() {
  //check if any buttons are being pressed
  if (digitalRead(button[0]) == LOW) {
    return 0;
  } else if (digitalRead(button[1]) == LOW) {
    return 1;
  } else if (digitalRead(button[2]) == LOW) {
    return 2;
  } else if (digitalRead(button[3]) == LOW) {
    return 3;
  } else {
    //no button being pressed
    return 4;
  }
}

//player starting
void playerStart() {

  //randomize pattern of LED's in game
  for (int i = 0; i <= winningRounds; i++) {
    patterns[i] = round(random(0, 4));
  }

  //flash all LED's when game starts
  for (int i = 0; i <= 2; i++) {

    //turn all LED's on
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
    delay(100);

    //turn all LED's off
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(100);

  }
}


//player loss
void playerLose() {

  //turn all LED's on
  for (int i = 0; i <= 3; i++) {
    digitalWrite(led[i], HIGH);
  }

  //wait until a button is pressed, then start sequence again
  do {
    noPress = buttonCheck();
  } while (noPress > 3);
  delay(200);

  start = false;
}


//player win
void playerWin() {

  //turn all LED's on
  for (int i = 0; i <= 3; i++) {
    digitalWrite(led[i], HIGH);
  }

  //wait until a button is pressed, then start sequence again
  do {
    noPress = buttonCheck();
  } while (noPress > 3);
  delay(100);

  start = false;
}
