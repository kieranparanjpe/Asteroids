
public class Walls extends MonoBehaviour
{
  public Walls()
  {
    colliders = new Collider[4];
    colliders[0] = new Collider(new PVector(width, height), new PVector(width, 0),
    new PVector(-1, 0));
    
    colliders[1] = new Collider(new PVector(width, height), new PVector(0, height),
    new PVector(0, -1));
    
    colliders[2] = new Collider(new PVector(0, height), new PVector(0, 0),
    new PVector(1, 0));
    
    colliders[3] = new Collider(new PVector(width, 0), new PVector(0, 0),
    new PVector(0, 1));
  }
 
}
