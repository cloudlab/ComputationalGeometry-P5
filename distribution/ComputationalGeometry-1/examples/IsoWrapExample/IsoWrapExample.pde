/*-----------------------------------
Example: IsoWrap
------------------------------------*/

import ComputationalGeometry.*;

IsoWrap wrap;
PVector[] pts;
PVector cc;
boolean record;

void setup() {
  size(1280, 720, P3D);
  //size(720, 480, P3D);

  // Create iso-skeleton
  skeleton = new IsoSkeleton();
  wrap = new IsoWrap();

  // Create points to make the network
  pts = new PVector[10];
  pts[0] = new PVector(496.48163, 236.61873, 22.393364);
  pts[1] = new PVector(413.53052, 191.96524, -16.22621);
  pts[2] = new PVector(426.80997, 309.59012, 32.86967);
  pts[3] = new PVector(548.3648, 179.54056, 88.14016);
  pts[4] = new PVector(585.9978, 276.26642, -3.9055648);
  pts[5] = new PVector(312.0167, 188.49063, -23.98544);
  pts[6] = new PVector(333.4687, 283.91452, 3.3516912);
  pts[7] = new PVector(212.23485, 187.75351, -40.797253);
  pts[8] = new PVector(261.66876, 100.58384, -32.422287);
  pts[9] = new PVector(235.14645, 3.0178702, -29.39462);
  wrap.addPts(pts);

  cc = new PVector();
  for (int i = 0; i < pts.length; i++)  cc.add(pts[i]);
  cc.div(pts.length);
}
void setup(){
  
  size(250,250,P3D);

  // Creating the Isocontour
  iso = new IsoContour(this, new PVector(0,0), new PVector(width,height), 10,10); 
  
  // Adding Meta-blobs to the Isocontour
  randomSeed(1);
  for(int i=0; i<20; i++){
    PVector pt = new PVector( random(width), random(height), 0 );
    iso.addPoint(pt);
  }
}
void draw(){
  
 background(80);
  lights();  
  float zm = 200;
  float sp = 0.001 * frameCount;
  camera(cc.x + zm * cos(sp), cc.y + zm * sin(sp), cc.z + zm, cc.x, cc.y, cc.z, 0, 0, -1);

  fill(255);
  stroke(50);
  translate(0, 0, -100);
  wrap.plot();
}

