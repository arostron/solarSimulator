final long noisekey = (long)random(100); //should be a final
Galaxy g1;   

void setup(){
  size(1000,700); 
  background(0); //black void 
  noiseSeed(noisekey); //set noiseSeed which holds galaxy gen constant
  
  g1 = new Galaxy(1000); 
  g1.generateGalaxy();//doesnt do anything currently 
  g1.logSpiral(0);
  
  //println(g1.timedrawNoiseGalaxy()+" ms");
  fill(255);
  noStroke(); 
  
}//end setup



//draw a parametrically defined logarithmic curve 
float i = 0; 
void draw(){ 
  /* VERY ineffeicient spin galaxy
   background(0);
   g1.logSpiral(i);
   g1.logSpiral(i+90);
   i-=0.5; 
   */
   g1.spin(); 
  
}//end draw