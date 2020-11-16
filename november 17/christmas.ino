//including libraries
#include "pitches.h"
#include <Servo.h>

//making servo motor class without delay
class Sweeper
{
    Servo servo;
    int pos;
    int increment;
    int  updateInterval;
    unsigned long lastUpdate;

  public:
    Sweeper(int interval)
    {
      updateInterval = interval;
      increment = 1;
    }

    void Attach(int pin)
    {
      servo.attach(pin);
    }

    void Detach()
    {
      servo.detach();
    }

    //update position of servo
    void Update()
    {
      if ((millis() - lastUpdate) > updateInterval)
      {
        lastUpdate = millis();
        pos += increment;
        servo.write(pos);
        Serial.println(pos);
        if ((pos >= 180) || (pos <= 0))
        {
          // reverse direction
          increment = -increment;
        }
      }
    }
};

Sweeper sweeper1(15);

//'We Wish You A Merry Christmas' melody
int wish_melody[] = {
  NOTE_B3,
  NOTE_F4, NOTE_F4, NOTE_G4, NOTE_F4, NOTE_E4,
  NOTE_D4, NOTE_D4, NOTE_D4,
  NOTE_G4, NOTE_G4, NOTE_A4, NOTE_G4, NOTE_F4,
  NOTE_E4, NOTE_E4, NOTE_E4,
  NOTE_A4, NOTE_A4, NOTE_B4, NOTE_A4, NOTE_G4,
  NOTE_F4, NOTE_D4, NOTE_B3, NOTE_B3,
  NOTE_D4, NOTE_G4, NOTE_E4,
  NOTE_F4
};

//'We Wish You A Merry Christmas' tempo
int wish_tempo[] = {
  4,
  4, 8, 8, 8, 8,
  4, 4, 4,
  4, 8, 8, 8, 8,
  4, 4, 4,
  4, 8, 8, 8, 8,
  4, 4, 8, 8,
  4, 4, 4,
  2
};


//'Santa Claus is Coming To Town' melody
int santa_melody[] = {
  NOTE_G4,
  NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_G4,
  NOTE_A4, NOTE_B4, NOTE_C5, NOTE_C5, NOTE_C5,
  NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_G4,
  NOTE_A4, NOTE_G4, NOTE_F4, NOTE_F4,
  NOTE_E4, NOTE_G4, NOTE_C4, NOTE_E4,
  NOTE_D4, NOTE_F4, NOTE_B3,
  NOTE_C4
};

//'Santa Claus is Coming To Town' tempo
int santa_tempo[] = {
  8,
  8, 8, 4, 4, 4,
  8, 8, 4, 4, 4,
  8, 8, 4, 4, 4,
  8, 8, 4, 2,
  4, 4, 4, 4,
  4, 2, 4,
  1
};

//'Jingle Bells' melody
int jingle_melody[] = {
  NOTE_E5, NOTE_E5, NOTE_E5,
  NOTE_E5, NOTE_E5, NOTE_E5,
  NOTE_E5, NOTE_G5, NOTE_C5, NOTE_D5,
  NOTE_E5,
  NOTE_F5, NOTE_F5, NOTE_F5, NOTE_F5,
  NOTE_F5, NOTE_E5, NOTE_E5, NOTE_E5, NOTE_E5,
  NOTE_E5, NOTE_D5, NOTE_D5, NOTE_E5,
  NOTE_D5, NOTE_G5
};

//'Jingle Bells' tone
int jingle_tempo[] = {
  8, 8, 4,
  8, 8, 4,
  8, 8, 8, 8,
  2,
  8, 8, 8, 8,
  8, 8, 8, 16, 16,
  8, 8, 8, 8,
  4, 4
};

//Philippines National Anthem melody
int philippines_melody[] = {
  NOTE_F4, 0, NOTE_E4, 0, NOTE_G4, NOTE_F4, 0, NOTE_C4, 0, NOTE_G4, NOTE_A4, NOTE_AS4, NOTE_A4, 0, NOTE_G4, NOTE_A4, 0, NOTE_F4, 0,
  NOTE_F4, 0, NOTE_E4, 0, NOTE_G4, NOTE_F4, 0, NOTE_C4, 0, NOTE_G4, NOTE_A4, NOTE_AS4, NOTE_A4, 0, NOTE_G4, NOTE_F4, 0,

  NOTE_F4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_G4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_A4, NOTE_AS4, NOTE_C5, NOTE_D5, NOTE_C5, 0,
  NOTE_F4, NOTE_E4, NOTE_F4, NOTE_G4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_G4, NOTE_G4, NOTE_C4, NOTE_C4, NOTE_A4, NOTE_AS4, NOTE_A4, NOTE_G4, NOTE_A4, NOTE_G4, NOTE_F4, 0,

  NOTE_F4, NOTE_D4, NOTE_F4, NOTE_AS4, 0, NOTE_AS4, 0, NOTE_C5, 0, NOTE_C5, 0, NOTE_D5, NOTE_C5, NOTE_AS4, NOTE_C5, NOTE_D5, 0,
  NOTE_DS5, NOTE_D5, NOTE_C5, NOTE_D5, 0, NOTE_AS4, 0, NOTE_C5, 0, NOTE_A4, 0, NOTE_A4, NOTE_AS4, 0,
};

