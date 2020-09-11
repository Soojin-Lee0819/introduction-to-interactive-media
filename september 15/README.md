Production Assignment 1: Processing Self Portrait

This activity proved to be quite time consuming, as the coordinates of the shapes were opposite to what we are taught in high school, going right and down with every increase instead of right and up. Because of this, it took some time for me to get used to writing the code for the portrait.

Some difficulties I encountered during the creation of my self portrait is not knowing how to add comments. Because I did not know how to label my lines of code, I did not remember what ellipses or lines stood for each body part. As a result, I had to change the coordinate of each code to remember which line or ellipse it is. Only when searching how to add comments did I learn how. In addition, because I decided to experiment with Processing before learning more shapes in class, I was met with harsh lines as I did not know the arc function yet. A picture of my rough sketch is shown below:

In addition, because Processing starts off with a small canvas, I did not know you could change the size of the canvas until after I finished coding my self portrait. As a result, I had to multiply each coordinate by a specific number, so they all fall in the same area as they were in the smaller canvas. Coloring also became an issue for me, as some of the lines such as my portrait's bangs are not considered a "shape" and therefore could not be filled with color, making it less realistic. As a result, I had to use extra shapes and remove their stroke to fill in the "bald spots" and make it look more natural.

Lastly, after inputting all the shapes, I wanted to add animations to make it engaging to the viewer. This proved difficult when first using the "less than or equal to" function instead of the "equal to" function (ex: if the position is <= 85, it will move down) when animating the position of a shape, as it would not go back to the original position (ex: the original position was 95) as even one pixel less than 85 it will go back to moving up and down without returning to the original position.
         
         if (eyebrowsmove >= 85) { 
          eyebrowsmove = eyebrowsmove - 1;
        } else {
          eyebrowsmove = eyebrowsmove + 1;
        }


