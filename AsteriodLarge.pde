
public class AsteroidLarge extends Asteroid
{
  public AsteroidLarge()
  {
    transform.scale = new PVector(100, 100);
    transform.direction = new PVector(1, 0).rotate(radians(random(360)));
    transform.velocity = new PVector(0, 0);

    PVector random = new PVector(random(width - transform.scale.x / 2), random(height - transform.scale.y / 2));
    
    
    transform.position = random;

    colliders = new Collider[]
    {
      new BoxCollider(transform)
    }; 
    
    maxSpeed = 1;

  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == SpaceShip.class || other.getClass() == Bullet.class)
    {      
      Instantiate(new AsteroidMedium(transform.position.copy().add(transform.scale.copy().div(2))));
      Instantiate(new AsteroidMedium(transform.position.copy().sub(transform.scale.copy().div(2))));
      Destroy(this);
    }
  }
}
