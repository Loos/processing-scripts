int cols = 300;
int rows = 300;
int spec = 3;
int chance = 0;
int s = 2;
float[][][] dataGrid = new float[cols][rows][spec];
float[][][] tempGrid = new float[cols][rows][spec];

void setup(){
  size(cols*s*2, rows*s*2);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k++){
      dataGrid[i][j][k] = int(random(255));
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
        tempGrid[i%cols][j%rows][k] = ((dataGrid[i%cols][j%rows][k] + dataGrid[(i-1)%cols][j%rows][k] + dataGrid[(i+1)%cols][j%rows][k] + dataGrid[i%cols][(j+1)%rows][k] + dataGrid[i%cols][(j-1)%rows][k])/5);
        
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
      if(dataGrid[i][j][0] > dataGrid[i][j][1] && dataGrid[i][j][0] > dataGrid[i][j][2]){
        fill(0, 0, 0);
      }
      if(dataGrid[i][j][1] > dataGrid[i][j][2] && dataGrid[i][j][1] > dataGrid[i][j][0]){
        fill(0, 0, 0);
      }
      if(dataGrid[i][j][2] > dataGrid[i][j][1] && dataGrid[i][j][2] > dataGrid[i][j][0]){
        fill(0, 0, 0);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][1]) < .5){
        fill(255, 255, 255);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][0]) < .5){
         fill(255, 255, 255);
      }
      if(abs(dataGrid[i][j][1] - dataGrid[i][j][0]) < .5 ){
        fill(255, 255, 255);
      }
      noStroke();
      rect(i*s, j*s, s, s);
      rect(i*s + cols*s, j*s, s, s);
      rect(i*s, j*s + rows*s, s, s);
      rect(i*s + cols*s, j*s + rows*s, s, s);
    }
  }
}

void keyPressed(){
  if (key == 'p') {
   saveFrame("Zeb-####.jpg");
 }
}
