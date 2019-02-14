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

class Projectile implements Drawable,Movable{
 
  private PVector postiones;
  private PVector targetPos;
  private float size = 10;
  private float speed;
  private PVector direc;
  
  public Projectile(float playerPosx,float playerPosy){
    postiones = new PVector(playerPosx,playerPosy);
    this.direc = new PVector(mouseX - width/2 - playerPosx,mouseY - height/2 - playerPosy).normalize();
  }
  
  public void move(){
    PVector blabla = new PVector(direc.x,direc.y);
    postiones.add(blabla.mult(10));
  }
  
  public void display(){
    ellipse(this.postiones.x, this.postiones.y, size, size);
  }
}





    
