int cols = 50;
int rows = 50;
int spec = 2;
int s = 10;
float[][][] dataGrid = new float[cols][rows][spec];
float[][][] tempGrid = new float[cols][rows][spec];

void setup(){
  size(cols*s, rows*s);
  float A = 4.5;
  float B = 8;
  float D = 8;
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      dataGrid[i%cols][j%rows][0] = 5 + random(-2, 2);
      dataGrid[i%cols][j%rows][1] = 5;
      tempGrid[i%cols][j%rows][0] = 0;
      tempGrid[i%cols][j%rows][1] = 0;
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
      
      if(mousePressed == true){
        if(mouseY > s*j && mouseY < s*j+s && mouseX > s*i && mouseX < s*i+s){
          dataGrid[i][j][0] += 1;
        }
      }
      
      
      colorMode(RGB);
      if(dataGrid[i][j][0] > 5){
        fill(0);
      }
      else{
        fill(255);
      }
      /*
      if(dataGrid[i][j][0] > dataGrid[i][j][1] && dataGrid[i][j][0] > dataGrid[i][j][2]){
        fill(130, 130, 255);
      }
      if(dataGrid[i][j][1] > dataGrid[i][j][2] && dataGrid[i][j][1] > dataGrid[i][j][0]){
        fill(0, 0, 255);
      }
      if(dataGrid[i][j][2] > dataGrid[i][j][1] && dataGrid[i][j][2] > dataGrid[i][j][0]){
        fill(0, 255, 255);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][1]) < .5){
        fill(150, 150, 150);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][0]) < .5){
         fill(200, 200, 200);
      }
      if(abs(dataGrid[i][j][1] - dataGrid[i][j][0]) < .5 ){
        fill(50, 50, 50);
      }
      */
      
      noStroke();
      rect(i*s, j*s, s, s);  
      
    }
  }
}
