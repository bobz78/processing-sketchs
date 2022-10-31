PVector lineStart;
int offset;
PVector lineLengthH;
PVector lineLength;
float olx1,oly1 , olx2,oly2;
float olx1h,oly1h , olx2h,oly2h;
int adder;
int rand;

void setup(){
  size(1200,800); 
  background(0);
}

void draw(){
  //*|| change this for a compeletly new look
  background(0);
  //*|| change this for a compeletly new look
  
  
  //*||
  for(int i=0;i<30;++i){
    snowFlake s = new snowFlake(int(random(50,width-50)),int(random(50,height-50)));
    s.showSnowFlake();
  }
  
  //*||
  delay(800);
  
}





class snowFlake{
  
  snowFlake(int xpos,int ypos){
    //*||
    stroke(165, 242, 243, random(100,255));
    //*||
    strokeWeight(random(0.5,5));
    adder = 0;
    lineStart = new PVector(xpos,ypos);
    offset = -10;
    //*||
    lineLength = new PVector(int(random(5,10)),int(random(20,40)));
    //*||
    rand = int(random(5,15));
    olx1 = lineStart.x+offset;
    oly1 = lineStart.y+offset;  
    olx2 = olx1+lineLength.x;
    oly2 = oly1+lineLength.y;
    olx1h = lineStart.x;
    oly1h = lineStart.y;
    olx2h = olx1h;
    oly2h = oly1h;
  }
  
  void recursive(int a, int n, int m){
  if(a>0){
    offset += 20;
    olx1 = lineStart.x+offset*n;
    oly1 = lineStart.y+offset*n*m;  
    float holder = lineLength.x;
    lineLength.x = lineLength.y;
    lineLength.y = holder;
    olx2 = olx1+lineLength.x*n;
    oly2 = oly1+lineLength.y*n*m;
    line(olx1,oly1,olx2,oly2);
    holder = lineLength.x;
    lineLength.x = lineLength.y;
    lineLength.y = holder;
    olx2 = olx1+lineLength.x*n;
    oly2 = oly1+lineLength.y*n*m;
    line(olx1,oly1,olx2,oly2);
    recursive(a-1,n,m);
   }
  }

void recursiveH(int a, int b){
  
    if(a>0){
      olx1h = lineStart.x;
      oly1h = lineStart.y;
      olx2h = olx1h;
      oly2h = oly1h;
      line((olx1h+10*b)+(adder*b),oly1h,olx2h+40*b+adder*b,oly2h-rand);
      line((olx1h+10*b)+(adder*b),oly1h,olx2h+40*b+adder*b,oly2h+rand);
      adder += 30;
      recursiveH(a-1,b);
   }
  }
  
  void showSnowFlake(){
    line(lineStart.x,lineStart.y,lineStart.x+100,lineStart.y+100); 
    line(lineStart.x,lineStart.y,lineStart.x+100,lineStart.y-100);
    line(lineStart.x,lineStart.y,lineStart.x-100,lineStart.y+100);
    line(lineStart.x,lineStart.y,lineStart.x-100,lineStart.y-100);
    line(lineStart.x,lineStart.y,lineStart.x+140,lineStart.y);
    line(lineStart.x,lineStart.y,lineStart.x-140,lineStart.y);
    adder = 0;
    recursiveH(4,1);
    adder = 0;
    recursiveH(4,-1);
    recursive(4,-1,-1);
    offset = -10;
    recursive(4,1,1);
    offset = -10;
    recursive(4,-1,1);
    offset = -10;
    recursive(4,1,-1);
    offset = -10;
  }
}
