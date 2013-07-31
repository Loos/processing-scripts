import gifAnimation.*;

GifMaker gifExport;
float f = 0;

void setup() {

  size(500,500);
  frameRate(20);
  smooth();
  noStroke();

  
  gifExport = new GifMaker(this, "delme.gif");
  gifExport.setRepeat(0);



}
 
void draw() {



    
  gifExport.setDelay(50);
  gifExport.addFrame();
  
  
  if(f==75){
    gifExport.finish();
  }
 
}
