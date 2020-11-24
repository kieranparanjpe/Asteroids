
public class AsteroidSpawner extends MonoBehaviour
{
  public ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  
  public int maxAsteroids = 5;
  
  @Override
  public void Update()
  {
    if(asteroids.size() < maxAsteroids)
      asteroids.add((Asteroid)Instantiate(new Asteroid()));
      
    for(int i = 0; i < asteroids.size(); i++)
    {
      if(asteroids.get(i) == null)
        println("null");
    }
    
    print(asteroids.get(0).transform.position.x);
  }
}
