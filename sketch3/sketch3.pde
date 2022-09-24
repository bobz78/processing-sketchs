
PVector pos[];
PVector acc[];

int num = 200;
int bound = 50;
int sp = 4;
float gravity = 0;
float ang;


void mousePressed(){
  gravity = 5;
}

void addGravity(PVector p1, PVector p2,PVector pR){
  ang = PVector.angleBetween(p1, p2);
  pR.rotate(ang*PI*gravity);
}


void mouseReleased(){
  gravity = 0;
}


void setup() {
  size(700, 700);
  background(0);
  
  
  pos = new PVector[num];
  acc = new PVector[num];
  
  for(int i=0;i<num;++i){
    pos[i] = new PVector(random(bound,width-bound),random(bound,height-bound),random(5,60));
    acc[i] = new PVector(random(-sp,sp),random(-sp,sp),0);
  }
}

void draw() {
  
  background(0);
  stroke(255);
  noFill();
  
  
  for(int j=0;j<num;++j){
    pos[j].add(acc[j]);
    
    if(pos[j].x>width-(pos[j].z/2)||pos[j].x<(pos[j].z/2)){
      acc[j].x = acc[j].x*-1;
    }
    
    if(pos[j].y>height-(pos[j].z/2)||pos[j].y<(pos[j].z/2)){
      acc[j].y = acc[j].y*-1;
    }
    
    
    for(int n=0;n<num;++n){
      
          
          if(PVector.dist(pos[j],pos[n])<(pos[j].z+pos[n].z)/2){
          stroke(180,240,255);
          strokeWeight(2);
          addGravity(pos[j],pos[n],acc[j]);
          line(pos[n].x,pos[n].y,pos[j].x,pos[j].y);
          
          }
        
          else{
          noStroke();
          }
        
        strokeWeight(0.5);
        ellipse(pos[n].x,pos[n].y,pos[n].z,pos[n].z);
      }
      
  }
}
