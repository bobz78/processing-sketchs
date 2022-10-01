
PVector a;
PVector Color1;
PVector Color2;
PVector Color3;
PVector Color4;
PVector Color5;

PVector ColorPallet;

int count = 1;
int Yoffset = -30;

float patternChanger;

void makePattern(PVector p, PVector col, int offsetX, int offsetY){
  
  
  for (int i=35; i<frameCount||i>width-75; ++i) {

    p.y = i-offsetY;
    p.x = ((height/2) + (sin(i*0.1)*10))+offsetX;

    fill(col.x, col.y, col.z, 30);
    ellipse(a.x, a.y, 15, 15);
  }
  for (int i=35; i<frameCount||i>width-75; ++i) {

    a.y = i-offsetY;
    a.x = (height/(2.1) + (sin(i*patternChanger)*-10))+offsetX;

    fill(col.x, col.y, col.z, 30);
    ellipse(a.x, a.y, 15, 15);
  }
}

  void setup() {
  size(450, 450);
  noStroke();
  background(227, 232, 216);
  
  a = new PVector();
  Color1 = new PVector(100, 100, 100);
  Color2 = new PVector(133, 105, 82);
  Color3 = new PVector(92, 115, 90);
  Color4 = new PVector(108, 127, 171);
  Color5 = new PVector(142, 106, 163);
  
  if(int(random(0,2))==0){
    patternChanger = 0.1;
  }
  else
  patternChanger = 0.3;
}

void draw() {
  
  for(int n=-210;n<260;n=n+30){
    if(count%2==0){
       Yoffset = 0;
    }
    else
    Yoffset = -30;
    
    int r = int(random(0,4));
    
    if(r==0){
      ColorPallet = Color1;
    }
    else if(r==1){
      ColorPallet = Color2;
    }
    else if(r==2){
      ColorPallet = Color3;
    }
    else if(r==3){
      ColorPallet = Color4;
    }
    else
    ColorPallet = Color5;
    
    
    makePattern(a,ColorPallet,n,Yoffset);
    count = count+1;
  }
  
}
