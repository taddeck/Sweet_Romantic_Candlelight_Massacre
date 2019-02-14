CuddleMuffin muffi;
int width = 800;
int height = 800;
ArrayList<Drawable> drawables = new ArrayList<Drawable>();
ArrayList<Movable> movables = new ArrayList<Movable>();

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
     movable.move();
   }
   for(Drawable sprite: drawables){
     sprite.draw();
   }
}

void mousePressed(){
  PVector dir = new PVector(mouseX - width/2 - muffi.pos.x,mouseY - height/2 - muffi.pos.y);
  dir = dir.normalize().mult(5);
  muffi.speed = dir.mult(-1);
  System.out.println(mouseX + " " + mouseY);
  System.out.println(muffi.speed.toString());
  
  Projectile pr = new Projectile(muffi.pos, new PVector(mouseX - width/2 - muffi.pos.x, mouseY - height/2 - muffi.pos.y), 0.5, 20);
  
  drawables.add(pr);
  movables.add(pr);
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
