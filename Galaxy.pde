public class Galaxy {
  //instance variables
  private int numStars;
  ArrayList<Star> galaxy = new ArrayList<Star>();
  String type; 

  //constructor method
  public Galaxy(String _type,int NUMSTARS){
    numStars = NUMSTARS;
    type = _type;
    generateGalaxy(); 
    
  }

  //adds numStars worth of stars to galaxy star list 
  void generateGalaxy(){
    background(0);
    switch(type){
      case "Cluster": //creates galaxy about origin not centre
        for(int i = 0; i < numStars*2; i += 2){
          galaxy.add(new Star(i,0,0,0));
        }
      break;
      
      case "Infinity":
        infinity(0);        
      break;
      
      case "Dual Spiral":
        //doubles number of stars 
        logSpiral(0);
        logSpiral(90); 
        numStars = 2*numStars; 
      break;
      
      case "Spiral":
      default: 
        logSpiral(0);
    } 
    
  }
  
  //generates a spiral galaxy through a polar logarithmic curve
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
      
      theta+= 2*TWO_PI/numStars; //numstars = ceil(4pi/this incrementation)
    }
  }
  
  //generates an infinity shaped galaxy
  void infinity(float degreeOffset){
    float theta = 0; 
    float a = 350; 
    float r = sqrt(a*a*cos(2*theta));
    float x = (r)*cos(theta);
    float y = (r)*sin(theta);
    int starcount = 0; 
    
    while(true){
      if(theta > TWO_PI){
        break;  
      }
      r = sqrt(a*a*cos(2*theta));
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
      
      theta+= 2*TWO_PI/numStars; //numstars = ceil(4pi/this incrementation)
    }
  }
  
  //rotates and draws the entire galaxy
  void drawSpin(){
    //background(0);
    float rotation = -0.05;
    for (Star star : galaxy) {
      star.rotate(rotation);
      star.drawStar(); 
    }
  }
   
  //prints the average time it takes to generate the galaxy
  void printAvgTimeGalaxy(){
    long total = 0;
    for(int i = 0; i < 50; i ++){
      total += timedrawGalaxy();
    }
    println("average time to draw the galaxy: "+total/50+"ms"); 
  }
  
  //draws the galaxy then returns the time it took to draw the galaxy
  long timedrawGalaxy(){
    long timer = millis(); 
    generateGalaxy();
    timer = millis() - timer;
    return timer; 
  }
  
}//end Galaxy class