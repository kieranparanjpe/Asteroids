
public class SpaceShip extends MonoBehaviour
{
  public int lives;
  
  public float maxSpeed = 8;
  
  private int fireRate = 500;//in ms
  private int lastFired = 0;
  
  private PImage image;
  
  public SpaceShip()
  {    
    transform.position = new PVector(width / 2, height / 2);
    transform.direction = new PVector(0.1, 0);
    transform.scale = new PVector(70, 70);
    transform.velocity = new PVector(0, 0);
    
    lives = 3;
    
    colliders = new Collider[]
    {
      new BoxCollider(transform, false)
    };

    
    image = loadImage("SpaceShip.png");
  }
  
  @Override
  public void Update()
  {    
    super.Update();

    pushMatrix();
    Move();

    translate(transform.position.x, transform.position.y);
    rotate(transform.direction.heading());//angle = atan(direction.y/direction.x); 
    
    fill(0);
    image(image, 0, 0, transform.scale.x, transform.scale.y);
    
    popMatrix();    
    

    
    if(q && millis() - fireRate > lastFired)
    {
      Instantiate(new Bullet(transform.position, transform.direction));
      lastFired = millis();
    }

  }  //<>// //<>// //<>//
  
  public void Move()
  {    
    transform.position.add(transform.velocity);
   // transform.direction = (transform.angularVelocity.copy());
    transform.direction.rotate(transform.angularVelocity.heading());
  //  println(transform.angularVelocity);
    
    if(a)
    {
      transform.angularVelocity = PVector.fromAngle(-radians(5));
    }
    if(d)
    {
      transform.angularVelocity = PVector.fromAngle(radians(5));
    }
    
    if(!a && !d)
    {
      transform.angularVelocity = PVector.fromAngle(radians(0));
    }
    
    if(w && transform.velocity.mag() <= maxSpeed)
    {
      transform.velocity.add(transform.direction);
    }
    if(s && transform.velocity.mag() <= maxSpeed)
    {
      transform.velocity.sub(transform.direction);
    }
    
    
    if(transform.velocity.mag() > maxSpeed)
    {
      transform.velocity.setMag(maxSpeed);
    }
  }
  
}
