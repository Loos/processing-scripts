int ballcount = 2;
ball[] balls;

void setup(){
  
  size(700, 700);
  colorMode(HSB);
  background(0);
  smooth();
  balls = new ball[ballcount];

  
  for(int i = 0; i < ballcount; ++i){
    balls[i] = new ball(round(random(-5, 5)), round(random(-5, 5)), 50*i, 50*i, round(random(255)), 20);
    for(int j = 1; j < ballcount; j++){
    }
  }
}

void draw(){
  for(int i = 0; i < ballcount; i ++){
    balls[i].display();
    balls[i].update();
    for(int j = 1; j < ballcount; j++){
    }
  }

}



class ball{

  PVector p, v, vchange;
  int d, opac, c, change, sizechange;

  ball(int x, int y, int xp, int yp, int ct, int dt)  {
    
    colorMode(HSB);
    c = ct;
    v = new PVector(x, y);

    opac = 100;
    p =  new PVector(xp, yp);
    d = dt;
  }

  void display(){
    ellipseMode(CENTER);
    fill((c+ change)%255, 255, 255);
    noStroke();
    ellipse(p.x, p.y, d, d);
  }

  void update(){
    if(v.x > 7){
      v.x = 7;
    }
    if(v.x < -7){
      v.x = -7;
    }
    if(v.y > 7){
      v.y = 7;
    }
    if(v.y < -7){
      v.y = -7;
    }
    
    
    d += random(-10, 10);
    /*
    if(d < 3){
      d = 3;
    }
    */
    vchange = new PVector(random(-1, 1), random(-1, 1));
    /* change += 1; */
    change += random(-2, 5);
    v.add(vchange);
    p.x = p.x+v.x;
    p.y = p.y+v.y;
    if(p.y > height){
      p.y = 0;
     
    }
    if(p.y < 0){
      p.y = height;
      
    }
    if(p.x > width-d/2){
      v.x = -v.x;
      p.x = width-d/2;
    
    }
    if (p.x < d/2){
      v.x = -v.x;
      p.x = d/2;
   
    }

  }
  PVector pos(){
    return p;
  }
  PVector vel(){
    return v;
  }
  int d(){
    return d;
  }
  void stop()
{
 
}
}


