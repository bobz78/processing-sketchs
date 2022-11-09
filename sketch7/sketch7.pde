PImage world;
int x = 100;
int y = 99;

int countCells = 0;

boolean cellKeepsLiving = false;
boolean cellComesAlive = false;


void setup(){
  size(1000,1000);
  world = createImage(width,height,RGB);
  image(world,0,0);
  world.loadPixels();
  
  for(int i=0;i<4500;++i){
   world.set(int(random(100,500)),int(random(100,500)),color(255));
 }
 
 for(int i=0;i<4500;++i){
   world.set(int(random(500,900)),int(random(500,900)),color(255));
 }
 
 for(int i=0;i<4500;++i){
   world.set(int(random(100,500)),int(random(500,900)),color(255));
 }
 
 for(int i=0;i<4500;++i){
   world.set(int(random(500,900)),int(random(100,500)),color(255));
 }
 
  image(world,0,0);
  world.loadPixels();
}

void draw(){
 
 /*world.set(100,99,color(255));
 world.set(100,100,color(255));
 world.set(101,100,color(255));
 world.set(102,100,color(255));
 world.set(101,99,color(255));*/
 
 
 for(int i=0;i<1000;++i){
   for(int j=0;j<1000;++j){
      rule(i,j);
      if(cellKeepsLiving){
      world.set(i,j,color(255));
      }
      else if(!cellKeepsLiving){
      world.set(i,j,color(0));
      }
      if(cellComesAlive){
      world.set(i,j,color(255));
     }
     
      cellKeepsLiving = false;
      cellComesAlive = false;
      countCells = 0;
   }
 }
 
 
 
 image(world,0,0);
 world.updatePixels();
 //noLoop();
}

void rule(int X, int Y){
  
  //check if the cell is alive***************
  if(red(world.get(X,Y))==255){
    
    if(X-1!=0){
    if(red(world.get(X-1,Y))==255){
    ++countCells; 
    }
    if(red(world.get(X-1,Y+1))==255){
    ++countCells; 
    }
    }
 
    if(y-1!=0){
    if(red(world.get(X,Y-1))==255){
    ++countCells; 
    }
    if(red(world.get(X+1,Y-1))==255){
    ++countCells; 
    }
    if(x-1!=0){
    if(red(world.get(X-1,Y-1))==255){
    ++countCells; 
    }
    }
    }
 
    if(red(world.get(X+1,Y))==255){
    ++countCells; 
    }
    if(red(world.get(X+1,Y+1))==255){
    ++countCells; 
    }
    if(red(world.get(X,Y+1))==255){
    ++countCells; 
    }
    
    if(countCells==3 || countCells==2){
      cellKeepsLiving = true;
    }
  }
  //if not check if the cell is dead************
  if(red(world.get(X,Y))==0){
    
    if(X-1!=0){
    if(red(world.get(X-1,Y))==255){
    ++countCells; 
    }
    if(red(world.get(X-1,Y+1))==255){
    ++countCells; 
    }
    }
 
    if(y-1!=0){
    if(red(world.get(X,Y-1))==255){
    ++countCells; 
    }
    if(red(world.get(X+1,Y-1))==255){
    ++countCells; 
    }
    if(x-1!=0){
    if(red(world.get(X-1,Y-1))==255){
    ++countCells; 
    }
    }
    }
 
    if(red(world.get(X+1,Y))==255){
    ++countCells; 
    }
    if(red(world.get(X+1,Y+1))==255){
    ++countCells; 
    }
    if(red(world.get(X,Y+1))==255){
    ++countCells; 
    }
    
    if(countCells==3){
      cellComesAlive = true;
    }
  }
  
  
  
  
}
