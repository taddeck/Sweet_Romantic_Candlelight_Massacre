class Stars{
  
  
  Stars(int starNum, PVector playerPos){
    
    for(int i = 0; i < starNum; i++){
      
      Star star = new Star(playerPos);
      drawables.add(star);
      movables.add(star);
      
    }
    
    
  }
  
  
  
}


class Star implements Drawable, Movable{
  
  PVector pos;
  PVector playerPos;
  float depth; //simulated through size
  float increase; //increase in size per frame
  float speed; //speed increase per frame, simulates the relative view speed aka the more to the edge the faster

  
  
  Star(PVector playerPos){
    
    this.playerPos = playerPos;
    this.reset();
    
  }
  
  
  
  PVector genSpawnPos(){
    
    int x = (int)random(this.playerPos.x - width + 1, this.playerPos.x + width);
    int y = (int)random(this.playerPos.y - height + 1, this.playerPos.y + height);
    PVector temp = new PVector(x, y);
    
    return temp;
  }
  
  
  void display(){
    
    fill(255);
    ellipse(this.pos.x, this.pos.y, this.depth, this.depth);
    
  }
  
  void move(){
    
     if(this.depth >= 50 || this.outOfView()){
        
       this.reset();
       
     } else {
       
       this.depth += this.increase;
       this.pos.add( (this.pos.copy().sub(this.playerPos.copy())).normalize().mult(this.speed));
       this.speed += 0.002;
       
       
     }
    
  }
  
  
  
  
  void reset(){
    
    this.depth = random(5);
    this.pos = genSpawnPos();
    this.increase = random(0.1);
    this.speed = random(2, 4);
    
  }
  
  
  boolean outOfView(){
   
    if(pos.x < this.playerPos.x - width){
      //out of view left side
      return true; 
    } else if(pos.x > this.playerPos.x + width){
      //out of view right side
      return true;
    } else if (pos.y < this.playerPos.y - height){
      //out of view bottom
      return true;
    } else if(pos.y > this.playerPos.y + height){
     //out of view top 
     return true;
    } else {
      return false;
    }
    
  }
  
  
  
  
  
}
