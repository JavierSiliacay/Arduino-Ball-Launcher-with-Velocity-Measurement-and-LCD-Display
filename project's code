/*
  Arduino Ball Launcher with Velocity Measurement
  ------------------------------------------------------------------------------
  © 2025 Javier Siliacay | USTP Autotronics - All Rights Reserved.

  This source code is the intellectual property of the author and is provided 
  for educational and non-commercial use only. Unauthorized copying, modification, 
  distribution, or use of this code for commercial purposes is strictly prohibited 
  without prior written consent from the author.

  Violation of these terms may result in legal action under applicable intellectual 
  property laws.

  For permissions, contact: github.com/javiersiliacay
  ------------------------------------------------------------------------------
*/

#include <Servo.h>
#include <Wire.h>
#include <LiquidCrystal_I2C.h>

#define TRIG_PIN 10
#define ECHO_PIN 11
#define BUTTON_PIN 2
#define POT_PIN A0

Servo servo;
LiquidCrystal_I2C lcd(0x27, 16, 2);  // Check your I2C address (0x27 or 0x3F)

int angle = 0;
bool launched = false;
bool dataCaptured = false;
unsigned long startTime;
unsigned long elapsedTime;

void setup() {
  servo.attach(9);
  pinMode(POT_PIN, INPUT);
  pinMode(BUTTON_PIN, INPUT);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  servo.write(0);

  Serial.begin(9600);
  lcd.init();
  lcd.backlight();

  Serial.println("Set angle with potentiometer, press button to launch.");
  lcd.setCursor(0, 0);
  lcd.print("Angle: ");
  lcd.setCursor(0, 1);
  lcd.print("Set & Press Btn");
}

void loop() {
  if (!launched && !dataCaptured) {
    int potValue = analogRead(POT_PIN);
    angle = map(potValue, 0, 1023, 0, 180);
    servo.write(angle);

    Serial.print("Angle: ");
    Serial.println(angle);

    // Display angle on LCD
    lcd.setCursor(7, 0); // After "Angle: "
    lcd.print("    ");   // Clear old angle
    lcd.setCursor(7, 0);
    lcd.print(angle);
    lcd.print((char)223); // Degree symbol

    if (digitalRead(BUTTON_PIN) == HIGH) {
      delay(200);
      Serial.println("Launching!");
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("Launching!");
      servo.write(90);
      launched = true;
      startTime = millis();
    }
  }

  if (launched && !dataCaptured) {
    long duration;
    float distance;

    digitalWrite(TRIG_PIN, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIG_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN, LOW);

    duration = pulseIn(ECHO_PIN, HIGH, 30000);
    distance = (duration * 0.0343) / 2;

    elapsedTime = millis() - startTime;
    float runningTimeSec = elapsedTime / 1000.0;

    Serial.print("Time (running): ");
    Serial.println(runningTimeSec, 2);

    lcd.setCursor(0, 0);
    lcd.print("Time:");
    lcd.print(runningTimeSec, 2);
    lcd.print("s  ");

    if (distance < 70) {
      Serial.println("Ball Detected.");

      float timeSec = runningTimeSec;
      float distance_m = distance / 100.0;
      float velocity = distance_m / timeSec;

      Serial.print("Final Time (s): ");
      Serial.println(timeSec, 2);
      Serial.print("Velocity (m/s): ");
      Serial.println(velocity, 4);

      lcd.setCursor(0, 1);
      lcd.print("Vel:");
      lcd.print(velocity, 3);
      lcd.print("m/s ");

      Serial.println("==== Waiting for RESET ====");
      dataCaptured = true;
    }
  }

  if (dataCaptured && digitalRead(BUTTON_PIN) == HIGH) {
    delay(200); // debounce
    Serial.println("Resetting system...");
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Resetting...");
    dataCaptured = false;
    launched = false;
    delay(1000);
    servo.write(angle);
    Serial.println("Ready. Set angle and press to launch again.");

    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Angle: ");
    lcd.setCursor(0, 1);
    lcd.print("Set & Press Btn");
  }

  delay(100);
}
