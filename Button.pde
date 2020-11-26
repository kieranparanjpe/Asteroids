public class Button extends MonoBehaviour
{  
  private PVector position;
  private PVector scale;
  
  private color colour;
  private color normalColour;
  private color clickedColour;

  private String text;
  
  private States target;
  
  public Button(PVector position, PVector scale, color normalColour, color clickedColour, String text, States target)
  {
    this.position = position;
    this.scale = scale;
    
    this.normalColour = normalColour;
    this.clickedColour = clickedColour;
    
    colour = normalColour;

    this.target = target;
    
    this.text = text;
  }
  
  @Override
  public void Update()
  {
    
    
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      stroke(0, 0, 255);
      strokeWeight(5);
    }
    else
    {
      stroke(0);
      strokeWeight(0);
    }
    
    fill(colour);
    rect(position.x, position.y, scale.x, scale.y);
    fill(0);
    textSize(50);
    text(text, position.x, position.y);
  }

  @Override
  public void OnClick()
  {
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      colour = clickedColour;
    }
  }
  
  @Override
  public void OnRelease()
  {
    colour = normalColour;
    
    if(PointInRect(new PVector(mouseX, mouseY), position, scale))
    {
      if(state == States.GAMEOVER)
      {
        menu.clear();
        behaviours.clear();
        over.clear();
        Init();
      }
      state = target;
    }
  }
}
