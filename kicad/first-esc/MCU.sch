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
L power:GND #PWR?
U 1 1 5FC8382A
P 2900 6100
AR Path="/5FC8382A" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC8382A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2900 5850 50  0001 C CNN
F 1 "GND" H 2905 5927 50  0000 C CNN
F 2 "" H 2900 6100 50  0001 C CNN
F 3 "" H 2900 6100 50  0001 C CNN
	1    2900 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6000 2800 6050
Wire Wire Line
	2800 6050 2900 6050
Wire Wire Line
	3000 6050 3000 6000
Wire Wire Line
	2900 6000 2900 6050
Connection ~ 2900 6050
Wire Wire Line
	2900 6050 2900 6100
$Comp
L power:+3.3V #PWR?
U 1 1 5FC83836
P 2700 2300
AR Path="/5FC83836" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83836" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2700 2150 50  0001 C CNN
F 1 "+3.3V" H 2715 2473 50  0000 C CNN
F 2 "" H 2700 2300 50  0001 C CNN
F 3 "" H 2700 2300 50  0001 C CNN
	1    2700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 2300 2700 2400
Wire Wire Line
	2700 2300 2800 2300
Connection ~ 2700 2300
Wire Wire Line
	2800 2400 2800 2300
Connection ~ 2800 2300
Wire Wire Line
	2800 2300 2900 2300
Wire Wire Line
	2900 2400 2900 2300
Connection ~ 2900 2300
Wire Wire Line
	2900 2300 3000 2300
Wire Wire Line
	3000 2400 3000 2300
Connection ~ 3000 2300
Wire Wire Line
	3000 2300 3100 2300
Wire Wire Line
	3100 2400 3100 2300
$Comp
L power:+3.3VA #PWR?
U 1 1 5FC83849
P 3200 2300
AR Path="/5FC83849" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83849" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 2150 50  0001 C CNN
F 1 "+3.3VA" H 3215 2473 50  0000 C CNN
F 2 "" H 3200 2300 50  0001 C CNN
F 3 "" H 3200 2300 50  0001 C CNN
	1    3200 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2300 3200 2400
$Comp
L Device:C_Small C?
U 1 1 5FC83852
P 1600 3200
AR Path="/5FC83852" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83852" Ref="C?"  Part="1" 
F 0 "C?" H 1692 3246 50  0000 L CNN
F 1 "2u2" H 1692 3155 50  0000 L CNN
F 2 "" H 1600 3200 50  0001 C CNN
F 3 "~" H 1600 3200 50  0001 C CNN
	1    1600 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83858
P 1950 3200
AR Path="/5FC83858" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83858" Ref="C?"  Part="1" 
F 0 "C?" H 2042 3246 50  0000 L CNN
F 1 "2u2" H 2042 3155 50  0000 L CNN
F 2 "" H 1950 3200 50  0001 C CNN
F 3 "~" H 1950 3200 50  0001 C CNN
	1    1950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC8385E
P 1600 3300
AR Path="/5FC8385E" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC8385E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1600 3050 50  0001 C CNN
F 1 "GND" H 1605 3127 50  0000 C CNN
F 2 "" H 1600 3300 50  0001 C CNN
F 3 "" H 1600 3300 50  0001 C CNN
	1    1600 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC83864
P 1950 3300
AR Path="/5FC83864" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83864" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 3050 50  0001 C CNN
F 1 "GND" H 1955 3127 50  0000 C CNN
F 2 "" H 1950 3300 50  0001 C CNN
F 3 "" H 1950 3300 50  0001 C CNN
	1    1950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3100 1950 3100
Wire Wire Line
	2200 3000 1600 3000
Wire Wire Line
	1600 3000 1600 3100
Wire Wire Line
	2900 6050 3000 6050
$Comp
L MCU_ST_STM32F4:STM32F405RGTx U?
U 1 1 5FC83870
P 2900 4200
AR Path="/5FC83870" Ref="U?"  Part="1" 
AR Path="/5FC738A0/5FC83870" Ref="U?"  Part="1" 
F 0 "U?" H 3450 6000 50  0000 C CNN
F 1 "STM32F405RGTx" H 3400 2450 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 2300 2500 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 2900 4200 50  0001 C CNN
	1    2900 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83876
P 1350 1600
AR Path="/5FC83876" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83876" Ref="C?"  Part="1" 
F 0 "C?" H 1442 1646 50  0000 L CNN
F 1 "4u7" H 1442 1555 50  0000 L CNN
F 2 "" H 1350 1600 50  0001 C CNN
F 3 "~" H 1350 1600 50  0001 C CNN
	1    1350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC8387C
