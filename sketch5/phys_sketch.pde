
float initalForceX = 10;
float gravity = 0.98;
float friction = -0.85;
float groundFriction = 0.985;
float weight;

PVector rectPos;
int rectHeight = -100,rectWidth= -50;
PVector tr,tl,br,bl;
int offset = 12;
boolean b = false;
boolean hasCollidedTR = false;
boolean hasCollidedTL = false;
boolean hasCollidedBR = false;
boolean hasCollidedBL = false;
float angle = 0;
int xOffset = 25;
int widthOffset = 1;
int fix = 1;



PVector ball;
SphereCollider ballCollider1;

void setup(){
  size(700,500);
  
  ball = new PVector(width/2,height/2,50);
  ballCollider1 = new SphereCollider(ball,ball.z);
  
}

void draw(){
  background(0);
  
  makeRect();
  
  fill(255);
  ellipse(ball.x,ball.y,ball.z,ball.z);
  ballCollider1.showCollider(true);
  ballCollider1.Collide();
  
  
}



////////////////////////////////////////////////////////////////////////////////////
void makeRect(){
  rectPos = new PVector(width-150,height);
  pushMatrix();
  translate(rectPos.x+xOffset,rectPos.y);
  fill(255);
  rotate(radians(angle));
  rect(0,0,rectWidth*widthOffset,rectHeight);
  popMatrix();
  
  br = new PVector(rectPos.x+xOffset*fix,rectPos.y);
  bl = new PVector(rectPos.x+rectWidth+xOffset*fix,rectPos.y);
  tr = new PVector(rectPos.x+xOffset*fix,rectPos.y+rectHeight);
  tl = new PVector(rectPos.x+rectWidth+xOffset*fix,rectPos.y+rectHeight);
  
  
  //shows corners and midpoint of rect
  /*fill(0,255,0);
  ellipse(tr.x,tr.y,10,10);
  fill(0,0,255);
  ellipse(tl.x,tl.y,10,10);
  fill(255,0,0);
  ellipse(br.x,br.y,10,10);
  fill(255,0,255);
  ellipse(bl.x,bl.y,10,10);
  fill(255,255,0);
  ellipse(tl.x,tl.y-rectHeight/2,10,10);*/
  
  if(ball.x+offset>=tl.x && ball.y-offset<=tl.y&&ball.y-offset<=tl.y-rectHeight/2 || hasCollidedTL){
    xOffset = 25;
    widthOffset = 1;
    fix = 1;
    rotateRectCW();
    hasCollidedTL = true;
  }
}

void rotateRectCW(){
  if(angle<=90){
    angle += 7;
  }
  
  if(angle>90){
    angle = 90;
  }
}



void rotateRectCCW(){
  if(angle>=-90){
    angle += 7*-1;
  }
  
  if(angle<-90){
    angle = -90;
  }
}
//////////////////////////////////////////////////////////////////////////////////





class SphereCollider{
  
  PVector forceCarry = new PVector(initalForceX,0);
  PVector colliderPos;
  float diameter;
  boolean show;
  
  SphereCollider(PVector colliderPos, float diameter){
    this.colliderPos = colliderPos;
    this.diameter = diameter;
  }
  
  void Collide(){
    
    forceCarry.y += gravity;
    forceCarry.x *= groundFriction;
    
    
    this.colliderPos.x += forceCarry.x;
    this.colliderPos.y += forceCarry.y;
    
  if(ball.x+offset>=tl.x && ball.y-offset<=tl.y&&ball.y-offset<=tl.y-rectHeight/2){
    this.colliderPos.x = tl.x-this.diameter/2;
    forceCarry.x *= friction;
    hasCollidedTL = true;
  }
    
  if(this.colliderPos.x + this.diameter/2 >width){
    this.colliderPos.x = width-this.diameter/2;
    forceCarry.x *= friction;
  }
  else if (this.colliderPos.x - this.diameter/2<0) {
    this.colliderPos.x = this.diameter/2;
    forceCarry.x *= friction;
  }
  
  
    
 if(this.colliderPos.y + this.diameter/2>height){
    this.colliderPos.y = height-this.diameter/2;
    forceCarry.y *= friction;
  }
  else if (this.colliderPos.y - this.diameter/2<0) {
    this.colliderPos.y = this.diameter/2;
    forceCarry.y *= friction;
  }
 }
 
 void showCollider(boolean show){
   
   this.show = show;
    if(this.show){
      noFill();
      stroke(0,255,0);
      strokeWeight(2.5);
      ellipse(this.colliderPos.x,this.colliderPos.y,this.diameter,this.diameter);
      noStroke();
    }
 }
  
}
