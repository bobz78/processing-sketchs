int N = 128;
int iter = 40;
int scale = 4;
int lettersDensity = 5;
int controlDens = 0;

Fluid fluid;

void settings(){
  size(N*scale,N*scale);
}

void setup(){
  fluid = new Fluid(0.1,0,0);
}

void draw(){
  background(0);

  if(inMode1){
    MATH();ART();CODE();
  }
  if(inMode3){
    for(int i =0;i<arrx.length;++i){
        fluid.addDensity(arrx[i],arry[i],600);
        fluid.addVelocity(arrx[i],arrx[i],(4),(0.1));
    }
  }
  
  
  fluid.stepFunc();
  fluid.renderDensity();
  fluid.fade();
  reset1();
  reset2();
  reset3();
}








boolean inMode1 = true;
void reset1(){
  if(keyPressed){
    if(key == '1'){
      fluid = new Fluid(0.1,0,0);
      inMode1 = true;
      inMode2 = false;
      inMode3 = false;
      controlDens = 0;
      velocityScaler = 1;
      arrx = new int[0];
      arry = new int[0];
    }
  }
}
boolean inMode2 = false;
void reset2(){
  if(keyPressed){
    if(key == '2'){
      fluid = new Fluid(0.1,0,0);
      inMode1 = false;
      inMode2 = true;
      inMode3 = false;
      controlDens = 500;
      velocityScaler = 1;
      arrx = new int[0];
      arry = new int[0];
    }
  }
}
boolean inMode3 = false;
void reset3(){
  if(keyPressed){
    if(key == '3'){
      fluid = new Fluid(0.1,0,0);
      inMode1 = false;
      inMode2 = false;
      inMode3 = true;
      controlDens = 500;
      velocityScaler = 0;
    }
  }
}





void MATH(){
  M(50,0);A(170,0);T(270,0);H(350,0);
}
void ART(){
  A(50,300);R(250,300);T(350,300);
}
void CODE(){
  C(-80,550);O(100,650);D(250,650);E(450,550);
}





void T(int Xoffset, int Yoffset){
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(230+i+Xoffset)/scale),int(0.5*(200+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(300+Xoffset)/scale),int(0.5*(200+i+Yoffset)/scale),lettersDensity);
  }
}

