
public class Walls extends MonoBehaviour
{
  public Walls()
  {
    transform.position = new PVector(width / 2, height / 2);
    transform.scale = new PVector(width, height);

    
    
    colliders = new Collider[]
    {
      new BoxCollider(transform, true)
    };
  }
 
}
