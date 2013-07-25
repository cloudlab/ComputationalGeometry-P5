/*-----------------------------------
Example: IsoContour
------------------------------------*/

import ComputationalGeometry.*;
IsoSkeleton skeleton;


void setup() {
  size(1280, 720, P3D);

  // Create iso-skeleton
  skeleton = new IsoSkeleton();

  // Create points to make the network
  PVector[] pts = new PVector[100];
  for (int i=0; i<pts.length; i++) {
    pts[i] = new PVector(random(-100, 100), random(-100, 100), random(-100, 100) );
  }  

  for (int i=0; i<pts.length; i++) {
    for (int j=i; j<pts.length; j++) {
      if (i != j) {
        if (pts[i].dist( pts[j] ) < 50) {
          skeleton.addEdge(pts[i], pts[j]);
        }
      }
    }
  }
}

void draw() {
  background(80);
  lights();  
  float zm = 150;
  float sp = 0.001 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm, 0, 0, 0, 0, 0, -1);
  
  noStroke();
  skeleton.plot(10.f * float(mouseX) / width, float(mouseY) / height);  // Thickness as parameter
}