void M(int Xoffset, int Yoffset){
  for(int i=0;i<100;i+=5){
    fluid.addDensity(int(0.5*(10+i+Xoffset)/scale),int(0.5*(200+Yoffset+i)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(10+Xoffset)/scale),int(0.5*(200+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<100;i+=5){
    fluid.addDensity(int(0.5*(110+i+Xoffset)/scale),int(0.5*(300-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(210+Xoffset)/scale),int(0.5*(200+i+Yoffset)/scale),lettersDensity);
  }
}
void A(int Xoffset, int Yoffset){
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(150+Xoffset)/scale),int(0.5*(400-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(i+150+Xoffset)/scale),int(0.5*(200+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(300+Xoffset)/scale),int(0.5*(400-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(150+i+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
}
void H(int Xoffset, int Yoffset){
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(350+Xoffset)/scale),int(0.5*(400-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<100;i+=5){
    fluid.addDensity(int(0.5*(i+350+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(450+Xoffset)/scale),int(0.5*(400-i+Yoffset)/scale),lettersDensity);
  }
}
void R(int Xoffset, int Yoffset){
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(150+Xoffset)/scale),int(0.5*(400-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<100;i+=5){
    fluid.addDensity(int(0.5*(i+150+Xoffset)/scale),int(0.5*(200+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<50;i+=5){
    fluid.addDensity(int(0.5*(250+Xoffset)/scale),int(0.5*(250-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<100;i+=5){
    fluid.addDensity(int(0.5*(150+i+Xoffset)/scale),int(0.5*(250+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(150+i+Xoffset)/scale),int(0.5*(250+Yoffset+i)/scale),lettersDensity);
  }
}
void C(int Xoffset, int Yoffset){
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(225+i+Xoffset)/scale),int(0.5*(200+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(225+Xoffset)/scale),int(0.5*(200+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(225+i+Xoffset)/scale),int(0.5*(400+Yoffset)/scale),lettersDensity);
  }
}
void E(int Xoffset, int Yoffset){
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(225+i+Xoffset)/scale),int(0.5*(200+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(225+Xoffset)/scale),int(0.5*(200+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(225+i+Xoffset)/scale),int(0.5*(400+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<150;i+=5){
    fluid.addDensity(int(0.5*(225+i+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
}
void D(int Xoffset, int Yoffset){
  for(int i=0;i<200;i+=5){
    fluid.addDensity(int(0.5*(300+Xoffset)/scale),int(0.5*(300-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<130;i+=5){
    fluid.addDensity(int(0.5*(390+Xoffset)/scale),int(0.5*(260-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(350+i+Xoffset)/scale),int(0.5*(100+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(300+i+Xoffset)/scale),int(0.5*(100+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(350+i+Xoffset)/scale),int(0.5*(300-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(300+i+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
}
void O(int Xoffset, int Yoffset){
  for(int i=0;i<130;i+=5){
    fluid.addDensity(int(0.5*(210+Xoffset)/scale),int(0.5*(260-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<130;i+=5){
    fluid.addDensity(int(0.5*(390+Xoffset)/scale),int(0.5*(260-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(350+i+Xoffset)/scale),int(0.5*(100+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(300+i+Xoffset)/scale),int(0.5*(100+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(350+i+Xoffset)/scale),int(0.5*(300-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(300+i+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(250-i+Xoffset)/scale),int(0.5*(100+i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(250+i+Xoffset)/scale),int(0.5*(100+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<40;i+=5){
    fluid.addDensity(int(0.5*(250-i+Xoffset)/scale),int(0.5*(300-i+Yoffset)/scale),lettersDensity);
  }
  for(int i=0;i<55;i+=5){
    fluid.addDensity(int(0.5*(250+i+Xoffset)/scale),int(0.5*(300+Yoffset)/scale),lettersDensity);
  }
}





int velocityScaler = 1;
void mouseDragged(){
  if(!inMode3){
    fluid.addDensity(mouseX/scale,mouseY/scale,controlDens);
  }
  float amountX = mouseX - pmouseX;
  float amountY = mouseY - pmouseY;
  fluid.addVelocity(mouseX/scale,mouseY/scale,(amountX-0.5)*velocityScaler,(amountY-0.5)*velocityScaler);
}


int[] arrx = new int[0];
int[] arry = new int[0]; 

void mousePressed(){
  if(inMode3){
    arrx = append(arrx,mouseX/scale);
    arry = append(arry,mouseY/scale);
  }
}


int count = 0;
void keyReleased(){
  if(key == 'c'){
      ++count;
  }
  if(count>=5){
    count = 0;
  }
}






int Index(int x, int y){
  x = constrain(x,0,N-1);
  y = constrain(y,0,N-1);
  return x+(y*N);
}

void set_bnd(int b, float[] x) {
  for (int i = 1; i < N - 1; i++) {
    x[Index(i, 0  )] = b == 2 ? -x[Index(i, 1  )] : x[Index(i, 1 )];
    x[Index(i, N-1)] = b == 2 ? -x[Index(i, N-2)] : x[Index(i, N-2)];
  }
  for (int j = 1; j < N - 1; j++) {
    x[Index(0, j)] = b == 1 ? -x[Index(1, j)] : x[Index(1, j)];
    x[Index(N-1, j)] = b == 1 ? -x[Index(N-2, j)] : x[Index(N-2, j)];
  }

  x[Index(0, 0)] = 0.5f * (x[Index(1, 0)] + x[Index(0, 1)]);
  x[Index(0, N-1)] = 0.5f * (x[Index(1, N-1)] + x[Index(0, N-2)]);
  x[Index(N-1, 0)] = 0.5f * (x[Index(N-2, 0)] + x[Index(N-1, 1)]);
  x[Index(N-1, N-1)] = 0.5f * (x[Index(N-2, N-1)] + x[Index(N-1, N-2)]);
}

void LE_solver(int b, float[] x, float[] x0, float a, float c) {
  float cRecip = 1.0 / c;
  for (int k = 0; k < iter; k++) {
    for (int j = 1; j < N - 1; j++) {
      for (int i = 1; i < N - 1; i++) {
        x[Index(i, j)] =
          (x0[Index(i, j)]
          + a*(    x[Index(i+1, j)]
          +x[Index(i-1, j)]
          +x[Index(i, j+1)]
          +x[Index(i, j-1)]
          )) * cRecip;
      }
    }

    set_bnd(b, x);
  }
}






class Fluid{
  
  int size;
  float dt;
  float diffusion;
  float viscosity;
 
  float[] s;
  float[] density;
  
  float[] Vx;
  float[] Vy;

  float[] PVx;
  float[] PVy;
  
  Fluid(float dt, int diffusion, int viscosity){
    
    this.size = N;
    this.dt = dt;
    this.diffusion = diffusion;
    this.viscosity = viscosity;
    
    this.s = new float[N*N];
    this.density = new float[N*N];
    
    this.Vx = new float[N*N];
    this.Vy = new float[N*N];
    
    this.PVx = new float[N*N];
    this.PVy = new float[N*N];
  }
  
  void stepFunc(){
    float visc= this.viscosity;
    float diff= this.diffusion;
    float dt       = this.dt;
    float[]Vx      = this.Vx;
    float[]Vy      = this.Vy;
    float[]PVx     = this.PVx;
    float[]PVy     = this.PVy;
    float[]s       = this.s;
    float[]density = this.density;
    
    diffuse(1, PVx, Vx, visc, dt);
    diffuse(2, PVy, Vy, visc, dt);
    
    project(PVx, PVy, Vx, Vy);
    
    advect(1, Vx, PVx, PVx, PVy, dt);
    advect(2, Vy, PVy, PVx, PVy, dt);
    
    project(Vx, Vy, PVx, PVy);
    
    diffuse(0, s, density, diff, dt);
    advect(0, density, s, Vx, Vy, dt);
  }
  
  void addDensity(int x, int y, float amount){
    int index = Index(x,y);
    this.density[index] += amount;
  }
  
  void addVelocity(int x, int y, float amountX, float amountY){
    int index = Index(x,y);
    this.Vx[index] += amountX;
    this.Vy[index] += amountY;
  }
  
  void renderDensity(){
    for(int i=0;i<N;i++){
      for(int j=0;j<N;j++){
        float x = i*scale;
        float y = j*scale;
        float d = this.density[Index(i,j)];
        
        
        if(inMode1){
          colorMode(HSB);
          fill(20,(d + 5) % 255,d);
        }
        else if(inMode2){
          colorMode(RGB);
          if(count==0){
            fill(d,0,0);
          }
          if(count==1){
            fill(0,0,d);
          }
          if(count==2){
            fill(0,d,0);
          }
          if(count==3){
            fill(d,d,0);
          }
          if(count==4){
            fill(d,0,d);
          }
        }
        
        
        if(inMode3){
          fill(d);
        }
        
        noStroke();
        rect(x,y,scale,scale);  
      }
    }
  }
  
  void fade(){
    for(int i=0;i<this.density.length;++i){
      if(this.density[i]>-1){
        this.density[i] -= 1;
      }
    }
  }

}

void diffuse (int b, float[] x, float[] x0, float diff, float dt) {
  float a = dt * diff * (N - 2) * (N - 2);
  LE_solver(b, x, x0, a, 1 + 4 * a);
}

void project(float[] velocX, float[] velocY, float[] p, float[] div) {
  for (int j = 1; j < N - 1; j++) {
    for (int i = 1; i < N - 1; i++) {
      div[Index(i, j)] = -0.5f*(
        velocX[Index(i+1, j)]
        -velocX[Index(i-1, j)]
        +velocY[Index(i, j+1)]
        -velocY[Index(i, j-1)]
        )/N;
      p[Index(i, j)] = 0;
    }
  }

  set_bnd(0, div); 
  set_bnd(0, p);
  LE_solver(0, p, div, 1, 4);

  for (int j = 1; j < N - 1; j++) {
    for (int i = 1; i < N - 1; i++) {
      velocX[Index(i, j)] -= 0.5f * (  p[Index(i+1, j)]
        -p[Index(i-1, j)]) * N;
      velocY[Index(i, j)] -= 0.5f * (  p[Index(i, j+1)]
        -p[Index(i, j-1)]) * N;
    }
  }
  set_bnd(1, velocX);
  set_bnd(2, velocY);
}


void advect(int b, float[] d, float[] d0, float[] velocX, float[] velocY, float dt) {
  float i0, i1, j0, j1;

  float dtx = dt * (N - 2);
  float dty = dt * (N - 2);

  float s0, s1, t0, t1;
  float tmp1, tmp2, x, y;

  float Nfloat = N;
  float ifloat, jfloat;
  int i, j;

  for (j = 1, jfloat = 1; j < N - 1; j++, jfloat++) { 
    for (i = 1, ifloat = 1; i < N - 1; i++, ifloat++) {
      tmp1 = dtx * velocX[Index(i, j)];
      tmp2 = dty * velocY[Index(i, j)];
      x    = ifloat - tmp1; 
      y    = jfloat - tmp2;

      if (x < 0.5f) x = 0.5f; 
      if (x > Nfloat + 0.5f) x = Nfloat + 0.5f; 
      i0 = floor(x); 
      i1 = i0 + 1.0f;
      if (y < 0.5f) y = 0.5f; 
      if (y > Nfloat + 0.5f) y = Nfloat + 0.5f; 
      j0 = floor(y);
      j1 = j0 + 1.0f; 

      s1 = x - i0; 
      s0 = 1.0f - s1; 
      t1 = y - j0; 
      t0 = 1.0f - t1;

      int i0i = int(i0);
      int i1i = int(i1);
      int j0i = int(j0);
      int j1i = int(j1);


      d[Index(i, j)] = 
        s0 * (t0 * d0[Index(i0i, j0i)] + t1 * d0[Index(i0i, j1i)]) +
        s1 * (t0 * d0[Index(i1i, j0i)] + t1 * d0[Index(i1i, j1i)]);
    }
  }

  set_bnd(b, d);
}
