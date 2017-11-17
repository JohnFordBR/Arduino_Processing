 
void setup() {
  Serial.begin(115200);
  pinMode(A0, INPUT);
}

void loop() {
  Serial.println(digitalRead(A0));
}

