int cols = 200;
int rows = 200;
int spec = 3;
int gen = 3000;
int s = 4;
int[][][] dataGrid = new int[cols][rows][spec];
int[][][] tempGrid = new int[cols][rows][spec];
int[] sums = new int[spec];
int[] avgs = new int[spec];

void setup(){
  size(cols*s*2, rows*s*2);
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k++){
      dataGrid[i][j][k] = int(random(100));
      tempGrid[i][j][k] = 0;
      }
    }
  }
}

void draw(){
  background(255);
  //calculate sum of each species
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k++){
          sums[k] += dataGrid[i][j][k];
      }
    }
  }
  
  //calculate average concentration of each species
  for(int k = 0; k < spec; k ++){
    avgs[k] = sums[k];
  }
  
  
  //update tempGrid based on diffusion rule
  
  for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      for(int k = 0; k < spec; k ++){
        tempGrid[i%cols][j%rows][k] = ((dataGrid[(i-1)%cols][j%rows][k] + dataGrid[(i+1)%cols][j%rows][k] + dataGrid[i%cols][(j+1)%rows][k] + dataGrid[i%cols][(j-1)%rows][k])/4);
      }
    }
  }
  
  //update based on generation rule
 /*
   for(int i = cols; i < 2*cols; i++){
    for(int j = rows; j < 2*rows; j++){
      for(int k = 0; k < spec; k ++){
        if(floor(random(gen)) == 1){
          tempGrid[i%cols][j%rows][k] += (50-avgs[k]);
        }
      }
    }
  }
  */
  //update dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      for(int k = 0; k < spec; k ++){
        dataGrid[i][j][k] = tempGrid[i][j][k];
      }
    }
  }
  
  /*
  //display datagrid for 2 species
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(dataGrid[i][j][1] > dataGrid[i][j][0]){
        fill(255, 255, 255);
      }
      if(dataGrid[i][j][0] > dataGrid[i][j][1]){
        fill(0, 0, 0);
      }

      if(abs(dataGrid[i][j][0] - dataGrid[i][j][1]) > 10000000){
        fill(128, 0, 240);
      }
      noStroke();
      rect(i*s, j*s, s, s);
      rect(i*s + cols*s, j*s, s, s);
      rect(i*s, j*s + rows*s, s, s);      
      rect(i*s + cols*s, j*s + rows*s, s, s);

    }
  }
  */
  
  
  //display dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(dataGrid[i][j][0] > dataGrid[i][j][1] && dataGrid[i][j][0] > dataGrid[i][j][2]){
        fill(130, 130, 255);
      }
      if(dataGrid[i][j][1] > dataGrid[i][j][2] && dataGrid[i][j][1] > dataGrid[i][j][0]){
        fill(0, 0, 255);
      }
      if(dataGrid[i][j][2] > dataGrid[i][j][1] && dataGrid[i][j][2] > dataGrid[i][j][0]){
        fill(0, 255, 255);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][1]) < 1){
        fill(150, 150, 150);
      }
      if(abs(dataGrid[i][j][2] - dataGrid[i][j][0]) < 1){
         fill(200, 200, 200);
      }
      if(abs(dataGrid[i][j][1] - dataGrid[i][j][0]) < 1 ){
        fill(50, 50, 50);
      }
      noStroke();
      rect(i*s, j*s, s, s);
      rect(i*s + cols*s, j*s, s, s);
      rect(i*s, j*s + rows*s, s, s);      
      rect(i*s + cols*s, j*s + rows*s, s, s);
    }
  }
  
}
