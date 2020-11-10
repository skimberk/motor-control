EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Q_NMOS_GDS Q1
U 1 1 5FC8E39D
P 3300 1250
F 0 "Q1" H 3505 1250 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 1205 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 1350 50  0001 C CNN
F 3 "~" H 3300 1250 50  0001 C CNN
	1    3300 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5FC8F029
P 3300 2050
F 0 "Q2" H 3505 2050 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 2005 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 2150 50  0001 C CNN
F 3 "~" H 3300 2050 50  0001 C CNN
	1    3300 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5FC90209
P 2900 1250
F 0 "R15" V 3000 1250 50  0000 C CNN
F 1 "4R7" V 2900 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 1250 50  0001 C CNN
F 3 "~" H 2900 1250 50  0001 C CNN
	1    2900 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R R16
U 1 1 5FC90771
P 2900 2050
F 0 "R16" V 3000 2050 50  0000 C CNN
F 1 "4R7" V 2900 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 2050 50  0001 C CNN
F 3 "~" H 2900 2050 50  0001 C CNN
	1    2900 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 1250 3100 1250
Wire Wire Line
	3050 2050 3100 2050
$Comp
L Device:C C21
U 1 1 5FC90E4B
P 3950 1600
F 0 "C21" V 3900 1400 50  0000 L CNN
F 1 "4u7" V 3900 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3988 1450 50  0001 C CNN
F 3 "~" H 3950 1600 50  0001 C CNN
	1    3950 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5FC92CED
P 4200 1600
F 0 "C24" V 4150 1400 50  0000 L CNN
F 1 "4u7" V 4150 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 4238 1450 50  0001 C CNN
F 3 "~" H 4200 1600 50  0001 C CNN
	1    4200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1450 3950 1050
Wire Wire Line
	3950 850  3700 850 
Wire Wire Line
	3400 850  3400 1050
Wire Wire Line
	4200 1450 4200 1050
Wire Wire Line
	4200 1050 3950 1050
Connection ~ 3950 1050
Wire Wire Line
	3950 1050 3950 850 
Wire Wire Line
	3950 1750 3950 2250
Wire Wire Line
	3950 2500 3700 2500
Wire Wire Line
	3400 2500 3400 2400
Wire Wire Line
	4200 1750 4200 2250
Wire Wire Line
	4200 2250 3950 2250
Connection ~ 3950 2250
Wire Wire Line
	3950 2250 3950 2500
Text HLabel 2750 1250 0    50   Input ~ 0
GH_A
Text HLabel 2750 2050 0    50   Input ~ 0
GL_A
Text HLabel 2950 1800 0    50   Input ~ 0
SH_A
Text HLabel 3000 2400 0    50   Input ~ 0
SL_A
Wire Wire Line
	3000 2400 3400 2400
Connection ~ 3400 2400
Wire Wire Line
	3400 2400 3400 2250
Wire Wire Line
	2950 1800 3400 1800
Connection ~ 3400 1800
Wire Wire Line
	3400 1800 3400 1850
$Comp
L power:GND #PWR0130
U 1 1 5FC96AEF
P 3700 2500
F 0 "#PWR0130" H 3700 2250 50  0001 C CNN
F 1 "GND" H 3705 2327 50  0000 C CNN
F 2 "" H 3700 2500 50  0001 C CNN
F 3 "" H 3700 2500 50  0001 C CNN
	1    3700 2500
	1    0    0    -1  
$EndComp
Connection ~ 3700 2500
Wire Wire Line
	3700 2500 3400 2500
Text HLabel 3800 750  2    50   Input ~ 0
SUPPLY
Wire Wire Line
	3400 1450 3400 1550
Connection ~ 3400 1550
Wire Wire Line
	3400 1550 3400 1800
Wire Wire Line
	1900 1550 3400 1550
Text HLabel 1300 1550 0    50   Input ~ 0
PH_A
Wire Wire Line
	1300 1550 1500 1550
$Comp
L Amplifier_Current:INA240A2PW U2
U 1 1 5FC9F753
P 1700 2250
F 0 "U2" V 1700 2400 50  0000 L CNN
F 1 "INA240A2PW" V 1800 2350 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 1700 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 1850 2400 50  0001 C CNN
	1    1700 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1700 1800 1950
Wire Wire Line
	1600 1700 1600 1950
$Comp
L power:GND #PWR0131
U 1 1 5FCA252B
P 1400 2250
F 0 "#PWR0131" H 1400 2000 50  0001 C CNN
F 1 "GND" V 1405 2122 50  0000 R CNN
F 2 "" H 1400 2250 50  0001 C CNN
F 3 "" H 1400 2250 50  0001 C CNN
	1    1400 2250
	0    1    1    0   
$EndComp
$Comp
L Device:C C18
U 1 1 5FCA403E
P 1650 2850
F 0 "C18" V 1600 2700 50  0000 C CNN
F 1 "2u2" V 1600 3000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 2700 50  0001 C CNN
F 3 "~" H 1650 2850 50  0001 C CNN
	1    1650 2850
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0132
U 1 1 5FCA14BE
P 2000 2150
F 0 "#PWR0132" H 2000 2000 50  0001 C CNN
F 1 "+3.3V" V 2015 2278 50  0000 L CNN
F 2 "" H 2000 2150 50  0001 C CNN
F 3 "" H 2000 2150 50  0001 C CNN
	1    2000 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5FCA1EC4
P 1400 2150
F 0 "#PWR0133" H 1400 1900 50  0001 C CNN
F 1 "GND" V 1405 2022 50  0000 R CNN
F 2 "" H 1400 2150 50  0001 C CNN
F 3 "" H 1400 2150 50  0001 C CNN
	1    1400 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5FCAAFF1
