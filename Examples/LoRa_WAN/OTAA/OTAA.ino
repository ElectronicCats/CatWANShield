/*******************************************************************************
  Created by Eduardo Contreras @ Electronic Cats 2016
  Based on Copyright (c) 2015 Thomas Telkamp and Matthijs Kooijman
  PLEASE REFER TO THIS LMIC LIBRARY https://github.com/things-nyc/arduino-lmic
  
  LoRaShield
  In this example you can send GPS information (Compatible with the L80)
  or a temperature read by the ADC  
  Example
 *******************************************************************************/

#include <lmic.h> 
#include <hal/hal.h> 
#include <SPI.h> 
#include <SoftwareSerial.h> 
 
//#define _USE_GPS_  
#define _USE_TEMP_  
 
 
#ifdef _USE_GPS_    //GPS Configuration 
#include <TinyGPS++.h> 
SoftwareSerial ss(5, 4); 
TinyGPSPlus gps; 
double gps_lat = 0; 
double gps_lng = 0; 
double gps_alt = 0; 
bool gpsEncoded = false; 
#endif 
 
#define debugSerial Serial 
 
unsigned long previousMillis = 0; 
 
static const u1_t PROGMEM DEVEUI[8]= {0x83,0x34,0x27,0x82,0x91,0x12,0x29,0x91}; 
static const u1_t PROGMEM APPEUI[8]= {0x76,0x28,0x81,0x73,0x61,0x35,0xFF,0xFF}; 
static const u1_t PROGMEM APPKEY[16] = {0xFF,0x21,0x35,0x16,0x23,0x21,0x3F,0x23,0xF2,0x3F,0x23,0xF2,0x3F,0x23,0xF2,0x31}; 
 
void os_getArtEui (u1_t* buf) { memcpy_P(buf, APPEUI, 8);} 
void os_getDevEui (u1_t* buf) { memcpy_P(buf, DEVEUI, 8);} 
void os_getDevKey (u1_t* buf) {  memcpy_P(buf, APPKEY, 16);} 
 
 
static osjob_t sendjob; 
static osjob_t blinkjob; 
static osjob_t readJob; 
 
const unsigned TX_INTERVAL = 30; 
 
// Pin mapping 
const lmic_pinmap lmic_pins = { 
    .nss = 10, 
    .rxtx = LMIC_UNUSED_PIN, 
    .rst = 9, 
    .dio = {2, 3, 4}, 
}; 
 
void do_send(osjob_t* j, uint8_t *mydata, uint16_t len) { 
  // Check if there is not a current TX/RX job running 
  if (LMIC.opmode & OP_TXRXPEND) { 
    debugSerial.println(F("[LMIC] OP_TXRXPEND, not sending")); 
  } else { 
    // Prepare upstream data transmission at the next possible time. 
    LMIC_setTxData2(1, mydata, len, 0); 
  } 
} 
 
static void blinkfunc (osjob_t* j) { 
  digitalWrite(A0,!digitalRead(A0)); 
  os_setTimedCallback(j, os_getTime()+ms2osticks(100), blinkfunc);  // reschedule blink job 
} 
 
static void readfunc(osjob_t* j) { 
 
  uint8_t len = 0; 
  uint8_t mydata[len]; 
  uint8_t cnt = 0; 
  uint8_t ch = 0; 
 
  #ifdef _USE_TEMP_// Temperature 
  len += 4; 
  debugSerial.println(F("[INFO] Collecting temperature info")); 
  int a = analogRead(A0); 
  float R = 1023.0 / ((float)a) - 1.0; 
  R = 100000.0 * R; 
 
  float temp = 1.0 / (log(R / 100000.0) / 4275 + 1 / 298.15) - 273.15; 
  debugSerial.print(F("[INFO] Temperature:")); debugSerial.println(temp); 
  int val = round(temp * 10); 
  mydata[cnt++] = ch; 
  mydata[cnt++] = 0x67; 
  mydata[cnt++] = highByte(val); 
  mydata[cnt++] = lowByte(val); 
  #endif 
   
  // GPS 
  #ifdef _USE_GPS_ 
    len += 11; // GPS 
    if (!ss.isListening()) { 
      ss.listen(); 
    } 
    while (ss.available() > 0) { 
      if (gps.encode(ss.read())) { 
        if (gps.location.isValid() && gps.altitude.isValid()) { 
          // indicating GPS is successfully obtained 
          gpsEncoded = true; 
          // update the locations 
          gps_lat = gps.location.lat(); 
          gps_lng = gps.location.lng(); 
          gps_alt = gps.altitude.meters(); 
        } 
      } 
    } 
  } 
   
  if (gpsEncoded) { 
    digitalWrite(A0, LOW); 
    debugSerial.println(F("[INFO] Collecting GPS info")); 
    debugSerial.print(F("[INFO] Lat:")); debugSerial.println(String(gps_lat, 6)); 
    debugSerial.print(F("[INFO] Lng:")); debugSerial.println(String(gps_lng, 6)); 
    debugSerial.print(F("[INFO] Alt:")); debugSerial.println(gps_alt); 
    long lat = round(gps_lat * 10000); 
    long lng = round(gps_lng * -10000); 
    long alt = round(gps_alt * 100); 
    ch = ch + 1; 
    mydata[cnt++] = ch; 
    mydata[cnt++] = 0x88; 
    mydata[cnt++] = lat >> 16; 
    mydata[cnt++] = lat >> 8; 
    mydata[cnt++] = lat; 
    mydata[cnt++] = lng >> 16; 
    mydata[cnt++] = lng >> 8; 
    mydata[cnt++] = lng; 
    mydata[cnt++] = alt >> 16; 
    mydata[cnt++] = alt >> 8; 
    mydata[cnt++] = alt; 
  } 
  else{ 
    digitalWrite(A0, HIGH); 
    lat=0;lng=0; 
    mydata[cnt++] = ch; 
    mydata[cnt++] = 0x88; 
    mydata[cnt++] = lat >> 16; 
    mydata[cnt++] = lat >> 8; 
    mydata[cnt++] = lat; 
    mydata[cnt++] = lng >> 16; 
    mydata[cnt++] = lng >> 8; 
    mydata[cnt++] = lng; 
    mydata[cnt++] = alt >> 16; 
    mydata[cnt++] = alt >> 8; 
    mydata[cnt++] = alt; 
 
  } 
  #endif 
 
  if (cnt == len) { 
    debugSerial.println(F("[LMIC] Start Radio TX")); 
    // indicating start radio TX 
    digitalWrite(A1, HIGH); 
 
    do_send(&sendjob, mydata, sizeof(mydata)); 
  } 
  else{ 
    debugSerial.println(F("[ERROR] Data stack incorrect")); 
} 
  os_setTimedCallback(j, os_getTime()+ms2osticks(30000), readfunc);  // reschedule blink job 
} 
 
