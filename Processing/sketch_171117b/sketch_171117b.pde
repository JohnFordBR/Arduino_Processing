import processing.serial.*;
import gifAnimation.*;
Gif myAnimation;
Serial port;
float data = 0;
int i =370;
int j = 180;
void setup()
  {
    size(400,370);
    frameRate(12);
    myAnimation = new Gif(this, "cars.gif");
    port = new Serial(this,"/dev/cu.usbmodem1431",115200);
    port.bufferUntil('\n');
  }
 
 void draw()
   {
     if(data==0)
     {
       j+=2;
     }
     else
     {
       j-=2;
     }
     if(j<=120)
     {
       j=120;
     }
     else if(j>=240)
     {
       j=240;
     }
     if(i<=0)
     {
       i = 400;
     }
     i-=2;
   myAnimation.play();
     image(myAnimation, 0, 0);
     //background(myAnimation);

       //myAnimation.setDelay(1); 
       //myAnimation.addFrame();
      //background(mapval);
      ellipse(j,i,20,20);
      
      println(data);
     
     
   }
  void serialEvent(Serial port)
  {
    try{
      data = float(port.readStringUntil('\n'));
    }catch (Exception e)
    {
      println("Error");
    }
        
  }