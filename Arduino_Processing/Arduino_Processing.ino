 int val = 0;
  int prevval = 0;
void setup()
  {
  pinMode(A0,INPUT);
  pinMode(3,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(8,OUTPUT);
   pinMode(12,OUTPUT);
   pinMode(13, OUTPUT);
    pinMode(7, OUTPUT);
     pinMode(2, OUTPUT);
  
  Serial.begin(115200); 
  }
int nullifier(){
  analogWrite(3,0);
     analogWrite(11, 0);
     analogWrite(5, 0);
}
void loop()
  {
    val = analogRead(A0);
   int amplitude=abs(val-prevval);
    
//   if(amplitude<=50)
//   {
//    nullifier();
//     analogWrite(5, 255);
//     digitalWrite(8, HIGH);
//    
//    Serial.println("red");
//   }
//    if(amplitude>=50&&amplitude<100)
//   {
//    nullifier();
//    analogWrite(11, 255);
//    digitalWrite(8, HIGH);
//  Serial.println("green");
//   }
//    if(amplitude<=200 && amplitude>100)
//   {
//    analogWrite(11, 0);
//     analogWrite(3, 255);
//     analogWrite(5, 0);
// 
//     Serial.println("blue");
//   }
  if(amplitude<=30)
  {
  digitalWrite(8, HIGH);
  digitalWrite(12, LOW);
  digitalWrite(13, LOW);   
  digitalWrite(7, LOW);  
  }
  else if(amplitude>=30&&amplitude<=50)
  {
    digitalWrite(12, HIGH);
   
    digitalWrite(7, LOW);
    digitalWrite(2, LOW);
    
    }
   else if(amplitude>=50&&amplitude<=70)
  {
    
    digitalWrite(7, HIGH);
    digitalWrite(2, LOW);

   }
    else if(amplitude>=70&&amplitude<=100)
  {

    digitalWrite(2, HIGH);


   }

      Serial.println(val);
    delay(50);
     prevval = val;
    

   


  }
