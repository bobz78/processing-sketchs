PVector branchS;

//changing these values will give you different results (change in recursive function)
//not here. *you can also change m,n in the recursive functions.
int offsetb;
int offsetH;
int c;
int d;
int s;
int r;
//------------------------------------------------------------------------------------



void setup(){
  size(500,500); 
  background(0);
  
  offsetb = 10;
  offsetH = 20;
  c = 20;
  d = 40;
  s = 15;
  r = 30;
  
  branchS = new PVector(width/2,height/2);
}

void draw(){
  
  stroke(165, 242, 243, int(random(100,255)));
  
  if(frameCount<50){
    strokeWeight(0.5*frameCount);
  }
  
  background(0);

  
  line(branchS.x,branchS.y,width/2+100,height/2-100);
  line(branchS.x,branchS.y,width/2-100,height/2+100);
  line(branchS.x,branchS.y,width/2+100,height/2+100);
  line(branchS.x,branchS.y,width/2-100,height/2-100);
  line(branchS.x,branchS.y,width/2-150,height/2);
  line(branchS.x,branchS.y,width/2+150,height/2);
  
  
    
  recBranch(4,1,1);
  resetValues();
  recBranch(4,-1,-1);
  resetValues();
  recBranch(4,1,-1);
  resetValues();
  recBranch(4,-1,1);
  recBranchHoriz(4,1);
  resetValues();
  recBranchHoriz(4,-1);
  
  delay(1000);
}



void recBranch(int a, int n, int m){
  
  if(a>0){
    line(branchS.x+(offsetb*n),branchS.y+(offsetb*m),width/2+(c*n),height/2+(d*m));
    line(branchS.x+(offsetb*n),branchS.y+(offsetb*m),width/2+(d*n),height/2+(c*m));
    offsetb = offsetb+20;
    c += int(random(12,28));
    d += int(random(12,28));
    recBranch(a-1,n,m);
  }
}

void recBranchHoriz(int a,int n){
  if(a>0){
    line(branchS.x+(offsetH*n),branchS.y,width/2+r*n+(offsetH*n),height/2-s);
    line(branchS.x+(offsetH*n),branchS.y,width/2+r*n+(offsetH*n),height/2+s);
    s = int(random(1,15));
    r = int(random(10,30));
    offsetH += 30;
    recBranchHoriz(a-1,n);
  }
}

void resetValues(){
  offsetb = 10;
  offsetH = 20;
  c = 20;
  d = 40;
}
