//Katie Ferreol November 10 Assignment
//Analog Vs. Digital
//Instructions: The game starts off with all lights on. One friend dial the potentiometer at a random value.
//To make things fun, the other friends should guess what LED will be left on after the button is pressed. 
//Press the button. Whoever's guess is right gets the point!

//declaring all variables
const int redLEDPin = 6;
const int blueLEDPin = 9;
const int yellowLEDPin = 10;
const int greenLEDPin = 11; 
const int button = 5;

void setup() {
  Serial.begin(9600);

  //setting the button as input
  pinMode(button, INPUT_PULLUP);

  //setting the LED's as output
  pinMode(redLEDPin, OUTPUT);
  pinMode(blueLEDPin, OUTPUT);
  pinMode(yellowLEDPin, OUTPUT);
  pinMode(greenLEDPin, OUTPUT);
}

void loop() {
  //read the value of the potentiometer (ANALOG)
  int sensorValue = analogRead (A2);
  Serial.println(sensorValue);

  //read the state of the button (DIGITAL)
  int buttonState = digitalRead(button);
  delay(1);

//if value is greater than 200 but less than 400, light up RED
 if ((sensorValue > 200) && (sensorValue < 400)) {
 analogWrite (redLEDPin, 100);
 analogWrite (blueLEDPin, 0);
 analogWrite (yellowLEDPin, 0);
 analogWrite (greenLEDPin, 0);
}
//if value is greater than 200 but less than 400, light up BLUE
else if ((sensorValue > 400) && (sensorValue < 600)) {
 analogWrite (redLEDPin, 0);
 analogWrite (blueLEDPin, 100);
 analogWrite (yellowLEDPin, 0);
 analogWrite (greenLEDPin, 0);
}
//if value is greater than 200 but less than 400, light up YELLOW
else if ((sensorValue > 600) && (sensorValue < 800)) {
 analogWrite (redLEDPin, 0);
 analogWrite (blueLEDPin, 0);
 analogWrite (yellowLEDPin, 100);
 analogWrite (greenLEDPin, 0);
}
//if value is greater than 200 but less than 400, light up GREEN
else if (sensorValue > 800) {
 analogWrite (redLEDPin, 0);
 analogWrite (blueLEDPin, 0);
 analogWrite (yellowLEDPin, 0);
 analogWrite (greenLEDPin, 100);
}
//turn all LED's OFF when button is pressed
//since it is below the analog values, it is lesser priority, explaining why the potentiometer LED will not turn off
if (buttonState == HIGH)  {
  digitalWrite(redLEDPin, HIGH);
  digitalWrite(blueLEDPin, HIGH);
  digitalWrite(yellowLEDPin, HIGH);
  digitalWrite(greenLEDPin, HIGH);
}
}
