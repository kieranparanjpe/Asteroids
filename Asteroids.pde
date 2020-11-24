
public ArrayList<MonoBehaviour> behaviours = new ArrayList<MonoBehaviour>();;

public void setup()
{
  size(800, 800);
  
  behaviours.add(new SpaceShip());
  behaviours.add(new Walls());
  //behaviours.add(new AsteroidSpawner());


    
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
          for(int k = 0; k < b.EdgeColliders().size(); k++) 
          {
            for(int l = 0; l < c.EdgeColliders().size(); l++) 
            {
              PVector v = new PVector(b.transform.velocity.x, b.transform.velocity.y);
               
              if(LinesIntersect(b.EdgeColliders().get(k).positionA, b.EdgeColliders().get(k).positionB, c.EdgeColliders().get(l).positionA, c.EdgeColliders().get(l).positionB))
              {
                float dp = DotProduct(v.normalize(), c.EdgeColliders().get(l).Normal());
                if(dp < 0)
                {
                  b.OnCollide(c, c.EdgeColliders().get(l));
                  c.OnCollide(b, b.EdgeColliders().get(k));
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

public MonoBehaviour Instantiate(MonoBehaviour behaviour)
{
    behaviours.add(behaviour);
    return behaviours.get(behaviours.size() - 1);
}

public void Destroy(MonoBehaviour behaviour)
{
  behaviours.remove(behaviour);
  behaviour.enabled = false;
}
