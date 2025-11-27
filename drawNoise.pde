void drawNoise(float[][] val, float alpha)
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      set(x,y,color(val[x][y],alpha));
    }
  }
}

void drawStack() // 16 layer auf jedem layer sollte nur eine textur sein, fängt niedrig an höhere werden drauf gerendert
{
  for(int i=0; i<layers; i++)
  {
    if(!whiteList[i].empty)
    {
      whiteList[i].set(whiteList[i].empty,whiteList[i].seed); //set aktualisiert ausführen, also noise berechnen
      drawNoise(whiteList[i].value,alphaval[i]);
    }
    else if(!perlinList[i].empty)
    {
      perlinList[i].set(perlinList[i].empty,perlinList[i].seed,perlinList[i].rez); //set aktualisiert ausführen, also noise berechnen
      drawNoise(perlinList[i].value,alphaval[i]);
    }
    else if(!voronoiList[i].empty)
    {
      voronoiList[i].set(voronoiList[i].empty,voronoiList[i].seed,voronoiList[i].pointAmt,voronoiList[i].scatterAmt); //set aktualisiert ausführen, also noise berechnen
      drawNoise(voronoiList[i].value,alphaval[i]);
    }
  }
}
