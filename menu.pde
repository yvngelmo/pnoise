void drawMenu()
{
  if(menuHidden) text("show menu[H]", 6,16);
  else
  {
    selectionMatrix();
    for(int i = 0; i<layers; i++)
    {
      content(i);
    }
    text("select value with mouse, change with ENTER / + / -, hide menu[H]", 6,height-8);
  }
}

void content(int i)
{
  if(whiteList[i].empty)
  text("disable[X] white[X] seed:"+whiteList[i].seed+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);
  
  else if(!perlinList[i].empty)
  text("disable[X] perlin[X] seed:"+perlinList[i].seed+"[+/-] rez:"+perlinList[i].rez+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);
  
  else if(!voronoiList[i].empty)
  text("disable[X] voronoi[X] seed:"+voronoiList[i].seed+"[+/-] rez:"+voronoiList[i].pointAmt+"[+/-] random:"+voronoiList[i].scatterAmt+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);
  
  else
  text("enable[X]", 6, 16+16*i);
}

void selectionMatrix()
{
  int texSelected = mouseY/16;
}
