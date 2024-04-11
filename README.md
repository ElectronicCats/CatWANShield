# CatWAN Arduino LoRa Shield

<p align="center">
    <a href="https://github.com/ElectronicCats/CatWANShield/wiki">
        <img src="https://github.com/ElectronicCats/CatWANShield/assets/44976441/8de6e8b1-e15e-40ff-b99f-82983276b99c"/>
    </a>
</p>

<p align=center>
    <a href="https://electroniccats.com/store/loracatshield/">
        <img src="https://github.com/ElectronicCats/flipper-shields/assets/44976441/0c617467-052b-4ab1-a3b9-ba36e1f55a91" width="200" height="104" />
    </a>
    <a href="https://github.com/ElectronicCats/CatWANShield/wiki">
        <img src="https://github.com/ElectronicCats/flipper-shields/assets/44976441/6aa7f319-3256-442e-a00d-33c8126833ec" width="200" height="104" />
    </a>
</p>

With the CatWAN Arduino LoRa Shield, you will be able to unlock the power of LoRa technology for long-range, low-power communication in an Arduino UNO. Seamlessly integrate your Arduino UNO into LoRaWAN networks for a variety of applications.

This repository contains the KiCad files for a LoRa shield for Arduino Uno and some examples that may help you to get running your LoRa-based applications with the power of an Arduino UNO 

- The folder named "LoRA_PHY_RH" refers to the communication
P2P by the Physical layer of LoRa, in here you can find 2 examples one as the Transmitter (Which also  is capable of receiving information) and the second as the receiver (Which also is capable of transmitting information), both examples work with the [RadioHead](http://www.airspayce.com/mikem/arduino/RadioHead/) library  

- The folder named "LoRA_PHY" refers to the communication
P2P by the Physical layer of LoRa, in here you can find 2 examples one as the Transmitter and the second as the receiver, both examples work with the Official [LoRa](https://github.com/sandeepmistry/arduino-LoRa) library from Arduino.

- The folder named LoRa_WAN refers to the communication by a LoRaWAN network from your device to the internet, by the two methods that exist OTAA and ABP, both examples were created to read a GPS or/and temperature from one analogic sensor attached to the analog input.

Electronic Cats invests time and resources in providing this open-source design, please support Electronic Cats and open-source hardware by purchasing products from Electronic Cats!

Designed by Electronic Cats.

## How to contribute <img src="https://electroniccats.com/wp-content/uploads/2018/01/fav.png" height="35"><img src="https://raw.githubusercontent.com/gist/ManulMax/2d20af60d709805c55fd784ca7cba4b9/raw/bcfeac7604f674ace63623106eb8bb8471d844a6/github.gif" height="30">
 Contributions are welcome! 

Please read the document  [**Contribution Manual**](https://github.com/ElectronicCats/electroniccats-cla/blob/main/electroniccats-contribution-manual.md)  which will show you how to contribute your changes to the project.

✨ Thanks to all our [contributors](https://github.com/ElectronicCats/Cat-Sink/graphs/contributors)! ✨

See [**_Electronic Cats CLA_**](https://github.com/ElectronicCats/electroniccats-cla/blob/main/electroniccats-cla.md) for more information.

See the  [**community code of conduct**](https://github.com/ElectronicCats/electroniccats-cla/blob/main/electroniccats-community-code-of-conduct.md) for a vision of the community we want to build and what we expect from it."			

# License

<a href="https://github.com/ElectronicCats">

<img  src="https://github.com/ElectronicCats/AjoloteBoard/raw/master/OpenSourceLicense.png"  height="200" />

</a>

Firmware released under a GNU AGPL v3.0 license. See the LICENSE file for more information.

Hardware released under a CERN Open Hardware Licence v1.2. See the LICENSE_HARDWARE file for more information.

Electronic Cats is a registered trademark, please do not use it if you sell these PCBs.

5 Jul 2018