P 1350 2850
F 0 "#PWR0134" H 1350 2600 50  0001 C CNN
F 1 "GND" V 1355 2722 50  0000 R CNN
F 2 "" H 1350 2850 50  0001 C CNN
F 3 "" H 1350 2850 50  0001 C CNN
	1    1350 2850
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0135
U 1 1 5FCAB3DD
P 1950 2850
F 0 "#PWR0135" H 1950 2700 50  0001 C CNN
F 1 "+3.3V" V 1965 2978 50  0000 L CNN
F 2 "" H 1950 2850 50  0001 C CNN
F 3 "" H 1950 2850 50  0001 C CNN
	1    1950 2850
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 2850 1500 2850
Wire Wire Line
	1800 2850 1950 2850
Wire Wire Line
	1500 2650 1700 2650
Wire Wire Line
	1700 2650 1700 2550
Connection ~ 3700 850 
Wire Wire Line
	3700 850  3400 850 
$Comp
L Device:R R30
U 1 1 5FCB0940
P 9500 1050
F 0 "R30" V 9450 1200 50  0000 C CNN
F 1 "39k" V 9500 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9430 1050 50  0001 C CNN
F 3 "~" H 9500 1050 50  0001 C CNN
	1    9500 1050
	0    1    1    0   
$EndComp
$Comp
L Device:R R31
U 1 1 5FCB0D5F
P 9500 1250
F 0 "R31" V 9450 1400 50  0000 C CNN
F 1 "2k2" V 9500 1250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9430 1250 50  0001 C CNN
F 3 "~" H 9500 1250 50  0001 C CNN
	1    9500 1250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 5FCB3374
P 9750 1350
F 0 "#PWR0136" H 9750 1100 50  0001 C CNN
F 1 "GND" H 9755 1177 50  0000 C CNN
F 2 "" H 9750 1350 50  0001 C CNN
F 3 "" H 9750 1350 50  0001 C CNN
	1    9750 1350
	1    0    0    -1  
$EndComp
Text HLabel 9750 1050 2    50   Input ~ 0
SUPPLY
Text HLabel 9250 1150 0    50   Input ~ 0
VOLT_SUPPLY
Wire Wire Line
	9650 1050 9750 1050
Wire Wire Line
	9650 1250 9750 1250
Wire Wire Line
	9750 1250 9750 1350
Wire Wire Line
	9350 1050 9300 1050
Wire Wire Line
	9300 1050 9300 1150
Wire Wire Line
	9300 1250 9350 1250
Wire Wire Line
	9300 1150 9250 1150
Connection ~ 9300 1150
Wire Wire Line
	9300 1150 9300 1250
$Comp
L Device:R R24
U 1 1 5FCBA45E
P 9450 1950
F 0 "R24" V 9400 2100 50  0000 C CNN
F 1 "39k" V 9450 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 1950 50  0001 C CNN
F 3 "~" H 9450 1950 50  0001 C CNN
	1    9450 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R R25
U 1 1 5FCBA464
P 9450 2150
F 0 "R25" V 9400 2300 50  0000 C CNN
F 1 "2k2" V 9450 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 2150 50  0001 C CNN
F 3 "~" H 9450 2150 50  0001 C CNN
	1    9450 2150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 5FCBA46A
P 9700 2250
F 0 "#PWR0137" H 9700 2000 50  0001 C CNN
F 1 "GND" H 9705 2077 50  0000 C CNN
F 2 "" H 9700 2250 50  0001 C CNN
F 3 "" H 9700 2250 50  0001 C CNN
	1    9700 2250
	1    0    0    -1  
$EndComp
Text HLabel 9700 1950 2    50   Input ~ 0
SH_A
Text HLabel 9200 2050 0    50   Input ~ 0
VOLT_A
Wire Wire Line
	9600 1950 9700 1950
Wire Wire Line
	9600 2150 9700 2150
Wire Wire Line
	9700 2150 9700 2250
Wire Wire Line
	9300 1950 9250 1950
Wire Wire Line
	9250 1950 9250 2050
Wire Wire Line
	9250 2150 9300 2150
Wire Wire Line
	9250 2050 9200 2050
Connection ~ 9250 2050
Wire Wire Line
	9250 2050 9250 2150
$Comp
L Device:R R26
U 1 1 5FCBC025
P 9450 2650
F 0 "R26" V 9400 2800 50  0000 C CNN
F 1 "39k" V 9450 2650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 2650 50  0001 C CNN
F 3 "~" H 9450 2650 50  0001 C CNN
	1    9450 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R R27
U 1 1 5FCBC02B
P 9450 2850
F 0 "R27" V 9400 3000 50  0000 C CNN
F 1 "2k2" V 9450 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 2850 50  0001 C CNN
F 3 "~" H 9450 2850 50  0001 C CNN
	1    9450 2850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0138
U 1 1 5FCBC031
P 9700 2950
F 0 "#PWR0138" H 9700 2700 50  0001 C CNN
F 1 "GND" H 9705 2777 50  0000 C CNN
F 2 "" H 9700 2950 50  0001 C CNN
F 3 "" H 9700 2950 50  0001 C CNN
	1    9700 2950
	1    0    0    -1  
$EndComp
Text HLabel 9700 2650 2    50   Input ~ 0
SH_B
Text HLabel 9200 2750 0    50   Input ~ 0
VOLT_B
Wire Wire Line
	9600 2650 9700 2650
Wire Wire Line
	9600 2850 9700 2850
Wire Wire Line
	9700 2850 9700 2950
Wire Wire Line
	9300 2650 9250 2650
Wire Wire Line
	9250 2650 9250 2750
Wire Wire Line
	9250 2850 9300 2850
Wire Wire Line
	9250 2750 9200 2750
Connection ~ 9250 2750
Wire Wire Line
	9250 2750 9250 2850
