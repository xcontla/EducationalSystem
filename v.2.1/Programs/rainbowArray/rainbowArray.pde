
float[][] colours;

void setup(){

  size(600,400);
  colours = new float[width][3];
  makeRainbow();

}

void draw(){
  for(int i=0; i < width; i++){
      stroke(colours[i][0],colours[i][1],colours[i][2]);
    line(i,0,i,height);
  }
  noLoop();
  save("rainbowArray.png");
}

/**
   i < width/6  
   red -> yellow
   width/6 < i <  width/3
   yellow -> green
   width/3 < i <  width/2
   green -> cyan
   width/2 < i < 2width/3
   cyan -> blue
  2width/3 < i < 5width/6
   blue ->magenta  
  5width/6 < i < width
   magenta->red
  */


void makeRainbow(){
  int offset = width/6;
  println(offset*6);
for(int i = 0; i < width; i++ ){
  if(i <= offset) { 
      float val = map(i,0,offset,0,255);
      colours[i][0] = 255;
      colours[i][1] = val;
      colours[i][2] = 0;
     }else if(offset < i && i <= 2*offset ){
      float val = map(i,offset,2*offset,0,255);
        colours[i][0] = 255 - val;
        colours[i][1] = 255;
        colours[i][2] = 0;
     }else if(2*offset < i && i <= 3*offset ){
      float val = map(i,2*offset,3*offset,0,255);
        colours[i][0] = 0;
        colours[i][1] = 255;
        colours[i][2] = val;
     }else if(3*offset < i && i <= 4*offset ){
      float val = map(i,3*offset,4*offset,0,255);
        colours[i][0] = 0;
        colours[i][1] = 255 - val;
        colours[i][2] = 255;
     }else if(4*offset < i && i <= 5*offset ){
      float val = map(i,4*offset,5*offset,0,255);
        colours[i][0] = val;
        colours[i][1] = 0;
        colours[i][2] = 255;
     }else {
      float val = map(i,5*offset,width,0,255);
        colours[i][0] =  255;
        colours[i][1] =  0;
        colours[i][2] =  255-val;
     }
 }
}