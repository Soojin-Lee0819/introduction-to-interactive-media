# Arduino Assignment 3: Piezo Buzzer & Servo Motor
This week's assignment makes use of a buzzer, servo motor, button, photoresistor, and potentiometer to create a "Christmas Radio" to commemorate the holiday season.

Mapping the potentiometer from 0 to 4, each number represents a new song, which will play if you hold down the button (1 for We Wish You A Merry Christmas,
2 for Santa Claus is Coming to Town, 3 for Jingle Bells). As the song plays, the servo motor--to which I added a clay Christmas tree on top--will spin accordingly.

To make use of the photoresistor as well, I made an easter egg so that, if all the numbers in the read.serial function is equal to zero
(so if the potentiometer is turned all the way down and if the photo resistor is covered), it will play the Philippine National Anthem if you press down on the button.

[The link to the full video is here!](https://vimeo.com/479846751)

## Inspiration
Christmas has always been a big occasion in the Philippines. In addition to being a majority Catholic country, we Filipinos are very festive family and love celelbrating with family. As a result, I wanted to commemorate the day through this project, not only through the joyous tunes but also using materials I can find to make it more festive, such as creating a Christmas tree.

![](images/christmasphilippines.png)

## Schematic
The build of the final schematic is below, which I made through drawing.

![](images/schematic.png)

## Playing The Melodies
From the beginning, I already knew I wanted to use other components instead of LED's, which have been a part of my Arduino for two projects now. Deciding I wanted to go out of my comfort zone, I decided to make use of the photo resistor and servo motor, in additio to the other components required for this project. My first build is below, which was still quite messy and used various colored wires instead of having them all uniform with one another.

 ![](images/firstbuild.png)
 
 Having the potentiometer, photo resistor, and buzzer all on the board, I began the first stage of adding the songs. Using the melodies from [this code](https://create.arduino.cc/projecthub/joshi/piezo-christmas-songs-fd1ae9) as it was hard to make my own, I made it so that the song would play to one digit in the potentiometer.
 
 ## Spinning The Servo Motor
 After I got all the melodies in order, it was time to add the servo motor. Adding it to my board (which was hard because I didn't know where to put the 5V wire), my build now looked like this:
 
  ![](images/secondbuild.png)
 
 At first, I had a hard time getting the servo motor to move, as I still wasn't fully familiar with not using the delay() function. As a result, my melodies would play, but my servo motor would stop. There were even times where it glitched out and only one tone played. However, learning and using Professor's [code for simultaneous LED's and melodies](https://github.com/michaelshiloh/toneMelodyAndBlinkWithoutDelay), I was able to get both of them to work.
 
 ## Adding an Easter Egg
 After getting all of these done, I noticed that I didn't make use of my photo resistor. Thinking of a way to pay tribute to my country in this project, I decided to have an easter egg melody play if you got both the photo resistor and the potentiometer to 0 values: the national anthem would play! Since there was no Arduino code for my national anthem, I had to make it myself. I made use of various sites and videos to find the right tune.
 
 ![](images/video.png)

 ![](images/philippinespiano.png)

 ## Making It Festive
 Deciding it still wasn't festive enough, I wanted to add something Christmas-related to the circuit, so it wasn't just filled with wires. Suddenly, I remembered that Christmas trees usually have a rotating function to them, creating this idea in my head to put a Christmas tree on the servo motor so it can move with the melody.
 
 
 First wanting to use paper, I thought that was too simple. Then, I remembered the convenience store here sold clay, which I then bought to create the tree.
 ![](images/claybox.png)

 ![](images/christmastree.png)
