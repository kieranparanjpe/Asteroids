
public ArrayList<MonoBehaviour> behaviours = new ArrayList<MonoBehaviour>();

public ArrayList<MonoBehaviour> menu = new ArrayList<MonoBehaviour>();
public ArrayList<MonoBehaviour> over = new ArrayList<MonoBehaviour>();
public ArrayList<MonoBehaviour> win = new ArrayList<MonoBehaviour>();
public ArrayList<MonoBehaviour> pause = new ArrayList<MonoBehaviour>();

PFont font;


color bg = 0;

public States state;

public int ast;

PImage backg;
PImage asteroid;
PImage ufo;

public void setup()
{
  size(800, 800);
  Init();
}

public void Init()
{
  font = createFont("PressStart2P-Regular.ttf", 32);
textFont(font);
  
  backg = loadImage("stars.jpg");
  asteroid = loadImage("asteroid.png");
  ufo = loadImage("ufo.png");
  behaviours.add(new SpaceShip());
  behaviours.add(new Walls());

  behaviours.add(new AsteroidSpawner());
  
  menu.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), color(70, 0, 220), color(0, 0, 170), "PLAY", States.GAME));

  over.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), color(70, 0, 220),color(0, 0, 170), "TRY AGAIN", States.MENU));
  
  win.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), color(70, 0, 220), color(0, 0, 170), "REPLAY", States.MENU));
  pause.add(new Button(new PVector(width / 2, height / 2), new PVector(300, 200), color(70, 0, 220), color(0, 0, 170), "RESUME", States.GAME));


  
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
    if(state == States.WIN)
      Win();
    if(state == States.PAUSE)
      Pause();

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
   GAMEOVER,
   WIN,
   PAUSE
}
