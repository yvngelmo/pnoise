class whiteNoise
{ 
  boolean empty;
  
  float[][] value = new float[width][height];
  
  whiteNoise(boolean empty, int seed)
  {
    set(empty, seed);
  }

  void set(boolean setEmpty, int seed)
  {
    empty = setEmpty;
    
    randomSeed(seed);
    if(!empty)
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
}