$Comp
L Device:R R28
U 1 1 5FCBE4B5
P 9450 3350
F 0 "R28" V 9400 3500 50  0000 C CNN
F 1 "39k" V 9450 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 3350 50  0001 C CNN
F 3 "~" H 9450 3350 50  0001 C CNN
	1    9450 3350
	0    1    1    0   
$EndComp
$Comp
L Device:R R29
U 1 1 5FCBE4BB
P 9450 3550
F 0 "R29" V 9400 3700 50  0000 C CNN
F 1 "2k2" V 9450 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9380 3550 50  0001 C CNN
F 3 "~" H 9450 3550 50  0001 C CNN
	1    9450 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0139
U 1 1 5FCBE4C1
P 9700 3650
F 0 "#PWR0139" H 9700 3400 50  0001 C CNN
F 1 "GND" H 9705 3477 50  0000 C CNN
F 2 "" H 9700 3650 50  0001 C CNN
F 3 "" H 9700 3650 50  0001 C CNN
	1    9700 3650
	1    0    0    -1  
$EndComp
Text HLabel 9700 3350 2    50   Input ~ 0
SH_C
Text HLabel 9200 3450 0    50   Input ~ 0
VOLT_C
Wire Wire Line
	9600 3350 9700 3350
Wire Wire Line
	9600 3550 9700 3550
Wire Wire Line
	9700 3550 9700 3650
Wire Wire Line
	9300 3350 9250 3350
Wire Wire Line
	9250 3350 9250 3450
Wire Wire Line
	9250 3550 9300 3550
Wire Wire Line
	9250 3450 9200 3450
Connection ~ 9250 3450
Wire Wire Line
	9250 3450 9250 3550
Wire Wire Line
	3800 750  3700 750 
Wire Wire Line
	3700 750  3700 850 
$Comp
L Device:Q_NMOS_GDS Q3
U 1 1 5FCE1880
P 3300 3450
F 0 "Q3" H 3505 3450 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 3405 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 3550 50  0001 C CNN
F 3 "~" H 3300 3450 50  0001 C CNN
	1    3300 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q4
U 1 1 5FCE1886
P 3300 4250
F 0 "Q4" H 3505 4250 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 4205 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 4350 50  0001 C CNN
F 3 "~" H 3300 4250 50  0001 C CNN
	1    3300 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 5FCE188C
P 2900 3450
F 0 "R17" V 3000 3450 50  0000 C CNN
F 1 "4R7" V 2900 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 3450 50  0001 C CNN
F 3 "~" H 2900 3450 50  0001 C CNN
	1    2900 3450
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 5FCE1892
P 2900 4250
F 0 "R18" V 3000 4250 50  0000 C CNN
F 1 "4R7" V 2900 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 4250 50  0001 C CNN
F 3 "~" H 2900 4250 50  0001 C CNN
	1    2900 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 3450 3100 3450
Wire Wire Line
	3050 4250 3100 4250
$Comp
L Device:C C22
U 1 1 5FCE189A
P 3950 3800
F 0 "C22" V 3900 3600 50  0000 L CNN
F 1 "4u7" V 3900 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3988 3650 50  0001 C CNN
F 3 "~" H 3950 3800 50  0001 C CNN
	1    3950 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 5FCE18A0
P 4200 3800
F 0 "C25" V 4150 3600 50  0000 L CNN
F 1 "4u7" V 4150 3850 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 4238 3650 50  0001 C CNN
F 3 "~" H 4200 3800 50  0001 C CNN
	1    4200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3650 3950 3250
Wire Wire Line
	3950 3050 3700 3050
Wire Wire Line
	3400 3050 3400 3250
Wire Wire Line
	4200 3650 4200 3250
Wire Wire Line
	4200 3250 3950 3250
Connection ~ 3950 3250
Wire Wire Line
	3950 3250 3950 3050
Wire Wire Line
	3950 3950 3950 4450
Wire Wire Line
	3950 4700 3700 4700
Wire Wire Line
	3400 4700 3400 4600
Wire Wire Line
	4200 3950 4200 4450
Wire Wire Line
	4200 4450 3950 4450
Connection ~ 3950 4450
Wire Wire Line
	3950 4450 3950 4700
Text HLabel 2750 3450 0    50   Input ~ 0
GH_B
Text HLabel 2750 4250 0    50   Input ~ 0
GL_B
Text HLabel 2950 4000 0    50   Input ~ 0
SH_B
Text HLabel 3000 4600 0    50   Input ~ 0
SL_B
Wire Wire Line
	3000 4600 3400 4600
Connection ~ 3400 4600
Wire Wire Line
	3400 4600 3400 4450
Wire Wire Line
	2950 4000 3400 4000
Connection ~ 3400 4000
Wire Wire Line
	3400 4000 3400 4050
$Comp
L power:GND #PWR0140
U 1 1 5FCE18BE
P 3700 4700
F 0 "#PWR0140" H 3700 4450 50  0001 C CNN
F 1 "GND" H 3705 4527 50  0000 C CNN
F 2 "" H 3700 4700 50  0001 C CNN
F 3 "" H 3700 4700 50  0001 C CNN
	1    3700 4700
	1    0    0    -1  
$EndComp
Connection ~ 3700 4700
Wire Wire Line
	3700 4700 3400 4700
Text HLabel 3800 2950 2    50   Input ~ 0
SUPPLY
Wire Wire Line
	3400 3650 3400 3750
Connection ~ 3400 3750
Wire Wire Line
	3400 3750 3400 4000
Wire Wire Line
	1900 3750 3400 3750
$Comp
L Device:R R13
U 1 1 5FCE18CB
P 1700 3750
F 0 "R13" V 1493 3750 50  0000 C CNN
F 1 "0.002R" V 1584 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 1630 3750 50  0001 C CNN
F 3 "~" H 1700 3750 50  0001 C CNN
	1    1700 3750
	0    1    1    0   
