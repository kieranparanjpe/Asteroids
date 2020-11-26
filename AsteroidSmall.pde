public class AsteroidSmall extends Asteroid
{
  public AsteroidSmall(PVector position)
  {
    transform.direction = new PVector(1, 0).rotate(radians(random(360)));
    transform.velocity = new PVector(0, 0);
    
    transform.position = position;
    transform.scale = new PVector(25, 25);

    colliders = new Collider[]
    {
      new BoxCollider(transform)
    }; 
    
    maxSpeed = 4;

  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == SpaceShip.class || other.getClass() == Bullet.class)
    {      
      Destroy(this);
    }
  }
}
