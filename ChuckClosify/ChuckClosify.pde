PImage img;
int loc;
int ran;

void setup(){
  smooth();
  size(2560, 1920);
  colorMode(RGB);
  img = loadImage("data/mom.JPG");
  img.loadPixels();
  float r = 0;
  float g = 0;
  float b = 0;
  for (int x = 0; x < img.width-10; x += 10){
    for(int y = 0; y < img.height; y += 10){
      loc = y*img.width+x;
      for (int j = 0; j<10; j+=1){
        for (int i = 0; i < 10; i+=1){
            r += red(img.pixels[loc]+j+img.width*i);
            g += green(img.pixels[loc]+j+img.width*i);
            b += blue(img.pixels[loc]+j+img.width*i);

            
        }
      }
      
      ran = int(random(3));
      
      if(ran==0){
        noStroke();
        ellipseMode(CORNER);
        fill(r/100, 255,255);
        ellipse(x, y, 10, 10);
        fill(255, g/100, 255);
        ellipse(x+2, y+2, 6, 6);
        fill(255, 255, b/100);
        ellipse(x+3, y+3, 4, 4);
      }
      
      if(ran==1){
        noStroke();
        ellipseMode(CORNER);
        fill(255, g/100,255);
        ellipse(x, y, 10, 10);
        fill(255, 255, b/100);
        ellipse(x+2, y+2, 6, 6);
        fill(r/100, 255, 255);
        ellipse(x+3, y+3, 4, 4);
      }
      
      if(ran==2){
        noStroke();
        ellipseMode(CORNER);
        fill(255, 255, b/100);
        ellipse(x, y, 10, 10);
        fill(r/100, 255, 255);
        ellipse(x+2, y+2, 6, 6);
        fill(255, g/100, 255);
        ellipse(x+3, y+3, 4, 4);
      }
        
      r=0;
      g=0;
      b=0;
    }
  }
  save("chuckclose-####.jpg");
}

