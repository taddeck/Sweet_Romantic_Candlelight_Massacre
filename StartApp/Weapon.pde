abstract class Weapon{
 
  private int ammo;
  private int damage;
  
  public void shoot(int x, int y){};
  
  public int getAmmo(){
    return this.ammo;
  }
  
  public int getDamage(){
    return this.damage;
  }
  
 
}


class Mercury extends Weapon{
 
  
  
}

class Projectile implements Movable, Drawable{
 
  private PVector pos;
  private PVector targetPos;
  private float size;
  private double speed;
  private PVector direc;
  
  
  
  
  public Projectile(PVector playerPos, PVector curserPos, double speed, float size){
    
    this.pos = playerPos;
    this.speed = speed;
    this.size = size;
    
    this.direc = (this.pos.sub(this.targetPos)).normalize();
    
  }
  
  
  public void move(){
    
    this.pos.add(this.direc);
    
  }
  
  public void draw(){
   
    ellipse(this.pos.x, this.pos.y, this.size, this.size);
  }
  
}





    
