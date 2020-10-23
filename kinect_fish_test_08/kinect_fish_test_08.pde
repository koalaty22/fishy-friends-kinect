
//import the SimpleOpenNI 
import SimpleOpenNI.*;

//Creates a SimpleOpenNI object
SimpleOpenNI kinect;

/**--------------------------------------
 Variables kinect
 -----------------------------------------*/
//Vector values for hands
PVector SKEL_LEFT_HAND = new PVector();
PVector SKEL_RIGHT_HAND = new PVector();
//PVector SKEL_RIGHT_KNEE = new PVector();

//XYZ coordinates of hands
float SKEL_LEFT_HANDX;
float SKEL_LEFT_HANDY;
float SKEL_LEFT_HANDZ;
float SKEL_RIGHT_HANDX;
float SKEL_RIGHT_HANDY;
float SKEL_RIGHT_HANDZ;
//float SKEL_RIGHT_KNEEZ;

//boolean values
//int numberOfFish = 1;

//boolean [] hitLeft = new boolean[numberOfFish];
//boolean [] hitRight = new boolean[numberOfFish];

/*int[] minX = new int[numberOfFish];
int[] minY = new int[numberOfFish];
int[] maxX = new int[numberOfFish];
int[] maxY = new int[numberOfFish];
int[] minZ = new int[numberOfFish];
int[] maxZ = new int[numberOfFish];*/

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

// GLOBAL VARIABLE DECLARATION:
PImage bg;
Fish fish1;
boolean mouseClicked = false;
boolean hand = false;
boolean leftHand = false;


/* ---------------------------------------
 Setup Method
 ------------------------------------------*/
void setup() {
  size(1080, 720);

  //set proximity variables
  /*minX[0] = 0;
  minY[0] = 100;
  maxX[0] = width/2;
  maxY[0] = height/2;
  minZ[0] = -30;
  maxZ[0] = 120;*/
  
 /* // set all booleans to false
  for (int i=0; i<numberOfFish; i++) {
    hitLeft[i] = false;
  } // for(int i=0;i<hitLeft.length();i++)
  for (int i=0; i<numberOfFish; i++) {
    hitRight[i] = false;
  } // for(int i=0;i<hitLeft.length();i++)*/

  //creates a new kinect object
  kinect = new SimpleOpenNI(this); 

  //mirrors image of kinect to get natural mirror effect
  kinect.setMirror(true);
  //turns on the DEPTH camera 
  kinect.enableDepth();
  //turns on the RGB camera(normal camera)
  kinect.enableRGB();
  //kinect will display DEPTH camera and highlight users
  kinect.enableUser();

  bg = loadImage("data/Underwater.jpg");
  fish1 = new Fish();
}
void draw() {
  kinect.update();

  //background display
  //imageMode(CORNER);
  image(bg, 0, 0, 1080, 720);
  //imageMode(CENTER);
  //displays the user depth camera
  image(kinect.userImage(), 0, 0, 64, 48);

  fish1.display();
  fish1.move();

  //int array[10] = {0, 1, 2, 3, 4, 6, 7, 7, 8, 9};
  // int array = {0, 1, 3, 4, 5};
  // for(int i=0; i<5; i++) {
  // println(array[i]);

  int [] userList = kinect.getUsers();
  //userID[0]
  //user[1]
  //for(int i=0;i<userList.length;i++){
  // int userID = userList [i];

  /*PVector pos = new PVector(0, 0, 0);
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
    
   // kinect.getJointPositionSkeleton(userID,SimpleOpenNI.SKEL_RIGHT_KNEE, pos);
   // kinect.convertRealWorldToProjective(pos, pos);
   // fill(255, 255, 0);
   // ellipse(pos.x/10, pos.y/10, 5, 5);*/
  }
  
 // for (int x = 0; x < kinect.depthWidth; x++){
  
  //}

void onNewUser(SimpleOpenNI curContext, int userId) {
  kinect.startTrackingSkeleton(userId);
}



void mouseClicked() {
  if (mouseClicked == false) {
    mouseClicked = true;
  } else {
    mouseClicked = false;
  }
}
