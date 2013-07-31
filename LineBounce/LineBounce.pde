int COUNT = 2;


final int XSIZE = 1280;
final int YSIZE = 800;

int b1;
int b2;
int f;


ball[] ballGrid;
ball[] handles;

void setup(){
  colorMode(HSB);
  background(random(255), 200, 255);
  smooth();
  size(XSIZE, YSIZE);
  noCursor();


  
  ballGrid = new ball[COUNT];
  handles = new ball[COUNT];
  
  for( int x = 0; x < COUNT; ++x ) {
      ballGrid[x] = new ball(random(width), random(height), random(100)/50., random(100)/50.);
      handles[x] = new ball(random(width), random(height), random(100)/50., random(100)/50.);
    }
  }


void draw(){
  f += 1;
  

  for( int x = 0; x < COUNT; ++x ) {
      ballGrid[x].update();
      handles[x].update();
  }
  colorMode(HSB);
    
  stroke((.01*f)%255, sin(radians(.3*f))*100 + 150, sin(radians(1.2*.3*f))*50+200);
  strokeWeight(50);
  noFill();

  for(int i = 0; i < COUNT; i ++){
    for(int j = 0; j < i; j ++){
        //curve(handles[i].p.x, handles[i].p.y, ballGrid[i].p.x, ballGrid[i].p.y, ballGrid[j].p.x, ballGrid[j].p.y, handles[j].p.x, handles[j].p.y);
        //really should be an arc!  Having arcs bounce around the screen would be great.
        line(handles[i].p.x, handles[i].p.y, handles[j].p.x, handles[j].p.y);
    }
  }
}



class ball{
  PVector p, v, a;
  float rad, col, gRate;

  
  ball(float x, 
       float y, 
       float xv, 
       float yv ){
         
    colorMode(HSB);
    noStroke();
    rad = 3;
    col = 255;
    gRate = 0;
    
    p = new PVector(x, y);
    v = new PVector(xv, yv);
    a = new PVector(0, 0);

  }
  
  void update(){

    noStroke();
    //update size, position
    rad += gRate;
    p.x += v.x;
    p.y += v.y;
    v.x += a.x;
    v.y += a.y;
    
    //edge detection
    if(p.x>=XSIZE-rad){
      v.x *= -1;
      p.x = XSIZE-rad;
    }
    if(p.x<=rad){
      v.x *= -1;
      p.x = rad;
    }
    if(p.y>=YSIZE-rad){
      v.y *= -1;
      p.y = YSIZE-rad;
    }
    if(p.y<=rad){
      v.y *= -1;
      p.y = rad;
    }
    //draw circle
    fill(255);
    //ellipse(p.x, p.y, 2*rad, 2*rad);
    

  }
  
  PVector pos(){
    return p;
  }
  PVector vel(){
    return v;
  }
  float gRate(){
    return gRate;
  }
  float rad(){
    return rad;
  }
  float col(){
    return col;
  }
  
}
