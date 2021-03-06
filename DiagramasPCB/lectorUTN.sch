EESchema Schematic File Version 2
LIBS:lectorUTN-rescue
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
LIBS:lectorUTN-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Lector de NCF"
Date "2017-10-12"
Rev "1.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L D D2
U 1 1 5995FCC7
P 4455 1835
F 0 "D2" H 4455 1935 50  0000 C CNN
F 1 "1N4007" H 4455 1735 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" H 4455 1835 50  0001 C CNN
F 3 "" H 4455 1835 50  0000 C CNN
	1    4455 1835
	-1   0    0    1   
$EndComp
$Comp
L D D4
U 1 1 5995FD0A
P 4855 1835
F 0 "D4" H 4855 1935 50  0000 C CNN
F 1 "1N4007" H 4855 1735 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" H 4855 1835 50  0001 C CNN
F 3 "" H 4855 1835 50  0000 C CNN
	1    4855 1835
	-1   0    0    1   
$EndComp
$Comp
L LED D3
U 1 1 5995FD7E
P 4555 2235
F 0 "D3" H 4555 2335 50  0000 C CNN
F 1 "LED_3mm" H 4555 2135 50  0000 C CNN
F 2 "LEDs:LED-3MM" H 4555 2235 50  0001 C CNN
F 3 "" H 4555 2235 50  0000 C CNN
	1    4555 2235
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X08 RFID1
U 1 1 5995FE20
P 9305 3835
F 0 "RFID1" H 9305 4285 50  0000 C CNN
F 1 "RFID" V 9405 3835 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x08" H 9305 3835 50  0001 C CNN
F 3 "" H 9305 3835 50  0000 C CNN
	1    9305 3835
	1    0    0    1   
$EndComp
$Comp
L CP C2
U 1 1 5995FF2F
P 5855 2235
F 0 "C2" H 5880 2335 50  0000 L CNN
F 1 "10x16" H 5880 2135 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D6.3_L11.2_P2.5" H 5893 2085 50  0001 C CNN
F 3 "" H 5855 2235 50  0000 C CNN
	1    5855 2235
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 5995FFB0
P 5705 1985
F 0 "C1" H 5730 2085 50  0000 L CNN
F 1 "10x16" H 5730 1885 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Radial_D6.3_L11.2_P2.5" H 5743 1835 50  0001 C CNN
F 3 "" H 5705 1985 50  0000 C CNN
	1    5705 1985
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 59960041
P 4705 2685
F 0 "R1" V 4785 2685 50  0000 C CNN
F 1 "1k" V 4705 2685 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 4635 2685 50  0001 C CNN
F 3 "" H 4705 2685 50  0000 C CNN
	1    4705 2685
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 599600DE
P 5205 2235
F 0 "R2" V 5285 2235 50  0000 C CNN
F 1 "220" V 5205 2235 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 5135 2235 50  0001 C CNN
F 3 "" H 5205 2235 50  0000 C CNN
	1    5205 2235
	0    1    1    0   
$EndComp
$Comp
L CONN_01X02 POWER1
U 1 1 59960903
P 1655 2135
F 0 "POWER1" H 1655 2285 50  0000 C CNN
F 1 "+12" V 1755 2135 50  0000 C CNN
F 2 "Connect:bornier2" H 1655 2135 50  0001 C CNN
F 3 "" H 1655 2135 50  0000 C CNN
	1    1655 2135
	-1   0    0    -1  
$EndComp
$Comp
L D D5
U 1 1 59960A97
P 2105 2085
F 0 "D5" H 2105 2185 50  0000 C CNN
F 1 "1N4007" H 2105 1985 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" H 2105 2085 50  0001 C CNN
F 3 "" H 2105 2085 50  0000 C CNN
	1    2105 2085
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X16 LCD1
U 1 1 599B27A1
P 5205 5085
F 0 "LCD1" H 5205 5935 50  0000 C CNN
F 1 "DISPLAY_LCD" V 5305 5085 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16" H 5205 5085 50  0001 C CNN
F 3 "" H 5205 5085 50  0000 C CNN
	1    5205 5085
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X15 NANOLEFT1
U 1 1 599B4B60
P 7605 2485
F 0 "NANOLEFT1" H 7605 3285 50  0000 C CNN
F 1 "NANO_LEFT_CONN" V 7705 2485 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x15" H 7605 2485 50  0001 C CNN
F 3 "" H 7605 2485 50  0000 C CNN
	1    7605 2485
	-1   0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 599C1D02
