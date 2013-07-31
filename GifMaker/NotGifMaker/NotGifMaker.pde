float f = 0;
float phi = 0;

void setup() {
  size(250,250);
  frameRate(20);
  smooth();
  ellipseMode(CENTER);
  stroke(255);
  colorMode(HSB);
  strokeWeight(2);
  noFill();
}

void draw() {
  background(0, 0, 0, 10);
  translate(125, 125);
  f += 1; 
  noFill();
  stroke(255);
  
  for(int i = 0; i < 20; i ++){

   
    phi = (2*f + 9*i)%360;

    ellipse(
            90*cos(radians(phi%180))*cos(radians(0)), 
            12*cos(radians(phi*2 + f)),
            //30*sin(radians(18*i + f)), 
            15*sin(radians(phi))*sin(radians(f)),
            //400*sin(radians()), 
            60*sin(radians(phi))
            );

  }
}

