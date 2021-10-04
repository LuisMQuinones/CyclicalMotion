class CyclicalMover
{
  float cX;
  float cY;
  float r;

  public CyclicalMover()
  {
    this(width/2, height/2, 256);
  }
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

  float calculateX(float theta)

  {
    return  cX + r * cos(theta);
  }

  float calculateY(float theta)
  {
    return cY + r* sin(theta);
  }

  float [] calculateXY(float theta)
  {
    float [] r = {calculateX(theta), calculateY(theta)};
    return r;
  }

  public void update()
  {
    float time = getCurrentRatio();
    float theta = TWO_PI * time;
    //float x = calculateX(theta);
    //float y = calculateY(theta);
    float [] xy = calculateXY(theta);
    float x = xy[0];
    float y = xy[1];
    ellipse(x, y, 16, 16);
  }
}

class RadiusNoiseMover extends CyclicalMover
{

  public  RadiusNoiseMover(  float centerX, float centerY, float radius)
  {
    super(centerX, centerY, radius);
  }
  float calculateRadiusNoise(float theta)
  {
    return noise(cos(theta), sin(theta));
  }
  float calculateX(float theta, float rNoise)
  {
    return  cX + r*rNoise * cos(theta);
  }

  float calculateY(float theta, float rNoise)
  {
    return cY + r*rNoise* sin(theta);
  }

  float [] calculateXY(float theta)
  {
    float rNoise = calculateRadiusNoise(theta);
    float [] r = {calculateX(theta, rNoise), calculateY(theta, rNoise)};
    return r;
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
CyclicalMover halfMover;
RadiusNoiseMover noiseMover;

float radius = 256;
void setup()
{
  size(600, 600);
  cp = new CenterPoint();
  mover = new CyclicalMover(width/2, height/2, radius);
  noiseMover= new RadiusNoiseMover(width/2, height/2, radius);
}
void draw()
{
  background(120);
  cp.update();
  mover.update();
  noiseMover.update();
}