P 5505 3985
F 0 "RV1" H 5505 3905 50  0000 C CNN
F 1 "1K" H 5505 3985 50  0000 C CNN
F 2 "Discret:RV2X4" H 5505 3985 50  0001 C CNN
F 3 "" H 5505 3985 50  0000 C CNN
	1    5505 3985
	1    0    0    1   
$EndComp
$Comp
L CONN_02X01 BUZZER1
U 1 1 599F0B21
P 2955 3535
F 0 "BUZZER1" H 2955 3635 50  0000 C CNN
F 1 "CONNECTOR_BUZZER" H 2955 3435 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2955 2335 50  0001 C CNN
F 3 "" H 2955 2335 50  0000 C CNN
	1    2955 3535
	-1   0    0    1   
$EndComp
$Comp
L R R4
U 1 1 599F0FC4
P 7005 6235
F 0 "R4" V 7085 6235 50  0000 C CNN
F 1 "1K" V 7005 6235 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 6935 6235 50  0001 C CNN
F 3 "" H 7005 6235 50  0000 C CNN
	1    7005 6235
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 599F6EAC
P 3705 2885
F 0 "R3" V 3785 2885 50  0000 C CNN
F 1 "1k" V 3705 2885 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 3635 2885 50  0001 C CNN
F 3 "" H 3705 2885 50  0000 C CNN
	1    3705 2885
	0    1    1    0   
$EndComp
$Comp
L D D1
U 1 1 599F9B76
P 2955 3785
F 0 "D1" H 2955 3885 50  0000 C CNN
F 1 "1N4007" H 2955 3685 50  0000 C CNN
F 2 "Diodes_ThroughHole:Diode_DO-41_SOD81_Horizontal_RM10" H 2955 3785 50  0001 C CNN
F 3 "" H 2955 3785 50  0000 C CNN
	1    2955 3785
	-1   0    0    1   
$EndComp
$Comp
L C C3
U 1 1 599E0430
P 6105 2235
F 0 "C3" H 6130 2335 50  0000 L CNN
F 1 "0.1" H 6130 2135 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 6143 2085 50  0001 C CNN
F 3 "" H 6105 2235 50  0000 C CNN
	1    6105 2235
	1    0    0    -1  
$EndComp
$Comp
L DIL16 P1
U 1 1 599E209C
P 6555 4835
F 0 "P1" H 6555 5285 50  0000 C CNN
F 1 "CD4094" V 6555 4835 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_LongPads" H 6555 4835 50  0001 C CNN
F 3 "" H 6555 4835 50  0000 C CNN
	1    6555 4835
	-1   0    0    1   
$EndComp
Text Notes 7255 3185 0    60   ~ 0
USB\n
Text Notes 1855 2085 0    60   ~ 0
+12V\n
Text Notes 2805 2385 0    60   ~ 0
GND\n
Text Notes 4605 2085 0    60   ~ 0
+5V
Text Notes 5055 1835 0    60   ~ 0
+3.3V
Text Notes 4755 2385 0    60   ~ 0
GND
$Comp
L Q_NPN_CBE Q2
U 1 1 599ED454
P 6705 6035
F 0 "Q2" H 7005 6085 50  0000 R CNN
F 1 "BC337" H 7305 5985 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow_Oval" H 6905 6135 50  0001 C CNN
F 3 "" H 6705 6035 50  0000 C CNN
	1    6705 6035
	0    -1   -1   0   
$EndComp
$Comp
L Q_NPN_CBE Q1
U 1 1 599EDA89
P 3055 2835
F 0 "Q1" H 3355 2885 50  0000 R CNN
F 1 "BC337" H 3655 2785 50  0000 R CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow_Oval" H 3255 2935 50  0001 C CNN
F 3 "" H 3055 2835 50  0000 C CNN
	1    3055 2835
	0    -1   -1   0   