void debug_char(u1_t b) { 
  debugSerial.write(b); 
} 
 
void debug_hex (u1_t b) { 
  debug_char("0123456789ABCDEF"[b >> 4]); 
  debug_char("0123456789ABCDEF"[b & 0xF]); 
} 
 
void debug_buf (const u1_t* buf, u2_t len) { 
  while (len--) { 
    debug_hex(*buf++); 
    debug_char(' '); 
  } 
  debug_char('\r'); 
  debug_char('\n'); 
} 
 
void onEvent (ev_t ev) { 
    debugSerial.print("[LMIC] "); 
    switch(ev) { 
        case EV_JOINING: 
            debugSerial.println(F("EV_JOINING")); 
             blinkfunc(&blinkjob); 
            break; 
        case EV_JOINED: 
            debugSerial.println(F("EV_JOINED")); 
            LMIC_setDrTxpow(DR_SF9,14); 
            // Disable link check validation (automatically enabled 
            // during join, but not supported by TTN at this time). 
            os_clearCallback(&blinkjob); 
            os_clearCallback(&sendjob); 
            digitalWrite(A0,false); 
            readfunc(&readJob); 
            LMIC_setLinkCheckMode(0); 
            break; 
        case EV_JOIN_FAILED: 
            debugSerial.println(F("EV_JOIN_FAILED")); 
            break; 
        case EV_REJOIN_FAILED: 
            debugSerial.println(F("EV_REJOIN_FAILED")); 
            break; 
        case EV_TXCOMPLETE: 
            debugSerial.println(F("EV_TXCOMPLETE (includes waiting for RX windows)")); 
            if (LMIC.txrxFlags & TXRX_ACK) 
              debugSerial.println(F("Received ack")); 
            if (LMIC.dataLen) { 
              debugSerial.println(F("Received ")); 
              debugSerial.println(LMIC.dataLen); 
              debugSerial.println(F(" bytes of payload")); 
            } 
            // Schedule next transmission 
           // os_setTimedCallback(&sendjob, os_getTime()+sec2osticks(TX_INTERVAL), do_send); 
            break; 
        case EV_RXCOMPLETE: 
            // data received in ping slot 
            debugSerial.println(F("EV_RXCOMPLETE")); 
            break; 
         default: 
            debugSerial.println(F("Unknown event"));  
            //Serial.println(ev); 
            break; 
    } 
} 
 
void setup() { 
  debugSerial.begin(115200); 
  debugSerial.println(F("[INFO] LoRa Demo Node 1 Demonstration")); 
 
  //initialize LED as output and at low state 
  pinMode(A1, OUTPUT); 
  pinMode(A0, OUTPUT); 
  digitalWrite(A1, LOW); 
  digitalWrite(A0, HIGH); 
  delay(250); 
  digitalWrite(A0, LOW); 
  // start GPS object 
  #ifdef _USE_GPS_ 
  ss.begin(9600); 
  #endif 
 
  os_init(); 
  LMIC_reset(); 
 
  for (int channel=0; channel<72; ++channel) { 
      LMIC_disableChannel(channel); 
    } 
 
      LMIC_enableChannel(48); 
      LMIC_enableChannel(49); 
      LMIC_enableChannel(50); 
      LMIC_enableChannel(51); 
      LMIC_enableChannel(52); 
      LMIC_enableChannel(53); 
      LMIC_enableChannel(54); 
      LMIC_enableChannel(55); 
      LMIC_enableChannel(70); 
 
  LMIC_setLinkCheckMode(0); 
  LMIC_setAdrMode(false); 
  LMIC_setDrTxpow(DR_SF7, 14); //SF7 
  LMIC_setClockError(MAX_CLOCK_ERROR * 1 / 100); 
  previousMillis = millis(); 
  char first = "Hola"; 
  do_send(&sendjob, first, sizeof(first)); 
    } 
   
void loop() { 
    os_runloop_once(); 
} 
