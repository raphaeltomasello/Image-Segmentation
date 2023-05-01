PImage img;

int w = 600;
int h = 600;

void setup() 
{
  size(600, 500);
  img = loadImage("img.jpg");
  int maxwidth = w;
  int maxheight = h;
  int imgwidth = img.width;
  int imgheight = img.height;
  float widthratio = (float) maxwidth / imgwidth;
  float heightratio = (float) maxheight / imgheight;
  
  if (widthratio <= heightratio) 
  {
    img.resize((int) (imgwidth * widthratio), 0);
  } 
  
  else 
  {
    img.resize(0, (int) (imgheight * heightratio));
  }
}

void draw() 
{
  background(255);
  image(img, 0, 0);
  save("img2.jpg");
}
