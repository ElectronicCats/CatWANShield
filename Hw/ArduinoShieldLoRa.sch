EESchema Schematic File Version 2
LIBS:ArduinoShieldLoRa-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ArduinoShieldLoRa
LIBS:ArduinoShieldLoRa-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Arduino LoRa Shield"
Date "2017-06-12"
Rev "v0.1"
Comp "Electronic Cats"
Comment1 "Eduardo Contreras"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9300 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 8900 2900 0    60   ~ 0
A4(SDA)
Text Label 8900 3000 0    60   ~ 0
A5(SCL)
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
DIO0/2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L CONN_01X08 P1
U 1 1 56D70129
P 9600 1950
F 0 "P1" H 9600 2400 50  0000 C CNN
F 1 "Power" V 9700 1950 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" H 9600 1950 50  0001 C CNN
F 3 "" H 9600 1950 50  0000 C CNN
	1    9600 1950
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset_a
$Comp
L +5V #PWR01
U 1 1 56D707BB
P 9050 1450
F 0 "#PWR01" H 9050 1300 50  0001 C CNN
F 1 "+5V" H 9050 1590 30  0000 C CNN
F 2 "" H 9050 1450 50  0000 C CNN
F 3 "" H 9050 1450 50  0000 C CNN
	1    9050 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 56D70CC2
P 9300 3150
F 0 "#PWR02" H 9300 2900 50  0001 C CNN
F 1 "GND" H 9300 3000 50  0000 C CNN
F 2 "" H 9300 3150 50  0000 C CNN
F 3 "" H 9300 3150 50  0000 C CNN
	1    9300 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 56D70CFF
P 10300 3150
F 0 "#PWR03" H 10300 2900 50  0001 C CNN
F 1 "GND" H 10300 3000 50  0000 C CNN
F 2 "" H 10300 3150 50  0000 C CNN
F 3 "" H 10300 3150 50  0000 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X06 P2
U 1 1 56D70DD8
P 9600 2750
F 0 "P2" H 9600 3100 50  0000 C CNN
F 1 "Analog" V 9700 2750 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" H 9600 2750 50  0001 C CNN
F 3 "" H 9600 2750 50  0000 C CNN
	1    9600 2750
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10800 650 50  0001 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 50  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11000 650 50  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11100 650 50  0001 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L CONN_01X08 P4
U 1 1 56D7164F
P 10000 2650
F 0 "P4" H 10000 3100 50  0000 C CNN
F 1 "Digital" V 10100 2650 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" H 10000 2650 50  0001 C CNN
F 3 "" H 10000 2650 50  0000 C CNN
	1    10000 2650
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X10 P3
U 1 1 56D721E0
P 10000 1650
F 0 "P3" H 10000 2200 50  0000 C CNN
F 1 "Digital" V 10100 1650 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" H 10000 1650 50  0001 C CNN
F 3 "" H 10000 1650 50  0000 C CNN
	1    10000 1650
	-1   0    0    -1  
$EndComp
Text Notes 9700 1600 0    60   ~ 0
1
$Comp
L 74HC4050D U2
U 1 1 593EC72F
P 6555 1500
F 0 "U2" H 6265 1970 50  0000 L BNN
F 1 "74HC4050D" H 6255 960 50  0000 L BNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6555 1500 50  0001 L BNN
F 3 "0.45 USD" H 6555 1500 50  0001 L BNN
F 4 "74HC4050D" H 6555 1500 50  0001 L BNN "MP"
F 5 "SOIC-16 NXP Semiconductors" H 6555 1500 50  0001 L BNN "Package"
F 6 "Good" H 6555 1500 50  0001 L BNN "Availability"
F 7 "NXP Semiconductors" H 6555 1500 50  0001 L BNN "MF"
F 8 "Hex high-to-low level shifter 74HC4050D" H 6555 1500 50  0001 L BNN "Description"
F 9 "74HC4050D,653" H 6555 1500 60  0001 C CNN "#manf"
	1    6555 1500
	1    0    0    -1  
$EndComp
$Comp
L ANT-RESCUE-ArduinoShieldLoRa A1
U 1 1 593ECA41
P 6640 4285
F 0 "A1" H 6890 4685 60  0000 C CNN
F 1 "ANT" H 6890 4285 60  0000 C CNN
F 2 "ArduinoShieldLoRa:SMA_EDGELAUNCH_UFL" H 6640 4285 60  0001 C CNN
F 3 "" H 6640 4285 60  0000 C CNN
	1    6640 4285
	1    0    0    -1  
