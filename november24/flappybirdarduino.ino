
#include "pitches.h"

//setting up variables
char val;
int speakerPin = 8;
const int potentiometerPin = A0;
const int photoresistorPin = A1;


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
  int sensorValue1 = analogRead (potentiometerPin);
  byte switchBG = map(sensorValue1, 0, 1023, 0, 4);
  Serial.println(switchBG);

  if (Serial.available() > 0) {
    val = Serial.read();

    //if bird is in the slot between the pipes, play 1-UP sound
    if (val == '4') {
      for (int thisNote = 0; thisNote < 6; thisNote++) {
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(speakerPin, melody[thisNote], noteDuration);
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
      }
      //if bird is not in the slot between the pipes, don't play 1-UP sound
    } else if (val == '5') {
      noTone(speakerPin);
    }
  }
}

//establish contact between Arduino and Processing
void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A");   // send a capital A
    delay(300);
  }
}
