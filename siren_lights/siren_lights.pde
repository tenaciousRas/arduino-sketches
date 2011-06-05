/*
 Fading
 
 This example shows how to fade two LEDs simultaneously.  An analog
 sensor, such as a potentiometer, controls the fadeIncrement.
 
 The circuit:
 * LED attached from digital pin 9 to ground.
 
 Created June 4, 2011
 By Free Beachler
 
 */


int ledPin1 = 9;    // LED connected to digital pin 9
int ledPin2 = 10;    // LED connected to digital pin 10
int fadeIncrement = 15;
int wait = 30;
int pin1FadeValue = 255;
int pin1FadeMode = 0;
int pin2FadeValue = 0;
int pin2FadeMode = 1;
int pinFadeOffset = 0;  // fadeValue offset for pin 2

void setup()  { 
  // nothing happens in setup 
  pin2FadeValue += pinFadeOffset;
  pin1FadeMode = setPinFadeMode(pin1FadeValue, pin1FadeMode);
  pin2FadeMode = setPinFadeMode(pin2FadeValue, pin2FadeMode);
} 

void loop()  {
  int sensorValue = analogRead(A2);
  fadeIncrement = sensorValue / 8;
  if (pin1FadeMode == 1) {
     pin1FadeValue += fadeIncrement;
  } else {
     pin1FadeValue -= fadeIncrement;
  }
  if (pin2FadeMode == 1) {
     pin2FadeValue += fadeIncrement;
  } else {
     pin2FadeValue -= fadeIncrement;
  }
  // obtain pin mode before normalizing
  pin1FadeMode = setPinFadeMode(pin1FadeValue, pin1FadeMode);
  pin2FadeMode = setPinFadeMode(pin2FadeValue, pin2FadeMode);
  pin1FadeValue = normalizedPinVal(pin1FadeValue);
  pin2FadeValue = normalizedPinVal(pin2FadeValue);
  analogWrite(ledPin1, pin1FadeValue);
  analogWrite(ledPin2, pin2FadeValue);
  delay(wait);
}

int normalizedPinVal(int fadeValue) {
  if (fadeValue > 255) {
    return 255;
  }
  if (fadeValue < 0) {
    return 0;
  }
  return fadeValue;
}

boolean bouncePinMode(int fadeValue) {
  if (255 < fadeValue || 0 > fadeValue) {
    return true;
  }
  return false;
}

int setPinFadeMode(int fadeValue, int currentPinMode) {
  if (bouncePinMode(fadeValue)) {
    if (1 == currentPinMode) {
      return 0;
    } else {
      return 1;
    }
  }
  return currentPinMode;
}
