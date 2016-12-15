import ddf.minim.*;
import ddf.minim.analysis.*;
//import processing.sound.*;

AudioInput in;
Minim minim;
FFT fft;
int bands = 512;
int r, g, b;
float s;
//float[] spectrum = new float [bands];

void setup(){
 size(1000,1000, P3D);
 background(0);
 
  
 minim = new Minim(this);
 //minim.debugOn();
 
 in = minim.getLineIn(Minim.STEREO, bands);
 fft = new FFT(in.bufferSize(), in.sampleRate());
  
  noStroke();
  smooth();
}

void draw()
{
  directionalLight(255, 100, 25, 1, 3, -10);
  ambientLight(100, 120, 200,10,200,100);
  spotLight(51, 102, 255, 50, 50, 400, 0, 0, -1, PI/16, 2); 
    translate(width/10,height/2,-1500);
  rotateX(PI/10+s);
  rotateY(PI/8);
  rotateZ(PI/5+s);
   
   s+=0.01; //rotation speed
   
  // draw the waveforms
  background(0);
  fft.forward(in.mix);
  
  loadPixels();
  for(int k=0; k<height-1; k++){
    for(int j=0; j<width -1; j++){
      int c=k+j*width;
      pixels[c]= color(r/255*j,g/255*k,b/255*k);
      //rect(100,100,500,500);
    }
  }
  updatePixels();
  
  for(int i = 0; i < fft.specSize() ; i++)
  {
   // stroke(255);
    //strokeWeight(1);
    box(8, 100, height - fft.getBand(i)*100);
    translate(20,0);
    //stroke((1+in.left.get(i))*50,100,100);
    //line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
   
    //stroke(255);
    //line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
    int colo = int(map(i, 0, 257, 405, 790));
    
    if(colo>=405 && colo<530)
    {colo = int(map(fft.getBand(i), 0, 0.05, 0, 255)); 
      r=colo;}
    else if( colo>=530 && colo<580)
    {colo = int(map(fft.getBand(i), 0, 0.05, 0, 255)); 
      g=colo;}
    else
    {colo = int(map(fft.getBand(i), 0, 0.05, 0, 255)); 
      b=colo;}
      
     // println(fft.getBand(i));
    
   
  }
  

}
void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}