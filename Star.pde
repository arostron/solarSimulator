public class Star{

  private int starID;
  private float colour,x,y;
  
  //constructor method
  public Star(int _starID, float _x, float _y, float degreeOffset){
    starID = _starID; //<>// //<>//
    float[] shift = generatePolarCoordShift(100);
    x = _x + shift[0];
    y = _y + shift[1];
    rotate(degreeOffset); 
    colour = map(noise(x,y),0,1,0,255); 
    drawStar(); //<>//
  } 
   //<>//
  float generateX(){
    return  map(noise(noisekey + starID),0,1,0,width);
  }
  
  float generateY(){
    return  map(noise(noisekey + starID+1),0,1,0,height); 
  }
  
  
  float[] generatePolarCoordShift(float maxRadius){
    float[] coords = {-1,-1};
    float r = map(noise(noisekey + starID),0,1,-1*maxRadius,maxRadius);
    float theta = map(noise(noisekey + starID+1),0,1,0,TWO_PI*2);
    
    coords[0] = r*cos(theta);//x offset from polar coordinates
    coords[1] = r*sin(theta);//y offset from polar coordinates
    return coords;
  }
  
  void drawStar(){
    noStroke(); 
    fill(colour);
    ellipse(x,y,1.4,1.4);
    if(starID == 1000){
      fill(255,0,0);
      ellipse(x,y,2,2);
    }
  
  }
  
  void rotate(float degrees){
    
    //shift (x,y) back to origin
    x-=width/2;
    y-=height/2;
    float radians = degrees*(TWO_PI/360); 
    float tmpx = x;
    float tmpy = y;
    //rotate (x,y) about origin
    x = tmpx*cos(radians)-tmpy*sin(radians);
    y = tmpx*sin(radians)+tmpy*cos(radians);
    //shift (x,y) back from origin 
    x+=width/2;
    y+=height/2;
    
  }

}//end star class