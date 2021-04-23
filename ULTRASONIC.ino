

int echoPin= 2;
int triggerPin= 3;

unsigned d=0;
unsigned long pt = 0;

unsigned odein =0;

void setup (){
  pinMode (echoPin, INPUT);
  pinMode (triggerPin, OUTPUT);
  Serial.begin(9600);  
}

void loop(){ 
   
   //{int mouseX=map(analogRead(A3),0,1023,-50,1000);
  //Serial.println(mouseX);
  //delay(100);}
  
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(100);
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(100);
  digitalWrite(triggerPin, LOW);
  pt = pulseIn(echoPin, HIGH);
  d = pt / 58;
  delay(10);
  if (odein != d) {

    Serial.println(d); 

    odein = d;
  }

  delay(50);
} 