$EndComp
$Comp
L AP2112K-3.3 U3
U 1 1 593ED11D
P 2315 1395
F 0 "U3" H 2115 1695 60  0000 C CNN
F 1 "AP2112K-3.3" H 2465 1145 60  0000 C CNN
F 2 "ArduinoShieldLoRa:AP2112K-3.3" H 2315 1395 60  0001 C CNN
F 3 "" H 2315 1395 60  0000 C CNN
F 4 "AP2112K-3.3TRG1" H 2315 1395 60  0001 C CNN "#manf"
	1    2315 1395
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 593ED460
P 1515 1345
F 0 "R1" V 1595 1345 50  0000 C CNN
F 1 "100K" V 1515 1345 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1445 1345 50  0001 C CNN
F 3 "" H 1515 1345 50  0001 C CNN
F 4 "RCA0603100KJNEC" V 1515 1345 60  0001 C CNN "#manf"
	1    1515 1345
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 593ED652
P 1015 1395
F 0 "C1" H 1040 1495 50  0000 L CNN
F 1 "10uF" H 1040 1295 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1053 1245 50  0001 C CNN
F 3 "" H 1015 1395 50  0001 C CNN
F 4 "GRM188C80G106KE47J" H 1015 1395 60  0001 C CNN "#manf"
	1    1015 1395
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 593ED719
P 1315 1695
F 0 "#PWR04" H 1315 1445 50  0001 C CNN
F 1 "GND" H 1315 1545 50  0000 C CNN
F 2 "" H 1315 1695 50  0001 C CNN
F 3 "" H 1315 1695 50  0001 C CNN
	1    1315 1695
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 593ED8F2
P 7765 1355
F 0 "C2" H 7790 1455 50  0000 L CNN
F 1 "0.1uF" H 7790 1255 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7803 1205 50  0001 C CNN
F 3 "" H 7765 1355 50  0001 C CNN
F 4 "0201ZD104KAT2A" H 7765 1355 60  0001 C CNN "#manf"
	1    7765 1355
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 593EDEA2
P 8020 3230
F 0 "C3" H 8045 3330 50  0000 L CNN
F 1 "10uF" H 8045 3130 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8058 3080 50  0001 C CNN
F 3 "" H 8020 3230 50  0001 C CNN
F 4 "GRM188C80G106KE47J" H 8020 3230 60  0001 C CNN "#manf"
	1    8020 3230
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 593EE361
P 5970 1925
F 0 "#PWR05" H 5970 1675 50  0001 C CNN
F 1 "GND" H 5970 1775 50  0000 C CNN
F 2 "" H 5970 1925 50  0001 C CNN
F 3 "" H 5970 1925 50  0001 C CNN
	1    5970 1925
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 593EE58B
P 5590 3685
F 0 "#PWR06" H 5590 3435 50  0001 C CNN
F 1 "GND" H 5590 3535 50  0000 C CNN
F 2 "" H 5590 3685 50  0001 C CNN
F 3 "" H 5590 3685 50  0001 C CNN
	1    5590 3685
	0    1    1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 593EE616
P 7340 4135
F 0 "#PWR07" H 7340 3885 50  0001 C CNN
F 1 "GND" H 7340 3985 50  0000 C CNN
F 2 "" H 7340 4135 50  0001 C CNN
F 3 "" H 7340 4135 50  0001 C CNN
	1    7340 4135
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR08
U 1 1 593EE6E1
P 7340 3985
F 0 "#PWR08" H 7340 3735 50  0001 C CNN
F 1 "GND" H 7340 3835 50  0000 C CNN
F 2 "" H 7340 3985 50  0001 C CNN
F 3 "" H 7340 3985 50  0001 C CNN
	1    7340 3985
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR09
U 1 1 593EE71C
P 6640 3985
F 0 "#PWR09" H 6640 3735 50  0001 C CNN
F 1 "GND" H 6640 3835 50  0000 C CNN
F 2 "" H 6640 3985 50  0001 C CNN
F 3 "" H 6640 3985 50  0001 C CNN
	1    6640 3985
	0    1    1    0   
$EndComp
$Comp
L GND #PWR010
U 1 1 593EE757
P 6640 4135
F 0 "#PWR010" H 6640 3885 50  0001 C CNN
F 1 "GND" H 6640 3985 50  0000 C CNN
F 2 "" H 6640 4135 50  0001 C CNN
F 3 "" H 6640 4135 50  0001 C CNN
	1    6640 4135
	0    1    1    0   
