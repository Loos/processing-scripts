import beads.*;
//import processing.video.*;

//MovieMaker mm;
AudioContext ac;

int cols = 199;
int rows = 199;
int s = 4;
int pitch = 0;
int speed = 200; //in ms / beat
float invSpeed = 1/speed;
int noteLength = 300; // in ms
int count = 2;

int l = 1280;
int h = 750;

int[][] dataGrid = new int[cols][rows];
int[][] tempGrid = new int[cols][rows];
int[][] fillGrid = new int[cols][rows];

void setup(){
  frameRate(5);
  size(l, h);
  
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      dataGrid[i][j] = 0;
      tempGrid[i][j] = 0;
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
                                          )%count;
            }
          }
          for(int i = 0; i < cols; i++){
            for(int j = 0; j < rows; j++){
               dataGrid[i][j] = tempGrid[i][j];
               if(dataGrid[i][j] == 1) pitch += 1;
            }
          }
          /*
          if(pitch%3 == 0){
            WavePlayer wp = new WavePlayer(ac, (pitch*.1) + 40, Buffer.SAW);
            Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, 1000, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
            
          }
          
          if(pitch%3 == 1){
            */
            WavePlayer wp = new WavePlayer(ac, (pitch*.05) + 80, Buffer.SINE);
            Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0, noteLength, new KillTrigger(g));
          g.addInput(wp);
          ac.out.addInput(g);
          pitch = 0;
          /*
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
  background(84, 105, 120);
  
  //display dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(dataGrid[i][j] == 1){
        fill(237, 135,46);
      }
      /*
      {
        fillGrid[i][j] += 128;
        colorMode(HSB);
        fill(fillGrid[i][j]%255, 255, 144);
      }
      */
      
      else fill(84, 105, 120);
      noStroke();
      rect((l - s*cols)*.5 + s*i, (h-s*rows)*.5 + s*j, s, s);
    }
  }
  //mm.addFrame();
  
}

/*
void keyPressed() {
  if (key == ' ') {
    mm.finish();  // Finish the movie if space bar is pressed!
  }
}
*/
