import beads.*;
//import processing.video.*;

//MovieMaker mm;
AudioContext ac;


int l = 1280;
int h = 750;

int cols = 199;
int rows = 199;
int s = 4;
int lastPitch = 0;
int pitch = 0;
int speed = 200; //in ms / beat
int count = 2;
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
  
  for(int i = 0; i < cols; i++){
    dataGrid[100][i] = 1;
    dataGrid[i][100] = 1;
  }

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
           Envelope freqEnv = new Envelope(ac, lastPitch*.05 + 80);
           for(int i = cols; i < 2*cols; i++){
            for(int j = rows; j < 2*rows; j++){
              tempGrid[i%cols][j%rows] = (dataGrid[(i-1)%cols][j%rows] + dataGrid[(i+1)%cols][(j)%rows] + dataGrid[i%cols][(j+1)%rows] + dataGrid[i%cols][(j-1)%rows] //+ dataGrid[i%cols][(j)%rows]
                                          //+ dataGrid[(i+1)%cols][(j+1)%rows] + dataGrid[(i-1)%cols][(j-1)%rows] //+ dataGrid[(i+1)%cols][(j-1)%rows] + dataGrid[(i-1)%cols][(j+1)%rows]
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

          freqEnv.addSegment(pitch*.05 + 80, speed, .5);
          WavePlayer wp = new WavePlayer(ac, freqEnv, new SineBuffer().getDefault());
          Gain g = new Gain(ac, 1, new Envelope(ac, 0.1));
          ((Envelope)g.getGainEnvelope()).addSegment(0.05, 1000, new KillTrigger(g));
          
          g.addInput(wp);
          ac.out.addInput(g);
          
          lastPitch = pitch;
          pitch = 0;
          
         
       }
     }
   }
 );
 ac.out.addDependent(clock);
 ac.start();
}
  

void draw(){
  background(189, 212, 230);
  
  //display dataGrid
  for(int i = 0; i < cols; i++){
    for(int j = 0; j < rows; j++){
      if(dataGrid[i][j] == 1){
        fill(54, 69,79);
      }
      
      else fill(189, 212, 230);
      noStroke();
      rect((l - s*cols)*.5 + s*i, (h-s*rows)*.5 + s*j, s, s);
    }
  }
 
}

