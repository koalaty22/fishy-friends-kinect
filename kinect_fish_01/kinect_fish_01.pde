
//import the SimpleOpenNI 
import SimpleOpenNI.*;

//Creates a SimpleOpenNI object
SimpleOpenNI kinect;

void setup() {
  size(600, 400);
  kinect = new SimpleOpenNI(this); 

  //turns on the DEPTH camera
  kinect.enableDepth();

  //turns on the RGB camera(normal camera)
  kinect.enableRGB();

  //kinect will display DEPTH camera and highlight users
  kinect.enableUser();
}
void draw() {
  kinect.update();
  background(255);
  //displays the DEPTH camera
  //image(kinect.depthImage(), 0,0);

  //displays the RGB camera
  //image(kinect.rgbImage(), 0, 0);

  //displays the user
  image(kinect.userImage(), 0, 0, 300, 200);
  int [] userList = kinect.getUsers();
  //userID[0]
  //user[1]
  //for(int i=0;i<userList.length;i++){
  //  int userID = userList [i];
  PVector pos = new PVector(0, 0, 0);
  for (int userID : userList) {
    kinect.getJointPositionSkeleton(userID, SimpleOpenNI.SKEL_HEAD, pos);
  }
  ellipse(pos.x, pos.y, 50, 50);
  println(pos);
}

void onNewUser(SimpleOpenNI curContext, int userId){
kinect.startTrackingSkeleton(userId);
}