$EndComp
Text Notes 6755 1785 0    60   ~ 0
TX\n
Text Notes 6755 1885 0    60   ~ 0
RX
Text Notes 6755 1985 0    60   ~ 0
RST
Text Notes 6755 2085 0    60   ~ 0
GND\n
Text Notes 6755 2185 0    60   ~ 0
D2
Text Notes 6755 2285 0    60   ~ 0
D3
Text Notes 6755 2385 0    60   ~ 0
D4
Text Notes 6755 2485 0    60   ~ 0
D5
Text Notes 6755 2585 0    60   ~ 0
D6\n
Text Notes 6755 2685 0    60   ~ 0
D7
Text Notes 6755 2785 0    60   ~ 0
D8
Text Notes 6755 2885 0    60   ~ 0
D9\n
Text Notes 6755 2985 0    60   ~ 0
D10\n
Text Notes 6755 3085 0    60   ~ 0
D11
Text Notes 6755 3185 0    60   ~ 0
D12\n
$Comp
L JUMPER JP1
U 1 1 599EE8FB
P 2755 2085
F 0 "JP1" H 2755 2235 50  0000 C CNN
F 1 "JUMPER" V 2755 2005 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 2755 2085 50  0001 C CNN
F 3 "" H 2755 2085 50  0000 C CNN
	1    2755 2085
	-1   0    0    1   
$EndComp
Text Notes 7805 1785 0    60   ~ 0
VIN
Text Notes 7805 1885 0    60   ~ 0
GND\n
Text Notes 7805 1985 0    60   ~ 0
RESET
Text Notes 7805 2085 0    60   ~ 0
5V
Text Notes 7805 3185 0    60   ~ 0
D13
Text Notes 7805 3085 0    60   ~ 0
3V3
Text Notes 7805 2985 0    60   ~ 0
AREF
Text Notes 7805 2885 0    60   ~ 0
A0
Text Notes 7805 2785 0    60   ~ 0
A1
Text Notes 7805 2685 0    60   ~ 0
A2
Text Notes 7805 2585 0    60   ~ 0
A3
Text Notes 7805 2485 0    60   ~ 0
A4
Text Notes 7805 2385 0    60   ~ 0
A5
Text Notes 7805 2285 0    60   ~ 0
A6
Text Notes 7805 2185 0    60   ~ 0
A7
Text Notes 9005 2385 0    60   ~ 0
3V3
Text Notes 9005 2485 0    60   ~ 0
GND
Text Notes 10266 3122 0    60   ~ 0
3V3
Text Notes 10968 3110 0    60   ~ 0
GND
Text Notes 9005 3485 0    60   ~ 0
3V3
Text Notes 9005 3585 0    60   ~ 0
RST
Text Notes 9005 3685 0    60   ~ 0
GND\n
Text Notes 9005 3885 0    60   ~ 0
MISO
Text Notes 9005 3985 0    60   ~ 0
MOSI
Text Notes 9005 4085 0    60   ~ 0
SCK
Text Notes 9005 4185 0    60   ~ 0
SDA
Text Notes 6905 4485 0    60   ~ 0
GND\n
Text Notes 6905 4985 0    60   ~ 0
CLOCK
Text Notes 6905 5085 0    60   ~ 0
DATA\n
Text Notes 6905 5185 0    60   ~ 0
STROBE
Text Notes 5405 4335 0    60   ~ 0
GND
Text Notes 5405 4435 0    60   ~ 0
5V
Text Notes 5405 4535 0    60   ~ 0
Vee
Text Notes 5405 4635 0    60   ~ 0
RS
Text Notes 5405 4735 0    60   ~ 0
R/W
Text Notes 5405 4835 0    60   ~ 0
EN
Text Notes 5405 4935 0    60   ~ 0
DB0
Text Notes 5405 5035 0    60   ~ 0
DB1
Text Notes 5405 5135 0    60   ~ 0
DB2
Text Notes 5405 5235 0    60   ~ 0
DB3
Text Notes 5405 5335 0    60   ~ 0
DB4
Text Notes 5405 5435 0    60   ~ 0
DB5
Text Notes 5405 5535 0    60   ~ 0
DB6
Text Notes 5405 5635 0    60   ~ 0
DB7
Text Notes 5405 5735 0    60   ~ 0
LED+5V
Text Notes 5405 5835 0    60   ~ 0
LED-
Text Notes 6205 5085 0    60   ~ 0
5V
Text Notes 6205 5185 0    60   ~ 0
5V
$Comp
L C C4
U 1 1 59A0CA26
P 6005 2035
F 0 "C4" H 6030 2135 50  0000 L CNN
F 1 "0.1" H 6030 1935 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3_P2.5" H 6043 1885 50  0001 C CNN
F 3 "" H 6005 2035 50  0000 C CNN
	1    6005 2035
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 5995FDC9
P 5205 2685
F 0 "SW1" H 5355 2795 50  0000 C CNN
F 1 "RESET" H 5205 2605 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02" H 5205 2685 50  0001 C CNN
F 3 "" H 5205 2685 50  0000 C CNN
	1    5205 2685
	1    0    0    -1  