//Philippines National Anthem tempo
int philippines_tempo[] = {
  4, 8, 8, 8, 8, 4, 8, 4, 8, 8, 8, 8, 8, 8, 8, 4, 8, 4, 8,
  4, 8, 8, 8, 8, 4, 8, 4, 8, 8, 8, 8, 8, 8, 8, 4, 8,

  8, 8, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8,
  8, 8, 8, 4, 8, 4, 8, 4, 8, 4, 8, 8, 8, 8, 8, 8, 8, 4, 8,

  8, 8, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8, 4, 8,
  8, 8, 8, 4, 8, 4, 8, 4, 8, 8, 8, 8, 4, 2,
};

//declaring PINs
const int tonePin = 8;
const int button = 7;
const int potentiometerPin = A0;
const int photoResistor = A1;

//declaring variables to avoid using delay() function
unsigned long currentNoteStartedAt = 0;
int thisNote = 0;
int millisToNextNote;

void setup() {
  Serial.begin(9600);
  pinMode(tonePin, OUTPUT);
  pinMode(button, INPUT);
  sweeper1.Attach(13);
}

void loop() {

  //read state of button and see if it's pressed
  int buttonState = digitalRead(button);

  //read state of potentiometer
  int sensorValue = analogRead (potentiometerPin);
  //map value of potentiometer from 0-1023 to 0-4 (not 0-3 because it makes the 3rd song emit weird tones)
  byte switchSong = map(sensorValue, 0, 1023, 0, 4);
  //allows user to see what number/song they're playing
  Serial.println(switchSong);

  //read state of photo resistor
  int photoValue = analogRead (photoResistor);
  //map value of potentiometer from 0-1023 to 0-2
  byte philippinesTrigger = map(photoValue, 0, 1023, 0, 2);
  //allows user to see if they are able to trigger the Philippine National Anthem
  Serial.println(philippinesTrigger);

  //declaring variable for seconds
  unsigned long currentMillis = millis();


  //if potentiometer gives 1 value and the button is pressed, turn servo motor and play the melody specified
  if ((switchSong == 1) && (buttonState == HIGH)) {
    sweeper1.Update();
    if (currentMillis - currentNoteStartedAt >= millisToNextNote) {
      int noteDuration = 1000 / wish_tempo[thisNote];
      tone(8, wish_melody[thisNote], noteDuration);
      millisToNextNote = noteDuration * 1.30;
      currentNoteStartedAt = currentMillis;
      thisNote++;
      if ( thisNote > + 29) {
        thisNote = 0;
      }
    }
  }

  //if potentiometer gives 2 value and the button is pressed, turn servo motor and play the melody specified
  if ((switchSong == 2) && (buttonState == HIGH)) {
    sweeper1.Update();
    if (currentMillis - currentNoteStartedAt >= millisToNextNote) {
      int noteDuration = 1000 / santa_tempo[thisNote];
      tone(8, santa_melody[thisNote], noteDuration);
      millisToNextNote = noteDuration * 1.30;
      currentNoteStartedAt = currentMillis;
      thisNote++;
      if ( thisNote > + 27) {
        thisNote = 0;
      }
    }
  }

  //if potentiometer gives 3 value and the button is pressed, turn servo motor and play the melody specified
  if ((switchSong == 3) && (buttonState == HIGH)) {
    sweeper1.Update();
    if (currentMillis - currentNoteStartedAt >= millisToNextNote) {
      int noteDuration = 1000 / jingle_tempo[thisNote];
      tone(8, jingle_melody[thisNote], noteDuration);
      millisToNextNote = noteDuration * 1.30;
      currentNoteStartedAt = currentMillis;
      thisNote++;
      if ( thisNote > + 25) {
        thisNote = 0;
      }
    }
  }

  //if potentiometer gives 0 value, photo resistor is covered/at 0, and the button is pressed, turn servo motor and play the melody specified
  if ((switchSong == 0) && (buttonState == HIGH) && (philippinesTrigger == 0)) {
    sweeper1.Update();
    if (currentMillis - currentNoteStartedAt >= millisToNextNote) {
      int noteDuration = 1000 / philippines_tempo[thisNote];
      tone(8, philippines_melody[thisNote], noteDuration);
      millisToNextNote = noteDuration * 1.30;
      currentNoteStartedAt = currentMillis;
      thisNote++;
      if ( thisNote > + 102) {
        thisNote = 0;
      }
    }
  }

}
