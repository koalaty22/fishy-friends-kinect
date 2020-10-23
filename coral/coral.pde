PImage img;
PImage[] coral1_move = new PImage[10];
int coralX = 600, coralY = 400;

void setup(){
size(1080, 720);
  frameRate(8);
  img = loadImage("data/Underwater.jpg");
  
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

void draw(){
  image(img, 0, 0, width, height);
 image(coral1_move[frameCount%10], 200, 250);
}