P 1700 1600
AR Path="/5FC8387C" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC8387C" Ref="C?"  Part="1" 
F 0 "C?" H 1792 1646 50  0000 L CNN
F 1 "100n" H 1792 1555 50  0000 L CNN
F 2 "" H 1700 1600 50  0001 C CNN
F 3 "~" H 1700 1600 50  0001 C CNN
	1    1700 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83882
P 2050 1600
AR Path="/5FC83882" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83882" Ref="C?"  Part="1" 
F 0 "C?" H 2142 1646 50  0000 L CNN
F 1 "100n" H 2142 1555 50  0000 L CNN
F 2 "" H 2050 1600 50  0001 C CNN
F 3 "~" H 2050 1600 50  0001 C CNN
	1    2050 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83888
P 2400 1600
AR Path="/5FC83888" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83888" Ref="C?"  Part="1" 
F 0 "C?" H 2492 1646 50  0000 L CNN
F 1 "100n" H 2492 1555 50  0000 L CNN
F 2 "" H 2400 1600 50  0001 C CNN
F 3 "~" H 2400 1600 50  0001 C CNN
	1    2400 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC8388E
P 2750 1600
AR Path="/5FC8388E" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC8388E" Ref="C?"  Part="1" 
F 0 "C?" H 2842 1646 50  0000 L CNN
F 1 "100n" H 2842 1555 50  0000 L CNN
F 2 "" H 2750 1600 50  0001 C CNN
F 3 "~" H 2750 1600 50  0001 C CNN
	1    2750 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83894
P 3150 1600
AR Path="/5FC83894" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83894" Ref="C?"  Part="1" 
F 0 "C?" H 3242 1646 50  0000 L CNN
F 1 "100n" H 3242 1555 50  0000 L CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "~" H 3150 1600 50  0001 C CNN
	1    3150 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FC8389A
P 1350 1400
AR Path="/5FC8389A" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC8389A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 1250 50  0001 C CNN
F 1 "+3.3V" H 1365 1573 50  0000 C CNN
F 2 "" H 1350 1400 50  0001 C CNN
F 3 "" H 1350 1400 50  0001 C CNN
	1    1350 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1400 1350 1500
Wire Wire Line
	1350 1400 1700 1400
Wire Wire Line
	3150 1400 3150 1500
Connection ~ 1350 1400
Wire Wire Line
	1700 1400 1700 1500
Connection ~ 1700 1400
Wire Wire Line
	1700 1400 2050 1400
Wire Wire Line
	2050 1400 2050 1500
Connection ~ 2050 1400
Wire Wire Line
	2050 1400 2400 1400
Wire Wire Line
	2400 1400 2400 1500
Connection ~ 2400 1400
Wire Wire Line
	2400 1400 2750 1400
Wire Wire Line
	2750 1400 2750 1500
Connection ~ 2750 1400
Wire Wire Line
	2750 1400 3150 1400
$Comp
L power:GND #PWR?
U 1 1 5FC838B0
P 1350 1850
AR Path="/5FC838B0" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC838B0" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 1600 50  0001 C CNN
F 1 "GND" H 1355 1677 50  0000 C CNN
F 2 "" H 1350 1850 50  0001 C CNN
F 3 "" H 1350 1850 50  0001 C CNN
	1    1350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1850 1350 1700
Wire Wire Line
	1350 1850 1700 1850
Wire Wire Line
	3150 1850 3150 1700
Connection ~ 1350 1850
Wire Wire Line
	1700 1850 1700 1700
Connection ~ 1700 1850
Wire Wire Line
	1700 1850 2050 1850
Wire Wire Line
	2050 1850 2050 1700
Connection ~ 2050 1850
Wire Wire Line
	2050 1850 2400 1850
Wire Wire Line
	2400 1850 2400 1700
Connection ~ 2400 1850
Wire Wire Line
	2400 1850 2750 1850
Wire Wire Line
	2750 1850 2750 1700
Connection ~ 2750 1850
Wire Wire Line
	2750 1850 3150 1850
$Comp
L Device:L_Small L?
U 1 1 5FC838C6
P 4050 1550
AR Path="/5FC838C6" Ref="L?"  Part="1" 
AR Path="/5FC738A0/5FC838C6" Ref="L?"  Part="1" 
F 0 "L?" V 4235 1550 50  0000 C CNN
F 1 "47n" V 4144 1550 50  0000 C CNN
F 2 "" H 4050 1550 50  0001 C CNN
F 3 "~" H 4050 1550 50  0001 C CNN
	1    4050 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC838CC
