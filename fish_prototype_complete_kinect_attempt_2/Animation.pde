/*
Class for animating a sequence of GIFs, 
 code adapted from: 
 Animated Sprite by James Paterson, https://processing.org/examples/animatedsprite.html
 Retrieved 8th October 2020
 */

class Animation {
  //setup the array for the coral
  PImage[] coral1_move = new PImage[10];
  //variable for the coral when its not bleached
  PImage fish_still;
  float xpos, ypos, w, h;
  boolean overCoral = false;

  //int xpos, ypos, xpos2, ypos2, w, h;

  Animation() {
    xpos = 500;
    ypos = 400;
    w = 200;
    h = 250;

    //made a new variable for the first frame (the still frame)
    fish_still = coral1_move[0] = loadImage("data/coral1/coral1_0.gif");

    //all the images for the coral
    //could have been put into a for loop
    coral1_move[0] = loadImage("data/coral1/coral1_0.gif");
    coral1_move[1] = loadImage("data/coral1/coral1_1.gif");
    coral1_move[2] = loadImage("data/coral1/coral1_2.gif");
    coral1_move[3] = loadImage("data/coral1/coral1_3.gif");
    coral1_move[4] = loadImage("data/coral1/coral1_4.gif");
    coral1_move[5] = loadImage("data/coral1/coral1_5.gif");
    coral1_move[6] = loadImage("data/coral1/coral1_6.gif");
    coral1_move[7] = loadImage("data/coral1/coral1_7.gif");
    coral1_move[8] = loadImage("data/coral1/coral1_8.gif");
    coral1_move[9] = loadImage("data/coral1/coral1_9.gif");
  }

  void display() {
    //When the mouse is clicked over the coral it animates the coral 
    if (mouseClicked == true && (mouseX > xpos && mouseY > ypos)) {
      image(coral1_move[frameCount%10], xpos, ypos, w, h);
    } else {
      image(fish_still, xpos, ypos, w, h);
    }
  }
  /*
    if (overCoral == true){
   image(coral1_move[frameCount%10], xpos, ypos, w, h);
   } else {
   image(fish_still, xpos, ypos, w, h);
   }
   }
   
   
   boolean overCoral(int xpos, int ypos, int w, int h) {
   if (mouseX >= xpos && mouseX <= xpos + w &&
   mouseY >= ypos && mouseY <= ypos + h){
   return true;
   } else {
   return false;
   }
   }
   }*/
}
