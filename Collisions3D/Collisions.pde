import ddf.minim.*;
Minim minim;

int l = 10;
int num =4;
boolean mute = false;
ball[] ballz;

collision[][] collide;

//would be cool if this was 3d, with polyhedra rolling.

void setup(){
  noCursor();
  ortho();
  sphereDetail(20);
  size(900, 500, P3D);
  //size(displayWidth, displayHeight, P3D);
  colorMode(HSB);
  background(32, 255, 255);
  smooth();
  minim = new Minim(this);
  ballz = new ball[num];
  ballz[0] = new ball(.1, 1, 100, 100, 10, 30, 20,  0, 100, "220.mp3");
  ballz[1] = new ball(0, 3, 300, 100,  10, 30, 20, 32, 100, "367.mp3");
  ballz[2] = new ball(0, 5, 500, 100, 7, 3, 2,  64, 100, "513.mp3");
  ballz[3] = new ball(0, 7, 700, 100,  6, 6, 6, 96, 100, "660.mp3");
  
  /*ballz[4] = new ball(0, 2, 500, 100,  1, 6, 3, 128, 100, "220.mp3");
  ballz[5] = new ball(0, 1, 500, 300, 3, 4, 5,  160, 100, "367.mp3");
  ballz[6] = new ball(0, 1, 700, 100, 6, 2, 0,  192, 100, "513.mp3");
  ballz[7] = new ball(0, 2, 700, 300, 1, 4, 6,  224, 100, "660.mp3");*/
  /*
  ballz[0] = new ball(-5, 4, 600, 600,   0, 50, "220.mp3");
  ballz[1] = new ball(4, 4, 100, 100,    32, 50, "367.mp3");
  ballz[2] = new ball(-2, -4, 600, 100,  64, 50, "513.mp3");
  ballz[3] = new ball(3, -4, 100, 600,   96, 50, "660.mp3");
  ballz[4] = new ball(3, -4, 200, 200,   128, 50, "220.mp3");
  ballz[5] = new ball(-4, 3, 400, 400,   160, 50, "367.mp3");
  ballz[6] = new ball(4, 3, 200, 400,   192, 50, "513.mp3");
  ballz[7] = new ball(3, 4, 400, 200,   224, 50, "660.mp3");
*/
  collide = new collision[num][num];
  for (int i = 0; i < num; i ++){
    for (int j = 0; j < i; j ++){
      collide[i][j] = new collision(ballz[i], ballz[j]);
    }
  }
}

void draw(){
  background(0);
  for (int i = 0; i < num; i ++){
    ballz[i].display();
    ballz[i].update();
  }
  for (int i = 0; i < num; i ++){
    for (int j = 0; j < i; j ++){
      collide[i][j].update();
    }
  }
}

void stop()
{
  minim.stop(); 
  super.stop();
}

class ball{
  AudioSample tone;
  PVector p, v, a;
  float d, opac, c, xangle, yangle, zangle;
  PVector[] ps;

  ball(float x, float y, float xp, float yp, float xa, float ya, float za, float ct, float dt, String ttone)  {
    tone = minim.loadSample(ttone, 1024);
    colorMode(HSB);
    c = ct;
    v = new PVector(x, y);
    opac = 100;
    p =  new PVector(xp, yp);
    ps = new PVector[l];
    zangle = za;
    xangle = xa;
    yangle = ya;
    a = new PVector(0, 0);
    d = dt;
    ps[l-1] = new PVector(xp, yp);
    for (int i = 0; i < l-1; i ++){
      ps[i] = new PVector(-100, -100);

    }
  }

  void display(){
    ellipseMode(CENTER);
    noStroke();
    fill(c, 255, 255);
    stroke(255);
    pushMatrix();
    translate(ps[l-1].x, ps[l-1].y, 0);
    rotateY(radians(yangle*frameCount));
    rotateX(radians(xangle*frameCount));
    rotateZ(radians(zangle*frameCount));
    sphere(d/2);
    popMatrix();
    
  }
  

  void update(){
    p.x = p.x+v.x;
    p.y = p.y+v.y;
    if(p.y > height-d/2){
      v.y=-v.y;
      p.y = height-d/2;
      if(mute == false){
        tone.trigger();
      }
    }
    if(p.y < d/2){
      v.y = -v.y;
      p.y = d/2;
      if(mute == false){
        tone.trigger();
      }
    }
    if(p.x > width-d/2){
      v.x = -v.x;
      p.x = width-d/2;
      if(mute == false){
        tone.trigger();
      }
    }
    if (p.x < d/2){
      v.x = -v.x;
      p.x = d/2;
      if(mute == false){
      tone.trigger();
      }
    }
    for(int i = 0; i < l-1; i ++){
      ps[i].x = ps[i+1].x;
      ps[i].y = ps[i+1].y;
    }
    ps[l-1].x = p.x;
    ps[l-1].y = p.y;

  }
  PVector pos(){
    return p;
  }
  PVector vel(){
    return v;
  }
  float d(){
    return d;
  }
  void stop()
{
  tone.close();
}
}


class collision{
  ball ball1;
  ball ball2;

  collision (ball b1, ball b2) {
    ball1 = b1;
    ball2 = b2;
  }

  void update(){
      if(PVector.dist(ball1.pos(), ball2.pos()) < (ball1.d()+ball2.d())/2){
        PVector n = PVector.sub(ball1.pos(), ball2.pos());
        n.normalize();
        PVector u = PVector.sub(ball1.vel(), ball2.vel());
        PVector un = componentVector(u,n);
        u.sub(un);
        ball1.v = PVector.add(u, ball2.vel());
        ball2.v = PVector.add(un, ball2.vel());
        if(mute == false){
        ball1.tone.trigger();
        ball2.tone.trigger();
        }
        /*
//makes balls speed up if the same color ball colides
        if (abs(ball1.c - ball2.c) < 15){
          ball1.v.x *= 1.05;
          ball2.v.x *= 1.05;
          ball1.v.y *= 1.05;
          ball2.v.y *= 1.05;
          background(255);
        }
        ball1.c = random(255);
        ball2.c = random(255);
        */
    }
  
}

PVector componentVector (PVector vector, PVector directionVector) {
    //--! ARGUMENTS: vector, directionVector (2D vectors)
    //--! RETURNS: the component vector of vector in the direction directionVector
    //-- normalize directionVector
    directionVector.normalize();
    directionVector.mult(vector.dot(directionVector));
    return directionVector;
  }
}

