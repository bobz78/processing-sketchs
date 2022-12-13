PVector rect;
PVector rect2;
float gravity = 0.5;
float carryForce;
int Rheight,Rwidth;
float rotationVal;
float maxRotation;
int MX,MY;
boolean isColliding = false;
boolean mp = false;
int rotationalOffset = 20;

 

void setup(){
  size(500,500);
  rectMode(CENTER);
  Rwidth = 120;
  Rheight = 10;
  rect = new PVector(width/2,height/2,10);
  rect2 = new PVector(190,20,20);
  rotationVal = 0;
}

void draw(){
  background(0);
  
  //rotationVal += -1;
  
  pushMatrix();
  translate(rect.x,rect.y);
  torque();
  rotate(radians(-rotationVal));
  rect(0,0,Rwidth,rect.z);
  //addGravity(rect);
  popMatrix();
  
  pushMatrix();
  translate(rect2.x,rect2.y);
  rect(0,0,rect2.z,rect2.z);
  if(count==1){
    addGravity(rect2);
  }
  popMatrix();
  
  col(rect,rect2);
  
}

void addGravity(PVector pv){
  if(pv.y<height-(pv.z/2)){
    carryForce += gravity;
    pv.y += carryForce;
  }
  else pv.y = height-(pv.z/2);
}


void torque(){
  if(isColliding){
    maxRotation = carryForce+(rect.x-rect2.x)-rotationalOffset;
  }
  
  if(maxRotation>0){
    if(rotationVal<maxRotation){
      rotationVal += carryForce-4;
    }
  }
  else{
    if(rotationVal>maxRotation){
      rotationVal -= carryForce-4;
    }
  }
}


void col(PVector vec, PVector vec2){
  //println(vec.y,vec2.y);
  if(vec.y+10 > vec2.y-5 && vec.y-10 < vec2.y+5){
    isColliding = true;
  }
  else
  isColliding = false;
}

int count = 0;
void mousePressed(){
  ++count;
  if(count>1){
    count=0;
  }
}
