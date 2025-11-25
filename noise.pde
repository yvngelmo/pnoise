voronoiNoise a;

void setup()
{
  size(768,768);
  pixelDensity(1);
  
  a = new voronoiNoise(2,20,70);
}

void draw()
{
  drawNoise(a.value);
}
