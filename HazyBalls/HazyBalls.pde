int COUNT = 3;


final int XSIZE = 1280;
final int YSIZE = 800;

int b1;
int b2;
int f;

ball[] handles;

void setup(){
  colorMode(HSB);
  background(random(255), 200, 255);
  ellipseMode(CENTER);
  smooth();
  size(XSIZE, YSIZE);
  noCursor();
  
  handles = new ball[COUNT];
  
  for( int x = 0; x < COUNT; ++x ) {
      handles[x] = new ball(random(width-50)+25, random(height-50)+25, random(-100, 100)/50., random(-100, 100)/50.);
    }
  }


void draw(){
  f += 1;

  for( int x = 0; x < COUNT; ++x ) {
      handles[x].update();
  }
  colorMode(HSB);
    

  strokeWeight(50);
  noFill();

  for(int i = 0; i < COUNT; i ++){
    for(int j = 0; j < i; j ++){
        
        //really should be an arc!  Having arcs bounce around the screen would be great.
        stroke(((.1*f) + 50*i + 50*j)%255, 255, 255, 10);
        line(handles[i].p.x, handles[i].p.y, handles[j].p.x, handles[j].p.y);


        
    }
  }

}


class ball{
  PVector p, v;
  float rad;

  
  ball(float x, 
       float y, 
       float xv, 
       float yv 
                ){
         
    colorMode(HSB);
    noStroke();
    rad = 50;
    
    p = new PVector(x, y);
    v = new PVector(xv, yv);


  }
  
  void update(){

    noStroke();
    //update size, position

    p.x += v.x;
    p.y += v.y;

    
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

  }
  
}