$EndComp
$Comp
L GND #PWR011
U 1 1 593EE792
P 7540 3635
F 0 "#PWR011" H 7540 3385 50  0001 C CNN
F 1 "GND" H 7540 3485 50  0000 C CNN
F 2 "" H 7540 3635 50  0001 C CNN
F 3 "" H 7540 3635 50  0001 C CNN
	1    7540 3635
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 593EEB4B
P 5590 2985
F 0 "#PWR012" H 5590 2735 50  0001 C CNN
F 1 "GND" H 5590 2835 50  0000 C CNN
F 2 "" H 5590 2985 50  0001 C CNN
F 3 "" H 5590 2985 50  0001 C CNN
	1    5590 2985
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR013
U 1 1 593EF289
P 3115 1145
F 0 "#PWR013" H 3115 995 50  0001 C CNN
F 1 "+3.3V" H 3115 1285 50  0000 C CNN
F 2 "" H 3115 1145 50  0001 C CNN
F 3 "" H 3115 1145 50  0001 C CNN
	1    3115 1145
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR014
U 1 1 593EF36F
P 7335 3125
F 0 "#PWR014" H 7335 2975 50  0001 C CNN
F 1 "+3.3V" H 7335 3265 50  0000 C CNN
F 2 "" H 7335 3125 50  0001 C CNN
F 3 "" H 7335 3125 50  0001 C CNN
	1    7335 3125
	1    0    0    -1  
$EndComp
NoConn ~ 2815 1495
$Comp
L +3.3V #PWR015
U 1 1 593EFD99
P 5905 1035
F 0 "#PWR015" H 5905 885 50  0001 C CNN
F 1 "+3.3V" H 5905 1175 50  0000 C CNN
F 2 "" H 5905 1035 50  0001 C CNN
F 3 "" H 5905 1035 50  0001 C CNN
	1    5905 1035
	1    0    0    -1  
$EndComp
Text Label 5905 1250 2    60   ~ 0
11(**/MOSI)
Text Label 5905 1350 2    60   ~ 0
13(SCK)
Text Label 5905 1550 2    60   ~ 0
9(**)
Text Label 5905 1450 2    60   ~ 0
10(**/SS)
NoConn ~ 6055 1650
NoConn ~ 6055 1750
Text Label 5290 3035 2    60   ~ 0
12(MISO)
Text Label 6990 3485 0    60   ~ 0
DIO3
Text Label 6990 3385 0    60   ~ 0
DIO4
Text Label 5490 3585 2    60   ~ 0
DIO5
Text Label 6840 3185 0    60   ~ 0
DIO0/2
$Comp
L +5V #PWR016
U 1 1 593F3F43
P 1315 995
F 0 "#PWR016" H 1315 845 50  0001 C CNN
F 1 "+5V" H 1315 1135 30  0000 C CNN
F 2 "" H 1315 995 50  0000 C CNN
F 3 "" H 1315 995 50  0000 C CNN
	1    1315 995 
	1    0    0    -1  
$EndComp
NoConn ~ 9150 1450
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9300 1450 9300 1700
Wire Wire Line
	9300 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	9400 2100 9300 2100
Wire Wire Line
	9400 2200 9300 2200
Connection ~ 9300 2200
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1450
Wire Wire Line
	9150 1900 9150 1450
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Wire Line
	10200 1500 10300 1500
Wire Wire Line
	10300 1500 10300 3150
Wire Wire Line
	9300 2100 9300 3150
Wire Notes Line
	8500 500  8500 4355
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
Wire Wire Line
	1665 1345 1865 1345
Wire Wire Line
	1015 1195 1865 1195
Wire Wire Line
	1315 995  1315 1345
Wire Wire Line
	1315 1345 1365 1345
Wire Wire Line
	1015 1245 1015 1195
Connection ~ 1315 1195
Wire Wire Line
	1015 1545 1015 1595
Wire Wire Line
	1015 1595 1865 1595
Wire Wire Line
	1865 1595 1865 1545
Wire Wire Line
	1315 1695 1315 1595
Connection ~ 1315 1595
Wire Wire Line
	6740 3685 7040 3685
Wire Wire Line
	6990 3685 6990 3885
Wire Wire Line
	7540 3635 7540 3585
Wire Wire Line
	3115 1145 3115 1195
Wire Wire Line
	3115 1195 2815 1195
Wire Wire Line
	5905 1250 6055 1250
Wire Wire Line
	5905 1350 6055 1350
Wire Wire Line
	5905 1450 6055 1450
Wire Wire Line
	5905 1550 6055 1550
Wire Wire Line
	5290 3035 5290 3085