$EndComp
Text HLabel 1300 3750 0    50   Input ~ 0
PH_B
Wire Wire Line
	1300 3750 1500 3750
$Comp
L Amplifier_Current:INA240A2PW U3
U 1 1 5FCE18D3
P 1700 4450
F 0 "U3" V 1700 4600 50  0000 L CNN
F 1 "INA240A2PW" V 1800 4550 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 1700 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 1850 4600 50  0001 C CNN
	1    1700 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 3900 1800 4150
Wire Wire Line
	1600 3900 1600 4150
$Comp
L power:GND #PWR0141
U 1 1 5FCE18E1
P 1400 4450
F 0 "#PWR0141" H 1400 4200 50  0001 C CNN
F 1 "GND" V 1405 4322 50  0000 R CNN
F 2 "" H 1400 4450 50  0001 C CNN
F 3 "" H 1400 4450 50  0001 C CNN
	1    1400 4450
	0    1    1    0   
$EndComp
$Comp
L Device:C C19
U 1 1 5FCE18E7
P 1650 5050
F 0 "C19" V 1600 4900 50  0000 C CNN
F 1 "2u2" V 1600 5200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 4900 50  0001 C CNN
F 3 "~" H 1650 5050 50  0001 C CNN
	1    1650 5050
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0142
U 1 1 5FCE18ED
P 2000 4350
F 0 "#PWR0142" H 2000 4200 50  0001 C CNN
F 1 "+3.3V" V 2015 4478 50  0000 L CNN
F 2 "" H 2000 4350 50  0001 C CNN
F 3 "" H 2000 4350 50  0001 C CNN
	1    2000 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0143
U 1 1 5FCE18F3
P 1400 4350
F 0 "#PWR0143" H 1400 4100 50  0001 C CNN
F 1 "GND" V 1405 4222 50  0000 R CNN
F 2 "" H 1400 4350 50  0001 C CNN
F 3 "" H 1400 4350 50  0001 C CNN
	1    1400 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5FCE18F9
P 1350 5050
F 0 "#PWR0144" H 1350 4800 50  0001 C CNN
F 1 "GND" V 1355 4922 50  0000 R CNN
F 2 "" H 1350 5050 50  0001 C CNN
F 3 "" H 1350 5050 50  0001 C CNN
	1    1350 5050
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0145
U 1 1 5FCE18FF
P 1950 5050
F 0 "#PWR0145" H 1950 4900 50  0001 C CNN
F 1 "+3.3V" V 1965 5178 50  0000 L CNN
F 2 "" H 1950 5050 50  0001 C CNN
F 3 "" H 1950 5050 50  0001 C CNN
	1    1950 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 5050 1500 5050
Wire Wire Line
	1800 5050 1950 5050
Wire Wire Line
	1500 4850 1700 4850
Wire Wire Line
	1700 4850 1700 4750
Connection ~ 3700 3050
Wire Wire Line
	3700 3050 3400 3050
Wire Wire Line
	3800 2950 3700 2950
Wire Wire Line
	3700 2950 3700 3050
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 5FCEC886
P 3300 5700
F 0 "Q5" H 3505 5700 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 5655 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 5800 50  0001 C CNN
F 3 "~" H 3300 5700 50  0001 C CNN
	1    3300 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q6
U 1 1 5FCEC88C
P 3300 6500
F 0 "Q6" H 3505 6500 50  0000 L CNN
F 1 "Q_NMOS_GDS" H 3504 6455 50  0001 L CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 3500 6600 50  0001 C CNN
F 3 "~" H 3300 6500 50  0001 C CNN
	1    3300 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5FCEC892
P 2900 5700
F 0 "R19" V 3000 5700 50  0000 C CNN
F 1 "4R7" V 2900 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 5700 50  0001 C CNN
F 3 "~" H 2900 5700 50  0001 C CNN
	1    2900 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 5FCEC898
P 2900 6500
F 0 "R20" V 3000 6500 50  0000 C CNN
F 1 "4R7" V 2900 6500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 6500 50  0001 C CNN
F 3 "~" H 2900 6500 50  0001 C CNN
	1    2900 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 5700 3100 5700
Wire Wire Line
	3050 6500 3100 6500
$Comp
L Device:C C23
U 1 1 5FCEC8A0
P 3950 6050
F 0 "C23" V 3900 5850 50  0000 L CNN
F 1 "4u7" V 3900 6100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 3988 5900 50  0001 C CNN
F 3 "~" H 3950 6050 50  0001 C CNN
	1    3950 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5FCEC8A6
P 4200 6050
F 0 "C26" V 4150 5850 50  0000 L CNN
F 1 "4u7" V 4150 6100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric" H 4238 5900 50  0001 C CNN
F 3 "~" H 4200 6050 50  0001 C CNN
	1    4200 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5900 3950 5500
Wire Wire Line
	3950 5300 3700 5300
Wire Wire Line
	3400 5300 3400 5500
Wire Wire Line
	4200 5900 4200 5500
Wire Wire Line
	4200 5500 3950 5500
Connection ~ 3950 5500
Wire Wire Line
	3950 5500 3950 5300
Wire Wire Line
	3950 6200 3950 6700
Wire Wire Line
	3950 6950 3700 6950
Wire Wire Line
	3400 6950 3400 6850
Wire Wire Line
	4200 6200 4200 6700
Wire Wire Line
	4200 6700 3950 6700
Connection ~ 3950 6700
Wire Wire Line
	3950 6700 3950 6950