P 4300 1650
AR Path="/5FC838CC" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC838CC" Ref="C?"  Part="1" 
F 0 "C?" H 4392 1696 50  0000 L CNN
F 1 "1u" H 4392 1605 50  0000 L CNN
F 2 "" H 4300 1650 50  0001 C CNN
F 3 "~" H 4300 1650 50  0001 C CNN
	1    4300 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC838D2
P 4600 1650
AR Path="/5FC838D2" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC838D2" Ref="C?"  Part="1" 
F 0 "C?" H 4692 1696 50  0000 L CNN
F 1 "10n" H 4692 1605 50  0000 L CNN
F 2 "" H 4600 1650 50  0001 C CNN
F 3 "~" H 4600 1650 50  0001 C CNN
	1    4600 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5FC838D8
P 3800 1500
AR Path="/5FC838D8" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC838D8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3800 1350 50  0001 C CNN
F 1 "+3.3V" H 3815 1673 50  0000 C CNN
F 2 "" H 3800 1500 50  0001 C CNN
F 3 "" H 3800 1500 50  0001 C CNN
	1    3800 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1550 3950 1550
Wire Wire Line
	4150 1550 4300 1550
Wire Wire Line
	4300 1550 4600 1550
Connection ~ 4300 1550
Wire Wire Line
	4300 1900 4450 1900
$Comp
L power:GND #PWR?
U 1 1 5FC838E3
P 4450 1950
AR Path="/5FC838E3" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC838E3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4450 1700 50  0001 C CNN
F 1 "GND" H 4455 1777 50  0000 C CNN
F 2 "" H 4450 1950 50  0001 C CNN
F 3 "" H 4450 1950 50  0001 C CNN
	1    4450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1900 4450 1950
Connection ~ 4450 1900
Wire Wire Line
	4450 1900 4600 1900
Wire Wire Line
	4300 1900 4300 1750
Wire Wire Line
	4600 1900 4600 1750
$Comp
L power:+3.3VA #PWR?
U 1 1 5FC838EE
P 4600 1500
AR Path="/5FC838EE" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC838EE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4600 1350 50  0001 C CNN
F 1 "+3.3VA" H 4615 1673 50  0000 C CNN
F 2 "" H 4600 1500 50  0001 C CNN
F 3 "" H 4600 1500 50  0001 C CNN
	1    4600 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1500 4600 1550
Connection ~ 4600 1550
Wire Wire Line
	3800 1550 3800 1500
Text Label 2200 3800 2    50   ~ 0
HSE_IN
Text Label 2200 3900 2    50   ~ 0
HSE_OUT
Text Label 2200 2600 2    50   ~ 0
NRST
Text Label 2200 2800 2    50   ~ 0
BOOT0
Text HLabel 3600 2600 2    50   Input ~ 0
VOLT_A
Text HLabel 3600 2700 2    50   Input ~ 0
VOLT_B
Text HLabel 3600 2800 2    50   Input ~ 0
VOLT_C
Text HLabel 3600 2900 2    50   Input ~ 0
TEMP
Text HLabel 3600 3400 2    50   Input ~ 0
H_A
Text HLabel 3600 3500 2    50   Input ~ 0
H_B
Text HLabel 3600 3600 2    50   Input ~ 0
H_C
Text HLabel 3600 3700 2    50   Input ~ 0
USB_D-
Text HLabel 3600 3800 2    50   Input ~ 0
USB_D+
Text HLabel 3600 5600 2    50   Input ~ 0
L_A
Text HLabel 3600 5700 2    50   Input ~ 0
L_B
Text HLabel 3600 5800 2    50   Input ~ 0
L_C
Text HLabel 2200 4300 0    50   Input ~ 0
CURR_A
Text HLabel 2200 4400 0    50   Input ~ 0
CURR_B
Text HLabel 2200 4500 0    50   Input ~ 0
CURR_C
Text HLabel 2200 4600 0    50   Input ~ 0
VOLT_SUPPLY
Text HLabel 2200 4100 0    50   Input ~ 0
CURR_FILTER_ON
Text HLabel 3600 3900 2    50   Input ~ 0
SWDIO
Text HLabel 3600 4000 2    50   Input ~ 0
SWCLK
Text HLabel 3600 4600 2    50   Input ~ 0
SWO
$EndSCHEMATC
