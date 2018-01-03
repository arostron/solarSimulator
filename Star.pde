public class Star{

  private int starID;
  private float colour,x,y;
  
  //constructor method
  public Star(int _starID){
    starID = _starID;
    float[] shift = generatePolarCoordShift(height/2);
    x = width/2 + shift[0]; //star x
    y = height/2 + shift[1]; //star y
    colour = map(noise(x,y),0,1,0,255); 
    drawStar();
  } 
  
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
    stroke(1); 
    fill(colour);
    ellipse(x,y,2,2);
  
  }



}//end star class