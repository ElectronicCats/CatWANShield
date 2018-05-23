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
#include <math.h>
#include <SoftwareSerial.h>

//#define _USE_GPS_
#define _USE_TEMP_
//#define _USE_ULTRASONIC_

#ifdef _USE_GPS_
#include <TinyGPS++.h>
SoftwareSerial ss(6, 5);
TinyGPSPlus gps;
double gps_lat = 0;
double gps_lng = 0;
double gps_alt = 0;
bool gpsEncoded = false;
#endif

#ifdef _USE_ULTRASONIC_
const int trigPin = 7;
const int echoPin = 8;
#endif


#define debugSerial Serial

unsigned long previousMillis = 0;


static const PROGMEM u1_t NWKSKEY[16] ={0x98,0xBB,0x8C,0x22,0xFC,0x0D,0x1F,0xB5,0xEF,0x8E,0xA2,0x90,0x76,0xFB,0xCF,0xA7};
static const u1_t PROGMEM APPSKEY[16] ={0xA4,0x98,0xF9,0x32,0xDF,0x71,0xDC,0x0A,0xB2,0xA6,0x15,0x77,0xC4,0xC4,0xCC,0xE7};
static const u4_t DEVADDR =0x077ce77f;


void os_getArtEui (u1_t* buf) { }
void os_getDevEui (u1_t* buf) { }
void os_getDevKey (u1_t* buf) { }

// We will be using Cayenne Payload Format
// For one sensor,
// the general format is channel | type | payload
// payload size depends on type
// here we are using temperature, GPS and customised PM25,
// temperature - 2, GPS - 9, PM25 - 2

static osjob_t sendjob;

// Schedule TX every this many seconds (might become longer due to duty
// cycle limitations).
const unsigned TX_INTERVAL = 20;

// Pin mapping for RFM9X
const lmic_pinmap lmic_pins = {
    .nss = 10,
    .rxtx = LMIC_UNUSED_PIN,
    .rst = 9,
    .dio = {2, 3, 4},
};

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
  switch (ev) {
    case EV_TXCOMPLETE:

      // indicating radio TX complete
      digitalWrite(A1, LOW);

      debugSerial.println(F("[LMIC] Radio TX complete (included RX windows)"));
      if (LMIC.txrxFlags & TXRX_ACK)
        debugSerial.println(F("[LMIC] Received ack"));
      if (LMIC.dataLen) {
        debugSerial.print(F("[LMIC] Received "));
        debugSerial.print(LMIC.dataLen);
        debugSerial.println(F(" bytes of payload"));
        debug_buf(LMIC.frame + LMIC.dataBeg, LMIC.dataLen);
      }
      break;

    default:
      debugSerial.println(F("[LMIC] Unknown event"));
      break;
  }
}

void do_send(osjob_t* j, uint8_t *mydata1, uint16_t len) {
  // Check if there is not a current TX/RX job running
  if (LMIC.opmode & OP_TXRXPEND) {
    debugSerial.println(F("[LMIC] OP_TXRXPEND, not sending"));
  } else {
    // Prepare upstream data transmission at the next possible time
    LMIC_setTxData2(1, mydata1, len, 0);
  }
}



void setup() {
  debugSerial.begin(115200);
  debugSerial.println(F("[INFO] LoRa Demo Node 1 Demonstration"));

  // start GPS object
  #ifdef _USE_GPS_
  ss.begin(9600);
  #endif

  #ifdef _USE_ULTRASONIC_
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  #endif

  os_init();
  LMIC_reset();

  uint8_t appskey[sizeof(APPSKEY)];
  uint8_t nwkskey[sizeof(NWKSKEY)];
  memcpy_P(appskey, APPSKEY, sizeof(APPSKEY));
  memcpy_P(nwkskey, NWKSKEY, sizeof(NWKSKEY));

  LMIC_setSession (0x1, DEVADDR, nwkskey, appskey);
  //LMIC_selectSubBand(2);
  for (int channel=0; channel<72; ++channel) {
      LMIC_disableChannel(channel);
    }
  //SF TTN
  /*
      LMIC_enableChannel(8);
      LMIC_enableChannel(9);
      LMIC_enableChannel(10);  //904.3Mhz
      LMIC_enableChannel(11);
      LMIC_enableChannel(12);
      LMIC_enableChannel(13);
      LMIC_enableChannel(14);
      LMIC_enableChannel(15);
      LMIC_enableChannel(65); 
   */
  //Home
    
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

  previousMillis = millis();

}

