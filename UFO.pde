
public class UFO extends MonoBehaviour
{
  
  private int spawned;
  
  private int shoot = 1000;
  
  public UFO()
  {
    spawned = millis();
    
     PVector random = new PVector(random(0, width), random(0, height)); 
     transform.direction = new PVector(1, 0);
     transform.scale = new PVector(40, 40);
     
     int rand = (int)random(0, 4);
     
     switch(rand)
     {
        case(0):
          random.x = transform.scale.x;
          transform.direction.rotate(radians(random(-30, 30)));
          break;
        case(1):
          random.x = width - transform.scale.x;
          transform.direction.rotate(radians(random(150, 210)));
          break;
        case(2):
          random.y = transform.scale.y;
          transform.direction.rotate(radians(random(50, 120)));
          break;
        case(3):
          random.y = height - transform.scale.x;
          transform.direction.rotate(radians(random(250, 300)));
          break;
     }
     
     transform.position = random;
     
    colliders = new Collider[]
    {
      new BoxCollider(transform, false)
    };

  }
  
  @Override
  public void Update()
  {
    super.Update();
    
    transform.position.add(transform.velocity);
    transform.velocity = transform.direction.copy().setMag(5);
    
    fill(255, 0, 0);
    rect(transform.position.x, transform.position.y, transform.scale.x, transform.scale.y);
    
    if(millis() > spawned + shoot)
    {
      //PVector b = PVector.fromAngle(transform.direction.heading() + PVector.angleBetween(transform.position, behaviours.get(0).transform.position));
      PVector b = behaviours.get(0).transform.position.copy().sub(transform.position);
      b.normalize();
      Instantiate(new Bullet(transform.position, b, false));
      shoot = 10000;
    }
  }
  
  @Override
  public void OnPhysicsCollide(EdgeCollider collider)
  {
    Destroy(this);
  }  
  
  @Override
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    if(other.getClass() == Bullet.class && !other.player())
      return;
    
    Destroy(this);
  }  
}
