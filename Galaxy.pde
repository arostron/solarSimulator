public class Galaxy {
  
  private int numStars;

  //constructor method
  public Galaxy(int NUMSTARS){
    numStars = NUMSTARS; 
    
  }
 
    
  void testSystemDraw(){
    fill(237,237,819);
    ellipse(width/2,height/2,6,6);
  }
  
  //renders random stars to fill the black void
  void drawRandGalaxy(){
    background(0); 
    fill(255);
    for(int i = 0; i < numStars; i ++){
          
      ellipse(random(0,width),random(0,height),2,2);
    }
  }//end draw rand galaxy 
  
  //pretty galaxy.....
  void drawNoiseGalaxy(){
    background(0); 
    stroke(1); 
    int pad = 100; // increasing spreads the galaxy out past screen (100)
  
    for(int i = 0; i < numStars*2; i += 2){
      int x = (int) map(noise(noisekey + i),0,1,0-pad,width+pad); //star x
      int y = (int) map(noise(noisekey + i+1),0,1,0-pad,height+pad); //star y
      fill(map(noise(x,y),0,1,0,255));
      ellipse(x,y,2,2);
    }
  
  }
  
  int systemR = 1;
  //you made systems the planets, originally stars were the background 
  void drawNoiseSystems(int numSystems){
    int pad = 0; // increasing spreads the galaxy out past screen
    for(int i = 0; i < numSystems*2; i += 2){
      int x = (int) map(noise(noisekey + i),0,1,0-pad,width+pad);
      int y = (int) map(noise(noisekey + i+1),0,1,0-pad,height+pad);
      //fill(237,237,819);
      fill(255,0,255); 
      ellipse(x,y,systemR,systemR);
    }
  
  }//end noise galaxy 
  
  void printAvgTimeGalaxy(){
    long tots = 0;
    for(int i = 0; i < 50; i ++){
      tots += timedrawNoiseGalaxy();
    }
    println("average time to draw the galaxy: "+tots/50+"ms"); 
  }
  
  long timedrawNoiseGalaxy(){
    long timer = millis(); 
    drawNoiseGalaxy();
    timer = millis() - timer;
    return timer; 
  }
  
}//end Galaxy class