Wire Wire Line
	5290 3085 5590 3085
Wire Wire Line
	5490 3585 5590 3585
Wire Wire Line
	6740 3385 6990 3385
Wire Wire Line
	6990 3485 6740 3485
Wire Wire Line
	6740 2985 6840 2985
Wire Wire Line
	6840 3085 6740 3085
Wire Wire Line
	6740 3185 6840 3185
NoConn ~ 10550 1200
NoConn ~ 10550 1300
$Comp
L R R2
U 1 1 59409DD6
P 4050 3410
F 0 "R2" V 4130 3410 50  0000 C CNN
F 1 "100k" V 4050 3410 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3980 3410 50  0001 C CNN
F 3 "" H 4050 3410 50  0001 C CNN
F 4 "RCA0603100KJNEC" V 4050 3410 60  0001 C CNN "#manf"
	1    4050 3410
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 59409EAC
P 4350 3410
F 0 "R3" V 4430 3410 50  0000 C CNN
F 1 "100k" V 4350 3410 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4280 3410 50  0001 C CNN
F 3 "" H 4350 3410 50  0001 C CNN
F 4 "RCA0603100KJNEC" V 4350 3410 60  0001 C CNN "#manf"
	1    4350 3410
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR017
U 1 1 59409EFD
P 4050 3160
F 0 "#PWR017" H 4050 3010 50  0001 C CNN
F 1 "+3.3V" H 4050 3300 50  0000 C CNN
F 2 "" H 4050 3160 50  0001 C CNN
F 3 "" H 4050 3160 50  0001 C CNN
	1    4050 3160
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR018
U 1 1 59409FB3
P 4350 3160
F 0 "#PWR018" H 4350 3010 50  0001 C CNN
F 1 "+3.3V" H 4350 3300 50  0000 C CNN
F 2 "" H 4350 3160 50  0001 C CNN
F 3 "" H 4350 3160 50  0001 C CNN
	1    4350 3160
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3160 4050 3260
Wire Wire Line
	4350 3160 4350 3260
Text Label 4400 3960 0    60   ~ 0
10(**/SS)
Text Label 4400 3810 0    60   ~ 0
9(**)
Wire Wire Line
	4400 3810 4350 3810
Wire Wire Line
	4350 3810 4350 3560
Wire Wire Line
	4400 3960 4050 3960
Wire Wire Line
	4050 3960 4050 3560
$Comp
L CONN_01X01 J3
U 1 1 5941DDAF
P 7240 3685
F 0 "J3" H 7240 3785 50  0000 C CNN
F 1 "CONN_01X01" H 7240 3585 50  0000 C CNN
F 2 "Wire_Pads:SolderWirePad_single_0-8mmDrill" H 7240 3685 50  0001 C CNN
F 3 "" H 7240 3685 50  0001 C CNN
	1    7240 3685
	1    0    0    -1  
$EndComp
Connection ~ 6990 3685
$Comp
L RFM95-RESCUE-ArduinoShieldLoRa U1
U 1 1 5B05A30B
P 5940 3835
F 0 "U1" H 5840 4835 60  0000 C CNN
F 1 "RFM95" H 5940 3835 60  0000 C CNN
F 2 "agroin:RFM95W" H 5940 3835 60  0001 C CNN
F 3 "" H 5940 3835 60  0000 C CNN
	1    5940 3835
	1    0    0    -1  
$EndComp
Text Label 6840 3085 0    60   ~ 0
DIO1
Text Label 6840 2985 0    60   ~ 0
DIO2
Text Label 7055 1250 0    60   ~ 0
MOSI_3v3
Text Label 7055 1350 0    60   ~ 0
SCK_3v3
Text Label 7055 1450 0    60   ~ 0
SS_3v3
Text Label 7055 1550 0    60   ~ 0
RESET
Text Label 5590 3485 2    60   ~ 0
RESET
Text Label 5590 3385 2    60   ~ 0
SS_3v3
Text Label 5590 3285 2    60   ~ 0
SCK_3v3
Text Label 5590 3185 2    60   ~ 0
MOSI_3v3
$Comp
L Conn_01x02 J1
U 1 1 5B581734
P 965 3620
F 0 "J1" H 965 3720 50  0000 C CNN
F 1 "DIO1" H 965 3420 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 965 3620 50  0001 C CNN
F 3 "" H 965 3620 50  0001 C CNN
	1    965  3620
	0    1    1    0   
$EndComp
Wire Wire Line
	6740 3285 7335 3285
Wire Wire Line
	7335 3285 7335 3125
