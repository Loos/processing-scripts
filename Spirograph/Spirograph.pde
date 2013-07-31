int p = 1;
int c = 1;
int x = 0;
int y = 0;
int phase = 1;
int radius = 0;
int camx = 0;
int camy = 0;
int camz = 0;

void setup() {
 size(700, 700, P3D);
 colorMode(HSB);


}

void draw() {
 background(0);
 rotateX(radians(-x));
 rotateY(radians(y));
 if(phase==1){
   for(int r=0; r<radius; r++){
       stroke(sin(radians(r))*124+124, 255, 255);
       line( 100*sin(radians(r*p))*cos(radians(c*r)),
             100*cos(radians(r*p))*cos(radians(c*r)),
             100*cos(radians(c*r)),
             100*sin(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*cos(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*sin(radians(c*(r+1)))
             );
   }
 }
 
 else if(phase==2){
   for(int r=0; r<radius; r++){
       stroke(sin(radians(r))*124+124, 255, 255);
       line( 100*sin(radians(p*r))*cos(radians(c*(r))),
             100*cos(radians(p*r))*cos(radians(c*(r))),
             100*sin(radians(p*r)),
             100*sin(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*cos(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*sin(radians(p*(r))))
             ;
   }}
   
 else if(phase==3){
   for(int r=0; r<radius; r++){
       stroke(sin(radians(r))*124+124, 255, 255);
       line( 100*sin(radians(p*r))*cos(radians(c*(r))),
             100*cos(radians(p*r))*cos(radians(c*(r))),
             100*cos(radians(p*r))*cos(radians(c*(r))),
             100*sin(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*cos(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*sin(radians(p*r))*sin(radians(c*(r))))
             ;
   }}
    if(phase==4){
   for(int r=0; r<radius; r++){
       stroke(sin(radians(r))*124+124, 255, 255);
       line( 100*sin(radians(r*p))*cos(radians(c*r)),
             100*cos(radians(r*p))*cos(radians(c*r)),
             100*sin(radians((r+1)*p))*cos(radians((c+1)*r)),
             100*sin(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*cos(radians(p*(1+r)))*cos(radians(c*(r+1))),
             100*sin(radians((p+1)*(1+r)))*cos(radians((c+1)*(r+1)))
             );
   }
 }
 
 if (mousePressed == true) {
   x += pmouseX-mouseX;
   y += pmouseY-mouseY;
 }
 radius += 1;
 stroke(sin(radians(radius))*124+124, 255, 255);
 

 
 camera(0, 0, 300,
        0, 0, 0,
        1, 0, 0);

 fill(255);
 textMode(SCREEN);
 text(c, width-90, height);
 text(p, width-60, height);
 text(phase, width-30, height);

}



void keyPressed() {
 if (key == 's') {
   c ++;
 }
 if (key == 'a') {
   c --;
 }
 if (key == 'q') {
   if(phase==4){
     phase = 1;
   }
   else{
     phase ++;
   }
 }
 if (key == 'z') {
   p --;
 }
 if (key == 'x') {
   p ++;
 }
 if (key == 'd') {
   radius = 0;
   background(0);
 }
 if (key == 'p') {
   saveFrame("Spiral-####.jpg");
 }

}
