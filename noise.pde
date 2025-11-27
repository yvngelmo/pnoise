int layers = 16;
int texSelected;
int valSelected;
boolean menuHidden = true;

//arrays für noise types
whiteNoise[] whiteList;
perlinNoise[] perlinList;
voronoiNoise[] voronoiList;

int[] alphaval;

void setup()
{ 
  size(768,768);
  pixelDensity(1);
  strokeWeight(1);

  PFont courier;
  courier = loadFont("CourierNewPS-BoldMT-16.vlw");
  textFont(courier);

  whiteList = new whiteNoise[layers];
  perlinList = new perlinNoise[layers];
  voronoiList = new voronoiNoise[layers];
  alphaval = new int[layers];
  
  
  
  //init empty stacks
  for(int i=0; i<layers; i++)
  {
    alphaval[i] = 100;
    
    whiteList[i] = new whiteNoise(true,0);
    perlinList[i] = new perlinNoise(true,0,10);
    voronoiList[i] = new voronoiNoise(true,0,20,20);
  }
  
  //first frame
  background(255);
  drawStack();
  drawMenu();
}

void draw()
{
  
}

void mousePressed()
{
  
  if(!menuHidden) selectionMatrix();
  
  //update frame
  background(255);
  drawStack();
  drawMenu();
}

void keyPressed()
{
  if(key=='h') menuHidden=!menuHidden;
  
  //update frame
  background(255);
  drawStack();
  drawMenu();
}
