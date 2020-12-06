public void Menu()
{
  background(0);
  image(backg, width / 2, height / 2);
  textSize(30);
  fill(255);
  text("Just Some game...", width / 2, 200);
    textSize(15);

    text("press 'e' (or 'E') to win, 'p' to pause", width / 2, 250);
    text("Made by: Kieran Paranjpe", width / 2, 700);

  for(int i = 0; i < menu.size(); i++)
  {
    menu.get(i).Update();
  }
}

public void Game()
{
  background(bg);
  image(backg, width / 2, height / 2);
  
  
  if(p)
    state = States.PAUSE;
    
  if(e)
  {
    link("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
    e = false;
  }
  
  if(ast <= 0)
  {
    state = States.WIN;
  }
  
  for(int i = 0; i < behaviours.size(); i++)
  {
    MonoBehaviour b = behaviours.get(i);
    
    if(b.enabled)
    {    
      PVector v = new PVector(b.transform.velocity.x, b.transform.velocity.y);
      for(int j = 0; j < behaviours.size(); j++)
      {
        MonoBehaviour c = behaviours.get(j);    
        
        boolean bC = false;
        boolean cC;
        
        if(b != c && b.init && c.init)
        {
          for(int k = 0; k < b.EdgeColliders().size(); k++) 
          {
            for(int l = 0; l < c.EdgeColliders().size(); l++) 
            {
              if(LinesIntersect(b.EdgeColliders().get(k).positionA, b.EdgeColliders().get(k).positionB, c.EdgeColliders().get(l).positionA, c.EdgeColliders().get(l).positionB))
              {
                float dp = PVector.dot(v.normalize(), c.EdgeColliders().get(l).Normal());
                //println(c.EdgeColliders().get(l).Normal());
                if(dp <= 0)
                {
                  if(!b.EdgeColliders().get(k).trigger && !c.EdgeColliders().get(l).trigger)
                    b.OnPhysicsCollide(c.EdgeColliders().get(l));
                    
                  if(!bC)
                  {
                    b.OnCollide(c, c.EdgeColliders().get(l));
                    c.OnCollide(b, b.EdgeColliders().get(k));
                  }

                  
                  bC = true;
                  
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
public void GameOver()
{
  background(0);
  image(backg, width / 2, height / 2);
  textSize(30);
  fill(255);
  text("mad lol?", width / 2, 200);
  for(int i = 0; i < over.size(); i++)
  {
    over.get(i).Update();
  }
}

public void Win()
{
  background(0);
  image(backg, width / 2, height / 2);

  textSize(30);
  fill(255);

  text("You Won!", width / 2, 200);

  for(int i = 0; i < win.size(); i++)
  {
    win.get(i).Update();
  }
}

public void Pause()
{
  background(0);
    image(backg, width / 2, height / 2);

  textSize(30);
  fill(255);
  text("Paused", width / 2, 200);

  for(int i = 0; i < pause.size(); i++)
  {
    pause.get(i).Update();
  }
}
