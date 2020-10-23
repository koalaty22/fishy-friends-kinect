//not sure if this is needed but keep it in anyways, :) 
class Coral {
  float xpos, ypos, xpos2, ypos2, w, h;
  PImage coral1_still; 

  Coral() {
    xpos = 600;
    ypos = 400;
    w = 200;
    h = 250;
    coral1_still = loadImage("data/coral1/coral1_1.gif");
  }

  void coraldisplay() {
    image(coral1_still, xpos, ypos, w, h);
  }
}
