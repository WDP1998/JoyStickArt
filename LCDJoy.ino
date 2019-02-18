#include <LiquidCrystal.h>

// initialize the library by associating any needed LCD interface pin
// with the arduino pin number it is connected to
const int rs = 7, en = 6, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

int x = A0;
int y = A1;
int x1 = A3;
int y1 = A4;
int JS = 9; 
void setup() {
  // set up the LCD's number of columns and rows:
  lcd.begin(16, 2);
  Serial.begin(9600);
  pinMode(x, INPUT);
  pinMode(y, INPUT);
  pinMode(x1, INPUT);
  pinMode(y1, INPUT);
  pinMode(JS, INPUT);
}

void loop() {
  lcd.clear();
  int xVal = analogRead(x);
  int yVal = analogRead(y);
  int xVal1 = analogRead(x1);
  int yVal1 = analogRead(y1);
  Serial.print(xVal);
  Serial.print(',');
  Serial.print(yVal);
  Serial.print(';');
  Serial.print(xVal1);
  Serial.print(',');
  Serial.print(yVal1);
  // set the cursor to column 0, line 1
  // (note: line 1 is the second row, since counting begins with 0):
  /*
  lcd.setCursor(0, 0);
  
  if(xVal > 600 && ((yVal > 400) && (yVal < 600))){
    lcd.print(1);
    Serial.print(1);
  }
  else if((xVal < 400)&&(yVal )){
    lcd.print("left");
    Serial.print("left");
  }
  /*
  else{
    lcd.print("");
    Serial.print("");
  }
  lcd.setCursor(0,1);
  Serial.print(" ");
  if(yVal > 600){
  lcd.print("down");
   Serial.print("down");
  }
  else if(yVal < 400){
    lcd.print("up");
    Serial.print("up");
  }
  /*
  else{
    lcd.print("");
    Serial.print("");
  }
  */
  Serial.print('.');
}
