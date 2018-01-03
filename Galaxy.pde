public class Galaxy {
  //instance variables
  private int numStars;
  ArrayList<Star> galaxy = new ArrayList<Star>();

  //constructor method
  public Galaxy(int NUMSTARS){
    numStars = NUMSTARS; 
    
  }

  //adds numStars worth of stars to galaxy star list 
  void generateGalaxy(){
    background(0); 
    for(int i = 0; i < numStars*2; i += 2){
      galaxy.add(new Star(i));
    }
  }
   
  void printAvgTimeGalaxy(){
    long total = 0;
    for(int i = 0; i < 50; i ++){
      total += timedrawGalaxy();
    }
    println("average time to draw the galaxy: "+total/50+"ms"); 
  }
  
  long timedrawGalaxy(){
    long timer = millis(); 
    generateGalaxy();
    timer = millis() - timer;
    return timer; 
  }
  
}//end Galaxy class