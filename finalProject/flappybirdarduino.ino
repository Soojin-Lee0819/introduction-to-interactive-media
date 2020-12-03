
#include "pitches.h"

//setting up variables
byte val1;
char val2;
int speakerPin = 8;
const int potentiometerPin = A0;
const int photoresistorPin = A1;
const int yellowButton = A2;
const int redButton = A3;
const int blueButton = A4;

int inByte = 0;
char incomingValue;

int yellowState = 0;
int redState = 0;
int blueState = 0;

int yellowPrevious = 0;
int yellowPush = 0;

int redPrevious = 0;
int redPush = 0;

int bluePrevious = 0;
int bluePush = 0;

// 1-UP sound
int melody[] = {
  NOTE_E6, NOTE_G6, NOTE_E7, NOTE_C7, NOTE_D7, NOTE_G7,
};

// 1-UP tempo
int noteDurations[] = {
  8, 8, 8, 8, 8, 8,
};

// introduction sound
int intro_melody[] = {
  NOTE_B4, NOTE_B5, NOTE_FS5, NOTE_DS5,
  NOTE_B5, NOTE_FS5, NOTE_DS5, NOTE_C5,
  NOTE_C6, NOTE_G5, NOTE_E5, NOTE_C6, NOTE_G5, NOTE_E5,

  NOTE_B4,  NOTE_B5,  NOTE_FS5,   NOTE_DS5,  NOTE_B5,
  NOTE_FS5, NOTE_DS5,  NOTE_DS5, NOTE_E5,  NOTE_F5,
  NOTE_F5,  NOTE_FS5,  NOTE_G5,  NOTE_G5, NOTE_GS5,  NOTE_A5, NOTE_B5,
};

// introduction tempo
int intro_tempo[] = {
  8, 8, 8, 8,
  8, 8, 8, 8,
  8, 8, 8, 8, 8, 8,

  8, 8, 8, 8, 8,
  8, 8, 8, 16, 16,
  16, 16, 16, 16, 16, 16, 4
};

void setup() {
  pinMode(speakerPin, OUTPUT);
  Serial.begin(9600);
  establishContact();

  //intro playing once when Processing loads
  int size = sizeof(intro_melody) / sizeof(int);
  for (int thisNote = 0; thisNote < size; thisNote++) {
    int noteDuration = 1000 / intro_tempo[thisNote];
    tone(speakerPin, intro_melody[thisNote], noteDuration);
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(speakerPin);
  }
}

void loop() {

  if (Serial.available() > 0) {
  inByte = Serial.read();
  incomingValue = Serial.read();

  int potentiometerState = analogRead(potentiometerPin);
  val1 = map(potentiometerState, 0, 1023, 0, 4);

  yellowState = analogRead(yellowButton);
  int yellowOn = map(yellowState, 0, 1023, 0, 2);

  redState = analogRead(redButton);
  int redOn = map(redState, 0, 1023, 0, 2);

  blueState = analogRead(blueButton);
  int blueOn = map(blueState, 0, 1023, 0, 2);
  

    //if bird is in the slot between the pipes, play 1-UP sound
    if (incomingValue == '4') {
      for (int thisNote = 0; thisNote < 6; thisNote++) {
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(speakerPin, melody[thisNote], noteDuration);
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
      }
      //if bird is not in the slot between the pipes, don't play 1-UP sound
    } else if (incomingValue == '5') {
      noTone(speakerPin);
    }
    
    if (yellowOn != yellowPrevious) {
      if (yellowOn == 1) {
        yellowPush++;
      }
    }

    if (redOn != redPrevious) {
      if (redOn == 1) {
        redPush++;
      }
    }

    if (blueOn != bluePrevious) {
      if (blueOn == 1) {
        bluePush++;
      }
    }

    yellowPrevious = yellowOn;
    redPrevious = redOn;
    bluePrevious = blueOn;

    if (yellowPush % 2 == 1) {
      yellowPush = 0;
      val2 = 0;
    }
    if ((redPush % 2 == 1)) {
      redPush = 0;
      val2 = 1;
    }
    if (bluePush % 2 == 1) {
      bluePush = 0;
      val2 = 2;
    }
  }

  Serial.write(val2);
  Serial.write(val1);
}

//establish contact between Arduino and Processing
void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A");   // send a capital A
    delay(300);
  }
}
