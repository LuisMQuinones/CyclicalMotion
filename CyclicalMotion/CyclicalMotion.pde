class CenterPoint
{
  void update()
  {
    ellipseMode(CENTER);
    noStroke();
    ellipse(width/2, height/2, 4, 4);
  }
}

CenterPoint cp;
void setup()
{
  size(600, 600);
  cp = new CenterPoint();
}
void draw()
{
  background(120);

  cp.update();
}
