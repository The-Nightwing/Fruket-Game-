#include <SimpleDHT.h>
#include <SoftwareSerial.h>
#include <dht.h> 
dht DHT;
int pinDHT11 = 8;
SimpleDHT11 dht11;
float sensor_volt;
float RS_gas; 
float R0;
float ratio;
float BAC;
int R2 = 2000;
#define DHT11_PIN 8
#define LDR_PIN A1
#define MQ3_PIN A0
char data = 0;
int ldr_read = 0;
int gas_read = 0;
void setup() 
{             
  pinMode(LDR_PIN, INPUT);
  Serial.begin(9600);
}
void loop()
{   String str="";
    String get_str="";
    int sensorValue = analogRead(A0);
    sensor_volt=(float)sensorValue/1024*5.0;
    RS_gas = ((5.0 * R2)/sensor_volt) - R2; 
    R0 = 16000;
    ratio = RS_gas/R0;// ratio = RS/R0
    double x = 0.4*ratio;   
    BAC = pow(x,-1.431);  //BAC in mg/L
    ldr_read = analogRead(LDR_PIN);
    gas_read = analogRead(MQ3_PIN);
    byte temperature = 0;
    byte humidity = 0;
    int t=BAC*0001;
    dht11.read(pinDHT11, &temperature, &humidity, NULL);
    Serial.print(" " + String((int)temperature) + " " + String((int)humidity) + " " + String(BAC*0.0001)+ " " + ldr_read);
delay(2000);
}
