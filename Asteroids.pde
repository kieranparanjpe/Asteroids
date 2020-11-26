
public ArrayList<MonoBehaviour> behaviours = new ArrayList<MonoBehaviour>();

public ArrayList<MonoBehaviour> menu = new ArrayList<MonoBehaviour>();
public ArrayList<MonoBehaviour> over = new ArrayList<MonoBehaviour>();


public States state;

public void setup()
{
  size(1280, 720);
  Init();
}

public void Init()
{

  
  behaviours.add(new SpaceShip());
  behaviours.add(new Walls());
  behaviours.add(new AsteroidSpawner());
  
  menu.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), 200, 100, "Play", States.GAME));

  over.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), 200, 100, "GAME OVER", States.MENU));
  
  state = States.MENU;

    
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
}

public void draw()
{

    if(state == States.MENU)
      Menu();
    if(state == States.GAME)
      Game();
    if(state == States.GAMEOVER)
      GameOver();

}

public void Instantiate(MonoBehaviour behaviour)
{
    behaviours.add(behaviour);
}

public void Destroy(MonoBehaviour behaviour)
{
  behaviours.remove(behaviour);
  behaviour.enabled = false;
}

public enum States
{
   MENU,
   GAME,
   GAMEOVER
}
