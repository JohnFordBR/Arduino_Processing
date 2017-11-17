import processing.serial.*;
Serial port;
String data =  "dzmeruk";
void setup()
  {
    size(1000,1000);
    port = new Serial(this,"/dev/cu.usbmodem1431",115200);
  }
 
 void draw()
   {
   
     if(data != null)
     {
       float mapval = map(float(data),0,1023,255,0);
      background(mapval);
      fill(mapval/4,mapval/4,mapval/4);
      ellipse(500,500,mapval,mapval);
      println(data);
     }
     
   }
  void serialEvent(Serial port)
  {
     if(port.available() > 0)
     {
        data = port.readStringUntil('\n');
     } 
  }