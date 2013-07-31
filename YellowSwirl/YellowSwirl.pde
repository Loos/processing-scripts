float f = 0;
float phi = 0;

void setup() {
  size(1280,800);
  frameRate(30);
  smooth();
  ellipseMode(CENTER);
  stroke(255);
  colorMode(HSB);
  strokeWeight(30);
  noFill();
  noCursor();

}

void draw() {

  translate(640, 400);
  background(30, 200, 255);

  f += 1; 
  

  strokeWeight(30);
  stroke(255);
  for(int i = 0; i < 15; i ++){

    arc(  0, 0, 
          1500-100*i, 1500-100*i, 
          (radians(0) +radians(f*(i+1)/10.+90*i) +radians(22.5*sin(radians(f)))), 
          (radians(90)+radians(f*(i+1)/10 + 90*i)-radians(22.5*sin(radians(f)))) );
    arc( 0, 0, 
         1500-100*i, 1500-100*i, 
         (radians(180)+radians(f*(i+1)/10+90*i) +radians(22.5*sin(radians(f)))), 
         (radians(270)+radians(f*(i+1)/10+90*i) -radians(22.5*sin(radians(f)))));
         

 }
 
 stroke(255);
 strokeWeight(5);
  for(int i = 0; i < 15; i ++){
    ellipse(0, 0, 0+100*i, 0+100*i);
    //ellipse(0, 0, 50+100*i, 50+100*i);
  }
}