Text HLabel 2750 5700 0    50   Input ~ 0
GH_C
Text HLabel 2750 6500 0    50   Input ~ 0
GL_C
Text HLabel 2950 6250 0    50   Input ~ 0
SH_C
Text HLabel 3000 6850 0    50   Input ~ 0
SL_C
Wire Wire Line
	3000 6850 3400 6850
Connection ~ 3400 6850
Wire Wire Line
	3400 6850 3400 6700
Wire Wire Line
	2950 6250 3400 6250
Connection ~ 3400 6250
Wire Wire Line
	3400 6250 3400 6300
$Comp
L power:GND #PWR0146
U 1 1 5FCEC8C4
P 3700 6950
F 0 "#PWR0146" H 3700 6700 50  0001 C CNN
F 1 "GND" H 3705 6777 50  0000 C CNN
F 2 "" H 3700 6950 50  0001 C CNN
F 3 "" H 3700 6950 50  0001 C CNN
	1    3700 6950
	1    0    0    -1  
$EndComp
Connection ~ 3700 6950
Wire Wire Line
	3700 6950 3400 6950
Text HLabel 3800 5200 2    50   Input ~ 0
SUPPLY
Wire Wire Line
	3400 5900 3400 6000
Connection ~ 3400 6000
Wire Wire Line
	3400 6000 3400 6250
Wire Wire Line
	1900 6000 3400 6000
$Comp
L Device:R R14
U 1 1 5FCEC8D1
P 1700 6000
F 0 "R14" V 1493 6000 50  0000 C CNN
F 1 "0.002R" V 1584 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 1630 6000 50  0001 C CNN
F 3 "~" H 1700 6000 50  0001 C CNN
	1    1700 6000
	0    1    1    0   
$EndComp
Text HLabel 1300 6000 0    50   Input ~ 0
PH_C
Wire Wire Line
	1300 6000 1500 6000
$Comp
L Amplifier_Current:INA240A2PW U4
U 1 1 5FCEC8D9
P 1700 6700
F 0 "U4" V 1700 6850 50  0000 L CNN
F 1 "INA240A2PW" V 1800 6800 50  0000 L CNN
F 2 "Package_SO:TSSOP-8_4.4x3mm_P0.65mm" H 1700 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina240.pdf" H 1850 6850 50  0001 C CNN
	1    1700 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 6150 1800 6400
Wire Wire Line
	1600 6150 1600 6400
$Comp
L power:GND #PWR0147
U 1 1 5FCEC8E7
P 1400 6700
F 0 "#PWR0147" H 1400 6450 50  0001 C CNN
F 1 "GND" V 1405 6572 50  0000 R CNN
F 2 "" H 1400 6700 50  0001 C CNN
F 3 "" H 1400 6700 50  0001 C CNN
	1    1400 6700
	0    1    1    0   
$EndComp
$Comp
L Device:C C20
U 1 1 5FCEC8ED
P 1650 7300
F 0 "C20" V 1600 7150 50  0000 C CNN
F 1 "2u2" V 1600 7450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1688 7150 50  0001 C CNN
F 3 "~" H 1650 7300 50  0001 C CNN
	1    1650 7300
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0148
U 1 1 5FCEC8F3
P 2000 6600
F 0 "#PWR0148" H 2000 6450 50  0001 C CNN
F 1 "+3.3V" V 2015 6728 50  0000 L CNN
F 2 "" H 2000 6600 50  0001 C CNN
F 3 "" H 2000 6600 50  0001 C CNN
	1    2000 6600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 5FCEC8F9
P 1400 6600
F 0 "#PWR0149" H 1400 6350 50  0001 C CNN
F 1 "GND" V 1405 6472 50  0000 R CNN
F 2 "" H 1400 6600 50  0001 C CNN
F 3 "" H 1400 6600 50  0001 C CNN
	1    1400 6600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5FCEC8FF
P 1350 7300
F 0 "#PWR0150" H 1350 7050 50  0001 C CNN
F 1 "GND" V 1355 7172 50  0000 R CNN
F 2 "" H 1350 7300 50  0001 C CNN
F 3 "" H 1350 7300 50  0001 C CNN
	1    1350 7300
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0151
U 1 1 5FCEC905
P 1950 7300
F 0 "#PWR0151" H 1950 7150 50  0001 C CNN
F 1 "+3.3V" V 1965 7428 50  0000 L CNN
F 2 "" H 1950 7300 50  0001 C CNN
F 3 "" H 1950 7300 50  0001 C CNN
	1    1950 7300
	0    1    1    0   
$EndComp
Wire Wire Line
	1350 7300 1500 7300
Wire Wire Line
	1800 7300 1950 7300
Wire Wire Line
	1500 7100 1700 7100
Wire Wire Line
	1700 7100 1700 7000
Connection ~ 3700 5300
Wire Wire Line
	3700 5300 3400 5300
Wire Wire Line
	3800 5200 3700 5200
Wire Wire Line
	3700 5200 3700 5300
$Comp
L Device:CP C36
U 1 1 5FD3B1AC
P 9450 4400
F 0 "C36" V 9400 4250 50  0000 L CNN
F 1 "680u" V 9400 4550 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 9488 4250 50  0001 C CNN
F 3 "~" H 9450 4400 50  0001 C CNN
	1    9450 4400
	0    1    1    0   
$EndComp
$Comp
L Device:CP C37
U 1 1 5FD3DF27
P 9450 4700
F 0 "C37" V 9400 4550 50  0000 L CNN
F 1 "680u" V 9400 4850 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 9488 4550 50  0001 C CNN
F 3 "~" H 9450 4700 50  0001 C CNN
	1    9450 4700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5FD3E68D
P 9100 4550
F 0 "#PWR0152" H 9100 4300 50  0001 C CNN
F 1 "GND" H 9105 4377 50  0000 C CNN
F 2 "" H 9100 4550 50  0001 C CNN
F 3 "" H 9100 4550 50  0001 C CNN
	1    9100 4550
	0    1    1    0   
