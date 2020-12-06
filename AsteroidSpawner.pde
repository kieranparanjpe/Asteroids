
public class AsteroidSpawner extends MonoBehaviour
{
  public ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
  
  public int maxAsteroids = 3;
  
  public UFO ufo;
  
  private int ufoSpawned;
  private PVector randUFO = new PVector(5000, 6000);
  private int nextUFO = 0;
  
  public AsteroidSpawner()
  {
    while(asteroids.size() < maxAsteroids)
    {
      Asteroid a = new AsteroidLarge();
      
      asteroids.add(a);
      Instantiate(a);
    }


    nextUFO = (int)0;
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
    
    if(millis() > ufoSpawned + nextUFO)
    {
      //CreateUFO();
    }
   }
   
   public void CreateUFO()
   {
     ufoSpawned = millis();
     nextUFO = (int)random(randUFO.x, randUFO.y);
     ufo = new UFO();
     Instantiate(ufo);
   }
}
