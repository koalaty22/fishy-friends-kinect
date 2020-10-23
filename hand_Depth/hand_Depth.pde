import SimpleOpenNI.*;

SimpleOpenNI kinect;

int closestValue;
int closestX;
int closestY;
PImage img, info_1;

void setup() {
  size(1080, 720);

  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  
  info_1 = loadImage("data/Info.png");
  
 // imageMode (CENTER);
}

void draw() {
  closestValue = 600;
  kinect.update();

  // draw the depth image on the screen 
   
  image(kinect.depthImage(), 0, 0); 
  
  
  int[] depthValues = kinect.depthMap();
  
  //breaks the array down into rows
  for (int y = 0; y < 480; y++) {
    
    //breaks the array down into specific pixels in each row
    for (int x = 0; x < 640; x++) {
      
      //pulls out the specific array position
      int i = x + y * 640;
      int current = depthValues[i];

      //now the positions are compared
      if (current > 0 && current < closestValue) {
        closestValue = current;
        closestX = x;
        closestY = y;
        fill(0, 0, 255);
        //ellipse (closestX, closestY, 50, 50);
        image(info_1, closestX, closestY, 200, 250);
      }
    }
  }
  // draw that red circle identifying it  
  fill(255, 0, 0); //This sets the colour to red  
  ellipse(closestX, closestY, 25, 25);
}