Wire Wire Line
	7540 3585 6740 3585
NoConn ~ 7055 1650
NoConn ~ 7055 1750
Wire Wire Line
	6055 1150 5905 1150
Wire Wire Line
	5905 1150 5905 1035
Wire Wire Line
	5970 1925 5970 1850
Wire Wire Line
	5970 1850 6055 1850
Wire Notes Line
	475  2580 8500 2580
Wire Notes Line
	8500 4355 485  4355
Wire Notes Line
	4325 470  4325 2580
Wire Notes Line
	4325 2580 4335 2580
Wire Notes Line
	3795 2580 3795 4355
$Comp
L GND #PWR019
U 1 1 5B5852C4
P 7765 1550
F 0 "#PWR019" H 7765 1300 50  0001 C CNN
F 1 "GND" H 7765 1400 50  0000 C CNN
F 2 "" H 7765 1550 50  0001 C CNN
F 3 "" H 7765 1550 50  0001 C CNN
	1    7765 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7765 1550 7765 1505
$Comp
L +3.3V #PWR020
U 1 1 5B5854A8
P 7765 1140
F 0 "#PWR020" H 7765 990 50  0001 C CNN
F 1 "+3.3V" H 7765 1280 50  0000 C CNN
F 2 "" H 7765 1140 50  0001 C CNN
F 3 "" H 7765 1140 50  0001 C CNN
	1    7765 1140
	1    0    0    -1  
$EndComp
Wire Wire Line
	7765 1140 7765 1205
Text Notes 4385 635  0    60   ~ 0
Level Shifter
Text Notes 520  605  0    60   ~ 0
Regulator
Text Notes 505  2705 0    60   ~ 0
DIO Headers
Text Notes 3865 2705 0    60   ~ 0
RFM95\n
$Comp
L +3.3V #PWR021
U 1 1 5B585E31
P 8020 3025
F 0 "#PWR021" H 8020 2875 50  0001 C CNN
F 1 "+3.3V" H 8020 3165 50  0000 C CNN
F 2 "" H 8020 3025 50  0001 C CNN
F 3 "" H 8020 3025 50  0001 C CNN
	1    8020 3025
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 5B585EB4
P 8020 3455
F 0 "#PWR022" H 8020 3205 50  0001 C CNN
F 1 "GND" H 8020 3305 50  0000 C CNN
F 2 "" H 8020 3455 50  0001 C CNN
F 3 "" H 8020 3455 50  0001 C CNN
	1    8020 3455
	1    0    0    -1  
$EndComp
Wire Wire Line
	8020 3455 8020 3380
Wire Wire Line
	8020 3080 8020 3025
$Comp
L Conn_01x02 J6
U 1 1 5B57C63A
P 1500 3610
F 0 "J6" H 1500 3710 50  0000 C CNN
F 1 "DIO2" H 1500 3410 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1500 3610 50  0001 C CNN
F 3 "" H 1500 3610 50  0001 C CNN
	1    1500 3610
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J4
U 1 1 5B57C6A4
P 1990 3605
F 0 "J4" H 1990 3705 50  0000 C CNN
F 1 "DIO3" H 1990 3405 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1990 3605 50  0001 C CNN
F 3 "" H 1990 3605 50  0001 C CNN
	1    1990 3605
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J2
U 1 1 5B57C7D7
P 2465 3595
F 0 "J2" H 2465 3695 50  0000 C CNN
F 1 "DIO4" H 2465 3395 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2465 3595 50  0001 C CNN
F 3 "" H 2465 3595 50  0001 C CNN
	1    2465 3595
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02 J5
U 1 1 5B57C860
P 2880 3605
F 0 "J5" H 2880 3705 50  0000 C CNN
F 1 "DIO5" H 2880 3405 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 2880 3605 50  0001 C CNN
F 3 "" H 2880 3605 50  0001 C CNN
	1    2880 3605
	0    1    1    0   
$EndComp
Text Label 865  3420 1    60   ~ 0
DIO1
Text Label 1400 3410 1    60   ~ 0
DIO2
Text Label 1890 3405 1    60   ~ 0
DIO3
Text Label 2365 3395 1    60   ~ 0
DIO4
Text Label 2780 3405 1    60   ~ 0
DIO5
Text Label 965  3420 0    60   ~ 0
3(**)
Text Label 1500 3410 0    60   ~ 0
4
Text Label 1990 3405 0    60   ~ 0
5(**)
Text Label 2465 3395 0    60   ~ 0
6(**)
Text Label 2880 3405 0    60   ~ 0
7
$EndSCHEMATC
