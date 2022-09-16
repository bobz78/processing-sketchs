
int cols = 20;
int rows = 20;
int stepx;
int stepy;
int pos1x;     
int pos1y;
int pos2x;     
int pos2y;
int pos3x;     
int pos3y;
int pos1x2;     
int pos1y2;
int pos2x2;     
int pos2y2;
int pos3x2;     
int pos3y2;
int pos1x3;     
int pos1y3;
int pos2x3;     
int pos2y3;
int pos3x3;     
int pos3y3;
int pos4x3;     
int pos4y3;
int time;
float waitTime = 50;
int highestPos;

int randG;

int randr;
int randg;
int randb;

void makeRect(float x,float y,float sx,float sy){
  rect(x,y,sx,sy);
}

void setup() {
  size(500,500);
  stepx = width/cols;
  stepy = height/rows;
  
  time = millis();
  
  pos1x = int(random(1,10));     
  pos1y = 1;
  pos2x = pos1x+1;     
  pos2y = 1;
  pos3x = pos2x;     
  pos3y = 0;
  
  
  pos1x2 = int(random(11,19));;   
  pos1y2 = 1;
  pos2x2 = pos1x2;     
  pos2y2 = 2;
  pos3x2 = pos1x2;      
  pos3y2 = 3;
  
  
  pos1x3 = int(random(11,19));     
  pos1y3 = 2;
  pos2x3 = pos1x3+1;     
  pos2y3 = pos1y3;
  pos3x3 = pos1x3-1;     
  pos3y3 = pos1y3;
  pos4x3 = pos1x3;     
  pos4y3 = pos1y3-1;
  
  randG = int(random(60,255));

  randr = int(random(1,255));
  randg = int(random(50,255));
  randb = int(random(20,255));
  
  
  for(int i=0;i<cols;++i){
    for(int j=0;j<rows;++j){
      
      float x = i*stepx;
      float y = j*stepy;
      
      
      rect(x,y,stepx,stepy);
    }
  }
  
}

void makeShape1(){
  fill(randr,randg,randb);
  makeRect(pos1x*stepx,pos1y*stepy,stepx,stepy);
  makeRect(pos2x*stepx,pos2y*stepy,stepx,stepy);
  makeRect(pos3x*stepx,pos3y*stepy,stepx,stepy);
  fill(255);
  makeRect(pos1x*stepx,(pos1y-1)*stepy,stepx,stepy);
  makeRect(pos1x*stepx,(pos1y-2)*stepy,stepx,stepy);
  makeRect(pos2x*stepx,(pos2y-2)*stepy,stepx,stepy);
  makeRect(pos3x*stepx,(pos3y-2)*stepy,stepx,stepy);
}

void makeShape2(){
  fill(58,29,0);
  makeRect(pos1x2*stepx,pos1y2*stepy,stepx,stepy);
  makeRect(pos2x2*stepx,pos2y2*stepy,stepx,stepy);
  makeRect(pos3x2*stepx,pos3y2*stepy,stepx,stepy);
  fill(255);
  makeRect(pos1x2*stepx,(pos1y2-5)*stepy,stepx,stepy);
  makeRect(pos2x2*stepx,(pos2y2-4)*stepy,stepx,stepy);
  makeRect(pos3x2*stepx,(pos3y2-3)*stepy,stepx,stepy);
}

void makeShape3(){
  fill(0,randG,0);
  makeRect(pos1x3*stepx,pos1y3*stepy,stepx,stepy);
  makeRect(pos2x3*stepx,pos2y3*stepy,stepx,stepy);
  makeRect(pos3x3*stepx,pos3y3*stepy,stepx,stepy);
  makeRect(pos4x3*stepx,pos4y3*stepy,stepx,stepy);
  fill(255);
  makeRect(pos1x3*stepx,(pos1y3-2)*stepy,stepx,stepy);
  makeRect(pos2x3*stepx,(pos2y3-1)*stepy,stepx,stepy);
  makeRect(pos3x3*stepx,(pos3y3-1)*stepy,stepx,stepy);
  makeRect(pos4x3*stepx,(pos4y3-4)*stepy,stepx,stepy);
}

void draw(){
  
  if(millis()-time>waitTime&&pos2y<19){
    pos1y = pos1y+1;
    pos2y = pos2y+1;
    pos3y = pos3y+1;
    time = millis();
  }
  
  makeShape1();
  
  if(pos2y>=19){
    
    if(millis()-time>waitTime&&pos3y2<19){

      pos1y2 = pos1y2+1;
      pos2y2 = pos2y2+1;
      pos3y2 = pos3y2+1;
      
      time = millis();
    
  }
    makeShape2();
    
  }
  
  if(pos2y>=19&&pos3y2>=19){
    
      if(millis()-time>waitTime&&pos1y3<19){
        
        if(((pos1x2==pos1x3&&pos1y3<pos1y2-1)||pos1x2!=pos1x3)&&((pos1x2==pos3x3&&pos3y3<pos1y2-1)||pos1x2!=pos3x3)&&((pos1x2==pos2x3&&pos2y3<pos1y2-1)||pos1x2!=pos2x3)){
          
           pos1y3 = pos1y3+1;
           pos2y3 = pos2y3+1;
           pos3y3 = pos3y3+1;
           pos4y3 = pos4y3+1;
      
           time = millis();
        }
    
  }
  
    makeShape3();
    
    
  }
}
