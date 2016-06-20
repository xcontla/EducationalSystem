
float[][] colours;

void setup(){

  size(600,400);
  colours = new float[width][3];
  
}

void draw(){
  colorMode(HSB,255);
  for(int i=0; i < width; i++){
      stroke(map(i,0,width,0,255),255,255);
      line(i,0,i,height);
  }
  noLoop();
  save("rainbowHue.png");

}