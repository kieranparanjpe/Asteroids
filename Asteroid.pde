
public abstract class Asteroid extends MonoBehaviour
{
  public double maxSpeed;
  
  @Override
  public void Update()
  {
    super.Update();
    pushMatrix();

    transform.position.add(transform.velocity);
    
    if(transform.velocity.mag() < maxSpeed)
      transform.velocity.add(transform.direction);

    translate(transform.position.x, transform.position.y);
    rotate(transform.direction.heading());//angle = atan(direction.y/direction.x); 
    
    fill(100);
    stroke(0);
    rect(0, 0,  transform.scale.x, transform.scale.y);
    
    popMatrix();    
  }
  
  @Override
  public void OnPhysicsCollide(EdgeCollider collider)
  {
    super.OnPhysicsCollide(collider);
    PVector n = collider.Normal().copy();
    
    transform.position.add(n.setMag(2));
    transform.direction.rotate(radians(random(150, 210)));
  }  
}
