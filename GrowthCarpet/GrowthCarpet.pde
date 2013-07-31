int XCOUNT = 24;
int YCOUNT = 14;

final int XSIZE = 1200;
final int YSIZE = 700;

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
  PVector p;
  float r, i;
  boolean grow;
  float m;
  
  ball(float x, float y){
    noStroke();
    grow = true;
    r = 1;
    p = new PVector(x, y);
    colorMode(HSB);
  }
  
  void update(){
    fill(m%255, 255, 255);
    ellipse(p.x, p.y, 2*r, 2*r);
    if(grow == true){
      r += 1;
    }
    else{
      r -= 2;
    }

    if(r <= 0){
      grow = true;
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
  
  collision(ball b1, ball b2){
    ball1 = b1;
    ball2 = b2;
  }
  
  void update(){
    x = round(random(1));
    if(PVector.dist(ball1.pos(), ball2.pos()) < ball1.rad() + ball2.rad()){
      ball1.m += 1;
      ball2.m += 1;
      if(x == 0){
        ball1.grow = false;
      }
      else{
        ball2.grow = false;
      }
    }
  }
}

