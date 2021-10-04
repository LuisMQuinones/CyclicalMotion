class CyclicalMover
{
  float cX;
  float cY;
  float r;
  public CyclicalMover(float centerX, float centerY, float radius)
  {
    cX = centerX;
    cY = centerY;
    r = radius;
  }
  float getCurrentRatio()
  {
    return 1.0 * frameCount/240;
  }
  public void update()
  {
    float time = getCurrentRatio();
    float theta = TWO_PI * time;
    float x = cX + r * cos(theta);
    float y = cY + r * sin(theta);
    ellipse(x, y, 16, 16);
  }
}

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
CyclicalMover mover;
void setup()
{
  size(600, 600);
  cp = new CenterPoint();
  mover = new CyclicalMover(width/2, height/2, 256);
}
void draw()
{
  background(120);

  cp.update();
  mover.update();
}
