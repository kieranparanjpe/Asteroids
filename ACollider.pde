public class Collider
{
  public boolean trigger;
  
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
      
      PVector tempOffsetA = new PVector(edgeCollider.offsetA.x, edgeCollider.offsetA.y);
      PVector tempOffsetB = new PVector(edgeCollider.offsetB.x, edgeCollider.offsetB.y);

      
      //edgeCollider.positionA = tempPositionA.add(tempOffsetA);
      //edgeCollider.positionB = tempPositionB.add(tempOffsetB);
      
      edgeCollider.positionA = (tempOffsetA.add(transform.velocity)); 
      edgeCollider.positionB = (tempOffsetB.add(transform.velocity)); 
      
      pushMatrix();
      
      translate(transform.position.x, transform.position.y);
      
      edgeCollider.positionA.rotate(transform.direction.heading());

      edgeCollider.positionB.rotate(transform.direction.heading() /*- edgeCollider.positionB.heading()*/);
      


      popMatrix();
      
      edgeCollider.positionA.add(tempPositionA); 
      edgeCollider.positionB.add (tempPositionB); 

      stroke(255, 0, 0);
      //line(edgeCollider.positionA.x, edgeCollider.positionA.y, edgeCollider.positionB.x, edgeCollider.positionB.y);
      
      //stroke(0, 0, 255);
      //line(edgeCollider.positionA.x, edgeCollider.positionA.y, edgeCollider.Normal().x, edgeCollider.Normal().y);

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
    colliders = new EdgeCollider[4];
    colliders[0] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(1, 0), reverseNormal);
    
    colliders[1] = new EdgeCollider(new PVector(transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, transform.scale.y / 2),
    new PVector(0, 1), reverseNormal);
    
    colliders[2] = new EdgeCollider(new PVector(-transform.scale.x / 2, transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(-1, 0), reverseNormal);
    
    colliders[3] = new EdgeCollider(new PVector(transform.scale.x / 2, -transform.scale.y / 2), new PVector(-transform.scale.x / 2, -transform.scale.y / 2),
    new PVector(0, -1), reverseNormal);
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
  
  boolean reverse;
  
  public EdgeCollider(PVector offsetA, PVector offsetB)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
  }
  
  public EdgeCollider(PVector offsetA, PVector offsetB, boolean reverse)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
    
    this.reverse = reverse;
  }
  
  public EdgeCollider(PVector offsetA, PVector offsetB, PVector normal)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    defaultNormal = normal;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
  }
  
  public EdgeCollider(PVector offsetA, PVector offsetB, PVector normal, boolean reverse)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    defaultNormal = normal;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
    
    this.reverse = reverse;
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
    
    PVector n;
    
    if(rise * run == 0)
      n = defaultNormal.copy();
    else
      n = new PVector(rise, -run).normalize();
      
      if(reverse)
        n.mult(-1);
      
      return n;
  }
  
}
