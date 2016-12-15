float x, y, theta, inc, t;
int r;
float f=1;
float v;

void setup() {

  size(1000, 1000);
  //Bg();
  //theta=0;
  inc=TWO_PI/5000;  //constant velocity
  frameRate(30);
}

void mousePressed() {
  Bg();
}
void draw() {
  r=75;
  
  
  for (int i=50; i<width; i+=100) {
    for (int k=50; k<height; k+=100) {
      if (abs(i-mouseX)<50 && abs(k-mouseY)<50) {
        noStroke();
        fill(0,20);
        //ellipse(i+10,k+10,2*r,2*r);
         // filter(BLUR, 1);
        Pend(r, i+20, k+20, 0.00001, i+k/10);
      } else {
        Pend(r, i, k, 0.1*i+0.0000002*k, i/100+k/50);
      }
    }
    //r++;
  }
  //Pend(mouseX,mouseY,0.0004,2);
  //Pend(50,50,0.001);
  //Pend(150,50,0.005);
  //Pend(250,50,0.009);
  //Pend(350,50,0.005);
  //Pend(450,50,0.001);
 //delay(100);
 saveFrame("frames/####.png");
}


void Pend(int r, int a, int b, float speed, float f) { 

  v=(theta-f/2)/PI;

  translate(a, b);
  x=r*cos(v);
  y=r*sin(v);
  t+=0.1*f;
  //float c=map(theta,0,TWO_PI,0,255);
  noStroke();
  fill(10*f, f+abs(200*cos(v)), f+abs(255*sin(v)), sin(v)*50);
  arc(0, 0, 2*r, 2*r, v-PI/1.8, v, PIE);


  stroke(50*f*sin(theta), 10*f*cos(theta), 10*f, abs(cos(theta)*30));
  strokeWeight(4);
  line(0,0,x,y);

  //fill(10*f,f+abs(200*cos(inc*t)),f+abs(255*sin(inc*t)),sin(theta)*30);
  //arc(0,0,2*r,2*r,theta,theta+PI/10,PIE);

  theta+=f*0.5+f*cos(speed*t/inc)+sin(speed*t/inc);

  //if(t>255){
  //f=-1;
  //}
  translate(-a, -b);
}

void Bg() {
  loadPixels();
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int loc=x+y*width;
      pixels[loc]=color(100, 100, y+10, 30);
    }
    updatePixels();
  }
}