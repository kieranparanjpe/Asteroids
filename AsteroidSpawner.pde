
public class AsteroidSpawner extends MonoBehaviour
{
  public ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  
  public int maxAsteroids = 5;
  
  public AsteroidSpawner()
  {
    while(asteroids.size() < maxAsteroids)
    {
      Asteroid a = new AsteroidLarge();
      
      asteroids.add(a);
      Instantiate(a);
    }
  }
  
  @Override
  public void Update()
  { 
    for(int i = 0; i < asteroids.size(); i++)
    {
      if(!asteroids.get(i).enabled)
      {
        asteroids.remove(asteroids.get(i));
      }
    }  
   }
}
