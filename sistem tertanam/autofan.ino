#include <LiquidCrystal.h>
#include <math.h>
#include <BlynkSimpleStream.h>
const int rs = 12, e = 11, d4 = 4, d5 = 5, d6 = 6, d7 = 7;
LiquidCrystal lcd(rs, e, d4, d5, d6, d7);
int tempPin = A5;
int fan = 10;

int tempDingin = 20;
int tempNormal = 25;
int tempPanas = 30;
float fanDingin = 0.1;
float fanNormal = 0.5;
float fanPanas = 0.9;

int fanMax = 255;

float fanLCD;
float fanNow;
float tempNow;

float i_tempDingin;
float i_tempNormal;
float i_tempPanas;

char auth[] = "nsgwi134vju4HSx1p6jgFSmDpGWa5J3w";

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Blynk.begin(auth, Serial);
  pinMode(fan, OUTPUT);
  pinMode(tempPin, INPUT);

}



void loop() {
  // put your main code here, to run repeatedly:
  Blynk.run();
  tempNow = analogRead(tempPin);
  tempNow = tempNow * 0.4883;

  
  if (tempNow == tempDingin) {
    fanNow = fanDingin * fanMax;
  }
  else if (tempNow > tempDingin && tempNow < tempNormal) {
      i_tempDingin = (tempNormal - tempNow) / (tempNormal - tempDingin); 
      i_tempNormal = (tempNow - tempDingin) / (tempNormal - tempDingin); 
      fanNow = (i_tempNormal * (fanNormal * fanMax)) + (i_tempDingin * (fanDingin * fanMax)) / (i_tempNormal + i_tempDingin);
  }
  else if (tempNow == tempNormal) {
      fanNow = fanNormal * fanMax;
  }
  else if (tempNow > tempNormal && tempNow < tempPanas) {
      i_tempNormal = (tempPanas - tempNow) / (tempPanas - tempNormal);
      i_tempPanas = (tempNow - tempNormal) / (tempPanas - tempNormal);
      fanNow = (i_tempPanas * (fanPanas * fanMax)) + (i_tempNormal * (fanNormal * fanMax)) / (i_tempPanas + i_tempNormal);
  }
  else if (tempNow == tempPanas) {
      fanNow = fanPanas * fanMax;
  }
  else {
      fanNow = 0;
  }

  analogWrite(fan, fanNow);

  fanLCD = (fanNow / fanMax)*100;
 
  Blynk.virtualWrite(V5, tempNow);
  Blynk.virtualWrite(V6, fanLCD);
  
  lcd.print("T: ");
  lcd.print(round(tempNow));
  lcd.println("C");

  lcd.print("V: ");
  lcd.print(round(fanLCD));
  lcd.print("%");
  delay(500);
  lcd.clear();
}
