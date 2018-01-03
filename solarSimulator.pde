final long noisekey = (long)random(100); //should be a final
Galaxy g1;   

void setup(){
  size(1000,700); 
  background(0); //black void 
  noiseSeed(noisekey); //set noiseSeed which holds galaxy gen constant
  
  g1 = new Galaxy(5000);  //<>// //<>//
  g1.generateGalaxy(); 
  //println(g1.timedrawNoiseGalaxy()+" ms");
  
}//end setup


void draw(){
  
}//end draw