$EndComp
Text Notes 10269 2712 0    60   ~ 0
CLK\n
Text Notes 10935 2715 0    60   ~ 0
INT\n
Text Notes 10936 2808 0    60   ~ 0
MISO
Text Notes 10266 2820 0    60   ~ 0
WCL\n
Text Notes 10278 3032 0    60   ~ 0
CS
Text Notes 10928 3016 0    60   ~ 0
RESET\n
Text Notes 10274 2944 0    60   ~ 0
MOSI\n
Text Notes 10274 2942 0    60   ~ 0
MOSI\n
Text Notes 10930 2908 0    60   ~ 0
SCK
$Comp
L CONN_02X05 ENC28J60
U 1 1 59C30613
P 10681 2912
F 0 "ENC28J60" H 10681 3212 50  0000 C CNN
F 1 "ETHERNET" H 10681 2612 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x05" H 10681 1712 50  0001 C CNN
F 3 "" H 10681 1712 50  0000 C CNN
	1    10681 2912
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X15 NANORIGHT1
U 1 1 599B4B1B
P 7055 2485
F 0 "NANORIGHT1" H 7055 3285 50  0000 C CNN
F 1 "NANO_RIGHT_CONN" V 7155 2485 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x15" H 7055 2485 50  0001 C CNN
F 3 "" H 7055 2485 50  0000 C CNN
	1    7055 2485
	1    0    0    -1  
$EndComp
$Comp
L LD1117S50CTR-RESCUE-lectorUTN-RESCUE-lectorUTN U1
U 1 1 599FC353
P 3655 2135
F 0 "U1" H 3655 2385 50  0000 C CNN
F 1 "7805" H 3655 2335 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-247_Vertical_Neutral123" H 3655 2235 50  0000 C CNN
F 3 "" H 3655 2135 50  0000 C CNN
	1    3655 2135
	-1   0    0    1   
$EndComp
Text Notes 9011 2292 0    60   ~ 0
SDA
$Comp
L CONN_01X06 DS3231
U 1 1 59C402B8
P 9305 2235
F 0 "DS3231" H 9305 2585 50  0000 C CNN
F 1 "CLOCK" V 9405 2235 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06" H 9305 2235 50  0001 C CNN
F 3 "" H 9305 2235 50  0000 C CNN
	1    9305 2235
	1    0    0    -1  
$EndComp
Text Notes 9023 2187 0    60   ~ 0
SCL
Text Notes 9027 2079 0    60   ~ 0
SQM
Wire Wire Line
	1855 2085 1955 2085
Wire Wire Line
	4055 2085 6405 2085
Wire Wire Line
	6405 2085 6405 1485
Wire Wire Line
	6505 2385 6505 2085
Wire Wire Line
	6505 2085 6855 2085
Wire Wire Line
	4605 1835 4705 1835
Wire Wire Line
	5405 5635 6155 5635
Wire Wire Line
	5405 5535 6105 5535
Wire Wire Line
	5405 5435 6055 5435
Wire Wire Line
	5405 5335 6005 5335
Wire Wire Line
	5505 4135 5505 4535
Wire Wire Line
	5505 4535 5405 4535
