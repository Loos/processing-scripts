float f = 0;
float phi = 0;
float x = 0;
int sw = 1;
void setup() { 
  noCursor();
  size(1280, 800);
  frameRate(20);
  smooth();
  ellipseMode(CENTER);
  stroke(255);
  colorMode(HSB);
  strokeWeight(5);
  noFill();
  
}

void draw() {

  translate(640, 400);
  f += 1;
  noFill();

  background((f/180.)%80, 255, ceil(sin(radians(f)))*110);
  
  
  color f1 = color(21, 255, 210);
  color f2 = color(255);
  color f3 = color(0, 255, 210);
  color f4 = color(144, 150, 50);
  
  stroke(f1);
  strokeWeight(30);
  
  if(f%50 == 1){
    x = radians(ceil(random(4))*30);
    sw *= -1;
  }
  
  rotate(x);
  rotate(radians(f*sw));
  rectMode(CENTER);
  for(int i = 0; i < 5; i ++){

    rect(0, 0, 200+100*i, 200+2000*i);
  }
  
  stroke(f2);
  

  
  strokeWeight(5);
    
  //for(int i = 0; i < 3; i ++){
  
    for(int j = 0; j < 3; j ++){
      ellipse(0, 0, 450 + j*25,  450 + j*25);
    }
    
    
    for(int j = 0; j < 5; j ++){
      ellipse(0, 0, 800 + j*25,  800 + j*25);
    }
    
    for(int j = 0; j < 5; j ++){
      ellipse(0, 0, 1150+j*25, 1150+j*25);
    }

  
  rotate(radians(45));
  for(int i = 0; i < 2; i ++){
    
    noStroke();
    fill(f3);
    for(int j = 0; j < 5; j ++){
      
      int jm = 180*j;
      
      rect(150+jm, 0, 50, 150);
      rect(0, 150+jm, 150, 50);
      rect(-150-jm, 0, 50, 150);
      rect(0, -150-jm, 150, 50);
      
    }

      
  }
  

}

