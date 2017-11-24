import processing.serial.*;
import cc.arduino.*;
import processing.sound.*;
Arduino arduino;
SoundFile file;

int value = 0;
int previousValue = 0;

int pulseCount = 0;
int pulse = 0;

int currentTime = 0;
int lastMillis = 0;

int eachTime = 10000;

PImage image = loadImage("http://www.pngmart.com/files/1/3D-Red-Heart-PNG-Image.png", "png");
PFont arial;

void setup() {
  size(1000, 1000);
    file = new SoundFile(this, "sample.mp3");
   file.play();
  arduino = new Arduino(this, "/dev/cu.usbmodem5", 57600);

  arduino.pinMode(0, Arduino.INPUT);
  
  arial = createFont("Arial Black", 60);
  textFont(arial);
  
  imageMode(CENTER);
}

void draw() {
  background(255, 255, 255);
  value = arduino.analogRead(0);
  int imgWidth = int(value);
  
  try {
    image(image, width / 2, height / 2, imgWidth, imgWidth);
  } catch (Exception e) {
    println("Error...");
  }

  if (value > 550 && previousValue < 550) {
    pulseCount++;
  }

  previousValue = value;
  currentTime = millis();

  if ((currentTime - lastMillis) > eachTime) {
    pulse = pulseCount * (60000 / eachTime);
    pulseCount = 0;
    lastMillis = currentTime;
  }

  fill(0, 0, 0);
  text(pulse, 50, 100);
  if(pulse>=60 && pulse <= 80)
    {
      file.stop();
    }
  println(pulse);
}