Wire Wire Line
	5555 4335 5555 4635
Wire Wire Line
	5555 4635 5405 4635
Wire Wire Line
	7205 4685 7205 4385
Wire Wire Line
	7205 4385 5605 4385
Wire Wire Line
	5605 4385 5605 4735
Wire Wire Line
	5605 4735 5405 4735
Wire Wire Line
	7155 4435 5655 4435
Wire Wire Line
	5655 4435 5655 4835
Wire Wire Line
	5655 4835 5405 4835
Wire Wire Line
	6155 5635 6155 4985
Wire Wire Line
	6105 5535 6105 4885
Wire Wire Line
	6055 5435 6055 4785
Wire Wire Line
	6005 5335 6005 4685
Wire Wire Line
	7255 4335 5555 4335
Wire Wire Line
	4055 2085 4055 1835
Wire Wire Line
	4055 1835 4305 1835
Wire Wire Line
	5005 1835 6305 1835
Wire Wire Line
	6305 1835 6305 1385
Wire Wire Line
	6305 1385 10055 1385
Connection ~ 4255 2085
Wire Wire Line
	4255 2235 4355 2235
Wire Wire Line
	4755 2235 5055 2235
Wire Wire Line
	5355 2235 5555 2235
Wire Wire Line
	5555 2235 5555 2385
Connection ~ 5555 2385
Wire Wire Line
	6405 1485 7305 1485
Wire Wire Line
	8705 3885 9105 3885
Wire Wire Line
	8605 3985 9105 3985
Wire Wire Line
	8705 2835 8705 3885
Wire Wire Line
	8705 2835 9106 2835
Wire Wire Line
	9105 2485 9105 2535
Wire Wire Line
	9105 2535 10005 2535
Wire Wire Line
	9705 2685 8355 2685
Wire Wire Line
	8355 2685 8355 3235
Connection ~ 8705 2985
Wire Wire Line
	7905 4185 9105 4185
Wire Wire Line
	7905 3335 7905 4185
Wire Wire Line
	9755 2635 8305 2635
Wire Wire Line
	7705 3735 6605 3735
Wire Wire Line
	5705 4535 7015 4535
Wire Wire Line
	5705 4535 5705 4985
Wire Wire Line
	5705 4985 4555 4985
Connection ~ 5855 2085
Connection ~ 6105 2085
Connection ~ 5855 2385
Connection ~ 6105 2385
Wire Wire Line
	8305 2209 8305 2385
Wire Wire Line
	8305 2385 7805 2385
Wire Wire Line
	8355 2285 8355 2485
Wire Wire Line
	8355 2485 7805 2485
Wire Wire Line
	6205 5085 6205 5985
Wire Wire Line
	6205 5985 4005 5985
Wire Wire Line
	4005 5985 4005 2285
Wire Wire Line
	6855 2185 6555 2185
Wire Wire Line
	6805 3335 7905 3335
Wire Wire Line
	4555 4985 4555 2385
Connection ~ 4555 2385
Wire Wire Line
	6555 2185 6555 2935
Wire Wire Line
	4855 2685 4905 2685
Wire Wire Line
	4555 2685 4555 2685
Connection ~ 4555 2685
Wire Wire Line
	4905 2685 4905 2935
Wire Wire Line
	4905 2935 6555 2935
Wire Wire Line
	5605 2085 5605 2685
Wire Wire Line
	5605 2685 5505 2685
Connection ~ 5605 2085
Wire Wire Line
	6855 2285 6605 2285
Wire Wire Line
	6605 2285 6605 3735
Wire Wire Line
	7755 3685 6655 3685
Wire Wire Line
	6855 2385 6655 2385
Wire Wire Line
	6655 2385 6655 3685
Wire Wire Line
	7805 3635 6705 3635
Wire Wire Line
	6805 3335 6805 2785
Wire Wire Line
	6805 2785 6855 2785
Wire Wire Line
	8355 3235 6855 3235
Wire Wire Line
	8305 2635 8305 3035
Wire Wire Line
	8255 3185 7805 3185
Wire Wire Line
	8255 4085 8255 3185
Wire Wire Line
	8655 2785 8655 4085
