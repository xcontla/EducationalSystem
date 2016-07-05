
/*Parabola
    p(t) = (1-t)A +tB;
    t = {0,1}
    float px,py,qx,qy,rx,ry;
    px = (1-t)*a.x+t*b.x;
    py = (1-t)*a.y+t*b.y;
    qx = (1-t)*b.x+t*c.x;
    qy = (1-t)*b.y+t*c.y;
    rx = (1-t)*px+t*qx;
    ry = (1-t)*py+t*qy;
*/


void setup()
{
  size(600,400);
  background(50);
}


void draw()
{
    PVector a = new PVector(10,10);
    PVector b = new PVector(300,200);
    PVector c = new PVector(245,390);
    
    strokeWeight(2);
    stroke(255);
    drawParabola(a,b,c);
    strokeWeight(8);
    stroke(255,255,0);
    point(a.x,a.y);
    point(b.x,b.y);
    point(c.x,c.y);
    noLoop();
    save("parabola.png");
}

void drawParabola(PVector a, PVector b, PVector c)
{
  float gap = 0.05;
  float antx = a.x;
  float anty = a.y;
  
  for(float t= gap; t < 1.0+gap; t=t+gap)
  {
            //  (1-t)*        p         + t *        q                        
    float rx = ((1-t)*((1-t)*a.x+t*b.x))+(t *((1-t)*b.x+t*c.x));
    float ry = ((1-t)*((1-t)*a.y+t*b.y))+(t *((1-t)*b.y+t*c.y));
    
   // stroke(rx%255,ry%255,255*(1-t));
    line(antx,anty,rx,ry);
    antx = rx;
    anty = ry;
  }
}