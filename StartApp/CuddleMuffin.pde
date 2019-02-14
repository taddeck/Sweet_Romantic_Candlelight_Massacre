class CuddleMuffin implements Drawable,Movable{
float xoff = 0.0;
float yoff = 0.0;
PVector pos;
PVector speed;
float speedyspeed = 0.7;
float speedyspeedreducer = 100;
int size = 20;
float speedreducerino = 1;
public boolean isLeft, isRight, isUp, isDown;
public CuddleMuffin(){
  pos = new PVector(0,0);
  speed = new PVector(0,0);
}

void draw(){
  xoff += 0.1;
  rect(pos.x,pos.y,size,size);
}

void move(){
   if(isUp){
     speed.y -= speedyspeed;
   }
   if(isLeft){
     speed.x -= speedyspeed;
   }
   if(isDown){
     speed.y += speedyspeed;
   }
   if(isRight){
     speed.x += speedyspeed;
   }

 speed.x -= speed.x/speedyspeedreducer;
 speed.y -= speed.y/speedyspeedreducer;
 pos.x += speed.x;
 pos.y += speed.y;
}

}
