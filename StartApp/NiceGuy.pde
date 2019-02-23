class NiceGuy implements Drawable{
  
  private PVector pos;
  private PVector playerPos;
  private int health;
  
  NiceGuy(PVector playerPos){
    
   this.playerPos = playerPos;
   this.pos = randomPos();
   this.health = 3;
   print(this.pos.x + " " + this.pos.y);
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
  
  
  
}
