CuddleMuffin muffi;
int width = 1600;
int height = 800;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Movable> movables = new ArrayList<Movable>();
ArrayList<Projectile> projec = new ArrayList<Projectile>();

public void setup(){
  size(1000,800,P3D);
  smooth();
   muffi = new CuddleMuffin();
  
 
  drawables.add(muffi);
  movables.add(muffi);
  for(int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
  dir = new PVector(0,0);
}

public void draw(){
   //pushMatrix();
  translate(-muffi.pos.x + pixelWidth/2,-muffi.pos.y + pixelHeight/2);
  //    translate(-muffi.pos.x,-muffi.pos.y++ );

     stars();
   for(Drawable sprite: drawables){
    sprite.display();
   }
 //  popMatrix();
System.out.println(muffi.speed.toString());
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
  
  Star(){
    z = random(pixelWidth+muffi.pos.x);
    reset();
  }
  
  void reset(){
    x = (int)(random(-pixelWidth,pixelWidth));
    y = (int)(random(-pixelHeight,pixelHeight));
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
    
    sx = map(x / z, 0,1, 0,width) + muffi.pos.x ;
    sy = map(y / z, 0,1, 0,height)+ muffi.pos.y;
    size = (int)map(z, 0,width, 10,1);
    
    ellipse(sx,sy,size,size);
    
    px = map(x / pz, 0,1, 0,width) +muffi.pos.x;
    py = map(y / pz, 0,1, 0,height)+ muffi.pos.y;
    
    pz = z;
    stroke(255);
    strokeWeight(size);
    line(px,py,sx,sy);
    
  }
 
  void changeDir(){
   y -= muffi.speed.y;
   x -= muffi.speed.x;
  }

}
