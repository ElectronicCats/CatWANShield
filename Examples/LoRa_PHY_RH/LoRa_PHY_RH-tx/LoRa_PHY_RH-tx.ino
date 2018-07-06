#include <SPI.h>
#include <RH_RF95.h>

#define RFM95_CS 10 
#define RFM95_RST 9
#define RFM95_INT 2
#define RF95_FREQ 915.0 //Usados creando el objeto

RH_RF95 rf95(RFM95_CS, RFM95_INT);

#include <Wire.h> 
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x3F,16,2);  // set the LCD address to 0x27 for a 16 chars and 2 line display
String Todo="";
uint32_t cont=1;

void setup() 
{
  pinMode(8,INPUT_PULLUP);
  Serial.begin(115200);
  lcd.begin();                      // initialize the lcd 
  lcd.backlight();
  /*****LoRa init****/
  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);
  delay(100);
  lcd.print("Electronic cats");
  lcd.setCursor(0,1);
  lcd.print("LoRa Tester 2017");
  delay(1800);
  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);
    while (!rf95.init()) {
    Serial.println(F("LoRa radio init failed"));
    while (1);
  }

  lcd.print("LoRa Ok");
  lcd.setCursor(0,1);
  lcd.print("inicializado");
  Serial.println("LoRa radio init OK!");
  if (!rf95.setFrequency(RF95_FREQ)) {
    while (1);
  }
  rf95.setTxPower(23, false); //Set the max transmition power
  /******************/
}

void loop()
{ 

  lcd.home();
  lcd.clear();
  Todo+=String(!digitalRead(8));
  Todo+=",";
  int a =map(analogRead(A0),0,1023,100,0);
  Todo+=String(a,DEC);
  char todoch[Todo.length()+1];
  Todo.toCharArray(todoch,Todo.length()+1);
  //Serial.println(todoch);
  lcd.setCursor(0,0);
  lcd.print("Boton:");
  lcd.print(!digitalRead(8));
  lcd.print(" Data:");
  lcd.print(a);
  lcd.setCursor(0,1);
  lcd.print("Fct: ");
  lcd.print(cont);
  delay(1000); 
  rf95.send((uint8_t *)todoch,Todo.length());
  cont++;
  Todo = "";
 
  
  rf95.waitPacketSent();
  // Espera respuesta 
  uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
  uint8_t len = sizeof(buf);

  if (rf95.waitAvailableTimeout(3000))
  { 
    // Respuesta del Rx  
    if (rf95.recv(buf, &len))
   {
      lcd.clear();
      lcd.home();
      lcd.print("Respuesta: ");
      lcd.println((char*)buf);
      lcd.setCursor(0,1);
      lcd.print("RSSI:");
      lcd.println(String(rf95.lastRssi()));
      Serial.print("got reply: ");
      Serial.println((char*)buf);
      Serial.print("RSSI: ");
      Serial.println(rf95.lastRssi(), DEC); 
      delay(1000);   
    }
    else
    {
      Serial.println("recv failed");
    }
  }
  else
  {
    lcd.clear();
    lcd.home();
    lcd.print("Sin respuesta");
    delay(1000);
    lcd.print("");
    Serial.println("Sin respuesta");
  }
  delay(100);
}


