void calcNoiseStack()
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      col[x][y]=0; //col reset wenn neu gedrawed wird
    }
  }
  
  for(int i=0; i<layers; i++) //für jeden layer, der der enabled ist wird noise berechnet und dann wird die noise in calcCol gesendet
  {
    if(!whiteList[i].empty)
    {
      whiteList[i].set(false,whiteList[i].seed); //noise berechnen
      calcCol(whiteList[i].value, i);
    }
    else if(!perlinList[i].empty)
    {
      perlinList[i].set(false,perlinList[i].seed,perlinList[i].rez); //noise berechnen
      calcCol(perlinList[i].value, i);
    }
    else if(!voronoiList[i].empty)
    {
      voronoiList[i].set(false,voronoiList[i].seed,voronoiList[i].pointAmt,voronoiList[i].scatterAmt); //noise berechnen
      calcCol(voronoiList[i].value, i);
    }
  }
}

void calcCol(float[][] listVal, int i)
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++) //für jeden wert von col & input val
    {
      col[x][y]=col[x][y]*(1-0.01*alphaval[i])+(listVal[x][y]*0.01*brightness[i])*0.01*alphaval[i]; //alte farbe*(1-opacity%)+(neue farbe*brightness%)*(opacity%)
    }
  }
}

void drawNoiseStack()
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      set(x,y,color(col[x][y])); //für jeden pixel wert von col drawen
    }
  }
}

void drawNoiseStack3d()
{
  noStroke();
  fill(255);
  
  int step = 2; //wieviele pixel auf ein face
  
  pointLight(255,255,255,width/2,height/2,0); //licht
  
  pushMatrix(); //transform
  
  rotateX(radians(64));
  translate(0,-512,-512);
  
  translate(width/2, height/2,0);
  rotateZ(radians(rotate));
  translate(-width/2, -height/2,0);
  
  
  for (int y=0; y<height-step; y+=step) //minus rendersize damit nicht rechts out of bounds gecheckt wird
  {
    beginShape(TRIANGLE_STRIP);
    
    for (int x=0; x<width; x+=step)
    {
      vertex(x,y,0.5*col[x][y]);
      vertex(x,y+step,0.5*col[x][y+step]); //immer linie nach unten von links nach rechts für jede row referencen
    }
    
    endShape();
  }
  popMatrix();
  
  stroke(0);
  noLights();
}
