//Katie Ferreol
//November 3 Arduino Project 1: LED Button Game
//Instructions: Press any button to start. Press the buttons in the sequence the program gives you. If you pass 7 rounds, you win!
//Make sure to press the desired pattern before 2 seconds runs out, or you'll lose the game!

int winningRounds = 7;
int LEDpattern[15];
int noPress = 4;
int roundNum = 1;

long startTime = 0;
long timesUp = 2000;

int button[] = {2, 4, 6, 8};
int led[] = {3, 5, 7, 9};

boolean start = false;

void setup() {
  pinMode(led[0], OUTPUT);
  pinMode(led[1], OUTPUT);
  pinMode(led[2], OUTPUT);
  pinMode(led[3], OUTPUT);

  pinMode(button[0], INPUT_PULLUP);
  pinMode(button[1], INPUT_PULLUP);
  pinMode(button[2], INPUT_PULLUP);
  pinMode(button[3], INPUT_PULLUP);
}

void loop() {

  if (start == false) {
    playerStart();
    roundNum = 0;
    delay(1500);
    start = true;
  }

  for (int i = 0; i <= roundNum; i++) {
    LEDon(LEDpattern[i]);
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
        if (noPress == LEDpattern[i]) {
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

      if (millis() - startTime > timesUp) {
        playerLose();
        break;
      }
    }
  }

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
 
//TURN ALL LEDS OFF
void LEDoff () {
  //turn all the LEDs off
  digitalWrite(led[0], LOW);
  digitalWrite(led[1], LOW);
  digitalWrite(led[2], LOW);
  digitalWrite(led[3], LOW);
}

//CHECK WHICH BUTTON IS PRESSED
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
    return 4; //this will be the value for no button being pressed
  }
}

//START SEQUENCE
void playerStart() {
  
  //populate the LEDpattern array with random numbers from 0 to 3
  for (int i = 0; i <= winningRounds; i++) {
    LEDpattern[i] = round(random(0, 4));
  }

  //flash all of the LEDs when the game starts
  for (int i = 0; i <= 2; i++) {

    //turn all of the leds on
    digitalWrite(led[0], HIGH);
    digitalWrite(led[1], HIGH);
    digitalWrite(led[2], HIGH);
    digitalWrite(led[3], HIGH);
    delay(100);

    //turn all of the leds off
    digitalWrite(led[0], LOW);
    digitalWrite(led[1], LOW);
    digitalWrite(led[2], LOW);
    digitalWrite(led[3], LOW);
    delay(100);

  }
}


void playerLose() {

  //turn all the LEDs on
  for (int i = 0; i <= 3; i++) {
    digitalWrite(led[i], HIGH);
  }

  //wait until a button is pressed
  do {
    noPress = buttonCheck();
  } while (noPress > 3);
  delay(200);

  start = false;
}


void playerWin() {

  //turn all the LEDs on
  for (int i = 0; i <= 3; i++) {
    digitalWrite(led[i], HIGH);
  }

  //wait until a button is pressed
  do {
    noPress = buttonCheck();
  } while (noPress > 3);
  delay(100);

  start = false;
}
