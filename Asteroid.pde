
public class Asteroid extends MonoBehaviour
{
  public int d = 0;
  
  
  public Asteroid()
  {
    transform.scale = new PVector(40, 40);
    transform.direction = new PVector(0.1, 0).rotate(radians(random(360)));
    transform.velocity = new PVector(0, 0);

    PVector random = new PVector(random(width - transform.scale.x / 2), random(height - transform.scale.y / 2));
    
    int rand = (int)random(0, 4);
    
    /*switch(rand)
    {
      case(0):
        random.x = transform.scale.x / 2;
        break;
      case(1):
        random.x = width - transform.scale.x / 2;
        break;
      case(2):
        random.y = 0 + transform.scale.y / 2;
        break;
      case(3):
        random.y = height - transform.scale.y / 2;
        break;
    }*/
    
    transform.position = random;
    transform.scale = new PVector(100, 100);

    colliders = new Collider[]
    {
      new BoxCollider(transform)
    };
}
  
  @Override
  public void Update()
  {
    d++;
    super.Update();
    pushMatrix();
    //Move();


    transform.position.add(transform.velocity);
    
    if(transform.velocity.mag() < 3)
    transform.velocity.add(transform.direction);

    translate(transform.position.x, transform.position.y);
    rotate(transform.direction.heading());//angle = atan(direction.y/direction.x); 
    
    fill(100);
    stroke(0);
    rect(0, 0,  transform.scale.x, transform.scale.y);
    //image(image, 0, 0, transform.scale.x, transform.scale.y);
    
    popMatrix();    
  }
  
  @Override
  public void OnPhysicsCollide(EdgeCollider collider)
  {

    super.OnPhysicsCollide(collider);
    PVector n = collider.Normal().copy();
    
    transform.position.add(n.setMag(2));
    transform.direction.rotate(random(0, 6));
  }
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == SpaceShip.class || other.getClass() == Asteroid.class)
    {
      Destroy(this);

      return;
    }
  }
  
}
