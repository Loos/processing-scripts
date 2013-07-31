int x = 0;
int y = 0;
boxes smap;

void setup() {
  background(0);
  smooth();
  size(1000, 1000, P3D); 
  lights();
  noStroke();
  
  
}

void draw(){
  lights();
  background(0);
  camera(0, 0, 300,
        0, 0, 0,
        1, 0, 0);
        
  rotateX(radians(-x));
  rotateY(radians(y));
  if (mousePressed == true) {
   x += pmouseX-mouseX;
   y += pmouseY-mouseY;
   }
   smap = new boxes(30, 30);
}

class boxes{
  boxes(float x, float y){
    translate(x, y, 500);
    stroke(1);
      for(int m = 0; m <40; m += 1){
        box(50-5*m);
        rotate(90);
        translate(500*sin(radians(m*6)), 500*cos(radians(m*6)), 0);
      
    }
  }
}
