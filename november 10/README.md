# Arduino Assignment 1: LED Game
This week's assignment involved using Arduino switches/buttons and LED lights to create a puzzle game. Through looking at tutorials and using what we learned in class, I decided to make a game that involved memorizing a pattern given by the Arduino program. If you are able to get through 7 rounds, you win! However, you should press the pattern before 2 seconds runs out, or that is a game over.

## Schematic
The build of the final schematic is below, which I made through a combination of drawing and Photoshop. This build involves connecting all button and LED wires from the digital pins to one side of the breadboard. This then connects all of the wires to one main GND wire, which is what powers it all up.

![alt-text](images/potentiometer.gif)

## First Build and Setbacks
At first, I believed that I would be able to build this program using only the knowledge we learned in class. However, this proved to be quite challenging, as we were taught to only put the LED's in a specific way on the breadboard, not making it visible to the future player.

![alt-text](images/photoresistor.gif)

In addition, because I did not know that you could connect wires on the breadboard itself instead of constantly connecting it to different GND pins, I made use of more wires than needed, making it look messier than expected. You can see from the gif below that I was struggling getting my finger inside the tight space of where the buttons were to activate the LED.

![](images/trial1.jpg)

With this being said, I decided to look at various tutorials and walkthroughs of how to properly position these parts of the build.

## Second Build and Setbacks
This trial was definitely more organized and I knew more of what was going on rather than blindly follow and hope that it would work. My build now had the colored LED's and its corresponding color button next to each other, with the wires behind instead of around them. This makes it easier for the player to access. I wanted to add a buzzer, however, I decided to withdraw it as I could not get it to work. 

![](images/trial2.jpg)

However, the next setback I experienced was the programming aspect of the game. Because I have never learned C or C++ before, some of the parts of coding were quite difficult to follow on just self-teaching, especially since most of the tutorials I found were very heavy on using C/C++, such as using #define and other parts.

However, I was able to realize that you did not technically need C/C++, as the game can run on majority Processing language alone. Even through this, I was able to recognize new parts of Processing that I did not know before, such as the "break" command, the "long" variable, and also the "do, while" function.

## Final Game
The final runthrough of the game (in 3x speed since gif's can only be no more than 30 seconds) is below. Please disregard the buzzer. As shown in this playthrough, you press any button to start the game, and all LED's will blink fast 3 times to indicate that game is starting. The game will then pick out a random LED for you to press, and will add more as you go. If you fail, all LED's will light up, going back to the initial start of the game. If you win, the LED's will blink fast once again.

![alt-text](images/finalgame.gif)

