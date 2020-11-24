public class MonoBehaviour
{
  public boolean enabled = true;
  
  public Transform transform = new Transform();
  
  protected Collider[] colliders = new Collider[0];
  
  public ArrayList<EdgeCollider> EdgeColliders()
  {
    ArrayList<EdgeCollider> temp = new ArrayList<EdgeCollider>();
    for(int i = 0; i < colliders.length; i++)
    {
      for(int j = 0; j < colliders[i].GetColliders().length; j++)
      {
        temp.add(colliders[i].GetColliders()[j]);
      }
    }
    
    return temp;
  }
 
  public void Update()
  {
    for(int i = 0; i < colliders.length; i++)
    {
      colliders[i].DrawColliders(transform);
    }
  }
  
  public void OnCollide(MonoBehaviour other, EdgeCollider collider)
  {
    transform.velocity = new PVector(0, 0);
  }
}
