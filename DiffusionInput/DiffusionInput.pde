//What i if the color content specified initial concentration for a brusselator?

int cols = 400;
int rows = 600;
int tall = 1;
int wide = 1;
int spec = 2;
int frame = 0;
float averageBrightness = 0;
float localBrightness = 0;
int[][][] dataGrid = new int[cols][rows][spec];
int[][][] tempGrid = new int[cols][rows][spec];
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
      averageBrightness += round(red(img.pixels[loc])) + round(green(img.pixels[loc])) + round(blue(img.pixels[loc]));
    }
  }
  print(averageBrightness);
  averageBrightness = averageBrightness/(cols*rows);
  loc = 0;
  // initialize Grids
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      loc = i + j*img.width;
      localBrightness = round(red(img.pixels[loc])) + round(green(img.pixels[loc])) + round(blue(img.pixels[loc]));
      if (localBrightness > averageBrightness){
        dataGrid[i][j][0] = 100;
        dataGrid[i][j][1] = 0;
      }
      else{
        dataGrid[i][j][0] = 0;
        dataGrid[i][j][1] = 100;
      }
      
      for(int k = 0; k < spec; k++){
      tempGrid[i][j][k] = 0;
      }
    }
  }
}

void draw(){
  background(255);
  //update tempGrid all but edges
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      for(int k = 0; k < spec; k++){
        tempGrid[i%cols][j%rows][k] = ((dataGrid[(i-1)%cols][j%rows][k] + dataGrid[(i+1)%cols][j%rows][k] + dataGrid[i%cols][(j+1)%rows][k] + dataGrid[i%cols][(j-1)%rows][k])/4); 
      }
    }
  }
  
  //update dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k ++){
        dataGrid[i][j][k] = tempGrid[i][j][k];
      }
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
