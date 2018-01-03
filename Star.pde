public class Star{

  private int starID;
  private float colour,x,y;
  
  //constructor method
  public Star(int _starID){
    starID = _starID;
    x = generateX(); //star x
    y = generateY(); //star y //<>//
    colour = map(noise(x,y),0,1,0,255); 
    drawStar();
  } 
  
  float generateX(){
    return  map(noise(noisekey + starID),0,1,0,width);
  }
  
  float generateY(){
    return  map(noise(noisekey + starID+1),0,1,0,height); 
  }
  
  void drawStar(){
    stroke(1); 
    fill(colour);
    ellipse(x,y,2,2);
  
  }



}//end star class