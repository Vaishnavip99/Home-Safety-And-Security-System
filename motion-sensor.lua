#define BLYNK_TEMPLATE_ID "TMPL32BBBtMii" 
#define BLYNK_TEMPLATE_NAME "theftn" 
#define BLYNK_AUTH_TOKEN "h6z3T7ycfIfTfIXcOp7oEVW_TkkYRPKs" 
#define BLYNK_PRINT Serial 
#include <ESP8266WiFi.h> 
#include <BlynkSimpleEsp8266.h> 
 
char auth[] = BLYNK_AUTH_TOKEN; 
char ssid[] = "M34"; // type your wifi name 
char pass[] = "janvi.p.patil1"; // type your wifi password 
#define PIR_SENSOR 4 //D2 
#define DO_PIN 13 //D7 
#define LED 5 // D1 
#define BUZZER 14 //D5 
BlynkTimer timer; 
int flag=0; 
void notifyOnTheft(){ 
int isTheftAlert = digitalRead(PIR_SENSOR); 
int gasState = digitalRead(DO_PIN); 
Serial.println(isTheftAlert); 
if (isTheftAlert==1 && flag==0) 
{ Serial.println("Theft Alert in Home"); 
//Blynk.email("jineshapatil1400@gmail.com","Alert","Theft Alert 
in Home"); 
// Blynk.notify("Alert : Theft Alert in Home"); 
Blynk.logEvent(" theft_alert","Theft Alert in Home "); 
digitalWrite(LED,HIGH); 
flag=1; 
} 
else if (isTheftAlert==0) 
{ 
flag=0; 
digitalWrite(LED,LOW); 
} 
if (gasState == HIGH) 
{ 
Serial.println("The gas is NOT present"); 
//digitalWrite(BUZZER,LOW); 
} 
else 
{ 
Serial.println("The gas is present"); 
 
Department of Computer Engineering 60 D.N.Patel College of Engineering Shahada 
 
 
 
Blynk.logEvent("gas_detected","Gas Alert in Home"); 
digitalWrite(BUZZER,HIGH); 
delay(1000); 
digitalWrite(BUZZER,LOW); 
} 
} 
void 
setup(){ pinMode(PIR_SENSOR, 
INPUT); pinMode(LED,OUTPUT); 
pinMode(DO_PIN, INPUT); 
 
Serial.begin(115200); 
Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass); 
//dht.begin(); 
timer.setInterval(1000L, notifyOnTheft); 
} 
void 
loop(){  
Blynk.run(); 
timer.run(); 
} 
 
 
 
 
