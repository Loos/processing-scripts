//What i if the color content specified initial concentration for a brusselator?

int cols = 400;
int rows = 600;
int tall = 2;
int wide = 2;
int spec = 2;
int frame = 0;
float averageBrightness = 0;
float localBrightness = 0;
float[][][] dataGrid = new float[cols][rows][spec];
float[][][] tempGrid = new float[cols][rows][spec];
PImage img;
int loc;

void setup(){
  size(cols*tall, rows*wide);
  img = loadImage("data/fink400600.jpg");
  img.loadPixels();
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      loc = i + j*img.width;
      //averageBrightness += round(brightness(img.pixels[loc]));
      averageBrightness += red(img.pixels[loc]) + green(img.pixels[loc]) + blue(img.pixels[loc]);
    }
  }
  print(averageBrightness);
  averageBrightness = averageBrightness/(cols*rows);
  loc = 0;
  // initialize Grids
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      loc = i + j*img.width;
      localBrightness = (red(img.pixels[loc])) + (green(img.pixels[loc])) + (blue(img.pixels[loc]));
      if (localBrightness > averageBrightness){
        dataGrid[i][j][0] = 6;
        dataGrid[i][j][1] = 5;
      }
      else{
        dataGrid[i][j][0] = 4;
        dataGrid[i][j][1] = 5;
      }
      
      for(int k = 0; k < spec; k++){
      tempGrid[i][j][k] = 0;
      }
    }
  }
}

void draw(){
  background(255);
  float A = 4.5;
  float B = 8;
  float D = 8;
  //update tempGrid all but edges
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      float dX = dataGrid[(i)%cols][(j-1)%rows][0] + dataGrid[(i-1)%cols][(j)%rows][0] + dataGrid[(i+1)%cols][(j)%rows][0] + dataGrid[(i)%cols][(j+1)%rows][0] - 4*dataGrid[(i)%cols][(j)%rows][0];
      float dY = dataGrid[(i)%cols][(j-1)%rows][1] + dataGrid[(i-1)%cols][(j)%rows][1] + dataGrid[(i+1)%cols][(j)%rows][1] + dataGrid[(i)%cols][(j+1)%rows][1] - 4*dataGrid[(i)%cols][(j)%rows][1];
      float X = dataGrid[(i)%cols][(j)%rows][0];
      float Y = dataGrid[(i)%cols][(j)%rows][1];
      
      tempGrid[(i)%cols][(j)%rows][0] += .01*(A - (B + 1)*X + X*X*Y + dX);
      tempGrid[(i)%cols][(j)%rows][1] += .01*(B*X - X*X*Y + D*dY);
    }
  }  
  
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      dataGrid[(i)%cols][(j)%rows][0] = tempGrid[(i)%cols][(j)%rows][0];
      dataGrid[(i)%cols][(j)%rows][1] = tempGrid[(i)%cols][(j)%rows][1];
    }
  }
  
  //display dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(dataGrid[i][j][0] > dataGrid[i][j][1]){
        fill(0);
      }
      else{
        fill(255);
      }

      noStroke();
      rect(tall*i, wide*j, tall, wide);
    }
  }
  frame += 1;
  /*if(frame%5 == 1){
    saveFrame("kievett-####.jpg");
  }
  */
}

void keyPressed(){
 if (key == 'p') {
   saveFrame("wondergrid-####.jpg");
 }
}
