int cols = 200;
int rows = 200;
int spec = 3;
int chance = 0;
int s = 4;
int[][][] dataGrid = new int[cols][rows][spec];
int[][][] tempGrid = new int[cols][rows][spec];

void setup(){
  size(cols*s, rows*s);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k++){
        dataGrid[i][j][k] = 0;
        tempGrid[i][j][k] = 0;
        }
      }
    }
  
  dataGrid[100][100][0] = 1;
  dataGrid[100][101][0] = 1;
  dataGrid[100][99][0] = 1;
}


void draw(){
  background(255);
  //make sure dataGrid has no numbers > 1
  for(int i=1; i < cols; i++){
    for(int j = 1; j < rows; j++){
      for(int k = 0; k < spec; k++){
        if(dataGrid[i][j][k] > 1){
          dataGrid[i][j][k] = 1;
        }
      }
    }
  }
  
  //update tempGrid all but edges
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      for(int k = 0; k < spec; k++){
        tempGrid[i%cols][j%rows][k] = 
        dataGrid[(i-1)%cols][(j-1)%rows][k] + dataGrid[(i)%cols][(j-1)%rows][k] + dataGrid[(i+1)%cols][(j-1)%rows][k] +
        dataGrid[(i-1)%cols][(j)%rows][k] + dataGrid[(i)%cols][(j)%rows][k] + dataGrid[(i+1)%cols][(j)%rows][k] +
        dataGrid[(i-1)%cols][(j+1)%rows][k] + dataGrid[(i)%cols][(j+1)%rows][k] + dataGrid[(i+1)%cols][(j+1)%rows][k];
      }
    }
  }
  
  //update dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k ++){
        //rule 1
        if(dataGrid[i][j][k] == 0 && tempGrid[i][j][k] == 3){
          dataGrid[i][j][k] = 1;
        }
        //rule 2
        if(dataGrid[i][j][k] == 1 && tempGrid[i][j][k] == 1){
          dataGrid[i][j][k] = 0;
        }
        if(dataGrid[i][j][k] == 1 && tempGrid[i][j][k] == 2){
          dataGrid[i][j][k] = 0;
        }
        if(dataGrid[i][j][k] == 1 && tempGrid[i][j][k] == 5){
          dataGrid[i][j][k] = 0;
        }
        
      }
    }
  }
  
  //display dataGrid
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(mousePressed == true){
        if(mouseY > s*j && mouseY < s*j+s && mouseX > s*i && mouseX < s*i+s){
          int x = round(random(2));
          dataGrid[i][j][0] += 1;
        }
      }
      colorMode(RGB);
      if(dataGrid[i][j][0] == 1){
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
