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
      //galaxy.add(new Star(i));
    }
  }
  
  void logSpiral(float degreeOffset){
    float theta = 0; 
    float r = pow( (2.7182), (0.7 * theta) );
    float x = (r)*cos(theta);
    float y = (r)*sin(theta);
    int starcount = 0; 
    
    while(true){
      if(theta > TWO_PI){
        break;  
      }
      r = 16*pow( (2.7182), (0.5 * theta) );
      x = (r)*cos(theta) + width/2;
      y = (r)*sin(theta) + height/2; 
      //ellipse(x,y,1,1);
      galaxy.add(new Star(starcount,x,y,degreeOffset));
      starcount++;
      
      x = -1*(r)*cos(theta) + width/2;
      y = -1*(r)*sin(theta) + height/2; 
      //ellipse(x,y,1,1);
      galaxy.add(new Star(starcount,x,y,degreeOffset));
      starcount++; 
      
      
      theta+= 0.01; //numstars = ceil(4pi/this incrementation)
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