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
  private float speed;
  private PVector direc;
  
  
  
  
  public Projectile(PVector playerPos, PVector curserPos, float speed, float size){
    
    this.pos = playerPos;
    this.targetPos = curserPos;
    this.speed = speed;
    this.size = size;
    
    this.direc = (this.targetPos.sub(this.pos)).normalize();
    
  }
  
  
  public void move(){
    
    this.pos.add(this.direc.mult(speed));
    
  }
  
  public void draw(){
   
    ellipse(this.pos.x, this.pos.y, this.size, this.size);
  }
  
}





    
