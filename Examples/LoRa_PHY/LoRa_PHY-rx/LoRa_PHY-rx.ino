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
char reci[10];
uint32_t cont=1;

void setup() 
{
  Serial.begin(9600);
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
  if(rf95.available())
  {
    lcd.clear();
    lcd.setCursor(0,0);
    // Should be a message for us now   
    uint8_t buf[RH_RF95_MAX_MESSAGE_LEN];
    uint8_t len = sizeof(buf);
    if (rf95.recv(buf, &len))
    {
      Serial.print("got request: ");
      Serial.write((char*)buf,4);
      Serial.println();
      for(int i=0;i<len;i++){
      reci[i]=(char*)buf[i];
      Serial.print("reci: ");
      Serial.println(reci[i]);
      }
      Serial.print(len);
      Serial.println(" bytes of payload");
      Serial.print("RSSI: ");
      Serial.println(rf95.lastRssi(), DEC);
      lcd.print("Boton:");
      lcd.print(reci[0]);
      lcd.print(" Data:");
      for(int a=2;a<len;a++){
        lcd.print(reci[a]);
      }
      lcd.setCursor(0,1);
      lcd.print("Fct:");
      lcd.print(cont);
      cont++;
      lcd.print(" RSSI:");
      lcd.print(String(rf95.lastRssi()));
      delay(1200);
      
      // Send a reply
      uint8_t data[] = "ACK";
      rf95.send(data, sizeof(data));
      rf95.waitPacketSent();
      Serial.println("Sent a reply");
      lcd.clear();
      lcd.setCursor(0,0);
      lcd.print("Enviando ");
      lcd.setCursor(0,1);
      lcd.print("Respuesta: ACK");
      delay(800);
    }
    else
    {
      Serial.println("recv failed");
    }
  }
}


