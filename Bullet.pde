
public class Bullet extends MonoBehaviour
{
  public boolean isPlayer;
  
  public Bullet(PVector position, PVector velocity, boolean isPlayer)
  {
    transform.position = new PVector(position.x, position.y);
    transform.velocity = new PVector(velocity.x, velocity.y);
    transform.scale = new PVector(10, 10);

    transform.velocity.setMag(14);
    
    colliders = new Collider[]
    {
      new BoxCollider(transform)
    };
    
    for(EdgeCollider a : colliders[0].GetColliders())
      a .trigger = true;
      
      this.isPlayer = isPlayer;
  }
  
  @Override
  public boolean player()
  {
   return isPlayer; 
  }
  
  @Override
  public void Update()
  {
    super.Update();
    
    transform.position.add(transform.velocity);
    
    fill(0);
    //pushMatrix();
    
    //translate(transform.position.x, transform.position.y);
    
    noStroke();
    //rect(transform.position.x, transform.position.y, transform.scale.x, transform.scale.y);
    ellipse(transform.position.x, transform.position.y, (transform.scale.x), (transform.scale.y));
    //popMatrix();
  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {       
    if((other.getClass() == SpaceShip.class && isPlayer) || (other.getClass() == UFO.class && !isPlayer) || other.getClass() == Bullet.class)
    {
      return;
    }
   // println(other.getClass());
    Destroy(this);
  }
  
  @Override
  public void OnPhysicsCollide(EdgeCollider collider)
  {       
    
  }
}
