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

public void setup(){
  size(2000, 1500);
  img = loadImage("herzchen.png");
  smooth();
  muffi = new CuddleMuffin();
  roff = 100;
  goff=200;
  boff=300;
  this.acc = 1;
  this.shootCount = 10000;
  this.fireRate = 2;
  muffi = new CuddleMuffin();
  drawables.add(muffi);
  movables.add(muffi);
  
  new Stars(400, muffi.pos);
  
  dir = new PVector(0,0);
}

public void draw(){
  background(0);
  translate(-muffi.pos.x + width / 2 ,-muffi.pos.y + height / 2);
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
       
       /*NiceGuy ng = new NiceGuy(muffi.pos);
       drawables.add(ng);
       movables.add(ng);
       */
       
     
    }
    
    
    
  }

   this.shootCount++;
   for(Movable movable: movables){
     movable.move();
   }
  

   for(Drawable sprite: drawables){
    sprite.display();
   }


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
  return new PVector(mouseX-pixelWidth/2 ,mouseY-pixelHeight/2);
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
