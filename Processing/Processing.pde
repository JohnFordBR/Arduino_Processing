import processing.serial.*;
Serial port;
float data = 0;
void setup()
  {
    size(1000,1000);
    port = new Serial(this,"/dev/cu.usbmodem1431",115200);
    port.bufferUntil('\n');
  }
 
 void draw()
   {
   
   
       float mapval = map(data,0,1023,255,0);
      background(mapval);
      fill(mapval/4,mapval/4,mapval/4);
      ellipse(500,500,mapval,mapval);
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