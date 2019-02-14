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
}

public void draw(){
   translate(width/2,height/2);
   background(255);
   for(Movable movable: movables){
    // movable.move();
   }
   for(Drawable sprite: drawables){
   //  sprite.draw();
   }
    for(Projectile projectile: projec){
     projectile.draw();
     projectile.move();
   }
}

void mousePressed(){
  PVector dir = new PVector(mouseX - width/2 - muffi.pos.x,mouseY - height/2 - muffi.pos.y);
  dir = dir.normalize().mult(5);
  muffi.speed = dir.mult(-1);
  
  projec.add(new Projectile(muffi.pos, new PVector(mouseX, mouseY), 1, 20));
}

void keyPressed() {
  setMove(key, true);
}
 
void keyReleased() {
  setMove(key, false);
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