$EndComp
Text HLabel 9900 4550 2    50   Input ~ 0
SUPPLY
Wire Wire Line
	9900 4550 9850 4550
Wire Wire Line
	9850 4550 9850 4400
Wire Wire Line
	9850 4400 9600 4400
Wire Wire Line
	9300 4400 9150 4400
Wire Wire Line
	9150 4400 9150 4550
Wire Wire Line
	9150 4550 9100 4550
Wire Wire Line
	9300 4700 9150 4700
Wire Wire Line
	9150 4700 9150 4550
Connection ~ 9150 4550
Wire Wire Line
	9600 4700 9850 4700
Wire Wire Line
	9850 4700 9850 4550
Connection ~ 9850 4550
Text Label 1500 2650 2    50   ~ 0
CURR_A_RAW
Text Label 1500 4850 2    50   ~ 0
CURR_B_RAW
Text Label 1500 7100 2    50   ~ 0
CURR_C_RAW
$Comp
L sebastian-symbols:BL1551 U5
U 1 1 5FDBAC34
P 5800 1650
F 0 "U5" H 6000 1400 50  0000 C CNN
F 1 "BL1551" H 5700 1400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5850 1950 50  0001 C CNN
F 3 "" H 5850 1950 50  0001 C CNN
	1    5800 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0153
U 1 1 5FDBB29C
P 5450 1500
F 0 "#PWR0153" H 5450 1350 50  0001 C CNN
F 1 "+3.3V" V 5450 1600 50  0000 L CNN
F 2 "" H 5450 1500 50  0001 C CNN
F 3 "" H 5450 1500 50  0001 C CNN
	1    5450 1500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0154
U 1 1 5FDBB83E
P 5450 1600
F 0 "#PWR0154" H 5450 1350 50  0001 C CNN
F 1 "GND" V 5455 1472 50  0000 R CNN
F 2 "" H 5450 1600 50  0001 C CNN
F 3 "" H 5450 1600 50  0001 C CNN
	1    5450 1600
	0    1    1    0   
$EndComp
Text HLabel 5450 1750 0    50   Input ~ 0
CURR_FILTER
NoConn ~ 6150 1600
$Comp
L Device:C C30
U 1 1 5FDD8D76
P 6300 1900
F 0 "C30" H 6415 1946 50  0000 L CNN
F 1 "15n" H 6415 1855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6338 1750 50  0001 C CNN
F 3 "~" H 6300 1900 50  0001 C CNN
	1    6300 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C33
U 1 1 5FDD93B5
P 6600 1650
F 0 "C33" H 6715 1696 50  0000 L CNN
F 1 "1n" H 6715 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 1500 50  0001 C CNN
F 3 "~" H 6600 1650 50  0001 C CNN
	1    6600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 2200 6300 2050
$Comp
L power:GND #PWR0155
U 1 1 5FDEA7F9
P 6450 2250
F 0 "#PWR0155" H 6450 2000 50  0001 C CNN
F 1 "GND" H 6455 2077 50  0000 C CNN
F 2 "" H 6450 2250 50  0001 C CNN
F 3 "" H 6450 2250 50  0001 C CNN
	1    6450 2250
	1    0    0    -1  
$EndComp
Text HLabel 5950 1300 0    50   Input ~ 0
CURR_A
Wire Wire Line
	6600 2200 6450 2200
Wire Wire Line
	6450 2200 6450 2250
Connection ~ 6450 2200
Wire Wire Line
	6450 2200 6300 2200
Wire Wire Line
	6600 1800 6600 2200
Wire Wire Line
	6300 1750 6150 1750
Wire Wire Line
	5950 1300 6300 1300
Wire Wire Line
	6600 1300 6600 1500
Wire Wire Line
	6150 1500 6300 1500
Wire Wire Line
	6300 1500 6300 1300
Connection ~ 6300 1300
Wire Wire Line
	6300 1300 6600 1300
$Comp
L Device:R R21
U 1 1 5FE4E3D2
P 6850 1300
F 0 "R21" V 6950 1300 50  0000 C CNN
F 1 "1k" V 6850 1300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6780 1300 50  0001 C CNN
F 3 "~" H 6850 1300 50  0001 C CNN
	1    6850 1300
	0    1    1    0   
$EndComp
Text Label 7100 1300 0    50   ~ 0
CURR_A_RAW
Wire Wire Line
	6700 1300 6600 1300
Connection ~ 6600 1300
Wire Wire Line
	7000 1300 7100 1300
$Comp
L sebastian-symbols:BL1551 U6
U 1 1 5FE7C797
P 5800 3850
F 0 "U6" H 6000 3600 50  0000 C CNN
F 1 "BL1551" H 5700 3600 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5850 4150 50  0001 C CNN
F 3 "" H 5850 4150 50  0001 C CNN
	1    5800 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0156
U 1 1 5FE7C79D
P 5450 3700
F 0 "#PWR0156" H 5450 3550 50  0001 C CNN
F 1 "+3.3V" V 5450 3800 50  0000 L CNN
F 2 "" H 5450 3700 50  0001 C CNN
F 3 "" H 5450 3700 50  0001 C CNN
	1    5450 3700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5FE7C7A3
P 5450 3800
F 0 "#PWR0157" H 5450 3550 50  0001 C CNN
F 1 "GND" V 5455 3672 50  0000 R CNN
F 2 "" H 5450 3800 50  0001 C CNN
F 3 "" H 5450 3800 50  0001 C CNN
	1    5450 3800
	0    1    1    0   
