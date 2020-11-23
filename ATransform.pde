public class Transform
{
  public PVector position;
  public PVector direction;
  public PVector scale;
  public PVector velocity;
  
  public Transform()
  {
    position = new PVector(0, 0);
    direction = new PVector(0, 0);
    scale = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
}
