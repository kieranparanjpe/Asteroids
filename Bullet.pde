
public class Bullet extends MonoBehaviour
{
  PVector position;
  PVector velocity;
  
  public Bullet(PVector position, PVector velocity)
  {
    this.position = new PVector(position.x, position.y);
    this.velocity = new PVector(velocity.x, velocity.y);
    
    this.velocity.setMag(5);
    
    colliders = new Collider[]
    {
      new BoxCollider(transform, false)
    };
  }
  
  @Override
  public void Update()
  {
    position.add(this.velocity);
    
    fill(200);
    rect(position.x, position.y, 10, 10);
  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {    
    if(other.getClass() == SpaceShip.class || other.getClass() == Bullet.class)
    {
      return;
    }
    println("Destroy");
    //Destroy(this);
  }
}
