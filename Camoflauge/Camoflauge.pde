int XCOUNT = 300;
int YCOUNT = 175;

final int XSIZE = 1200;
final int YSIZE = 700;

unit[][] ballGrid;
diffuse[][] collideGridUp;
diffuse[][] collideGridLeft;

void setup(){
  size(XSIZE, YSIZE);
  
  ballGrid = new unit[XCOUNT][YCOUNT];
  collideGridUp = new diffuse[XCOUNT][YCOUNT-1];
  collideGridLeft = new diffuse[XCOUNT-1][YCOUNT];
  
  for( int x = 0; x < XCOUNT; ++x ) {
    for( int y = 0; y < YCOUNT; ++y) {
      ballGrid[x][y] = new unit( (x)*XSIZE/(XCOUNT), (y) * YSIZE / (YCOUNT), XSIZE/XCOUNT, YSIZE/YCOUNT);
    }
  }
  for( int x = 0; x < XCOUNT; ++x ) {
    for( int y = 0; y < YCOUNT-1; ++y) {
      collideGridUp[x][y] = new diffuse(ballGrid[x][y], ballGrid[x][y+1]);
    }
  }
  for( int x = 0; x < XCOUNT-1; ++x ) {
    for( int y = 0; y < YCOUNT; ++y) {
      collideGridLeft[x][y] = new diffuse(ballGrid[x][y], ballGrid[x+1][y]);
    }
  }
  
}
  
  
void draw(){
  colorMode(RGB);
  background(255, 255, 255);
  smooth();
  for( int x = 0; x < XCOUNT; ++x ) {
   for( int y = 0; y < YCOUNT; ++y ) {
     ballGrid[x][y].update();
   }
  }
  for( int x = 0; x < XCOUNT; ++x ) {
    for( int y = 0; y < YCOUNT-1; ++y) {
       collideGridUp[x][y].update();
    }
  }
  for( int x = 0; x < XCOUNT-1; ++x ) {
    for( int y = 0; y < YCOUNT; ++y) {
       collideGridLeft[x][y].update();
    }
  }
}
  
void keyPressed(){
 if (key == 'p') {
   saveFrame("bubbles-####.jpg");
 }

}

class unit{
  PVector p, s, mouse;
  float b, w, grey, r, m, interact;
  color c;

  
  unit(float x, float y, float X, float Y){
    colorMode(RGB);
    noStroke();
    p = new PVector(x, y);
    s = new PVector(X, Y);
    b = random(255);
    w = random(255);
    grey = random(255);
    c = color(0, 0, 0);
    mouse = new PVector(mouseX, mouseY);
  }
  
  void update(){
    mouse.x = mouseX;
    mouse.y = mouseY;
    if(mousePressed == true){
      interact = round(random(6));
      if(p.dist(mouse) < XSIZE/XCOUNT){
        if (interact == 1){
          b += 500;
        }
        if (interact == 2){
          b -= 500;
        }
        if (interact == 3){
          w += 500;
        }
        if (interact == 4){
          w -= 500;
        }
        if (interact == 5){
          grey += 500;
        }
        if (interact == 6){
          grey -= 500;
        }
      }
    }
    r = random(25);
    m = round(random(10));
    /*
    if(mouseX < p.x + s.x && mouseX > p.x && mouseY < p.y + s.y && mouseY > p.y){
      i += 1;
    }
    */
    /*
    fill(c);
   */
   
   if(b > w && b > grey){
     
     fill(255, 0, 0);
   }
   if(w > b && w > grey){
     fill(255, 255, 0);
   }
   if(grey > b && grey > w){
     fill(0, 0, 255);
   }
     
     /*
     if(m == 1){
       fill(200, 200, 200);
       ellipse(p.x, p.y, r, r);
       fill(255, 255, 255);
       ellipse(p.x, p.y, r/1.2, r/1.2);
     }
     if(m == 0){
       fill(255, 255, 255);
       ellipse(p.x, p.y, r, r);
       fill(200, 200, 200);
       ellipse(p.x, p.y, r/1.2, r/1.2);
     }
     
     */
     
  
   /*
   else{
     fill(255);
   }
   */
   
   rect(p.x, p.y, s.x, s.y);
   
  }
}


class diffuse{
  unit ball1;
  unit ball2;
  float m;
  float r;
  
  diffuse(unit b1, unit b2){
    ball1 = b1;
    ball2 = b2;
  }
  
  void update(){
    
    /*
    
    if(ball1.w > ball1.b && ball2.b > ball2.w){
         
         ball1.c = color(255, 255, 255);
         ball2.c = color(255, 255, 255);
         
        }
        if(ball1.b > ball1.w && ball2.w > ball2.b){
          
         ball1.c = color(255, 255, 255);
         ball2.c = color(255, 255, 255);

        }
        
        if(ball1.w > ball1.b && ball2.w > ball2.b){

         ball2.c = color(0, 0, 0);
         ball1.c = color(0, 0, 0);
         
        }
        if(ball1.b > ball1.w && ball2.b > ball2.w){
         ball1.c = color(0, 0, 0);
         ball1.c = color(0, 0, 0);
        }
        
        */
        
    r = round(random(2));
    
    if(r == 2){
       m = round((ball1.b + ball2.b)/2);
       ball2.b = m;
       ball1.b = m;
       
       m = round((ball1.w + ball2.w)/2);
       ball2.w = m;
       ball1.w = m;  
       
       m = round((ball1.grey + ball2.grey)/2);
       ball2.grey = m;
       ball1.grey = m;  
       
    }
  }
}


