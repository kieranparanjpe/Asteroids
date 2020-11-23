public boolean w, a, s, d, q;

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
  else if(key == 'Q' || key == 'q')
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
  else if(key == 'Q' || key == 'q')
  {
    q = false;
  }
}
