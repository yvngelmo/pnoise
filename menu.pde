void drawMenu()
{
  if(menuHidden) text("show menu[H]", 6,16);
  else
  {
    for(int i = 0; i<layers; i++)
    {
      content(i);
    }
    text("select value with mouse, change with CLICK / + / -, hide menu[H]", 6,height-8);
  }
}

void content(int i)
{  
  if(!whiteList[i].empty) //draw text&matrixSquares wenn layer whitenoise ist
  {
    text("disable[X] white[X] seed:"+whiteList[i].seed+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);
    
    for(int v=0; v<4; v++)
    square(16*v,272+16*i,16);
  }
  
  else if(!perlinList[i].empty) //draw text&matrixSquares wenn layer perlinnoise ist
  {
    text("disable[X] perlin[X] seed:"+perlinList[i].seed+"[+/-] rez:"+perlinList[i].rez+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);    
    
    for(int v=0; v<5; v++)
    square(16*v,272+16*i,16);
  }
  
  else if(!voronoiList[i].empty) //draw text&matrixSquares wenn layer voronoinoise ist
  {
    text("disable[X] voronoi[X] seed:"+voronoiList[i].seed+"[+/-] rez:"+voronoiList[i].pointAmt+"[+/-] random:"+voronoiList[i].scatterAmt+"[+/-] alpha:"+alphaval[i]+"[+/-]", 6, 16+16*i);
    
    for(int v=0; v<6; v++)
    square(16*v,272+16*i,16);
  }
  
  else //draw text wenn layer leer ist
  {
    text("enable[X]", 6, 16+16*i);
    
    square(0,272+16*i,16);
  }
}

void selectionMatrix() //auf mousePressed callen
{
  texSelected = mouseY/16;
  if(texSelected>16&&texSelected<33) texSelected = texSelected-17; //wert fixen damit richtiger input für listen
  else texSelected = -1; //von 17 bis 32, wenn außerhalb dann minus 1
  
  if(texSelected!=-1) //wenn mausY innerhalb dann wert bestimmen der in matrix ausgewählt wird
  {
    valSelected = mouseX/16;
    
    //welcher wert soll ausgewählt werden?
    if(!whiteList[texSelected].empty&&valSelected<3) //werte: enabled, seed, alpha
    {
      
    }
    else if(!perlinList[texSelected].empty&&valSelected<4) //werte: enabled, seed, rez, alpha
    {
      
    }
    else if(!voronoiList[texSelected].empty&&valSelected<5) //werte: enabled, seed, pointAmt, scatterAmt, alpha
    {
      
    }
    else if(valSelected<1)//werte: enabled
    {
      enableLayerToWhite(texSelected);
    }
  }
  
  //println(texSelected,valSelected);
}

int changeVal(int input)
{
  int result = input;
  return result;
}

void enableLayerToWhite(int layer)
{
  println(layer);
}