Wire Wire Line
	8305 3035 6855 3035
Wire Wire Line
	7255 3285 8605 3285
Wire Wire Line
	7255 3135 7255 3285
Wire Wire Line
	4005 2285 4155 2285
Wire Wire Line
	4155 2285 4155 2085
Connection ~ 4155 2085
Wire Wire Line
	5655 3985 5655 3535
Wire Wire Line
	5655 3535 4555 3535
Connection ~ 4555 3535
Wire Wire Line
	5455 4435 5455 4185
Wire Wire Line
	5455 4185 5205 4185
Wire Wire Line
	5205 4185 5205 3985
Wire Wire Line
	4005 3985 5355 3985
Wire Wire Line
	1855 2385 6505 2385
Wire Wire Line
	1855 2185 1855 2385
Connection ~ 5705 1835
Wire Wire Line
	5705 2135 5705 2385
Connection ~ 5705 2385
Wire Wire Line
	5405 5835 6505 5835
Wire Wire Line
	6505 5835 6505 5935
Wire Wire Line
	10005 1435 5405 1435
Wire Wire Line
	5405 1435 5405 2385
Connection ~ 5405 2385
Wire Wire Line
	7305 6235 7305 4285
Wire Wire Line
	6305 2585 6305 4285
Wire Wire Line
	6305 4285 7305 4285
Wire Wire Line
	6705 6235 6855 6235
Wire Wire Line
	7155 6235 7305 6235
Wire Wire Line
	6750 2685 6855 2685
Wire Wire Line
	6305 2585 6855 2585
Connection ~ 4255 2235
Wire Wire Line
	3455 3035 3455 2885
Wire Wire Line
	6855 2885 3855 2885
Wire Wire Line
	3455 2885 3555 2885
Wire Wire Line
	4255 3535 4255 2085
Wire Wire Line
	3205 3535 4255 3535
Wire Wire Line
	2705 2735 2705 3785
Wire Wire Line
	3055 3035 3455 3035
Wire Wire Line
	3255 2352 3255 2735
Wire Wire Line
	2855 2735 2705 2735
Wire Wire Line
	3255 3535 3255 3785
Wire Wire Line
	3255 3785 3105 3785
Connection ~ 3255 3535
Wire Wire Line
	2705 3785 2805 3785
Connection ~ 2705 3535
Wire Wire Line
	6905 4535 6905 4485
Connection ~ 6205 5185
Wire Wire Line
	2255 2085 2455 2085
Wire Wire Line
	6005 4685 6205 4685
Wire Wire Line
	6055 4785 6205 4785
Wire Wire Line
	6105 4885 6205 4885
Wire Wire Line
	6155 4985 6205 4985
Wire Wire Line
	7705 5185 7705 3735
Wire Wire Line
	6905 5085 7755 5085
Wire Wire Line
	6905 4985 7805 4985
Wire Wire Line
	7805 4985 7805 3635
Wire Wire Line
	7705 5185 6905 5185
Wire Wire Line
	7205 4685 6905 4685
Wire Wire Line
	7155 4585 6905 4585
Wire Wire Line
	7255 4785 6905 4785
Wire Wire Line
	7255 4335 7255 4785
Wire Wire Line
	5405 5735 5405 5785
Wire Wire Line
	5405 5785 4005 5785
Connection ~ 4005 5785
Wire Wire Line
	7755 5085 7755 3685
Wire Wire Line
	5405 4335 5405 4235
Wire Wire Line
	5405 4235 4555 4235
Connection ~ 4555 4235
Wire Wire Line
	7805 2035 7805 2085
Wire Wire Line
	7305 2035 7805 2035
Wire Wire Line
	7305 1485 7305 2035
Wire Wire Line
	6855 3035 6855 2985
Wire Wire Line
	6855 3135 7255 3135
Wire Wire Line
	6855 3135 6855 3085
Wire Wire Line
	9105 2385 9105 2435
Wire Wire Line
	9105 2435 10055 2435
Connection ~ 10055 2435
Wire Wire Line
	5455 4435 5405 4435
Connection ~ 4005 3985
Connection ~ 5205 3985
Connection ~ 10005 2535
Wire Wire Line
	6005 1885 6005 1835
