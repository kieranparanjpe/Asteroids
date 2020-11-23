
public class SpaceShip extends MonoBehaviour
{
  public int lives;
  
  public float maxSpeed = 4;
  
  private PImage image;
  
  public SpaceShip()
  {    
    transform.position = new PVector(width / 2, height / 2);
    transform.direction = new PVector(0.1, 0);
    transform.scale = new PVector(70, 70);
    transform.velocity = new PVector(0, 0);
    
    lives = 3;
    
    colliders = new Collider[4];
    colliders[0] = new Collider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(1, 0));
    
    colliders[1] = new Collider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, transform.scale.y / 2),
    new PVector(0, 1));
    
    colliders[2] = new Collider(new PVector(-transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(-1, 0));
    
    colliders[3] = new Collider(new PVector(transform.scale.x / 2, -transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(0, -1));

    
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
    

    
    if(q)
    {
      behaviours.add(new Bullet(transform.position, transform.direction));
    }

  }  //<>//
  
  public void Move()
  {    
    transform.position.add(transform.velocity);
    
    if(a)
    {
      transform.direction.rotate(-radians(5));
    }
    if(d)
    {
      transform.direction.rotate(radians(5));
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
