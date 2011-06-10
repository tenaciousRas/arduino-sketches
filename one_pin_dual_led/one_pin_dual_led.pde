int pin1 = 9;

void setup()
{
  pinMode(pin1, OUTPUT);
}

void loop()
{
  sos();
  delay(3000);
}

void sos()
{
  dot(); dot(); dot();
  dash(); dash(); dash();
  dot(); dot(); dot();
}

void dot()
{
  digitalWrite(pin1, HIGH);
  pinMode(pin1, OUTPUT);
  delay(250);
  digitalWrite(pin1, LOW);
  pinMode(pin1, INPUT);
//  digitalWrite(pin1, LOW);
  delay(250);
}

void dash()
{
  pinMode(pin1, OUTPUT);
  digitalWrite(pin1, LOW);
  delay(1000);
  pinMode(pin1, INPUT);
  delay(250);
}
