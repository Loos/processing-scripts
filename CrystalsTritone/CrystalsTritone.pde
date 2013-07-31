import beads.*;
//import processing.video.*;

//MovieMaker mm;
AudioContext ac;

int l = 1280;
int h = 750;

int cols = 199;
int rows = 199;
int k = 0;
int s = 3;
int pitch = 0;
int pitch2 = 0;
int pitch3 = 0;
int speed = 100;
int noteLength = 50;
int count = 3;
int[][] dataGrid = new int[cols][rows];
int[][] tempGrid = new int[cols][rows];

int[][] dataGrid2 = new int[cols][rows];
int[][] tempGrid2 = new int[cols][rows];

int[][] dataGrid3 = new int[cols][rows];
int[][] tempGrid3 = new int[cols][rows];

int[][] fillGrid = new int[cols][rows];

void setup(){
  frameRate(10);
  size(l, h);
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      dataGrid[i][j] = 0;
      tempGrid[i][j] = 0;
      dataGrid2[i][j] = 0;
      tempGrid2[i][j] = 0;
      dataGrid3[i][j] = 0;
      tempGrid3[i][j] = 0;
      fillGrid[i][j] = 0;
    }
  }
  /*
  for(int i = 0; i < cols; i++){
    dataGrid[100][i] = 1;
  }
  
  for(int i = 0; i < cols; i++){
    dataGrid[i][100] = 1;
  }
  */
  
  dataGrid[100][100] = 1;
  dataGrid2[100][100] = 1;
  dataGrid3[100][100] = 1;

  //mm = new MovieMaker(this, width, height, "Life3Slow2.mov", 5, MovieMaker.H263, MovieMaker.HIGH);

  ac = new AudioContext();
  
 Clock clock = new Clock(ac, speed);
 clock.addMessageListener(
  //this is the on-the-fly bead
  new Bead() {
    //this is the method that we override to make the Bead do something
     public void messageReceived(Bead message) {
        Clock c = (Clock)message;
        if(c.isBeat()) {
           for(int i = cols; i < 2*cols; i++){
            for(int j = rows; j < 2*rows; j++){
              tempGrid[i%cols][j%rows] = (dataGrid[(i-1)%cols][j%rows] + dataGrid[(i+1)%cols][(j)%rows] + dataGrid[i%cols][(j+1)%rows] + dataGrid[i%cols][(j-1)%rows] //+ dataGrid[i%cols][(j)%rows]
                                          + dataGrid[(i+1)%cols][(j+1)%rows] + dataGrid[(i-1)%cols][(j-1)%rows] //+ dataGrid[(i+1)%cols][(j-1)%rows] + dataGrid[(i-1)%cols][(j+1)%rows]
                                          //dataGrid[(i-2)%cols][(j)%rows] + dataGrid[(i+2)%cols][(j)%rows] + dataGrid[(i+3)%cols][(j)%rows] + dataGrid[(i-3)%cols][(j)%rows]
                                          )%4;
              tempGrid2[i%cols][j%rows] = (dataGrid2[(i-1)%cols][j%rows] + dataGrid2[(i+1)%cols][(j)%rows] + dataGrid2[i%cols][(j+1)%rows] + dataGrid2[i%cols][(j-1)%rows] //+ dataGrid2[i%cols][(j)%rows]
                                          //+ dataGrid2[(i+1)%cols][(j+1)%rows] + dataGrid2[(i-1)%cols][(j-1)%rows] //+ dataGrid2[(i+1)%cols][(j-1)%rows] + dataGrid2[(i-1)%cols][(j+1)%rows]
                                          //dataGrid2[(i-2)%cols][(j)%rows] + dataGrid2[(i+2)%cols][(j)%rows] + dataGrid2[(i+3)%cols][(j)%rows] + dataGrid2[(i-3)%cols][(j)%rows]
                                          )%4;
              tempGrid3[i%cols][j%rows] = (dataGrid3[(i-1)%cols][j%rows] + dataGrid3[(i+1)%cols][(j)%rows] + dataGrid3[i%cols][(j+1)%rows] + dataGrid3[i%cols][(j-1)%rows] //+ dataGrid2[i%cols][(j)%rows]
                                          + dataGrid3[(i+2)%cols][(j+1)%rows] + dataGrid3[(i-2)%cols][(j-1)%rows] //+ dataGrid2[(i+1)%cols][(j-1)%rows] + dataGrid2[(i-1)%cols][(j+1)%rows]
                                          //dataGrid2[(i-2)%cols][(j)%rows] + dataGrid2[(i+2)%cols][(j)%rows] + dataGrid2[(i+3)%cols][(j)%rows] + dataGrid2[(i-3)%cols][(j)%rows]
                                          )%4;
            }
          }
          for(int i = 0; i < cols; i++){
            for(int j = 0; j < rows; j++){
               dataGrid[i][j] = tempGrid[i][j];
               if(dataGrid[i][j] == 1) pitch += 1;
               
               dataGrid2[i][j] = tempGrid2[i][j];
               if(dataGrid2[i][j] == 1) pitch2 += 1;
               
               dataGrid3[i][j] = tempGrid3[i][j];
               if(dataGrid3[i][j] == 1) pitch3 += 1;
            }
          }
          
          WavePlayer wp = new WavePlayer(ac, (pitch*.1) + 400, Buffer.SINE);
          Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, noteLength, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
          
          WavePlayer wp2 = new WavePlayer(ac, 1000-((pitch2*.1) + 40), Buffer.SAW);
          Gain g2 = new Gain(ac, 1, new Envelope(ac, 0.05));
          ((Envelope)g2.getGainEnvelope()).addSegment(0, noteLength, new KillTrigger(g2));
          g2.addInput(wp2);
          ac.out.addInput(g2);
          pitch2 = 0;
          
          WavePlayer wp3 = new WavePlayer(ac, 1000-((pitch3*.1) + 160), Buffer.SQUARE);
          Gain g3 = new Gain(ac, 1, new Envelope(ac, 0.05));
          ((Envelope)g3.getGainEnvelope()).addSegment(0, noteLength, new KillTrigger(g3));
          g3.addInput(wp3);
          ac.out.addInput(g3);
          pitch3 = 0;
          
          
       /*
          if(pitch%3 == 0){
            WavePlayer wp = new WavePlayer(ac, (pitch*.1) + 40, Buffer.SINE);
            Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
            
          }
          
          if(pitch%3 == 1){
            WavePlayer wp = new WavePlayer(ac, (pitch*.05) + 40, Buffer.SAW);
            Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
          }
          
          
          if(pitch%3 == 2){
            WavePlayer wp = new WavePlayer(ac, (pitch*.05) + 40, Buffer.SQUARE);
            Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
          }
          */
          
          
         
       }
     }
   }
 );
 ac.out.addDependent(clock);
 ac.start();
}
  

void draw(){
  background(0);
  
  //display dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(k == 0){
        fill(dataGrid[i][j]*255, dataGrid2[i][j]*255, dataGrid3[i][j]*255);
        noStroke();
         rect((l - s*cols)*.5 + s*i, (h-s*rows)*.5 + s*j, s, s);
      }
      else if(k == 1){
         fill(dataGrid2[i][j]*255, dataGrid3[i][j]*255, dataGrid[i][j]*255);
         noStroke();
         rect((l - s*cols)*.5 + s*i, (h-s*rows)*.5 + s*j, s, s);
    }
  }
  //mm.addFrame();
  
}
}
