public boolean w, a, s, d, q, click;

void keyPressed()
{
  if(key == 'W' || key == 'w')
  {
    w = true;
  }
  else if(key == 'S' || key == 's')
  {
    s = true;
  }
  else if(key == 'D' || key == 'd')
  {
    d = true;
  }
  else if(key == 'A' || key == 'a')
  {
    a = true;
  }
  else if(key == ' ')
  {
    q = true;
  }
}

void keyReleased()
{
  if(key == 'W' || key == 'w')
  {
    w = false;
  }
  else if(key == 'S' || key == 's')
  {
    s = false;
  }
  else if(key == 'D' || key == 'd')
  {
    d = false;
  }
  else if(key == 'A' || key == 'a')
  {
    a = false;
  }
  else if(key == ' ')
  {
    q = false;
  }
}

void mousePressed()
{
  if(state == States.MENU)
  {
    for(int i = 0; i < menu.size(); i++)
    {
      menu.get(i).OnClick();
    }
  }
  if(state == States.GAME)
  {
    for(int i = 0; i < behaviours.size(); i++)
    {
      behaviours.get(i).OnClick();
    }
  }
  if(state == States.GAMEOVER)
  {
    for(int i = 0; i < over.size(); i++)
    {
      over.get(i).OnClick();
    }
  }
}

void mouseReleased()
{
  if(state == States.MENU)
  {
    for(int i = 0; i < menu.size(); i++)
    {
      menu.get(i).OnRelease();
    }
  }
  if(state == States.GAME)
  {
    for(int i = 0; i < behaviours.size(); i++)
    {
      behaviours.get(i).OnRelease();
    }
  }
  if(state == States.GAMEOVER)
  {
    for(int i = 0; i < over.size(); i++)
    {
      over.get(i).OnRelease();
    }
  }
 
}
