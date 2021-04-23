import processing.sound.*;

import processing.serial.*;

Serial arduinoPort;
SoundFile File;
float mouseX;
Serial myport;
int k=0;
int s=2;
int distance=0;
int applex;
int applex1;
int mangox;
int mangox1;
float appley;
float appley1;
float mangoy;
float mangoy1;
int dir=500;
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
int score1=0;
int score2=0;
int IncomingDistance;
void setup() {
  size(1000, 1000);
  img=loadImage("bask.png");
  img1=img;
  img2=loadImage("apple.png");
  img4=loadImage("apple.png");
  img3=loadImage("mango.png");
  img5=loadImage("mango2.png");
  //println(arduino.list());
  arduinoPort=new Serial(this, "COM7", 9600);
  File=new SoundFile(this, "pope.mp3");
  myport=new Serial(this, "COM8", 9600);
  File.play();
  update();
}
void serialEvent() 
{ 
  String k=arduinoPort.readStringUntil('\n');
  if (k!=null)distance = Integer.parseInt(k.trim());
}
void keyPressed()
{   
  if (keyPressed==true && key=='x')s=1;
  if(keyPressed==true && key=='y')s=0;
    
  // game(s);
}

void update() {
  applex=int(random(800));
  applex1=int(random(800));
  mangox=int(random(800));
  mangox1=int(random(800));
  appley=0;
  mangoy=0;
}
  //gamescreen();
void draw()
{  
 // gamescreen();
  serialEvent();
  background(100, 50, 50);
  if (s==1)
  {
    if (appley>=height) {
      applex=int(random(800));
      appley=0;
      image(img2, applex, appley, 100, 100);
    }
    if (mangoy>=height) {
      mangox=int(random(800));
      mangoy=0;
      image(img3, mangox, mangoy, 100, 100);
    }
    if (appley1>=height) {
      applex1=int(800);
      appley1=0;
      image(img4, applex1, appley1, 100, 100);
    }
    if (mangoy1>=height) {
      mangox1=int(random(800));
      mangoy1=0;
      image(img5, mangox1, mangoy1, 100, 100);
    }//creating apples and mangos
    image(img2, applex, appley, 100, 100);
    image(img3, mangox, mangoy, 100, 100);
    image(img4, applex1, appley1, 100, 100);
    image(img5, mangox1, mangoy1, 100, 100);
    img.resize(200, 100);

    image(img, mouseX, height-100);
    image(img, dir, height-100);
    appley+=5.0;
    appley1+=10.0;
    mangoy+=5.0;
    mangoy1+=10.0;


    if ((applex>=mouseX-80)&&(applex<=mouseX+80)||(applex1>=mouseX-80)&&(applex1<=mouseX+80))
    { 
      if ((appley==height-100)||(appley1==height-100))
        score1+=1;
    }
    textSize(30);
    text("score1 "+score1, 10, 100, 100); 


    if ((mangox>=dir-80)&&(mangox<=dir+80)||(mangox1>=dir-80)&&(mangox1<dir+80))
    { 
      if ((mangoy==height-100)||(mangoy1==height-100))
        score2+=1;
    }
    textSize(30);
    text("score2 "+score2, 20, 150, 150); 

    if (distance<20&&distance>10)
    {   
      dir=dir+8;
    }
    if (distance>20&&distance<30)
    { 
      dir=dir-8;
    } 

    if (score1==50||score2==50)
    { 
      textSize(50);
      text("GAME OVER", 20, width/2, height/2);
      if (score2>score1)
      { 
        textSize(50);
        text("Player2wins", 40, width/2, height/2);
      } else
      {
        textSize(50);
        text("player1wins", 40, width/2+100, height/2+100);
      }
      applex=0;
      applex1=0;
      appley=0;
      appley1=0;
      delay(1200);
    }
  }
  
  if (s==0)
{  {
    if (appley>=height) {
      applex=int(random(800));
      appley=0;
      image(img2, applex, appley, 100, 100);
    }
    if (mangoy>=height) {
      mangox=int(random(800));
      mangoy=0;
      image(img3, mangox, mangoy, 100, 100);
    }

    //creating apples and mangos
    image(img2, applex, appley, 100, 100);
    image(img3, mangox, mangoy, 100, 100);
    //image(img4, applex1, appley1, 100, 100);
    //image(img5, mangox1, mangoy1, 100, 100);
    img.resize(200, 100);

    image(img, mouseX, height-100);
    //image(img, dir, height-100);
    appley+=10.0;
    mangoy+=5.0;


    if ((applex>=mouseX-80)&&(applex<=mouseX+80)||(mangox>=mouseX-80)&&(mangox<=mouseX+80))
    { 
      if ((appley==height-100)&&(mangoy==height-100))
        score1+=1;
    }
    textSize(30);
    text("score1 "+score2, 10, 100, 100); 

    /*if (distance<20&&distance>10)
     {   
     dir=dir+10;
     }
     if (distance>20&&distance<30)
     { 
     dir=dir-10;
     } */

    if (score1==50)
    { 
      textSize(50);
      text("GAME OVER", 20, width/2, height/2);
      
      applex=0;
      applex1=0;
      appley=0;
      appley1=0;
      delay(1200);
    }
}

  }
  if (myport.available()>0)
  { 
    String str=myport.readStringUntil('\n');

    if (str!=null)
    { 
      mouseX=float(str);
      mouseX=map(mouseX, 0, 1023, -50, 900);
    }
  
  }
}
