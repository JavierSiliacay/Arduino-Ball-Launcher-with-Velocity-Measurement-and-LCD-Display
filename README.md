# 🎯 Arduino Ball Launcher with Velocity Measurement

This Arduino project launches a ball using a servo, detects it with an ultrasonic sensor, and calculates velocity based on time of flight. A potentiometer sets the launch angle, and an LCD shows angle, time, and velocity. Ideal for physics experiments and motion demos.

---

## 📷 Overview

- Set launch angle via potentiometer
- Launch ball using a button and servo
- Measure flight time with an ultrasonic sensor
- Display angle, time, and velocity on 16x2 I2C LCD
- Reset and repeat with a button press

---

## 🛠️ Components Used

| Component                   | Quantity |
|-----------------------------|----------|
| Arduino Uno/Nano            | 1        |
| HC-SR04 Ultrasonic Sensor   | 1        |
| SG90/MG996R Servo Motor     | 1        |
| Potentiometer (10kΩ)        | 1        |
| Push Button                 | 1        |
| 16x2 I2C LCD (0x27 or 0x3F) | 1        |
| Jumper Wires                | -        |
| Breadboard                  | 1        |

---

## 🔌 Pin Connections

| Arduino Pin | Connected To         |
|-------------|----------------------|
| D2          | Button               |
| D9          | Servo Signal         |
| D10         | HC-SR04 Trigger      |
| D11         | HC-SR04 Echo         |
| A0          | Potentiometer Output |
| SDA (A4)    | LCD SDA              |
| SCL (A5)    | LCD SCL              |
| 5V / GND    | All Components Power |

---

## 📐 Velocity Formula

\[
\text{Velocity (m/s)} = \frac{\text{Distance}}{\text{Time}}
\]

- Distance is the point of ultrasonic detection (in meters)
- Time is measured from launch to detection using `millis()`

---

## ▶️ How It Works

1. Turn the potentiometer to set an angle (shown on LCD)
2. Press the button to launch the ball (servo moves to 90°)
3. Ultrasonic sensor detects the ball's arrival
4. Time is measured and velocity is calculated
5. Press button again to reset and repeat

---

## 📋 Libraries Required

- [Servo.h](https://www.arduino.cc/reference/en/libraries/servo/)
- [Wire.h](https://www.arduino.cc/en/Reference/Wire)
- [LiquidCrystal_I2C.h](https://github.com/johnrickman/LiquidCrystal_I2C)

---

## 🚀 Future Improvements

- Log results to SD card
- Display velocity graph on PC via Serial
- Add buzzer or lights for feedback
- Support different launch distances

---

## 📄 License

MIT License – free to use, modify, and distribute.

---

## 🧠 Author

Made by [Javier Siliacay] – for educational purposes and fun physics demos!
