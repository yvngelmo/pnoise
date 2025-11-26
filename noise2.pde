//arrays für noise types
whiteNoise[] whiteList;
perlinNoise[] perlinList;
voronoiNoise[] voronoiList;

int[] alphaval;

void setup()
{ 
  size(768,768);
  pixelDensity(1);

  whiteList = new whiteNoise[16];
  perlinList = new perlinNoise[16];
  voronoiList = new voronoiNoise[16];
  alphaval = new int[16];
  
  //init empty stacks
  for(int i=0; i<16; i++)
  {
    alphaval[i] = 255;
    
    whiteList[i] = new whiteNoise(true,0);
    perlinList[i] = new perlinNoise(true,0,0);
    voronoiList[i] = new voronoiNoise(true,0,0,0);
  }
}

void draw()
{
  drawStack();
}
