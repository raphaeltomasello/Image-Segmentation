void setup() {
  size(600,600);
  noLoop();
}

void draw() {
   PImage img = loadImage("Joao.jpg"); 
   PImage img2 = createImage(img.width, img.height, RGB);
   
   // Filtro de Escala de Cinza
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         img2.pixels[pos] = color(red(img.pixels[pos]));
     }
   }
    // Filtro de Escala de Cinza
    for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         img2.pixels[pos] = color(blue(img.pixels[pos]));
     }
   }
   // Filtro de Brilho
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int brilho = (int) blue(img2.pixels[pos]) + 100;
         if (brilho > 255) brilho = 255;
         else if(brilho < 0) brilho = 0;
         img2.pixels[pos] = color(brilho);
     }
   }
   // Filtro de Brilho
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int brilho = (int) green(img2.pixels[pos]) + 10;
         if (brilho > 255) brilho = 255;
         else if(brilho < 0) brilho = 0;
         img2.pixels[pos] = color(brilho);
     }
   }
   
// Filtro de Limiarização
  for (int y = 0; y < img.height; y++)
  {
    for (int x = 0; x < img.width; x++)
    {
      int pos = y*img.width + x;
      int originalColor = img.get(x, y);
      //if(red(img2.pixels[pos]) > 210 && y > 100 && y < 550 && x > 80)
      if (green(img2.pixels[pos]) > 254)
        img2.pixels[pos] = color(0);
        //img2.pixels[pos] = color(255);
      else
      img2.pixels[pos] = color(originalColor);
      //img2.pixels[pos] = color(255);
      //img2.pixels[pos] = color(0);
    }
  }
   
   image(img2,0,0);
   save("cor original.jpg");
}
