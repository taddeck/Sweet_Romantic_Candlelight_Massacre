CuddleMuffin muffi;
int width = 3860;
int height = 2160;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Movable> movables = new ArrayList<Movable>();
ArrayList<Projectile> projec = new ArrayList<Projectile>();
PImage img;
float roff,goff,boff;
float raff,gaff,baff;
public void setup(){
  size(3860,2160);
    img = loadImage("herzchen.png");
  smooth();
   muffi = new CuddleMuffin();
  roff = 100;
  goff=200;
  boff=300;
 
  drawables.add(muffi);
  movables.add(muffi);
  for(int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
  dir = new PVector(0,0);
}

public void draw(){
  roff+=0.5;
  boff+=0.5;
  goff+=0.5;
  raff = noise(roff);
  baff = noise(boff);
  gaff = noise(goff);
  
  translate(-muffi.pos.x + pixelWidth/2,-muffi.pos.y + pixelHeight/2);
  //    translate(-muffi.pos.x,-muffi.pos.y++ );

     stars();
   for(Drawable sprite: drawables){
    sprite.display();
   }
 //  popMatrix();

   for(Movable movable: movables){
     movable.move();
   }
   
   for(Projectile proj : projec){
     proj.display();
     proj.move();
   }
   

}
  PVector dir;
void mousePressed(){
  dir = getCurrentdir().normalize().mult(5);
  muffi.speed = dir.mult(-1);
  
 projec.add(new Projectile(muffi.pos.x,muffi.pos.y));
}

PVector getCurrentdir(){
  return new PVector( mouseX-pixelWidth/2 ,mouseY-pixelHeight/2);
}


////////////////////////////////////
////////////////////////////////////
float speed = 8;
int movingSpeed = 16;

boolean a = false;
boolean d = false;
boolean w = false;
boolean s = false;
boolean plus = false;
boolean minus = false;

Star[] stars = new Star[400];

void stars(){
  background(0);
  
  for(int i=0; i<stars.length; i++){
    stars[i].move();
    stars[i].show();
     stars[i].changeDir();
}
}




//class ----------------------------------
class Star{
  
  int x, y;
  int size;
  float z;
  float sx, sy;
  float pz, px, py;
  int starsize;
  float red,green,blue;
  Star(){
    z = random(pixelWidth);
    starsize = (int)random(20);
    red = random(100);
    blue = random(100);
    green = random(100);
    reset();
  }
  
  void reset(){
    x = (int)(random(-pixelWidth+muffi.pos.x,pixelWidth+muffi.pos.x));
    y = (int)(random(-pixelHeight+ muffi.pos.y,pixelHeight+ muffi.pos.y));
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
     fill(180 ,180 ,0,10);
    
    sx = map(x / z, 0,1, 0+muffi.pos.x,width+muffi.pos.x);
    sy = map(y / z, 0,1, 0+muffi.pos.y,height+muffi.pos.y);
    size = 5;
  for(int i = starsize;i > 0; --i){
      
    ellipse(sx,sy,size*i,size*i);
 
  }
    
   // px = map(x / pz, 0,1, 0,width);
  //  py = map(y / pz, 0,1, 0,height);
    
    pz = z;
    fill(255  ,215 ,174   );
    strokeWeight(size);
  //  line(px,py,sx,sy);
    
  }
 
  void changeDir(){
   y -= muffi.speed.y*3;
   x -= muffi.speed.x*3;
  }

}
