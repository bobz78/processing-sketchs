PImage myImg;
color col;
int w;
int h;

void setup(){  
  myImg.resize(w/2,h/2);
  image(myImg,0,0);
}

void settings(){
  myImg = loadImage("the-last-samurai_photo2.jpg");
  w = myImg.width;
  h = myImg.height;
  size(w/2,h/2);
}

void draw(){

  
  for(int i=0;i<w;++i){
    for(int j=0;j<h;++j){
     col = get(i,j);
      
     color nColor = color(red(col),red(col),red(col));
     myImg.set(i,j,nColor);
    }
  }
  
  image(myImg,0,0);
  noLoop();
}
