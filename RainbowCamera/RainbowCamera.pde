import processing.video.*;

Capture video;
float h;
float count;
int loc;
float radius;
int cols = 256;
int rows = 160;
int big = 2;
float[][] dataGrid = new float[cols][rows];
float[][] tempGrid = new float[cols][rows];

void setup() {
  count = 0;
  size(cols*big, rows*big);
  video = new Capture(this,cols, rows, 5);
  background(255);
  h = 0;
  radius = 0;
}

void draw() {
  count += 10;
  video.read();
  video.loadPixels();
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      loc = i + j*video.width;
      dataGrid[i][j] = round(hue(video.pixels[loc]));
      tempGrid[i][j] = 0;  
    }
  }
  
  for(int l = 0; l < 40; l++){
    for(int i = cols; i < 2*cols; i++){
      for(int j = rows; j < 2*rows; j++){
          tempGrid[i%cols][j%rows] = ((dataGrid[(i-1)%cols][j%rows] + dataGrid[(i+1)%cols][j%rows] + dataGrid[i%cols][(j+1)%rows] + dataGrid[i%cols][(j-1)%rows])/4); 
        }
      }
    
    for(int i = 0; i < cols; i++){
      for(int j = 0; j < rows; j++){
          dataGrid[i][j] = tempGrid[i][j];
        
      }
    }  
  }
  for(int i = 0; i < cols; i++){
     for(int j = 0; j < rows; j++){
      colorMode(HSB);
      radius = sqrt(pow((i-cols/2), 2)+pow((j-rows/2),2));
      fill(128*sin(radians((dataGrid[i][j]+radius)*sin(radians(count/50))*10))+128, 255, 255);
      noStroke();
      rect(big*i, big*j, big, big);
     }
   }
  
}


