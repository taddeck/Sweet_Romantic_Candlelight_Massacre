CuddleMuffin muffi;
int width = 800;
int height = 800;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Movable> movables = new ArrayList<Movable>();
ArrayList<Projectile> projec = new ArrayList<Projectile>();

public void setup(){
  size(800,800);
  translate(width/2,height/2);
  muffi = new CuddleMuffin();
  drawables.add(muffi);
  movables.add(muffi);
  for(int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
  dir = new PVector(0,0);
}

public void draw(){
   translate(width/2,height/2);
   stars();
   for(Movable movable: movables){
     movable.move();
   }
   for(Drawable sprite: drawables){
    sprite.display();
   }
   for(Projectile proj : projec){
     proj.display();
     proj.move();
   }
   

}
  PVector dir;
void mousePressed(){
dir = getCurrentdir();
  dir = dir.normalize().mult(5);
  muffi.speed = dir.mult(-1);
  
 projec.add(new Projectile(muffi.pos.x,muffi.pos.y));
}

PVector getCurrentdir(){
  return new PVector(mouseX - width/2 - muffi.pos.x,mouseY - height/2 - muffi.pos.y);
}
void keyPressed() {
  setMove(key, true);
  starcontrol();
}
 
void keyReleased() {
  setMove(key, false);
  starrelease();
}
 
boolean setMove(int k, boolean b) {
  switch (k) {
  case 'w':
    return muffi.isUp = b;
 
  case 's':
    return  muffi.isDown = b;
 
  case 'a':
    return  muffi.isLeft = b;
 
  case 'd':
    return  muffi.isRight = b;
 
  default:
    return b;
  }
}


////////////////////////////////////
////////////////////////////////////
float speed = 8;
int movingSpeed = 1;

boolean a = false;
boolean d = false;
boolean w = false;
boolean s = false;
boolean plus = false;
boolean minus = false;

Star[] stars = new Star[300];

void stars(){
  background(0);
  
  for(int i=0; i<stars.length; i++){
    stars[i].move();
    stars[i].show();

     stars[i].changeDir();
    
  
  
  if(plus){
    speed = speed + 0.1;
    if(speed >= 24){
      speed = 24;
    }
  }
  if(minus){
    speed = speed - 0.1;
    if(speed <= 0.5){
      speed = 0.5;
    }
  }
}
}

void starcontrol(){
  if(key == 'a'){
    a = true;
  }
  if(key == 'd'){
    d = true;
  }
  if(key == 'w'){
    w = true;
  }
  if(key == 's'){
    s = true;
  }
  if(key == '+'){
    plus = true;
  }
  if(key == '-'){
    minus = true;
  }
}

void starrelease(){
  if(key == 'a'){
    a = false;
  }
  if(key == 'd'){
    d = false;
  }
  if(key == 'w'){
    w = false;
  }
  if(key == 's'){
    s = false;
  }
  if(key == '+'){
    plus = false;
  }
  if(key == '-'){
    minus = false;
  }
}

//class ----------------------------------
class Star{
  
  int x, y;
  int size;
  float z;
  float sx, sy;
  float pz, px, py;
  
  Star(){
    z = random(width);
    reset();
  }
  
  void reset(){
    x = (int)random(-width/2,width/2);
    y = (int)random(-height/2,height/2);
    pz = z;
  }
  
  boolean timeToReset(){
    if(z < 1){
      return true;
    } else {
      return false;
    }
  }
  
  void move(){
    z = z - speed;
    if(timeToReset()){
      z = width;
      reset();
    }
  }
    
  void show(){
    noStroke();
    fill(255);
    
    sx = map(x / z, 0,1, 0,width);
    sy = map(y / z, 0,1, 0,height);
    size = (int)map(z, 0,width, 10,1);
    
    ellipse(sx,sy,size,size);
    
    px = map(x / pz, 0,1, 0,width);
    py = map(y / pz, 0,1, 0,height);
    
    pz = z;
    stroke(255);
    strokeWeight(size);
    line(px,py,sx,sy);
    
  }
 
  void changeDir(){
   y -= dir.y;
   x -= dir.x;
  }

}
