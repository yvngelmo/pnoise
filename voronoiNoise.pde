class voronoiNoise
{ 
  float[][] value = new float[width][height];
  
  voronoiNoise(int seed)
  {
    set(seed);
  }

  void set(int seed)
  {
    randomSeed(seed);
    
    for (int y=0; y<height; y++)
    {
      for (int x=0; x<width; x++)
      {
        value[x][y]=random(255);
      }
    }
  }
}
