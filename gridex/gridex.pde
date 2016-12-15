PImage yun;
float col, row;
float resolution =10;
int d=0;

void setup(){
 yun = new PImage();
 yun = loadImage("yun_profile.JPG");
 //int w=yun.width;
 //int h=yun.height;
 //println(w,h); 
  size(2048,1151);
       noStroke();

  
  col =width/(resolution+200);
  row =height/(resolution);
  
}

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) {
       d+=10;
    } else if (keyCode == DOWN) {
       d-=10;
    } 
  } else {
    
  }
 
  
}
void draw(){
  yun.loadPixels();
  
  for(int i=0; i<width-col; i+=col){
   for(int k=0; k<height-row; k+=row){
     int c = yun.get(i+int(col)/2,k+int(row/2));
     pushMatrix();
     translate(i,k);
     fill(c);
      stroke(0);
  strokeWeight(2);
  
     rect(0,0,col,row);
     popMatrix();
     
      }
    
    
  }
  
  pushMatrix();
  translate(mouseX,mouseY);
  for(int j=-100-d; j<100+d; j++){
   for(int l=-100-d; l<100+d; l++){
     int r=yun.get(mouseX+j, mouseY+l);
     noStroke();
      fill(r);
      rect(j,l,1,1);
      
   }
  }
   stroke(0);
  strokeWeight(10);
 line(-100-d,-100-d,100+d,-100-d);
 line(-100-d,100+d,100+d,100+d);
  line(-100-d,-100-d,-100-d,100+d);
 line(100+d,-100-d,100+d,100+d);
  popMatrix();
  
  
 // updatePixels();
  
}