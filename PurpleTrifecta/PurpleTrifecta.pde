int f = 0;
void setup(){
  
  size(1280, 800);
  colorMode(HSB);

  strokeWeight(20);
  noFill();
  smooth();
  noCursor();
  
  
}

void draw(){
  f += 1;
  background(200, 200, 100);
  translate(640, 400);
  for(int i = 0; i < 3; i ++){
    rotate(radians(120));
    for(int k = 0; k < 5; k ++){
      stroke(150, 200, 200);
      arc(0, 0, 100*k+100, 200*k+200, radians(f), radians(f + 60));
      stroke(150, 70, 250);
      arc(0, 0, 100*k+100, 200*k+200, radians(-f + 180), radians(-f + 45 + 180));
      stroke(0, 200, 200);
      arc(0, 0, 100*(k+.5)+100, 200*(k+.5)+200, radians(f), radians(f + 60));
      stroke(0, 70, 250);
      arc(0, 0, 100*(k+.5)+100, 200*(k+.5)+200, radians(-f + 180), radians(-f + 45 + 180));
    }
  }
}
  
