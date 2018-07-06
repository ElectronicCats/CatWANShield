#include <SPI.h>
#include <LoRa.h>

int counter = 0;


void setup() {
  Serial.begin(9600);
  while (!Serial);

  LoRa.setPins(10, 9, 2);

  Serial.println("LoRa Sender");

  if (!LoRa.begin(915E6)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }
}

void loop() {
  Serial.print("Sending packet: ");
  Serial.println(counter);

  // send packet
  LoRa.beginPacket();
  LoRa.print("hello ");
  LoRa.print(counter);
  LoRa.endPacket();

  counter++;

  delay(5000);
}