$EndComp
Text HLabel 5450 3950 0    50   Input ~ 0
CURR_FILTER
NoConn ~ 6150 3800
$Comp
L Device:C C31
U 1 1 5FE7C7AB
P 6300 4100
F 0 "C31" H 6415 4146 50  0000 L CNN
F 1 "15n" H 6415 4055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6338 3950 50  0001 C CNN
F 3 "~" H 6300 4100 50  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C34
U 1 1 5FE7C7B1
P 6600 3850
F 0 "C34" H 6715 3896 50  0000 L CNN
F 1 "1n" H 6715 3805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 3700 50  0001 C CNN
F 3 "~" H 6600 3850 50  0001 C CNN
	1    6600 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4400 6300 4250
$Comp
L power:GND #PWR0158
U 1 1 5FE7C7B8
P 6450 4450
F 0 "#PWR0158" H 6450 4200 50  0001 C CNN
F 1 "GND" H 6455 4277 50  0000 C CNN
F 2 "" H 6450 4450 50  0001 C CNN
F 3 "" H 6450 4450 50  0001 C CNN
	1    6450 4450
	1    0    0    -1  
$EndComp
Text HLabel 5950 3500 0    50   Input ~ 0
CURR_B
Wire Wire Line
	6600 4400 6450 4400
Wire Wire Line
	6450 4400 6450 4450
Connection ~ 6450 4400
Wire Wire Line
	6450 4400 6300 4400
Wire Wire Line
	6600 4000 6600 4400
Wire Wire Line
	6300 3950 6150 3950
Wire Wire Line
	5950 3500 6300 3500
Wire Wire Line
	6600 3500 6600 3700
Wire Wire Line
	6150 3700 6300 3700
Wire Wire Line
	6300 3700 6300 3500
Connection ~ 6300 3500
Wire Wire Line
	6300 3500 6600 3500
$Comp
L Device:R R22
U 1 1 5FE7C7CB
P 6850 3500
F 0 "R22" V 6950 3500 50  0000 C CNN
F 1 "1k" V 6850 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6780 3500 50  0001 C CNN
F 3 "~" H 6850 3500 50  0001 C CNN
	1    6850 3500
	0    1    1    0   
$EndComp
Text Label 7100 3500 0    50   ~ 0
CURR_B_RAW
Wire Wire Line
	6700 3500 6600 3500
Connection ~ 6600 3500
Wire Wire Line
	7000 3500 7100 3500
$Comp
L sebastian-symbols:BL1551 U7
U 1 1 5FE865E7
P 5800 6100
F 0 "U7" H 6000 5850 50  0000 C CNN
F 1 "BL1551" H 5700 5850 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5850 6400 50  0001 C CNN
F 3 "" H 5850 6400 50  0001 C CNN
	1    5800 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0159
U 1 1 5FE865ED
P 5450 5950
F 0 "#PWR0159" H 5450 5800 50  0001 C CNN
F 1 "+3.3V" V 5450 6050 50  0000 L CNN
F 2 "" H 5450 5950 50  0001 C CNN
F 3 "" H 5450 5950 50  0001 C CNN
	1    5450 5950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0160
U 1 1 5FE865F3
P 5450 6050
F 0 "#PWR0160" H 5450 5800 50  0001 C CNN
F 1 "GND" V 5455 5922 50  0000 R CNN
F 2 "" H 5450 6050 50  0001 C CNN
F 3 "" H 5450 6050 50  0001 C CNN
	1    5450 6050
	0    1    1    0   
$EndComp
Text HLabel 5450 6200 0    50   Input ~ 0
CURR_FILTER
NoConn ~ 6150 6050
$Comp
L Device:C C32
U 1 1 5FE865FB
P 6300 6350
F 0 "C32" H 6415 6396 50  0000 L CNN
F 1 "15n" H 6415 6305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6338 6200 50  0001 C CNN
F 3 "~" H 6300 6350 50  0001 C CNN
	1    6300 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C35
U 1 1 5FE86601
P 6600 6100
F 0 "C35" H 6715 6146 50  0000 L CNN
F 1 "1n" H 6715 6055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 5950 50  0001 C CNN
F 3 "~" H 6600 6100 50  0001 C CNN
	1    6600 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 6650 6300 6500
$Comp
L power:GND #PWR0161
U 1 1 5FE86608
P 6450 6700
F 0 "#PWR0161" H 6450 6450 50  0001 C CNN
F 1 "GND" H 6455 6527 50  0000 C CNN
F 2 "" H 6450 6700 50  0001 C CNN
F 3 "" H 6450 6700 50  0001 C CNN
	1    6450 6700
	1    0    0    -1  
$EndComp
Text HLabel 5950 5750 0    50   Input ~ 0
CURR_C
Wire Wire Line
	6600 6650 6450 6650
Wire Wire Line
	6450 6650 6450 6700
Connection ~ 6450 6650
Wire Wire Line
	6450 6650 6300 6650
Wire Wire Line
	6600 6250 6600 6650
Wire Wire Line
	6300 6200 6150 6200
Wire Wire Line
	5950 5750 6300 5750
Wire Wire Line
	6600 5750 6600 5950
Wire Wire Line
	6150 5950 6300 5950
Wire Wire Line
	6300 5950 6300 5750
Connection ~ 6300 5750
Wire Wire Line
	6300 5750 6600 5750
$Comp
L Device:R R23
U 1 1 5FE8661B
P 6850 5750
F 0 "R23" V 6950 5750 50  0000 C CNN
F 1 "1k" V 6850 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6780 5750 50  0001 C CNN
F 3 "~" H 6850 5750 50  0001 C CNN
	1    6850 5750
	0    1    1    0   
$EndComp
Text Label 7100 5750 0    50   ~ 0
CURR_C_RAW
Wire Wire Line
	6700 5750 6600 5750
Connection ~ 6600 5750
Wire Wire Line
	7000 5750 7100 5750
