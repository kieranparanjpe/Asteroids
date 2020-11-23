
public class Asteroid extends MonoBehaviour
{
  
  public Asteroid()
  {
    transform.scale = new PVector(100, 100);
    transform.velocity = new PVector(random(1), random(1));

    PVector random = new PVector(random(width - transform.scale.x / 2), random(height - transform.scale.y / 2));
    
    int rand = (int)random(0, 4);
    
    switch(rand)
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
    }
    
    transform.position = random;
    
    colliders = new Collider[]
    {
      new BoxCollider(transform)
    };
  }
  
  @Override
  public void Update()
  {
    super.Update();
    pushMatrix();
    //Move();


    transform.position.add(transform.velocity);

    translate(transform.position.x, transform.position.y);
    rotate(transform.direction.heading());//angle = atan(direction.y/direction.x); 
    
    fill(100);
    stroke(0);
    rect(0, 0,  transform.scale.x, transform.scale.y);
    //image(image, 0, 0, transform.scale.x, transform.scale.y);
    
    popMatrix();    
  }
  
}
