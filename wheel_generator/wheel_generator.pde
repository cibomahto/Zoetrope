// Zoetrope generator
// By Matt Mets, 2011

import processing.pdf.*;
float pi = 3.14159;

// All units in inches
float outerDiameter = 11.5;  // Diameter of the circular base
float innerDiameter = 2;     // Keepaway radius in the center of the base.

float shaftDiameter = .188;   // Diameter of the motor shaft

float mountSeparation = .4;  // Distance between the two mounting holes
float mountOutset = 5.25;    // Distance from the center of the circle to the center of the mount
float mountDiameter = .12;  // Diameter of the object mounting holes (there are two per frame, separated by 6deg)

int frameCount = 15;    // Number of frames to divide the zoetrope into.


color cuttingColor = color(0);
color engravingColor = color(255,0,0);



void setup() {
  size(1000,1000);
  background(255);

  beginRecord(PDF, "zoetrope.pdf");  
  drawMountBase();
//  String[] images = {
//    "Nyan_Cat_animation_00.png",
//    "Nyan_Cat_animation_01.png",
//    "Nyan_Cat_animation_02.png",
//    "Nyan_Cat_animation_03.png",
//    "Nyan_Cat_animation_04.png",
//    "Nyan_Cat_animation_05.png",
//    "Nyan_Cat_animation_06.png",
//    "Nyan_Cat_animation_07.png",
//    "Nyan_Cat_animation_08.png",
//    "Nyan_Cat_animation_09.png",
//    "Nyan_Cat_animation_10.png",
//    "Nyan_Cat_animation_11.png",
//  };
//  drawImageBase(images);
  endRecord();
}

void drawMountBase() {
  noFill();
  
  // TODO: Calculate this!
  strokeWeight(.01);
  
  translate(width/2, height/2);

  // The PDF exporter expects 72 DPI, so scale to that.
//  scale(width/(outerDiameter*1.1));
  scale(72);
  
/* Cutting section - things in here will be cut with the laser */
  stroke(cuttingColor);
  
  // Draw the outer diameter of the circle
  ellipse(0,0, outerDiameter, outerDiameter); 
  
  // Draw the motor shaft diameter 
  ellipse(0,0, shaftDiameter, shaftDiameter); 
  
    // Draw mounting holes for the parts.
  for (int i = 0; i < frameCount; i++) {
    for (int j = 4; j*mountSeparation < outerDiameter/2; j++) {
      // Initial translation unit vector, from center of base
      float xVector = cos(pi*2*i/frameCount + pi/frameCount);
      float yVector = sin(pi*2*i/frameCount + pi/frameCount);
      
      // Mount separation unit vector, from center of mount point
      float xSeparation = cos(pi*2*i/frameCount + pi/frameCount + pi/2);
      float ySeparation = sin(pi*2*i/frameCount + pi/frameCount + pi/2);
              
      ellipse(xVector*j*mountSeparation + xSeparation*mountSeparation/2,
              yVector*j*mountSeparation + ySeparation*mountSeparation/2,
              mountDiameter, mountDiameter);
              
      ellipse(xVector*j*mountSeparation - xSeparation*mountSeparation/2,
              yVector*j*mountSeparation - ySeparation*mountSeparation/2,
              mountDiameter, mountDiameter);
    }
  }
  
      // Draw mounting holes for the parts.
  for (int i = 0; i < frameCount; i++) {
    for (int j = 9; j*mountSeparation < outerDiameter/2; j++) {
      // Initial translation unit vector, from center of base
      float xVector = cos(pi*2*i/frameCount + pi/frameCount);
      float yVector = sin(pi*2*i/frameCount + pi/frameCount);
      
      // Mount separation unit vector, from center of mount point
      float xSeparation = cos(pi*2*i/frameCount + pi/frameCount + pi/2);
      float ySeparation = sin(pi*2*i/frameCount + pi/frameCount + pi/2);
              
      ellipse(xVector*j*mountSeparation + xSeparation*mountSeparation*1.5,
              yVector*j*mountSeparation + ySeparation*mountSeparation*1.5,
              mountDiameter, mountDiameter);
              
      ellipse(xVector*j*mountSeparation - xSeparation*mountSeparation*1.5,
              yVector*j*mountSeparation - ySeparation*mountSeparation*1.5,
              mountDiameter, mountDiameter);
    }
  }
  
        // Draw mounting holes for the parts.
  for (int i = 0; i < frameCount; i++) {
    for (int j = 13; j < 14; j++) {
      // Initial translation unit vector, from center of base
      float xVector = cos(pi*2*i/frameCount + pi/frameCount);
      float yVector = sin(pi*2*i/frameCount + pi/frameCount);
      
      // Mount separation unit vector, from center of mount point
      float xSeparation = cos(pi*2*i/frameCount + pi/frameCount + pi/2);
      float ySeparation = sin(pi*2*i/frameCount + pi/frameCount + pi/2);
              
      ellipse(xVector*j*mountSeparation + xSeparation*mountSeparation*2.5,
              yVector*j*mountSeparation + ySeparation*mountSeparation*2.5,
              mountDiameter, mountDiameter);
              
      ellipse(xVector*j*mountSeparation - xSeparation*mountSeparation*2.5,
              yVector*j*mountSeparation - ySeparation*mountSeparation*2.5,
              mountDiameter, mountDiameter);
    }
  }
  
/* Engraving section - things in this section will just be engraved */
  stroke(engravingColor);
  
  // Inner circle decoration
  ellipse(0,0, innerDiameter, innerDiameter); 
  
  // Next, draw the lines for the table.
  for (int i = 0; i < frameCount; i++) {
    float xVector = cos(pi*2*i/frameCount);
    float yVector = sin(pi*2*i/frameCount);
    
    line(xVector*innerDiameter/2,yVector*innerDiameter/2, xVector*outerDiameter/2,yVector*outerDiameter/2);
  }
}


void drawImageBase(String[] images) {

  frameCount = images.length;

  noFill();
  
  // TODO: Calculate this!
  strokeWeight(.01);
  
  translate(width/2, height/2);

  // The PDF exporter expects 72 DPI, so scale to that.
//  scale(width/(outerDiameter*1.1));
  scale(72);
  
/* Cutting section - things in here will be cut with the laser */
  stroke(cuttingColor);
  
  // Draw the outer diameter of the circle
  ellipse(0,0, outerDiameter, outerDiameter); 
  
  // Draw the motor shaft diameter 
  ellipse(0,0, shaftDiameter, shaftDiameter); 
  
/* Engraving section - things in this section will just be engraved */
  stroke(engravingColor);
  
  // Inner circle decoration
  ellipse(0,0, innerDiameter, innerDiameter); 
  
  // Next, draw the lines for the table.
  for (int i = 0; i < frameCount; i++) {
    float xVector = cos(pi*2*i/frameCount);
    float yVector = sin(pi*2*i/frameCount);
    
    line(xVector*innerDiameter/2,yVector*innerDiameter/2, xVector*outerDiameter/2,yVector*outerDiameter/2);
  }
  
/* Image section - these are prolly going to be engraved as well */
  for (int i = 0; i < frameCount; i++) {
    PImage picture = loadImage(images[i]);
    float imageRadius = pi*outerDiameter/frameCount;

    pushMatrix();
      rotate(pi*2*i/frameCount  - pi/frameCount);
      scale(1/72.0);
      
      image(picture, -picture.width/2, innerDiameter*72);
    popMatrix();
  }
}


void draw() {
  // Only need to draw once.
}

