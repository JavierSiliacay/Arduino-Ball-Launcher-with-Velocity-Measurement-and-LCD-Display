### Project Overview: Catapult Velocity Measurement with Ultrasonic Sensor

This project uses an **ultrasonic sensor** to measure the *velocity* of a catapult-launched ball. The system calculates the **time of flight** based on the distance traveled and the launch-to-detection time interval. It then computes the **velocity** and displays it on an LCD screen, providing real-time feedback.

### How It Works

1. Hardware Setup:

   -Ultrasonic Sensor: The sensor measures the distance traveled by the catapult-launched ball after it is fired.
   -Servo Motor: The servo is used to release the ball at a user-defined angle.
   -LCD Display: A 20x4 LCD shows the time of flight and calculated velocity.
   -Button: A button is used to launch the catapult and reset the system for the next measurement.

2. Velocity Calculation:

   - The distance between the catapult launch point and the ultrasonic sensor is measured after the ball is launched.
   - Using this distance and the time of flight, the velocity is calculated using the formula:

   $$
   \text{{Velocity (m/s)}} = \frac{{\text{{Distance (m)}}}}{{\text{{Time (s)}}}}
   $$

3. Operation Logic:

   - Set the Launch Angle: A potentiometer is used to set the release angle of the catapult.
   - Launch Process: Once the button is pressed, the servo releases the ball.
   - Measure Time and Distance: The time between the launch and when the ball is detected by the ultrasonic sensor is recorded. The distance traveled by the ball is also measured.
   - Display Results: The time of flight and velocity are displayed on the LCD screen.

4. Feedback System:

   - Velocity Display: The LCD shows real-time velocity calculations based on the measured distance and time.
   - Reset: After each measurement, the system can be reset to repeat the process with a new ball launch.

### Workflow:

1. Launch the Ball:

   - Press the button to launch the ball using the servo mechanism.
2. Measure Distance:

    The ultrasonic sensor measures the distance traveled by the ball after launch.
3. Calculate Velocity:

   - The time of flight and distance are used to calculate the ball's velocity.
4. Display Results:

   - The calculated velocity is shown on the LCD screen, and the system is reset for the next launch.

---

By using this setup, you'll be able to measure the velocity of the launched ball, which can help with analyzing the dynamics of the catapult.
