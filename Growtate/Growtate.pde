int XCOUNT = 24;
int YCOUNT = 12;
int f = 0;

final int XSIZE = 50*XCOUNT;
final int YSIZE = 50*YCOUNT;

ball[][] ballGrid;
collision[][] collideGridUp;
collision[][] collideGridLeft;


void setup(){

  smooth();
  size(XSIZE, YSIZE);
  background(255);
  ballGrid = new ball[XCOUNT][YCOUNT];
  collideGridUp = new collision[XCOUNT][YCOUNT-1];
  collideGridLeft = new collision[XCOUNT-1][YCOUNT];
  for( int x = 0; x < XCOUNT; ++x ) {
    for( int y = 0; y < YCOUNT; ++y) {
      ballGrid[x][y] = new ball( (x+1)*XSIZE/(XCOUNT + 1), (y + 1) * YSIZE / (YCOUNT + 1));
    }
  }
  for( int x = 0; x < XCOUNT; ++x ) {
    for( int y = 0; y < YCOUNT-1; ++y) {
      collideGridUp[x][y] = new collision(ballGrid[x][y], ballGrid[x][y+1]);
    }
  }
  for( int x = 0; x < XCOUNT-1; ++x ) {
    for( int y = 0; y < YCOUNT; ++y) {
      collideGridLeft[x][y] = new collision(ballGrid[x][y], ballGrid[x+1][y]);
    }
  }
}

void draw(){
  f += 1;
  background(sin(radians(f/10.))*128 + 125);
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


class ball{
  PVector p, mouse;
  float r, i;
  boolean grow;
  float m;
  float h;
  
  ball(float x, float y){
    noStroke();
    grow = true;
    r = 1;
    p = new PVector(x, y);
    colorMode(HSB);
    mouse = new PVector(mouseX, mouseY);
  }
  

  void update(){
    
    if( radians(m)%(TWO_PI) < (radians(m)+PI)%(TWO_PI)){
      fill(sin(radians(f/10.))*128 + 125);
      ellipse(p.x, p.y, 2*r, 2*r);
      fill(h%255, 120, 120);
      arc(p.x, p.y, 2*r, 2*r, radians(m)%(TWO_PI), (radians(m)+PI)%(TWO_PI));
    }
    else{
      fill(h%255, 120, 120);
      ellipse(p.x, p.y, 2*r, 2*r);
      fill(0);
      arc(p.x, p.y, 2*r+1, 2*r+1, (radians(m)+PI)%(TWO_PI), radians(m)%(TWO_PI));
    }
    mouse.x = mouseX;
    mouse.y = mouseY;
    r += 1;
    if(mousePressed == true){
      if(p.dist(mouse) < XSIZE/XCOUNT){
        h += 1;
        m += 5;
      }
    }
  }
  
  PVector pos(){
    return p;
  }
  float rad(){
    return r;
  }
}

class collision{
  ball ball1;
  ball ball2;
  int x;
  int y;
  int hv;
  int hvc;
  int cv;
  int cvc;
  boolean chaos;
  
  collision(ball b1, ball b2){
    ball1 = b1;
    ball2 = b2;
    hv = 1;
    cv = 1;
    chaos = true;
    hvc = 1;
    cvc = 1;
  }
  
  void update(){
    x = round(random(1));
    if(chaos == false){
      y = round(random(100000));
      if(y == 1){
          hv+=hvc*30;
          hvc = hvc*(-1);
        }
      if(y == 2){
        cv +=cvc*30;
        cvc = cvc*(-1);
      }
    }
        
    if(PVector.dist(ball1.pos(), ball2.pos()) < ball1.rad() + ball2.rad()){
      if(x == 0){
        ball1.r = 0;
      }
      else{
        ball2.r = 0;
      }
      
      //ball1.m += cv;
      //ball2.m += cv;
      
      
      ball1.h += hv;
      ball2.h += hv;
      
      
      if(ball1.m > ball2.m){
        ball2.m = ball1.m;
      }
      if(ball2.m > ball1.m){
        ball1.m = ball2.m;
      }
      
      
      if(ball1.h > ball2.h){
        ball2.h = ball1.h;
      }
      if(ball2.h > ball1.h){
        ball1.h = ball2.h;
      }
      
      
      
    }
  }
}


