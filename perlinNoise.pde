class perlinNoise
{ 
  float[][] value = new float[width][height];
  float[][] vector;
  
  perlinNoise(int seed,int rez)
  {
    randomSeed(seed);
    vector = new float[rez][rez];
    
    for (int y=0; y<rez; y++)
    {
      for (int x=0; x<rez; x++)
      {
        vector[x][y]=0.01*random(100);
      }
    }
    
    for (int y=0; y<height; y++)
    {
      for (int x=0; x<width; x++)
      {
        value[x][y]=random(255);
      }
    }
  }
}
