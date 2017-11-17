import processing.serial.*;
import gifAnimation.*;
Serial port;
float data = 0;

PImage bg = loadImage("https://i.makeagif.com/media/4-07-2016/RG5u6z.gif");
//PImage heartbeat = loadImage("http://icongal.com/gallery/image/52078/heart_cardiology.png");
void setup()
  {
    size(400,400);
    //myAnimation = new Gif(this, bg);
    //myAnimation.play();
    port = new Serial(this,"/dev/cu.usbmodem1431",115200);
    port.bufferUntil('\n');
  }
 
 void draw()
   {
   
   
      float mapval = map(data,0,1023,255,0);
      
      background(bg);
      //image(heartbeat, width/2,height/2,mapval,mapval);
      //fill(mapval/4,mapval/4,mapval/4);
      //ellipse(500,500,mapval,mapval);
      //imageMode(CENTER);
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