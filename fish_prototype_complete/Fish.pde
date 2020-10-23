/*
Class for creating Fish Objects
    Includes functions:
      display() - displays image of fish_1 with respective x and y co-ordinates
      move() - moves the fish horizontally
    
    Variables:
      xpos, ypos - current x and y positions of fish object (top-left corner)
      xpos2, ypos2 - current x and y positions of fish object (bottom-right corner)
      xspeed - speed of fish swimming
      w, h - width and height of fish object
      fish_1 - fish 1 (used for testing, will update code to involve many fish)
      info_1 - info for fish 1 (used for testing, will update code to involve many fish)
*/

class Fish {
  float xpos, ypos, xspeed, xpos2, ypos2, w, h;
  PImage fish_1, info_1;
  //fishGrabbed is the created boolean for the mousePressed/mouseClicked
  boolean fishGrabbed;
  
  Fish() {
    xpos = random(0, width/2);
    ypos = random(100, height/2);
    w = 300;
    h = 200;
    
    //The fish will swim at different speeds
    xspeed = random(1, 7);
    fish_1 = loadImage("data/Fish1.png");
    info_1 = loadImage("data/Info.png");
    fishGrabbed = false;
  }
  
  void display() {
    image(fish_1, xpos, ypos, w, h);
  }
  
  void move() {
    
    //changed mouseClicked to mousePressed (seemed more effective)
    if (mousePressed == true && (mouseX > xpos && mouseX < xpos2 &&
        mouseY > ypos && mouseY < ypos2)){
        fishGrabbed = true; 
        println("fishGrabbed is " + true + ".");
    } else {
        fishGrabbed = false;
        println("fishGrabbed is " + false + ".");
    }
    
    if (fishGrabbed == false) {  // move fish if mouse is not clicked & not on fish
      xpos = xpos + xspeed;
      xpos2 = xpos + w;        // updates the second positions of x and y
      ypos2 = ypos + h;
      
      if (xpos > width) {      // checks if fish is off screen
        xpos = 0;
      }
    } 
    
    else if (fishGrabbed == true) {
      image(info_1, xpos, ypos, 200, 250);
    }
  }
}
