/*class NiceGuyManager{
 
  PVector playerPos;
  ArrayList<NiceGuy> niceGuysArray;
  float spawnChance;
  
  
  NiceGuyManager(PVector playerPos){
     
     this.playerPos = playerPos;
     //this.niceGuysArray = new ArrayList<>();
     this.spawnChance = 0.01;
    
  }
  
  
  
  
}

class NiceGuy implements Drawable, Movable{
  
  private PVector pos;
  private PVector playerPos;
  private int health;
  private float speed;
  
  NiceGuy(PVector playerPos){
    
   this.playerPos = playerPos;
   this.pos = randomPos();
   this.health = 3;
   this.speed = 3;
   
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
    
    if(health <= 0) this.reset();
    
     this.pos.add( (this.playerPos.copy().sub(this.pos.copy())).normalize().mult(this.speed));
    
  }
  
  

  
  
}
*/
