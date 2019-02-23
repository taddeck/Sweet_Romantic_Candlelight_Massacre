CuddleMuffin muffi;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Movable> movables = new ArrayList<Movable>();
ArrayList<Projectile> projec = new ArrayList<Projectile>();
PImage img;
float roff,goff,boff;
float raff,gaff,baff;
private int shootCount;
private int fireRate;
private float acc;
private int starMax;

public void setup(){
  size(2440,1440);
    img = loadImage("herzchen.png");
  smooth();
   muffi = new CuddleMuffin();
  stars = new Star[100];
  roff = 100;
  goff=200;
  boff=300;
  this.acc = 1;
  this.shootCount = 10000;
  this.fireRate = 2;
  muffi = new CuddleMuffin();
  drawables.add(muffi);
  movables.add(muffi);
  for(int i=0; i<stars.length; i++){
    stars[i] = new Star();
  }
  dir = new PVector(0,0);
}

public void draw(){
  background(0);
  roff+=0.5;
  boff+=0.5;
  goff+=0.5;
  raff = noise(roff);
  baff = noise(boff);
  gaff = noise(goff);
  setWeapon("Earth");
  
  if(mousePressed){
        
    if(this.shootCount > this.fireRate){
       
       projec.add(new Projectile(muffi.pos, muffi.speed , "Earth"));
       
       dir = getCurrentdir();
       dir = dir.normalize().mult(5);
       muffi.speed = dir.mult(-this.acc);
       this.shootCount = 0;
       
       drawables.add(new NiceGuy(muffi.pos));
     
    }
  }

   this.shootCount++;
   stars();
   for(Movable movable: movables){
     movable.move();
   }
  
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
  


PVector getCurrentdir(){
  return new PVector( mouseX-pixelWidth/2 ,mouseY-pixelHeight/2);
}



void setWeapon(String planet){
 
    switch(planet){
        
         case "Mercury": 
           this.fireRate = 15;
           this.acc = 0.5;
           break;
           
         case "Venus":
           break;

         case "Earth":
           this.fireRate = 30;
           this.acc = 1;
           break;

         case "Mars":
           this.fireRate = 60;
           this.acc = 2;
           break;
           
         case "Jupiter":
           this.fireRate = 30;
           break;
           
         case "Saturn":
          this.fireRate = 60;
           break;
           
         case "Uranus":
           this.fireRate = 30;
           break;  
           
         case "Neptune":
           this.fireRate = 5;
           
           break;  
           

         default: 
           
            break;
         
         
       }
  
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

Star[] stars;

void stars(){
  
  
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
    red = random(200);
    blue = random(200);
    green = random(200);
    reset();
  }
  
  void reset(){
    
    
    
    x = (int)(random(muffi.pos.x + width));
    y = (int)(random(muffi.pos.y + height));
    
    
    pz = z;
  }
  
  boolean timeToReset(){
    if(z < 1){
      return true;
    } else if(outOfView()){
      
       return true;
      
    } else {
      return false;
    }
    
    
    
  }
  
  boolean outOfView(){
   
    if(sx < (muffi.pos.x - ((width / 2) + 100)) || sx > (muffi.pos.x + ((width / 2) + 100)) || sy < (muffi.pos.y - (height / 2) - 100)
        || sy > (muffi.pos.y + (height / 2) + 100)) return true;
    else return false;
   
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
     fill(red ,green ,blue,30);
    
    sx = map(x / z, 0,1, muffi.pos.x - (width / 2), muffi.pos.x + (width / 2));
    sy = map(y / z, 0,1, muffi.pos.y - (height / 2), muffi.pos.y + (height / 2));
    size = 3;
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
