ball ball1;
ball ball2;
ball ball3;
ball ball4;

//collision collide12;
//collision collide23;
//collision collide13;
//collision collide14;
//collision collide24;
//collision collide34;

void setup(){
  
  size(576, 580);
  colorMode(HSB);
  background(0);
  ball1 = new ball(10, 2, 100, 100, 26, 50, "bohlenpierce/220.mp3");
  ball2 = new ball(2, -10, 300, 100, 155, 50, "bohlenpierce/367.mp3");
  ball3 = new ball(6, -8, 100, 300, 200, 50, "bohlenpierce/513.mp3");
  ball4 = new ball(4, 8, 300, 300, 255, 50, "bohlenpierce/660.mp3");
  //collide12 = new collision(ball1, ball2);
  //collide13 = new collision(ball1, ball3);
  //collide23 = new collision(ball2, ball3);
  //collide14 = new collision(ball1, ball4);
  //collide24 = new collision(ball2, ball4);
  //collide34 = new collision(ball3, ball4);
}

void draw(){
 
  ball1.display();
  ball1.update();
  ball2.display();
  ball2.update();
  ball3.display();
  ball3.update();
  ball4.display();
  ball4.update();
  //collide12.update();
  //collide23.update();
  //collide13.update();
  //collide14.update();
  //collide24.update();
  //collide34.update();

}


class ball{
  PVector p, v;
  int d, opac, c;
  PImage img;
  float h, s, b;

  ball(int x, int y, int xp, int yp, int ct, int dt, String ttone)  {
    colorMode(HSB);
    img = loadImage("data/claire1.jpg");
    h = 0;
    c = ct;
    v = new PVector(x, y);
    opac = 100;
    p =  new PVector(xp, yp);
    d = dt;
  }

  void display(){
    colorMode(HSB);
    loadPixels();
    img.loadPixels();
    h = hue(img.pixels[round(p.y*img.width+p.x)]);
    s = saturation(img.pixels[round(p.y*img.width+p.x)]);
    b = brightness(img.pixels[round(p.y*img.width+p.x)]);
    ellipseMode(CENTER);
    colorMode(HSB);
    fill(h, s, b);
    stroke(h, s, b);
    ellipse(p.x, p.y, d, d);
  }

  void update(){
    p.x = p.x+v.x;
    p.y = p.y+v.y;
    if(p.y > height-d/2){
      v.y=-v.y;
      p.y = height-d/2;
    }
    if(p.y < d/2){
      v.y = -v.y;
      p.y = d/2;
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

