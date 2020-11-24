/*
  Melody

  Plays a melody

  circuit:
  - 8 ohm speaker on digital pin 8

  created 21 Jan 2010
  modified 30 Aug 2011
  by Tom Igoe

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Tone
*/

#include "pitches.h"

char val; // Data received from the serial port
int speakerPin = 8; // Set the pin to digital I/O 13
const int potentiometerPin = A0;
const int photoresistorPin = A1;


// notes in the melody:
int melody[] = {
  NOTE_E6, NOTE_G6, NOTE_E7, NOTE_C7, NOTE_D7, NOTE_G7,
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  8, 8, 8, 8, 8, 8,
};

int intro_melody[] = {
  NOTE_B4, NOTE_B5, NOTE_FS5, NOTE_DS5, //1
  NOTE_B5, NOTE_FS5, NOTE_DS5, NOTE_C5,
  NOTE_C6, NOTE_G5, NOTE_E5, NOTE_C6, NOTE_G5, NOTE_E5,

  NOTE_B4,  NOTE_B5,  NOTE_FS5,   NOTE_DS5,  NOTE_B5,  //2
  NOTE_FS5, NOTE_DS5,  NOTE_DS5, NOTE_E5,  NOTE_F5,
  NOTE_F5,  NOTE_FS5,  NOTE_G5,  NOTE_G5, NOTE_GS5,  NOTE_A5, NOTE_B5,
};

int intro_tempo[] = {
  8, 8, 8, 8,
  8, 8, 8, 8,
  8, 8, 8, 8, 8, 8,

  8, 8, 8, 8, 8,
  8, 8, 8, 16, 16,
  16, 16, 16, 16, 16, 16, 4
};

void setup() {
  pinMode(speakerPin, OUTPUT); // Set pin as OUTPUT
  Serial.begin(9600); // Start serial communication at 9600 bps
  establishContact();

  int size = sizeof(intro_melody) / sizeof(int);
  for (int thisNote = 0; thisNote < size; thisNote++) {

    // to calculate the note duration, take one second divided by the note type.
    //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
    int noteDuration = 1000 / intro_tempo[thisNote];
    tone(speakerPin, intro_melody[thisNote], noteDuration);

    // to distinguish the notes, set a minimum time between them.
    // the note's duration + 30% seems to work well:
    int pauseBetweenNotes = noteDuration * 1.30;
    delay(pauseBetweenNotes);
    // stop the tone playing:
    noTone(speakerPin);
    if (thisNote == size-1) {
      Serial.println("S");
    }
  }
}

void loop() {
  int sensorValue1 = analogRead (potentiometerPin);
  byte switchBG = map(sensorValue1, 0, 1023, 0, 3);
  Serial.println(switchBG);

  if (Serial.available() > 0) { // If data is available to read,
    val = Serial.read();

    if (val == '4')
    { // If 1 was received
      for (int thisNote = 0; thisNote < 6; thisNote++) {

        // to calculate the note duration, take one second divided by the note type.
        //e.g. quarter note = 1000 / 4, eighth note = 1000/8, etc.
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(speakerPin, melody[thisNote], noteDuration);

        // to distinguish the notes, set a minimum time between them.
        // the note's duration + 30% seems to work well:
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
        // stop the tone playing:
      }
    } else if (val == '5') {
      noTone(speakerPin);
    }
  }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.println("A");   // send a capital A
    delay(300);
  }
}
