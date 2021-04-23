
void setup() {
  Serial.begin(9600);
 }

void loop() {
  int mouseX=map(analogRead(A0),0,1023,-50,1000);
  Serial.println(mouseX);
  delay(100);
  }
