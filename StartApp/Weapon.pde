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

class Projectile{
 
  private PVector pos;
  
  
  public Projectile(PVector playerPos, PVector curserPos, double speed, float s){
    
    pos = playerPos;
    final float size = s;
    
    
    
  }
  
}





    