Connection ~ 6005 1835
Wire Wire Line
	6005 2185 6005 2385
Connection ~ 6005 2385
Wire Wire Line
	10004 3140 10967 3140
Wire Wire Line
	9106 2836 10932 2836
Wire Wire Line
	8608 2916 8608 2914
Wire Wire Line
	8604 2916 8608 2916
Wire Wire Line
	8608 2914 10246 2914
Wire Wire Line
	9776 3014 10262 3014
Wire Wire Line
	10246 2912 10431 2912
Wire Wire Line
	10246 2914 10246 2912
Wire Wire Line
	10262 3012 10431 3012
Wire Wire Line
	10262 3014 10262 3012
Wire Wire Line
	9755 2635 9755 3060
Wire Wire Line
	9755 3060 9776 3060
Wire Wire Line
	9776 3060 9776 3014
Wire Wire Line
	10931 2812 10959 2812
Wire Wire Line
	10959 2812 10959 2837
Wire Wire Line
	10959 2837 10932 2837
Wire Wire Line
	10932 2837 10932 2836
Wire Wire Line
	10967 3140 10967 3112
Wire Wire Line
	8605 2950 8605 3985
Wire Wire Line
	9106 2835 9106 2836
Wire Wire Line
	8604 2916 8604 2950
Wire Wire Line
	8604 2950 8605 2950
Wire Wire Line
	10967 3112 10931 3112
Wire Wire Line
	10055 3112 10431 3112
Connection ~ 10055 3112
Wire Wire Line
	10004 3140 10004 3139
Wire Wire Line
	10004 3139 10005 3139
Connection ~ 10005 3139
Wire Wire Line
	10980 2912 10931 2912
Wire Wire Line
	10980 2964 10980 2912
Wire Wire Line
	9352 2964 10980 2964
Wire Wire Line
	9352 2813 9352 2964
Wire Wire Line
	8655 2785 9387 2785
Wire Wire Line
	9387 2785 9387 2813
Wire Wire Line
	9387 2813 9352 2813
Wire Wire Line
	6833 3185 6833 3236
Wire Wire Line
	6833 3236 6855 3236
Wire Wire Line
	6855 3236 6855 3235
Wire Wire Line
	8605 3285 8605 3284
Connection ~ 8605 3284
Wire Wire Line
	3055 2085 3365 2085
Wire Wire Line
	3365 1844 3655 1844
Wire Wire Line
	3365 2085 3365 1844
Wire Wire Line
	3255 2185 3236 2185
Wire Wire Line
	3236 2185 3236 2352
Wire Wire Line
	3236 2352 3255 2352
Wire Wire Line
	4055 2185 4155 2185
Connection ~ 4155 2185
Wire Wire Line
	3655 1844 3655 1885
Wire Wire Line
	6855 3185 6833 3185
Wire Wire Line
	9705 2685 9705 2836
Connection ~ 9705 2836
Connection ~ 3255 2385
Wire Wire Line
	8282 2185 9105 2185
Wire Wire Line
	8282 2185 8282 2209
Wire Wire Line
	8282 2209 8305 2209
Wire Wire Line
	8355 2285 9105 2285
Wire Wire Line
	6705 3635 6705 2485
Wire Wire Line
	6705 2485 6855 2485
Wire Wire Line
	6750 3585 9105 3585
Wire Wire Line
	6750 2685 6750 3585
Wire Wire Line
	9105 3685 8880 3685
Wire Wire Line
	8880 3685 8880 3140
Wire Wire Line
	8880 3140 10005 3140
Wire Wire Line
	10005 3140 10005 1435
Wire Wire Line
	10055 3320 9105 3320
Connection ~ 10055 3320
Wire Wire Line
	10055 1385 10055 3320
Wire Wire Line
	9105 3320 9105 3485
Connection ~ 8655 4085
Wire Wire Line
	8255 4085 9105 4085
Wire Wire Line
	7155 4585 7155 4435
Wire Wire Line
	6905 5935 7015 5935
Wire Wire Line
	7015 5935 7015 4535
Connection ~ 6905 4535
$EndSCHEMATC
