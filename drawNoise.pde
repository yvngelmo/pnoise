void drawNoise(float[][] val)
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      set(x,y,color(val[x][y]));
    }
  }
}
