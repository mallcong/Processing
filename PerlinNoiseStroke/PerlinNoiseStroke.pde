float s1, s2;
float offset1, offset2;
color c1=255;
color c2=255;
float a;

void setup() {
  size(1000, 1000);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  offset1 += 0.1;
  offset2 += 0.05;

  //stroke(255);
  fill(0);
  //textSize(20);
  //text("eraser",940,940);
  stroke(255);
  strokeWeight(1);
  rect(950, 950, 50, 50); //Reset

  fill(255, 30, 60);
  rect(950, 900, 50, 50); // Add Red

  fill(0, 30, 255);
  rect(950, 850, 50, 50); // Add Blue
  

}

void mouseDragged() {
  fill(c1);
  noStroke();
  //s1 = map(noise(offset1), 0, 1, 2, 50);
  //s2 = map(noise(offset2), 0, 1, 2, 80);
  //ellipse(mouseX, mouseY, s1, s2);
  stroke(c1,c2,map(noise(offset1), 0, 1, 40,255));
  strokeWeight(map(noise(offset1), 0, 1, 1, 50));
  line(mouseX, mouseY, pmouseX, pmouseY);
  noStroke();
}

void mousePressed() {
  if (mouseX > 950 && mouseY >950) {
    background(0);
    c1=255;
    c2=255;
  }

  if (mouseX > 950 && mouseY >900 && 950> mouseY) {
    c1 = int(map(noise(offset1), 0, 1, 40,255));
    c2=10;
  }

  if (mouseX > 950 && mouseY >850 && 900> mouseY) {
    c2 = int(map(noise(offset1), 0, 1, 40,255));
    c1=10;
  }
}