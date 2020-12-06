
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
    //rect(0, 0,  transform.scale.x, transform.scale.y);
    image(asteroid, 0, 0, transform.scale.x, transform.scale.y);
    
    popMatrix(); 
    
    if(transform.position.x > width + 120 || transform.position.y > height + 120 || transform.position.x <  -120 || transform.position.y < - 120)
    {
      ast--;
      Destroy(this);      
    }
  }
  
  public void init()
  {
   ast++; 
  }
  
  @Override
  public void OnPhysicsCollide(EdgeCollider collider)
  {
    super.OnPhysicsCollide(collider);
    PVector n = collider.Normal().copy();
    
    transform.position.add(n.setMag(2));
    transform.direction.rotate(radians(random(60, 120)));
  }  
  
  public void Die()
  {
    ast--;
    
   for(int i = 0; i < 50; i++)
   {
     Instantiate(new Fire(transform.position, transform.direction.copy().rotate(radians(random(0, 360))),  color(100)));
   }
    
    Destroy(this);
  }
}
