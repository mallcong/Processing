import processing.video.*;
PImage image;
Capture video;
float x;
float i=PI;
float p;

void setup(){
 //background(0);
 size(650, 650);
 video= new Capture(this, 640, 320);
 video.start();
 image = loadImage("eye.jpg");
 //copy(image,20,0,image.width-20,image.height-40,0,0,width,height);
 image.loadPixels();
 image.resize(width,height);
 for(int j=0; j<image.height; j++)
   for(int i=0; i<image.width; i++)
   {
    int loc=i+j*width;
      float b= blue(image.pixels[loc]);
      float r= red(image.pixels[loc]);
      float g= green(image.pixels[loc]);
      image.pixels[loc]=color(b-50,g-50,r-50); 
     
   }
  image.updatePixels();
  
  image(image,0,0);
}

void captureEvent(Capture video){
 video.read(); 
}

void draw(){
  
  int w= video.width;
  int h= video.height;
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(x);
  tint(50);
  copy(video,w/2,0,4,h,0,0,4,h/2-10);
  popMatrix();
  //translate(-width/2, height/2);
  
  x=x+PI/540;
  
 pushMatrix(); 
   translate(width/2,height/2);
  rotate(i);
  tint(50);
  p=map(mouseX,0,width,0,50);
  copy(video,w/2,0,4,h,0,0,4,h/4+int(p));
  popMatrix();
  
  i=i-PI/540;
  
  if(x>TWO_PI){
   x=0; 
  }
  
  if(i<-TWO_PI){
    i=0;
  }
  
  
}