int ColourNumber = 16;
int p = 0;
color[] Pal = new color[ColourNumber];
boolean sim = false;
PImage Photo;
void setup (){
  Photo = loadImage("Colour.png");
  size(512,512);
  background(255);
  fill(0);
  noStroke();
  refresh();
}
void draw (){
  for(int y = 0;y < sqrt(ColourNumber);y++){
    for(int x = 0;x < sqrt(ColourNumber);x++){
      fill(Pal[(y*int(sqrt(ColourNumber))+x)]);
      rect(x*(512/sqrt(ColourNumber)),y*(512/sqrt(ColourNumber)),512/sqrt(ColourNumber),512/sqrt(ColourNumber));
    }  
  }
}
void refresh (){
  for(int i = 0;i < ColourNumber;i++){
    if(floor(i/sqrt(ColourNumber)) % 2 == 0){
      Pal[i] = color(random(50,255),random(50,255),random(50,255));
      while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
            Pal[i] = color(random(50,255),random(50,255),random(50,255));
      }
       for(int j = 0;j < i;j++){
        if(abs(red(Pal[i])-red(Pal[j])) < 20 && abs(green(Pal[i])-green(Pal[j])) < 20 && abs(blue(Pal[i])-blue(Pal[j])) < 20){
          Pal[i] = color(random(50,255),random(50,255),random(50,255));
          while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
            Pal[i] = color(random(20,255),random(20,255),random(20,255));
          }
          j = 0;
          if(p == 1000){
            p = 0;
            j = i;
          }else{
            p++;
          }
        }
      }
    }else{
      Pal[i] = color(red(Pal[i-int(sqrt(ColourNumber))])-(red(Pal[i-int(sqrt(ColourNumber))])/4),green(Pal[i-int(sqrt(ColourNumber))])-(green(Pal[i-int(sqrt(ColourNumber))])/4),blue(Pal[i-int(sqrt(ColourNumber))])-(blue(Pal[i-int(sqrt(ColourNumber))])/4));
    }
  }
}
void photoRefresh (){
  for(int i = 0;i < ColourNumber;i++){
    sim = false;
    if(floor(i/sqrt(ColourNumber)) % 2 == 0){
      Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
      while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
          Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
      }
      for(int j = 0;j < i;j++){
        if(abs(red(Pal[i])-red(Pal[j])) < 20 && abs(green(Pal[i])-green(Pal[j])) < 20 && abs(blue(Pal[i])-blue(Pal[j])) < 20){
          Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
          while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
            Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
          }
          j = 0;
          if(p == 1000){
            p = 0;
            j = i;
          }else{
            p++;
          }
        }
      }
    }else{
      Pal[i] = color(red(Pal[i-int(sqrt(ColourNumber))])-(red(Pal[i-int(sqrt(ColourNumber))])/4),green(Pal[i-int(sqrt(ColourNumber))])-(green(Pal[i-int(sqrt(ColourNumber))])/4),blue(Pal[i-int(sqrt(ColourNumber))])-(blue(Pal[i-int(sqrt(ColourNumber))])/4));
    }
  }
}
void photoAllCol (){
  for(int i = 0;i < ColourNumber;i++){
    if(floor(i/sqrt(ColourNumber)) % 2 == 0){
      switch(i){
        case 0:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(red(Photo.get(x,y))-green(Photo.get(x,y)) > red(Pal[i])-green(Pal[i]) && red(Photo.get(x,y))-blue(Photo.get(x,y)) > red(Pal[i])-blue(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
        case 1:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(green(Photo.get(x,y))-red(Photo.get(x,y)) > green(Pal[i])-red(Pal[i]) && green(Photo.get(x,y))-blue(Photo.get(x,y)) > green(Pal[i])-blue(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
        case 2:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(blue(Photo.get(x,y))-green(Photo.get(x,y)) > blue(Pal[i])-green(Pal[i]) && blue(Photo.get(x,y))-red(Photo.get(x,y)) > blue(Pal[i])-red(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break; 
        case 3:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(blue(Photo.get(x,y))-green(Photo.get(x,y)) > blue(Pal[i])-green(Pal[i]) && red(Photo.get(x,y))-green(Photo.get(x,y)) > red(Pal[i])-green(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
       case 8:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(green(Photo.get(x,y))-red(Photo.get(x,y)) > green(Pal[i])-red(Pal[i]) && blue(Photo.get(x,y))-red(Photo.get(x,y)) > blue(Pal[i])-red(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
       case 9:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(red(Photo.get(x,y))-blue(Photo.get(x,y)) > red(Pal[i])-blue(Pal[i]) && green(Photo.get(x,y))-blue(Photo.get(x,y)) > green(Pal[i])-blue(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
       case 10:
          Pal[i] = 0;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(red(Photo.get(x,y))+blue(Photo.get(x,y))+green(Photo.get(x,y)) > red(Pal[i])+blue(Pal[i])+green(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;
       case 11:
          Pal[i] = 255;
          for(int y = 0;y < Photo.height;y++){
            for(int x = 0;x < Photo.width;x++){
              if(red(Photo.get(x,y))+blue(Photo.get(x,y))+green(Photo.get(x,y)) < red(Pal[i])+blue(Pal[i])+green(Pal[i])){
                Pal[i] = Photo.get(x,y);
              }
            }
          }
          break;     
        default:
          Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
      while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
          Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
      }
      for(int j = 0;j < i;j++){
        if(abs(red(Pal[i])-red(Pal[j])) < 20 && abs(green(Pal[i])-green(Pal[j])) < 20 && abs(blue(Pal[i])-blue(Pal[j])) < 20){
          Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
          while(red(Pal[i])+green(Pal[i])+blue(Pal[i])/3 < 20 || red(Pal[i])+blue(Pal[i])/2 > 254){
            Pal[i] = Photo.get(int(random(0,Photo.width)),int(random(0,Photo.height)));
          }
          j = 0;
          if(p == 1000){
            p = 0;
            j = i;
          }else{
            p++;
          }
        }
      }
          break;
      }
    }else{
      Pal[i] = color(red(Pal[i-int(sqrt(ColourNumber))])-(red(Pal[i-int(sqrt(ColourNumber))])/4),green(Pal[i-int(sqrt(ColourNumber))])-(green(Pal[i-int(sqrt(ColourNumber))])/4),blue(Pal[i-int(sqrt(ColourNumber))])-(blue(Pal[i-int(sqrt(ColourNumber))])/4));
    }
  }
}
void keyPressed() {
  if(key == 'r'){
    refresh();
  }
  if(key == 'p'){
    photoRefresh();
  }
  if(key == 'o'){
    photoAllCol();
  }
}
void keyReleased() {
  if(key == 's'){
      save("screenshot"+millis()+".png");
  }
}
