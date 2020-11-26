
public class SpaceShip extends MonoBehaviour
{
  public int lives = 15;
  
  public float maxSpeed = 4;
  
  private int fireRate = 100;//in ms
  private int lastFired = 0;
  
  private PImage image;
  
  public SpaceShip()
  {    
    transform.position = new PVector(width / 2, height / 2);
    transform.direction = new PVector(0.1, 0);
    transform.scale = new PVector(70, 70);
    transform.velocity = new PVector(0, 0);
    
    
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
    
    textSize(20);
    fill(255);
    text("Lives " + lives, 50, 50);

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
    
    if(lives <= 0)
    {
       state = States.GAMEOVER; 
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
      
      for(int i = 0; i < 5; i++)
      {
        Instantiate(new Fire(transform.position, transform.direction.copy().rotate(radians(random(-30, 30)))));

      }
     
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
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == AsteroidLarge.class || other.getClass() == AsteroidMedium.class || other.getClass() == AsteroidSmall.class)
      lives--;
  }
}
