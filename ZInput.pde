public boolean w, a, s, d, q, click, e, p;

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
  else if(key == 'E' || key == 'e')
  {
    e = true;
  }
  else if(key == 'P' || key == 'p')
  {
    p = true;
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
  else if(key == 'E' || key == 'e')
  {
    e = false;
  }
  else if(key == 'P' || key == 'p')
  {
    p = false;
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
  
  if(state == States.WIN)
  {
    for(int i = 0; i < win.size(); i++)
    {
      win.get(i).OnClick();
    }
  }
  
  if(state == States.PAUSE)
  {
    for(int i = 0; i < pause.size(); i++)
    {
      pause.get(i).OnClick();
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
  
  if(state == States.WIN)
  {
    for(int i = 0; i < win.size(); i++)
    {
      win.get(i).OnRelease();
    }
  }
  
  if(state == States.PAUSE)
  {
    for(int i = 0; i < pause.size(); i++)
    {
      pause.get(i).OnRelease();
    }
  }
 
}
