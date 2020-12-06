public class AsteroidMedium extends Asteroid
{
  public AsteroidMedium(PVector position)
  {
    super.init();

    transform.direction = new PVector(1, 0).rotate(radians(random(360)));
    transform.velocity = new PVector(0, 0);
    
    transform.position = position;
    transform.scale = new PVector(50, 50);

    colliders = new Collider[]
    {
      new BoxCollider(transform)
    }; 
    
    maxSpeed = 2;

  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == SpaceShip.class || other.getClass() == Bullet.class)
    {      
      Instantiate(new AsteroidSmall(transform.position.copy().add(transform.scale.copy().div(2))));
      Instantiate(new AsteroidSmall(transform.position.copy().sub(transform.scale.copy().div(2))));
      super.Die();

    }
  }
}
