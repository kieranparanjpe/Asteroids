
public class AsteroidSpawner extends MonoBehaviour
{
  public ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  
  public int maxAsteroids = 5;
  
  @Override
  public void Update()
  {
    if(asteroids.size() < maxAsteroids)
    {
      Asteroid a = new Asteroid();
      
      asteroids.add(a);
      Instantiate(a);
    }
      
    for(int i = 0; i < asteroids.size(); i++)
    {
      if(!asteroids.get(i).enabled)
      {
        asteroids.remove(asteroids.get(i));
      }
    }  
   }
}
