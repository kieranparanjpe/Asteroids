
public ArrayList<MonoBehaviour> behaviours = new ArrayList<MonoBehaviour>();;

public void setup()
{
  size(800, 800);
  
  behaviours.add(new SpaceShip());
  behaviours.add(new Walls());

    
  rectMode(CENTER);
  imageMode(CENTER);
}

public void draw()
{
  background(0);
  
  for(int i = 0; i < behaviours.size(); i++)
  {
    MonoBehaviour b = behaviours.get(i);
    
    if(b.enabled)
    {
      for(int j = 0; j < behaviours.size(); j++)
      {
        MonoBehaviour c = behaviours.get(j);
        
        if(b != c)
        {
          for(int k = 0; k < b.colliders.length; k++) 
          {
            for(int l = 0; l < c.colliders.length; l++) 
            {
              PVector v = new PVector(b.transform.velocity.x, b.transform.velocity.y);
               
              if(LinesIntersect(b.colliders[k].positionA, b.colliders[k].positionB, c.colliders[l].positionA, c.colliders[l].positionB))
              {
                float dp = DotProduct(v.normalize(), c.colliders[l].Normal());
                if(dp < 0)
                {
                  b.transform.velocity = new PVector(0, 0);
                  c.transform.velocity = new PVector(0, 0);
                }
              }
            }
          }
        }
      }
      b.Update();
    }
  } 
}

public class MonoBehaviour
{
  public boolean enabled = true;
  
  public Transform transform = new Transform();;
  public Collider[] colliders = new Collider[0];
 
  public void Update()
  {
    for(int i = 0; i < colliders.length; i++) 
    {
      PVector tempPositionA = new PVector(transform.position.x, transform.position.y);
      PVector tempPositionB = new PVector(transform.position.x, transform.position.y);
      colliders[i].positionA = tempPositionA.add(colliders[i].offsetA);
      colliders[i].positionB = tempPositionB.add(colliders[i].offsetB);
      
      stroke(255);
      line(colliders[i].positionA.x, colliders[i].positionA.y, colliders[i].positionB.x, colliders[i].positionB.y);
    }
  }
}

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

public class Collider
{
  PVector positionA;
  PVector positionB;
  PVector offsetA;
  PVector offsetB;
  
  PVector defaultNormal;
  
  public Collider(PVector offsetA, PVector offsetB)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
  }
  
  public Collider(PVector offsetA, PVector offsetB, PVector normal)
  {
    this.offsetA = offsetA;
    this.offsetB = offsetB;
    
    defaultNormal = normal;
    
    positionA = new PVector(0, 0);
    positionB = new PVector(0, 0);
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
