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
import SimpleOpenNI.*;
SimpleOpenNI kinect;

PVector SKEL_LEFT_HAND = new PVector();
PVector SKEL_RIGHT_HAND = new PVector();
PVector SKEL_RIGHT_KNEE = new PVector();

//XYZ coordinates of hands
float SKEL_LEFT_HANDX;
float SKEL_LEFT_HANDY;
float SKEL_LEFT_HANDZ;
float SKEL_RIGHT_HANDX;
float SKEL_RIGHT_HANDY;
float SKEL_RIGHT_HANDZ;
float SKEL_RIGHT_KNEEZ;

// Size of drawn dot on each joint  
float dotSize = 30;
// Vector to scalar ratio
float vectorScalar = 525;

// threshold of level of confidence
float confidenceLevel = 0.1;
// the current confidence level that the kinect is tracking
float confidence;
// vector of tracked head for confidence checking
PVector confidenceVector = new PVector();

// boolean if kinect is tracking
boolean tracking = false;
// current userid of tracked user
int userID;
// mapping of users
int[] userMapping;

//variables that tracks the depth points 
float sumX = 0;
float sumY = 0;
float count = 0;

float xpos;
float ypos;

// GLOBAL VARIABLE DECLARATION:
PImage bg;
PImage info_1;
Fish fish1;
Animation coral1_animate;

boolean mouseClicked = false;
boolean coralOver = false;

void setup() {
  //noCursor();
  size(1080, 720);
  bg = loadImage("data/Underwater.jpg");
  info_1 = loadImage("data/Info.png");
  xpos = random(0, width/2);
  ypos = random(100, height/2);

  kinect = new SimpleOpenNI(this); 
  //mirrors image of kinect to get natural mirror effect
  kinect.setMirror(true);
  //turns on the DEPTH camera 
  kinect.enableDepth();
  //turns on the RGB camera(normal camera)
  kinect.enableRGB();
  //kinect will display DEPTH camera and highlight users
  kinect.enableUser();

  //makes a new fish
  fish1 = new Fish();
  //coral1_still = new Coral();
  //coral1_animate = new Animation("data/coral[1]/", 10);
  //makes a new coral
  coral1_animate = new Animation();
}

void draw () {
  kinect.update();
  //places underwater background image
  image(bg, 0, 0, 1080, 720);
  //coral1_still.coraldisplay();

  image(kinect.userImage(), 0, 0, 64, 48);

  //displays the coral animation
  coral1_animate.display();
  //displays the fish 
  fish1.display();
  //displays the fish move
  fish1.move();
  fish1.kinect();
  //fish1.onNewUser();

  //userID[0]
  //user[1]
  //for(int i=0;i<userList.length;i++){
  // int userID = userList [i];

  //hand vectors
  int [] userList = kinect.getUsers();

  PVector pos = new PVector(0, 0, 0);
  for (int userID : userList) {
    //detects and creates a circle where the Left hand is
    kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_LEFT_HAND, pos);
    kinect.convertRealWorldToProjective(pos, pos);
    fill(0, 0, 255);
    ellipse(pos.x, pos.y, 50, 50);
    ellipse(pos.x/10, pos.y/10, 5, 5);

    //detects and creates a circle where the Right hand is
    kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_RIGHT_HAND, pos);
    kinect.convertRealWorldToProjective(pos, pos);
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 50, 50);
    ellipse(pos.x/10, pos.y/10, 5, 5);

    kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_HEAD, pos);
    kinect.convertRealWorldToProjective(pos, pos);
    fill(255, 255, 0);
    ellipse(pos.x/10, pos.y/10, 5, 5);

    /* kinect.getJointPositionSkeleton(userID,SimpleOpenNI.SKEL_RIGHT_KNEE, pos);
     kinect.convertRealWorldToProjective(pos, pos);
     fill(255, 255, 0);
     ellipse(pos.x/10, pos.y/10, 5, 5);*/
  }

  if (pos.x > 0 && pos.x < 600 && pos.y > 0 && pos.y < 600 && (keyPressed == true)) {
   image(info_1, xpos, ypos, 200, 250);
 }
 if (pos.x > 0 && pos.x < 600){
 
 }
 
}
void onNewUser(SimpleOpenNI curContext, int userId) {
  kinect.startTrackingSkeleton(userId);
}

//mouseClicked variable to check if the mouse was clicked or not
void mouseClicked() {
  if (mouseClicked == false) {
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
