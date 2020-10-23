/*
----------------------------------------------------------------
    "Fishy Friends"
    DXH602 Embodied Interactions
    Assignment 2 Prototype
    Authors: Gabrielle Burey, Steph Robinson & Judy Um
    Date: 13/10/2020
    Description:
      "Fishy Friends" is a prototype programmed to display an 
      interactive reef where users can touch the fish for 
      more information. Additionally the 
      Cry". The code uses a simple class object to draw,
      mask and display the diamond-like prism. 
    
    Inputs: 
      Mouse Press (fish) - Click for more information about fish
      Mouse Over (Coral) - Triggers coral to desaturate
SEE ALL REFERENCES AT THE BOTTOM OF SKETCH. 
----------------------------------------------------------------
*/

// GLOBAL VARIABLE DECLARATION:
PImage bg;
Fish fish1;
Animation coral1_animate;

boolean mouseClicked = false;
boolean coralOver = false;

void setup() {
  //noCursor();
  size(1080, 720);
  bg = loadImage("data/Underwater.jpg");
  
  //makes a new fish
  fish1 = new Fish();
  //coral1_still = new Coral();
  //coral1_animate = new Animation("data/coral[1]/", 10);
  //makes a new coral
 coral1_animate = new Animation();
}

void draw () {
  //places underwater background image
  background(bg);
  //coral1_still.coraldisplay();
  
  //displays the coral animation
  coral1_animate.display();
  //displays the fish 
  fish1.display();
  //displays the fish move
  fish1.move();
}

//mouseClicked variable to check if the mouse was clicked or not
void mouseClicked() {
    if (mouseClicked == false){
      mouseClicked = true;
    } else {
      mouseClicked = false;
    }
}

/*
----------------------------------------------------------------

SimpleOpenNI library created by Max Rheiner 
https://github.com/totovr/SimpleOpenNI
https://totovr.github.io/SimpleOpenNI/

This tutorial by JS Yeh was used as a basis for tracking hands with SimpleOpenNI
(It's in Chinese Mandarin, but found it easy to follow)
https://www.youtube.com/watch?v=tgyCg8Wp8Nw

Also followed some codes for the Kinect by Leonardo Merza
https://leonardomerza.wordpress.com/category/kinect-development/
Mostly the Invisible Drumset project
https://github.com/ljmerza/KinectDrumset

Adapted the hand clicked code for the kinect from this 
https://stackoverflow.com/questions/33883123/kinect-play-pause-music-in-processing


----------------------------------------------------------------
*/
