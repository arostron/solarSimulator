final long noisekey = (long)random(100); //should be a final 


void setup(){
  size(1000,700);
  noiseSeed(noisekey); //set noiseSeed for program (holds galaxy constant)
  
  Galaxy g187ab24 = new Galaxy(5000);  
  g187ab24.drawNoiseGalaxy(); 
 
  //drawNoiseGalaxy(galaxyStarTotal); 
  //drawNoiseSystems(500);
  
  //printAvgTimeGalaxy();
  
  
}//end setup


void draw(){

}//end draw