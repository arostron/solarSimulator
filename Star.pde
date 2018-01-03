public class Star{

  private int x,y,starID,pad;
  private float colour;
  
  //constructor method
  public Star(int _starID){
    starID = _starID;
    pad = 100; // increasing spreads the galaxy out past screen (100)
    x = generateX(); //star x
    y = generateY(); //star y
    colour = map(noise(x,y),0,1,0,255); 
    drawStar();
  } 
  
  int generateX(){
    return (int) map(noise(noisekey + starID),0,1,0-pad,width+pad);
  }
  
  int generateY(){
    return (int) map(noise(noisekey + starID+1),0,1,0-pad,height+pad); 
  }
  
  void drawStar(){
    stroke(1); 
    fill(colour);
    ellipse(x,y,2,2);
  
  }



}