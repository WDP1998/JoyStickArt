// Example by Tom Igoe

import processing.serial.*;
import java.awt.event.KeyEvent; // imports library for reading the data from the serial port
int x = 500;
int y = 500;
int x1 = 500;
int y1 = 500;

int r = 0;
int b = 10;
int g = 10;
int xcoord = 500;
int ycoord = 500;
int xcoord1 = 500;
int ycoord1 = 500;
boolean down = false;
void setup() {
 size (1920, 1080);
 background(1);
 smooth();
 Serial myPort = new Serial(this,"COM5", 9600); // starts the serial communication
 myPort.bufferUntil('.'); // reads the data from the serial port up to the character '.'. So actually it reads this: angle,distance.
}



void serialEvent (Serial myPort) { // starts reading data from the Serial Port
  // reads the data from the Serial Port up to the character '.' and puts it into the String variable "data".
  String data = myPort.readStringUntil('.');
  data = data.substring(0,data.length()-1);
  
  int index1 = data.indexOf(";"); // find the character ',' and puts it into the variable "index1"
  String First = data.substring(0,index1);
  String Second = data.substring(index1+1,data.length());
  int index2 = First.indexOf(',');
  int index3 = Second.indexOf(',');
  String xStr = First.substring(0, index2); // read the data from position "0" to position of the variable index1 or thats the value of the angle the Arduino Board sent into the Serial Port
  String yStr = First.substring(index2+1, First.length()); // read the data from position "index1" to the end of the data pr thats the value of the distance
  String xStr1 = Second.substring(0, index3); // read the data from position "0" to position of the variable index1 or thats the value of the angle the Arduino Board sent into the Serial Port
  String yStr1 = Second.substring(index3+1, Second.length()); // read the data from position "index1" to the end of the data pr thats the value of the distance
  
  // converts the String variables into Integer
  x = int(xStr);
  y = int(yStr);
  x1 = int(xStr1);
  y1 = int(yStr1);
}

 void rainbow(int r,int g,int b) {
   if (r != 255) {
     r++;
   }
   else if (b !=255) {
     b++;
   }
   else if (g != 255) {
     g++;
   }
   else {
     r =0;
     b=0;
     g=0;
   }    
}

void draw(){
 noStroke();
   if (r != 255 && down == false) {
     r++;
   }
   else if (b !=255 && down == false) {
     b++;
   }
   else if (g != 255 && down == false) {
     g++;
     down = true;
   }
   else if (r != 0 && down == true) {
     r--;
   }
   else if (b != 0 && down == true) {
     b-- ;
   }
   else if (g != 0 && down == true) {
     g--;
   }
   else {
     down = false;
   }
 fill(r,g,b);
 ellipse(xcoord1,ycoord1,10,10);
 rainbow(r,g,b);
 fill(r,g,b);
 ellipse(xcoord,ycoord,20,20);
 //text(x1, x1-15, y1-10);
 //text(y1, x1+15, y1-10);
if(x1 > 600){
   //b += 10;
   if(xcoord1 < 1920){
   xcoord1 += 10;
   }
 }
 else if(x1 < 400){
   //b -= 10;
   if (xcoord1 > 0){
     xcoord1 -= 10;
   }
 }
 if(y1 > 600){
   //g -= 10;
   if(ycoord1 < 1080){
   ycoord1 += 10;
   }
 }
 else if(y1 < 400){
  //g += 10;
  if(ycoord1 > 0){
  ycoord1 -= 10;
  }
 }
if(x > 600){
  if(xcoord < 1920){
   xcoord += 10;
  }
 }
 else if(x < 400){
   if(xcoord > 0){
   xcoord -= 10;
 }
 if(y > 600){
   if(ycoord < 1080){
     ycoord += 10;
   }
 }
 else if(y < 400){
   if(ycoord > 0){
  ycoord -= 10;
   }
 }
}
}
