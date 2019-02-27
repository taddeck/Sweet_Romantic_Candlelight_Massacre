class NiceGuyManager{
 
  PVector playerPos;
  float spawnChance;
  
  
  NiceGuyManager(float spawnChance){
     
     this.spawnChance = spawnChance;
  }
  
  
  public void spawn(){
  
    if(random(0, 100) <= this.spawnChance){
      
       NiceGuy ng = new NiceGuy(muffi.pos);
       drawables.add(ng);
       movables.add(ng);
    }
    
  }
  
  
  
  
}

class NiceGuy implements Drawable, Movable{
  
  private PVector pos;
  private PVector playerPos;
  private int health;
  private float speed;
  private PVector targetPos;
  
  NiceGuy(PVector playerPos){
    
   this.playerPos = playerPos;
   this.reset();
   this.targetPos = playerPos.copy().add(muffi.speed.copy().normalize().mult(pos.dist(this.playerPos)));
   
  }
  
  
  PVector randomPos(){
    
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
  
  public void display(){
    fill(255, 0, 0);
    rect(pos.x, pos.y, 30, 30);
  }
  
  public void move(){
    
    //position infront of the player
    this.targetPos = playerPos.copy().add(muffi.speed.copy().mult( (pos.dist(this.playerPos) / 1.5 )));
    
    if(this.health <= 0 || pos.dist(muffi.pos) > width * 2) this.reset();
    
    this.pos.add( (this.targetPos.copy().sub(this.pos.copy())).normalize().mult(this.speed));
    
  }
  
  private void reset(){
    
   this.pos = randomPos();
   this.health = 3;
   this.speed = 3;
    
  }
  
  
  
  

  
  
}
