class Projectile implements Drawable,Movable{
 
  
  private HashMap<String, Integer> planet = new HashMap<String, Integer>();
  private PVector postiones;
  private float size;
  private float speed;
  private PVector direc;
  private double increase;
  private boolean isChangening;
  private boolean isspread;
  private float damage;
  private PVector playerHead;
  
  
  public Projectile(PVector playerPos, PVector playerHead, String planet){
        
      this.direc = new PVector(mouseX - width/2,mouseY - height/2).normalize();
      this.isChangening = false;
      this.size = 10;
      this.isspread = false;
      this.increase = 0;
      this.postiones = playerPos.copy();
      this.playerHead = playerHead.copy();
      
      
       switch(planet){
         
         case "Mercury": 
           this.damage = 1;
           this.size = 10;
           this.speed = 30;
           break;
           
         case "Venus":
           this.speed = 10;
           break;

         case "Earth":
           this.damage = 2;
           this.size = 30;
           this.isChangening = true;
           this.increase = 2;
           this.speed = 30;
           break;

         case "Mars":
           this.damage = 3;
           this.increase = 4;
           this.speed = 30;
           break;
           
         case "Jupiter":
           this.speed = 30;
           break;
           
         case "Saturn":
           this.damage = 2;
           this.isspread = true;
           this.speed =30;
           break;
           
         case "Uranus":
         
           this.speed = 30;
           break;  
           
         case "Neptune":
           this.damage = 0.5; 
           this.speed = 30;
           this.increase = 5;
           break;  
           
         default: 
           
            this.speed = 30;
            break;
         
       }
       
       
  }
  
  public void display(){
     image(img,this.postiones.x,this.postiones.y,size,size);

  }
  
  public void move(){
    PVector temp = new PVector(direc.x,direc.y);
    postiones.add(temp.mult(this.speed).add(this.playerHead));
  }
  
  /* public void display(){
    
    this.size += this.increase;
    
    if(this.isChangening) if(frameCount % 30 == 0) this.increase *= (-1);
    
    fill(255,40,40);
    stroke(255,40,40);
    strokeWeight(5);
    ellipse(this.postiones.x, this.postiones.y, size, size);
  }
  */
  
  public float getDamage(){
   return this.damage; 
  }
  
  public PVector getPos(){
    return this.postiones;
  }
  
  public boolean outOfRange(PVector pos){
   
    if(this.postiones.x > pos.x + (width * 3) || this.postiones.x < pos.x - (width * 3)
        || this.postiones.y > pos.y + (height * 3) || this.postiones.y < pos.y - (height * 3)){
      return true;
    } else {
      return false;
    }
    
  }
  
    
}





    
