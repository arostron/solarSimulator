final long noisekey = (long)random(100); //should be a final
Galaxy g1;   

void setup(){
  size(850,850); 
  background(0); //black void 
  noiseSeed(noisekey); //set noiseSeed which holds galaxy gen constant

  g1 = new Galaxy("Dual Spiral",2000); //important to set after noiseSeed 

}

void draw(){ 
  background(0);
  g1.drawSpin(); //<>//
  
}