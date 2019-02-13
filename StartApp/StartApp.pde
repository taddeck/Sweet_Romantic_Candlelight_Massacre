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
