class Projectile implements Drawable,Movable{
 
  
  private HashMap<String, Integer> planet = new HashMap<String, Integer>();
  private PVector postiones;
  private PVector targetPos;
  private float size;
  private float speed;
  private PVector direc;
  private double increase;
  private boolean isspread;
  private boolean isChangening;
  
  
  public Projectile(float playerPosx,float playerPosy, String planet){
      
      this.isChangening = false;
      this.size = 10;
      this.isspread = false;
      this.increase = 0;
      postiones = new PVector(playerPosx,playerPosy);
      PVector targetPos = new PVector(mouseX, mouseY);
      
     
       switch(planet){
        
         
         case "Mercury": 
           this.speed = 10;
           break;
           
         case "Venus":
           this.speed = 10;
           break;

         case "Earth":
           this.size = 5;
           this.isChangening = true;
           this.increase = 2;
           this.speed = 10;
           break;

         case "Mars":
           this.increase = 2;
           this.speed = 10;
           break;
           
         case "Jupiter":
           this.speed = 10;
           break;
           
         case "Saturn":
           this.isspread = true;
           this.speed = 10;
           break;
           
         case "Uranus":
         
           this.speed = 10;
           break;  
           
         case "Neptune":
           this.speed = 20;
           this.increase = 5;
           
           break;  
           

         default: 
           this.speed = 10;
            break;
         
         
       }
       
       this.direc = new PVector(mouseX - width/2 - playerPosx,mouseY - height/2 - playerPosy).normalize();

 
  }
  
  public void move(){
    PVector temp = new PVector(direc.x,direc.y);
    postiones.add(temp.mult(this.speed));
  }
  
  public void display(){
    
    this.size += this.increase;
    
    if(this.isChangening) if(frameCount % 30 == 0) this.increase *= (-1);
    println(this.increase);
    
    fill(255,40,40);
    stroke(255,40,40);
    strokeWeight(5);
    ellipse(this.postiones.x, this.postiones.y, size, size);
  }
}





    