void loop() {

  if (millis() > previousMillis + TX_INTERVAL * 1000) { //Start Job at every TX_INTERVAL*1000

    getInfoAndSend();
    previousMillis = millis();
  }

  os_runloop_once();
}

void getInfoAndSend() {

  uint8_t len=0;   //Bug of len

  uint8_t mydata[255];
  uint8_t cnt = 0;
  uint8_t ch = 0;
  debugSerial.println(F("[INFO] Collecting info"));
 
  #ifdef _USE_ULTRASONIC_
  len+=4;
  uint16_t distance = readDistance(); 
  uint8_t Percent = map(distance,1,150,100,0);
  debugSerial.print(F("[INFO] Distance:")); debugSerial.println(distance);
  debugSerial.print(F("[INFO] Distance (%):")); debugSerial.println(Percent);  
  mydata[cnt++] = 0x01;
  mydata[cnt++] = (distance>>8)&0xFF;
  mydata[cnt++] = distance&0xFF;
  mydata[cnt++] = Percent;
  #endif
  
  #ifdef _USE_TEMP_// Temperature
  len += 4; // temperature
  //float temp = readTemperature();
  float temp = 10;
  debugSerial.print(F("[INFO] Temperature:")); debugSerial.println(temp);
  int val = round(temp * 10);
  mydata[cnt++] = ch;
  mydata[cnt++] = 0x67;
  mydata[cnt++] = highByte(val);
  mydata[cnt++] = lowByte(val);
  #endif
  // GPS
  #ifdef _USE_GPS_// Temperature
  len += 11; // GPS
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
    debugSerial.println(F("[INFO] Collecting GPS info"));
    debugSerial.print(F("[INFO] Lat:")); debugSerial.println(String(21.900932, 6));
    debugSerial.print(F("[INFO] Lng:")); debugSerial.println(String(102.316399, 6));
    debugSerial.print(F("[INFO] Alt:")); debugSerial.println(1900);
    long lat = round(1900 * 10000);
    long lng = round(21.900932 * -10000);
    long alt = round(102.316399 * 100);
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
  #endif

  

  if (cnt == len) {
    debugSerial.println(F("[LMIC] Start Radio TX"));

    // indicating start radio TX
    digitalWrite(A1, HIGH);
    for(int i;i<sizeof(mydata);i++){
    debugSerial.print(mydata[i]);
    }
    debugSerial.println();
    do_send(&sendjob, mydata, sizeof(mydata));
  }
  else
    debugSerial.println(F("[ERROR] Data stack incorrect"));
}

#ifdef _USE_TEMP_// Temperature
float readTemperature() {

  int a = analogRead(A0);
  float R = 1023.0 / ((float)a) - 1.0;
  R = 100000.0 * R;

  float temperature = 1.0 / (log(R / 100000.0) / 4275 + 1 / 298.15) - 273.15; //convert to temperature via datasheet ;

  return temperature;

}
#endif


#ifdef _USE_ULTRASONIC_
uint16_t readDistance(void){
   long duration;
    uint16_t distance;
    digitalWrite(trigPin, LOW);
    delayMicroseconds(2);
    // Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin, HIGH);
    // Calculating the distance
    distance= duration*0.034/2;
    return distance;
}
#endif
    
#ifdef _USE_GPS_
void GPS_loop() {
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
#endif

