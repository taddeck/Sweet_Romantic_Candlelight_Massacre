
//Datastructure for holding stars
class Stars{
  
  Stars(int starNum, PVector playerPos){
    
    for(int i = 0; i < starNum; i++){
      
      Star star = new Star(playerPos);
      drawables.add(star);
      movables.add(star); 
    }
  }
  
}

//actual stars
class Star implements Drawable, Movable{
  
  private PVector pos;
  private PVector playerPos;
  private PVector playerPosLast;
  private float depth; //simulated through size
  private float increase; //increase in size per frame
  private PVector speed; //speed increase per frame, simulates the relative view speed aka the more to the edge the faster
  

  
  Star(PVector playerPos){
    
    this.playerPos = playerPos;
    this.playerPosLast = playerPos.copy();
    this.reset(false);
  }
  
  //generates the spawnpositon based on the playerposition
  private PVector genSpawnPosFirst(){
    
    int x = (int)random(this.playerPos.x - width + 1, this.playerPos.x + width);
    int y = (int)random(this.playerPos.y - height + 1, this.playerPos.y + height);
    PVector temp = new PVector(x, y);
    
    return temp;
  }
  
  
  private PVector genSpawnPos(){
    
    PVector posi = new PVector(7000, 7000);
    double chance = random(4);
    
    if(chance < 1){
      //right
      float px = this.playerPos.x + ((width / 2) + 40); 
      float py = this.playerPos.y + random(-(height / 2), (height / 2));
      posi.set(px, py);
      
    } else if(chance >= 1 && chance < 2){
      //left
      float px = this.playerPos.x - ((width / 2) + 40); 
      float py = this.playerPos.y + random(-(height / 2), (height / 2));
      posi.set(px, py);
      
    } else if(chance >= 2 && chance < 3){
      //up
      float px = this.playerPos.x + random(-(width / 2), (width / 2));
      float py = this.playerPos.y + (height / 2 + 40);
      posi.set(px, py);
      
    } else if(chance > 3){
      //down
      float px = this.playerPos.x + random(-(width / 2), (width / 2));
      float py = this.playerPos.y - (height / 2 + 40);
      posi.set(px, py);
    }
    
   
    return posi;
    
  }
  
  
  void display(){
    
    fill(255);
    ellipse(this.pos.x, this.pos.y, this.depth, this.depth);
    
  }
  
  void move(){
    
     if(this.outOfView()){
        
       this.reset(true);
       
     } else if(this.playerPos != this.playerPosLast){
         
         this.pos.add(muffi.speed.copy().div(this.depth).add(this.speed));
     }
  }
  
  
  
  //resets the position
  void reset(boolean trueReset){
    
    this.speed = new PVector(0, 0);
    
    if(random(1) > 0.99){
      //star
      this.depth = random(50, 70);
    } else {
      if(random(1) > 0.95) this.speed = new PVector(random(-50, 50), random(-50, 50));
      
    this.depth = random(1.1, 10);
    }
    
    if(trueReset)this.pos = genSpawnPos();
    else this.pos = genSpawnPosFirst();
    
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
