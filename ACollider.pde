public class Collider
{
  public EdgeCollider[] GetColliders()
  {
    return new EdgeCollider[0]; 
  } 
  
  public void DrawColliders(Transform transform)
  {
    for(int i = 0; i < GetColliders().length; i++)
    {
      EdgeCollider edgeCollider = GetColliders()[i];
      
      PVector tempPositionA = new PVector(transform.position.x, transform.position.y);
      PVector tempPositionB = new PVector(transform.position.x, transform.position.y);
      edgeCollider.positionA = tempPositionA.add(edgeCollider.offsetA);
      edgeCollider.positionB = tempPositionB.add(edgeCollider.offsetB);

      stroke(255);
      line(edgeCollider.positionA.x, edgeCollider.positionA.y, edgeCollider.positionB.x, edgeCollider.positionB.y);
    }
  }
}

public class BoxCollider extends Collider
{
  private EdgeCollider[] colliders = new EdgeCollider[0];
  
  public BoxCollider(Transform transform)
  {
    colliders = new EdgeCollider[4];
    colliders[0] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(1, 0));
    
    colliders[1] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, transform.scale.y / 2),
    new PVector(0, 1));
    
    colliders[2] = new EdgeCollider(new PVector(-transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(-1, 0));
    
    colliders[3] = new EdgeCollider(new PVector(transform.scale.x / 2, -transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(0, -1));
  }
  
  public BoxCollider(Transform transform, boolean reverseNormal)
  {
    if(!reverseNormal)
      return;
    
    colliders = new EdgeCollider[4];
    colliders[0] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(-1, 0));
    
    colliders[1] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, transform.scale.y / 2),
    new PVector(0, -1));
    
    colliders[2] = new EdgeCollider(new PVector(-transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(1, 0));
    
    colliders[3] = new EdgeCollider(new PVector(transform.scale.x / 2, -transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(0, 1));
  }
  
  public EdgeCollider[] GetColliders()
  {
    return colliders; 
  }
}

public class EdgeCollider extends Collider
{
  PVector positionA;
  PVector positionB;
  PVector offsetA;
  PVector offsetB;
  
  PVector defaultNormal;
  
  public EdgeCollider(PVector offsetA, PVector offsetB)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
  }
  
  public EdgeCollider(PVector offsetA, PVector offsetB, PVector normal)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    defaultNormal = normal;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
  }
  
  @Override
  public EdgeCollider[] GetColliders()
  {
    return new EdgeCollider[] {this} ;
  }
  
  public PVector Normal()
  {
    float rise = positionA.y - positionB.y;
    float run = positionA.x - positionB.x;
    
    if(rise * run == 0)
      return defaultNormal;
    
    return new PVector(rise, -run).normalize();
  }
  
}
