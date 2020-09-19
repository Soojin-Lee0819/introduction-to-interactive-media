# Production Assignment 2: Processing Work of Art

Having experience with Processing from the previous assignment, I was able to finish this assignment at a quicker time, even if it involved new commands. My final work of art is shown below:

![](images/finalsketch.png)

and the animated version of my file is below:

![alt-text](images/butterfly.gif)

Some difficulties I encountered during the creation of my work of art is as follows:

## 1. Attention to detail
Because I wanted this work to be a step up from what I coded for my first assignment, I wanted it to resemble a butterfly. As a result, I used the curve() function for the first time for the wings, and lines and ellipses for the detail. This, I could say, was the longest part in my coding process. A picture of my rough sketch is shown below:

![](images/originalsketch.png)

## 2. Animating different colors inside the while() function
For my work of art, I wanted different butterflies to show different colors every second, to give an illuminated light effect like those you see on Christmas. However, when putting the random color generating code *outside* the while() function, it would only generate random colors and leave it at that specific color for the whole run, not changing color like I wanted to.

void wings(int xstartingpoint, int ystartingpoint) {
    translate(xstartingpoint, ystartingpoint);
    stroke(255, random(255), random(255));
      fill (random(255), random(255), random(255));
      strokeWeight (3);
      }
      
 However, after watching

 void pattern() {
    xstartingpoint = 400;
    ystartingpoint = 100;
    while (xstartingpoint < width) {
      butterfly.wings(xstartingpoint, ystartingpoint);
      butterfly.wings(xstartingpoint, ystartingpoint);
      xstartingpoint = xstartingpoint + 1;
      stroke(255, random(255), random(255));
      fill (random(255), random(255), random(255));
      strokeWeight (3);
    }
  }

## 3. Lack of knowledge regarding all shapes
In addition, because I decided to experiment with Processing before learning more shapes in class, I was met with harsh lines for the nose, bangs, and mouth as I did not know the arc function yet.

## 4. Not changing the canvas before coding
In addition, because Processing starts off with a small canvas, I did not know you could change the size of the canvas until after I finished coding my self portrait. As a result, I had to multiply each coordinate by a specific number, so they all fall in the same area as they were in the smaller canvas.

## 5. Coloring and the Color Selector
Coloring also became an issue for me, as the button to copy was only for the HEX code, there was no option to copy the RGB code straight from the Color Selector, so I had to manually type it in. In addition, as some of the lines such as my portrait's bangs are not considered a *"shape"* and therefore could not be filled with color, making it less realistic. As a result, I had to use extra shapes and remove their stroke to fill in the *"bald spots"* and make it look more natural.

![](images/butterflybug.png)

## 6. Coding the animations
Lastly, after inputting all the shapes, I wanted to add animations to make it engaging to the viewer. This proved difficult when first using the *"less than or equal to"* function instead of the *"equal to"* function (ex: if the position is <= 85, it will move down) when animating the position of a shape, as it would not go back to the original position (ex: the original position was 95) as even one pixel less than 85 it will go back to moving up and down without returning to the original position. This code is seen below:
         
         if (eyebrowsmove >= 85) { 
          eyebrowsmove = eyebrowsmove - 1;
        } else {
          eyebrowsmove = eyebrowsmove + 1;
        }

This is the code I ended up using instead:

         if (eyebrowsmove == 95) { 
             eyebrowsmove = eyebrowsmove - 10;
           } else {
             eyebrowsmove = eyebrowsmove + 10;
           }