$Comp
L power:+3.3VA #PWR0162
U 1 1 60018919
P 1400 2350
F 0 "#PWR0162" H 1400 2200 50  0001 C CNN
F 1 "+3.3VA" V 1415 2477 50  0000 L CNN
F 2 "" H 1400 2350 50  0001 C CNN
F 3 "" H 1400 2350 50  0001 C CNN
	1    1400 2350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR0163
U 1 1 6001B897
P 1400 4550
F 0 "#PWR0163" H 1400 4400 50  0001 C CNN
F 1 "+3.3VA" V 1415 4677 50  0000 L CNN
F 2 "" H 1400 4550 50  0001 C CNN
F 3 "" H 1400 4550 50  0001 C CNN
	1    1400 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3VA #PWR0164
U 1 1 6001D876
P 1400 6800
F 0 "#PWR0164" H 1400 6650 50  0001 C CNN
F 1 "+3.3VA" V 1415 6927 50  0000 L CNN
F 2 "" H 1400 6800 50  0001 C CNN
F 3 "" H 1400 6800 50  0001 C CNN
	1    1400 6800
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C27
U 1 1 60028A42
P 5800 1050
F 0 "C27" V 5750 900 50  0000 C CNN
F 1 "2u2" V 5750 1200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5838 900 50  0001 C CNN
F 3 "~" H 5800 1050 50  0001 C CNN
	1    5800 1050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 60028A48
P 5500 1050
F 0 "#PWR0165" H 5500 800 50  0001 C CNN
F 1 "GND" V 5505 922 50  0000 R CNN
F 2 "" H 5500 1050 50  0001 C CNN
F 3 "" H 5500 1050 50  0001 C CNN
	1    5500 1050
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0166
U 1 1 60028A4E
P 6100 1050
F 0 "#PWR0166" H 6100 900 50  0001 C CNN
F 1 "+3.3V" V 6115 1178 50  0000 L CNN
F 2 "" H 6100 1050 50  0001 C CNN
F 3 "" H 6100 1050 50  0001 C CNN
	1    6100 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 1050 5650 1050
Wire Wire Line
	5950 1050 6100 1050
$Comp
L Device:C C28
U 1 1 60033EBE
P 5800 3250
F 0 "C28" V 5750 3100 50  0000 C CNN
F 1 "2u2" V 5750 3400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5838 3100 50  0001 C CNN
F 3 "~" H 5800 3250 50  0001 C CNN
	1    5800 3250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0167
U 1 1 60033EC4
P 5500 3250
F 0 "#PWR0167" H 5500 3000 50  0001 C CNN
F 1 "GND" V 5505 3122 50  0000 R CNN
F 2 "" H 5500 3250 50  0001 C CNN
F 3 "" H 5500 3250 50  0001 C CNN
	1    5500 3250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0168
U 1 1 60033ECA
P 6100 3250
F 0 "#PWR0168" H 6100 3100 50  0001 C CNN
F 1 "+3.3V" V 6115 3378 50  0000 L CNN
F 2 "" H 6100 3250 50  0001 C CNN
F 3 "" H 6100 3250 50  0001 C CNN
	1    6100 3250
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 3250 5650 3250
Wire Wire Line
	5950 3250 6100 3250
$Comp
L Device:C C29
U 1 1 6003E74D
P 5800 5500
F 0 "C29" V 5750 5350 50  0000 C CNN
F 1 "2u2" V 5750 5650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5838 5350 50  0001 C CNN
F 3 "~" H 5800 5500 50  0001 C CNN
	1    5800 5500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0169
U 1 1 6003E753
P 5500 5500
F 0 "#PWR0169" H 5500 5250 50  0001 C CNN
F 1 "GND" V 5505 5372 50  0000 R CNN
F 2 "" H 5500 5500 50  0001 C CNN
F 3 "" H 5500 5500 50  0001 C CNN
	1    5500 5500
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0170
U 1 1 6003E759
P 6100 5500
F 0 "#PWR0170" H 6100 5350 50  0001 C CNN
F 1 "+3.3V" V 6115 5628 50  0000 L CNN
F 2 "" H 6100 5500 50  0001 C CNN
F 3 "" H 6100 5500 50  0001 C CNN
	1    6100 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 5500 5650 5500
Wire Wire Line
	5950 5500 6100 5500
$Comp
L Device:R R12
U 1 1 5FC9C485
P 1700 1550
F 0 "R12" V 1493 1550 50  0000 C CNN
F 1 "0.002R" V 1584 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 1630 1550 50  0001 C CNN
F 3 "~" H 1700 1550 50  0001 C CNN
	1    1700 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1700 1900 1700
Wire Wire Line
	1900 1700 1900 1550
Wire Wire Line
	1900 1550 1850 1550
Connection ~ 1900 1550
Wire Wire Line
	1600 1700 1500 1700
Wire Wire Line
	1500 1700 1500 1550
Wire Wire Line
	1500 1550 1550 1550
Connection ~ 1500 1550
Wire Wire Line
	1800 3900 1900 3900
Wire Wire Line
	1900 3900 1900 3750
Wire Wire Line
	1600 3900 1500 3900
Wire Wire Line
	1500 3900 1500 3750
Wire Wire Line
	1500 3750 1550 3750
Connection ~ 1500 3750
Wire Wire Line
	1850 3750 1900 3750
Connection ~ 1900 3750
Wire Wire Line
	1800 6150 1900 6150
Wire Wire Line
	1900 6150 1900 6000
Wire Wire Line
	1600 6150 1500 6150
Wire Wire Line
	1500 6150 1500 6000
Wire Wire Line
	1500 6000 1550 6000
Connection ~ 1500 6000
Wire Wire Line
	1850 6000 1900 6000
Connection ~ 1900 6000
$EndSCHEMATC
