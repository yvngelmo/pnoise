perlinNoise a;

void setup()
{
  size(768,768);
  pixelDensity(1);
  
  a = new perlinNoise(2, 50);
}

void draw()
{
  drawNoise(a.value);
}
