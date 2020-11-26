
public class Fire extends MonoBehaviour
{
  
  private int spawned;
  private int lifeSpan;
  
  private color colour;
  
  public Fire(PVector position, PVector direction, color c)
  {
    transform.direction = direction.copy().rotate(radians(180));
    transform.position = position.copy().add(transform.direction.copy().setMag(30));
    transform.velocity = new PVector(1, 0);
    
    spawned = millis();
    
    lifeSpan = (int)random(200, 400);
    
    colour = c;
  }
  
  @Override
  public void Update()
  {
    if(millis() > spawned + lifeSpan)
    {
      Destroy(this);
    }
    
    transform.position.add(transform.velocity);
    pushMatrix();
    
    translate(transform.position.x, transform.position.y);
    rotate(transform.direction.heading());
    
    fill(colour);
    noStroke();
    circle(0, 0, 5);
    
    popMatrix();
    
    transform.velocity = transform.direction.copy().setMag(3);
  }
  
}
