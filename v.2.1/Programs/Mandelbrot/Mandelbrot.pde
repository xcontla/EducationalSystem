// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// The Mandelbrot Set

// Simple rendering of the Mandelbrot set
// c = a + bi
// Iterate z = z^2 + c, i.e.
// z(0) = 0
// z(1) = 0*0 + c
// z(2) = c*c + c
// z(3) = (c*c + c) * (c*c + c) + c
// etc.

// c*c = (a+bi) * (a+bi) = a^2 - b^2 + 2abi

// Establish a range of values on the complex plane
float xmin = -2.5; float ymin = -1; float w = 4; float h = 2;
float xmin_prev = -2.5; float ymin_prev = -1; float w_prev = 4; float h_prev = 2;
int zoomCount =0;

// A different range will allow us to "zoom" in or out on the fractal
 //double xmin = -1.5; double ymin = -.1; double w=0.15; double h = 0.15;

void setup() {
  size(863,431);
}

void draw() {

  loadPixels();
  
  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 2000;
  // x goes from xmin to xmax
  double xmax = xmin + w;
  // y goes from ymin to ymax
  double ymax = ymin + h;
  
  // Calculate amount we increment x,y for each pixel
  double dx = (xmax - xmin) / (width);
  double dy = (ymax - ymin) / (height);

  // Start y
  double y = ymin;
  for(int j = 0; j < height; j++) {
    // Start x
    double x = xmin;
    for(int i = 0;  i < width; i++) {
      
      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      double a = x;
      double b = y;
      int n = 0;
      while (n < maxiterations) {
        double aa = a * a;
        double bb = b * b;
        double twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if(aa + bb > 16.0f) {
          break;  // Bail
        }
        n++;
      }
      
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) pixels[i+j*width] = color(0);
      else pixels[i+j*width] = setColor(n%16);  // Gosh, we could make fancy colors here if we wanted
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  //noLoop();
}

void mousePressed() {
  
  
   if (mouseButton == LEFT) {
    zoomCount++; 
    xmin_prev = xmin;
    ymin_prev = ymin;
    w_prev = w;
    h_prev = h;
    
    xmin = map(mouseX, 0, width , xmin, xmin + w); // map the point
    ymin = map(mouseY, 0, height, ymin, ymin + h);  // map the point
    
    // gap of view 
    w = w * 0.5; 
    h = h * 0.5; 
    
    //recenter the point
    xmin = xmin - (w*0.5); 
    ymin = ymin - (h*0.5);
   
  } else if (mouseButton == RIGHT) {
    xmin = xmin_prev;
    ymin = ymin_prev;
    w = w_prev;
    h = h_prev;
  } else { 
    println(zoomCount);
    save("Mandelbrot.png");
  }
 
 
}

color setColor(int n){

    color c = color(0);
  switch(n){
  
    case 0:
      c=color(66, 30, 15);
      break; 
    case 1:
      c=color(25, 7, 26);
      break;
    case 2:
      c=color(9, 1, 47);
      break;
    case 3:
      c=color(4, 4, 73);
      break;
    case 4:
      c=color(0, 7, 100);
      break;
    case 5:
      c=color(12, 44, 138);
      break;
    case 6:
      c=color(24, 82, 177);
      break;
    case 7:
      c=color(57, 125, 209);
      break;
    case 8:
      c=color(134, 181, 229);
      break;
    case 9:
      c=color(211, 236, 248);
      break;
    case 10:
      c=color(241, 233, 191);
      break;
    case 11:
      c=color(248, 201, 95);
      break;
    case 12:
      c=color(255, 170, 0);
      break;
    case 13:
     c=color(204, 128, 0);
      break;
    case 14:
      c=color(153, 87, 0);
      break;
    case 15:
      c=color(106, 52, 3);
      break;
    case 16:
      c=color(53, 5, 6);
      break; 
    case 17:
      c=color(0, 40, 9);
      break;
    case 18:
      c=color(39, 75, 15);
      break;
    case 19:
      c=color(76, 110, 21);
      break;
    case 20:
      c=color(111, 145, 35);
      break;
    case 21:
      c=color(130, 190, 60);
      break;
    case 22:
      c=color(165, 235, 92);
      break;
    case 23:
      c=color(200, 255, 109);
      break;
    case 24:
      c=color(225, 220, 139);
      break;
    case 25:
      c=color(240, 203, 150);
      break;
    case 26:
      c=color(253, 185, 190);
      break;
    case 27:
      c=color(250, 160, 178);
      break;
    case 28:
      c=color(224, 130, 140);
      break;
    case 29:
     c=color(203, 120, 120);
      break;
    case 30:
      c=color(178, 87, 89);
      break;
    case 31:
      c=color(206, 87, 60);
      break;
  }
  return c;
  
}