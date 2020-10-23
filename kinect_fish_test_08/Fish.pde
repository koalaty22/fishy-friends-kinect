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
  PVector pos = new PVector(0, 0, 0);
  boolean fishGrabbed;

  // kinect depth values
  int[] depthValues;

  int userID;

  // DISTANCE RANGE IN MILLIMETERS (FOR THE FILTER)
  int minDistance  = 500;  // 50cm
  int maxDistance  = 1500; // 1.5m

  Fish() {
    xpos = random(0, width/2);
    ypos = random(100, height/2);
    w = 300;
    h = 200;

    xspeed = random(1, 7);
    fish_1 = loadImage("data/Fish1.png");
    info_1 = loadImage("data/Info.png");
    fishGrabbed = false;
  }

  void display() {
    image(fish_1, xpos, ypos, w, h);
  }

  void move() {

    if (leftHand == true && (pos.x > xpos && pos.x < xpos2 &&
      pos.y > ypos && pos.y < ypos2)) {
      fishGrabbed = true;
    } else {
      fishGrabbed = false;
    }

    if (fishGrabbed == false) {  // move fish if mouse is not clicked & not on fish
      xpos = xpos + xspeed;
      xpos2 = xpos + w;        // updates the second positions of x and y
      ypos2 = ypos + h;

      if (xpos > width) {      // checks if fish is off screen
        xpos = 0;
      }
    } else if (fishGrabbed == true) {
      image(info_1, xpos, ypos, 200, 250);
    }
  }


  /*void fishDepth() {
   depthValues = kinect.depthMap();
   loadPixels();
   for (int i = 0; i < depthValues.length; i++)
   if (depthValues[i] > minDistance && depthValues[i] < maxDistance)
   fishGrabbed = true; 
   else {
   fishGrabbed = false;
   }
   
   kinect.update();
   }*/

  void hand() {
    PVector pos = new PVector(0, 0, 0);
    int [] userList = kinect.getUsers();
    for (int userID : userList) {
      ////detects and creates a circle where the Left hand is
      kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_LEFT_HAND, pos); //kinects senses the left hand of the the user 
      kinect.convertRealWorldToProjective(pos, pos); //tracks the left hand, grabs the x, y position
      fill(0, 0, 255); //makes the circle blue
      ellipse(pos.x, pos.y, 50, 50); //makes an ellipse on where the kinect sense the left hand 
      ellipse(pos.x/10, pos.y/10, 5, 5); //smaller circles for the small screen

      ////detects and creates a circle where the Right hand is
      kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_RIGHT_HAND, pos); //kinects senses the right hand of the user
      kinect.convertRealWorldToProjective(pos, pos); //tracks the right hand, grabs the x, y position
      fill(255, 0, 0); //makes the circle red
      ellipse(pos.x, pos.y, 50, 50); //makes an ellipse where the kinect sense the right hand
      ellipse(pos.x/10, pos.y/10, 5, 5); //smaller circle for the small screen
    }
  }
}

/*void checkFish(int i) {
 if (SKEL_LEFT_HAND.y < minY[i]) {
 hitLeft[i] = false;
 }// if left hand is above fish then allow to grab
 
 if(SKEL_RIGHT_HAND.y < minY[i]){
 hitRight[i] = false;
 } // if right hand is above fish then allow to grab
 
 if(SKEL_LEFT_HAND.x > minX[i] & SKEL_LEFT_HAND.x < maxX[i] 
 & SKEL_LEFT_HAND.y > minY[i] & SKEL_LEFT_HAND.y < maxY[i] 
 & (SKEL_RIGHT_KNEE.z - SKEL_LEFT_HAND.z) > minZ[i]
 & (SKEL_RIGHT_KNEE.z - SKEL_LEFT_HAND.z) < maxZ[i]
 & !(hitLeft[i])){
 
 //display box
 image(info_1, xpos, ypos, 200, 250);
 hitLeft[i] = true;
 }
 
 if(SKEL_RIGHT_HAND.x > minX[i] & SKEL_RIGHT_HAND.x < maxX[i] 
 & SKEL_RIGHT_HAND.y > minY[i] & SKEL_RIGHT_HAND.y < maxY[i]
 & (SKEL_RIGHT_KNEE.z - SKEL_RIGHT_HAND.z) > minZ[i]
 & (SKEL_RIGHT_KNEE.z - SKEL_RIGHT_HAND.z) < maxZ[i]
 & !(hitLeft[i])){
 //display box
 image(info_1, xpos, ypos, 200, 250);
 hitRight[i] = true;
 }
 }*/
