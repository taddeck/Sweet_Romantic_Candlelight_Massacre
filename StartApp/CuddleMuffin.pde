class CuddleMuffin implements Drawable,Movable{
PVector pos;
PVector speed;
float speedyspeed = 0.001;
float speedyspeedreducer = 100;
int size = 20;
float speedreducerino = 1;
int lebensenergiebalkenzuverfuegung = 5;
public boolean isLeft, isRight, isUp, isDown;
public CuddleMuffin(){
  pos = new PVector(0,0);
  speed = new PVector(0,0);
}
    
void display(){
  rect(pos.x,pos.y,size,size);
}

public void move(){

 speed.x -= speed.x/speedyspeedreducer;
 speed.y -= speed.y/speedyspeedreducer;
 pos.x += speed.x;
 pos.y += speed.y;
}

}
