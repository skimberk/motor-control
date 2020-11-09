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
P 4200 6650
AR Path="/5FC8382A" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC8382A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4200 6400 50  0001 C CNN
F 1 "GND" H 4205 6477 50  0000 C CNN
F 2 "" H 4200 6650 50  0001 C CNN
F 3 "" H 4200 6650 50  0001 C CNN
	1    4200 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 6550 4100 6600
Wire Wire Line
	4100 6600 4200 6600
Wire Wire Line
	4300 6600 4300 6550
Wire Wire Line
	4200 6550 4200 6600
Connection ~ 4200 6600
Wire Wire Line
	4200 6600 4200 6650
$Comp
L power:+3.3V #PWR?
U 1 1 5FC83836
P 4000 2850
AR Path="/5FC83836" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83836" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4000 2700 50  0001 C CNN
F 1 "+3.3V" H 4015 3023 50  0000 C CNN
F 2 "" H 4000 2850 50  0001 C CNN
F 3 "" H 4000 2850 50  0001 C CNN
	1    4000 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2850 4000 2950
Wire Wire Line
	4000 2850 4100 2850
Connection ~ 4000 2850
Wire Wire Line
	4100 2950 4100 2850
Connection ~ 4100 2850
Wire Wire Line
	4100 2850 4200 2850
Wire Wire Line
	4200 2950 4200 2850
Connection ~ 4200 2850
Wire Wire Line
	4200 2850 4300 2850
Wire Wire Line
	4300 2950 4300 2850
Connection ~ 4300 2850
Wire Wire Line
	4300 2850 4400 2850
Wire Wire Line
	4400 2950 4400 2850
$Comp
L power:+3.3VA #PWR?
U 1 1 5FC83849
P 4500 2850
AR Path="/5FC83849" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83849" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4500 2700 50  0001 C CNN
F 1 "+3.3VA" H 4515 3023 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2850 4500 2950
$Comp
L Device:C_Small C?
U 1 1 5FC83852
P 2900 3750
AR Path="/5FC83852" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83852" Ref="C?"  Part="1" 
F 0 "C?" H 2992 3796 50  0000 L CNN
F 1 "2u2" H 2992 3705 50  0000 L CNN
F 2 "" H 2900 3750 50  0001 C CNN
F 3 "~" H 2900 3750 50  0001 C CNN
	1    2900 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5FC83858
P 3250 3750
AR Path="/5FC83858" Ref="C?"  Part="1" 
AR Path="/5FC738A0/5FC83858" Ref="C?"  Part="1" 
F 0 "C?" H 3342 3796 50  0000 L CNN
F 1 "2u2" H 3342 3705 50  0000 L CNN
F 2 "" H 3250 3750 50  0001 C CNN
F 3 "~" H 3250 3750 50  0001 C CNN
	1    3250 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC8385E
P 2900 3850
AR Path="/5FC8385E" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC8385E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2900 3600 50  0001 C CNN
F 1 "GND" H 2905 3677 50  0000 C CNN
F 2 "" H 2900 3850 50  0001 C CNN
F 3 "" H 2900 3850 50  0001 C CNN
	1    2900 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC83864
P 3250 3850
AR Path="/5FC83864" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/5FC83864" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3250 3600 50  0001 C CNN
F 1 "GND" H 3255 3677 50  0000 C CNN
F 2 "" H 3250 3850 50  0001 C CNN
F 3 "" H 3250 3850 50  0001 C CNN
	1    3250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3650 3250 3650
Wire Wire Line
	3500 3550 2900 3550
Wire Wire Line
	1600 3000 1600 3100
Wire Wire Line
	4200 6600 4300 6600
$Comp
L MCU_ST_STM32F4:STM32F405RGTx U?
U 1 1 5FC83870
P 4200 4750
AR Path="/5FC83870" Ref="U?"  Part="1" 
AR Path="/5FC738A0/5FC83870" Ref="U?"  Part="1" 
F 0 "U?" H 4750 6550 50  0000 C CNN
F 1 "STM32F405RGTx" H 4700 3000 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 3600 3050 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00037051.pdf" H 4200 4750 50  0001 C CNN
	1    4200 4750
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
Text Label 3500 4350 2    50   ~ 0
HSE_IN
Text Label 3500 4450 2    50   ~ 0
HSE_OUT
Text HLabel 4900 3150 2    50   Input ~ 0
VOLT_A
Text HLabel 4900 3250 2    50   Input ~ 0
VOLT_B
Text HLabel 4900 3350 2    50   Input ~ 0
VOLT_C
Text HLabel 4900 3450 2    50   Input ~ 0
TEMP
Text HLabel 4900 3950 2    50   Input ~ 0
H_A
Text HLabel 4900 4050 2    50   Input ~ 0
H_B
Text HLabel 4900 4150 2    50   Input ~ 0
H_C
Text HLabel 4900 4250 2    50   Input ~ 0
USB_D-
Text HLabel 4900 4350 2    50   Input ~ 0
USB_D+
Text HLabel 4900 6150 2    50   Input ~ 0
L_A
Text HLabel 4900 6250 2    50   Input ~ 0
L_B
Text HLabel 4900 6350 2    50   Input ~ 0
L_C
Text HLabel 3500 4850 0    50   Input ~ 0
CURR_A
Text HLabel 3500 4950 0    50   Input ~ 0
CURR_B
Text HLabel 3500 5050 0    50   Input ~ 0
CURR_C
Text HLabel 3500 5150 0    50   Input ~ 0
VOLT_SUPPLY
Text HLabel 3500 4650 0    50   Input ~ 0
CURR_FILTER_ON
Text HLabel 4900 4450 2    50   Input ~ 0
SWDIO
Text HLabel 4900 4550 2    50   Input ~ 0
SWCLK
Text HLabel 4900 5150 2    50   Input ~ 0
SWO
$Comp
L power:GND #PWR?
U 1 1 600BAF20
P 3500 3350
AR Path="/600BAF20" Ref="#PWR?"  Part="1" 
AR Path="/5FC738A0/600BAF20" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3500 3100 50  0001 C CNN
F 1 "GND" H 3505 3177 50  0000 C CNN
F 2 "" H 3500 3350 50  0001 C CNN
F 3 "" H 3500 3350 50  0001 C CNN
	1    3500 3350
	0    1    1    0   
$EndComp
Text HLabel 3500 3150 0    50   Input ~ 0
NRST
Text HLabel 4900 5350 2    50   Input ~ 0
EN_GATE
Text HLabel 4900 4850 2    50   Input ~ 0
LED_GREEN
Text HLabel 4900 4950 2    50   Input ~ 0
LED_RED
$Comp
L Device:Crystal Y?
U 1 1 600C1F68
P 6100 1500
F 0 "Y?" H 6100 1768 50  0000 C CNN
F 1 "8M" H 6100 1677 50  0000 C CNN
F 2 "" H 6100 1500 50  0001 C CNN
F 3 "~" H 6100 1500 50  0001 C CNN
	1    6100 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600C3307
P 5850 1750
F 0 "C?" H 5942 1796 50  0000 L CNN
F 1 "30p" H 5942 1705 50  0000 L CNN
F 2 "" H 5850 1750 50  0001 C CNN
F 3 "~" H 5850 1750 50  0001 C CNN
	1    5850 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600C391F
P 6350 1750
F 0 "C?" H 6442 1796 50  0000 L CNN
F 1 "30p" H 6442 1705 50  0000 L CNN
F 2 "" H 6350 1750 50  0001 C CNN
F 3 "~" H 6350 1750 50  0001 C CNN
	1    6350 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 600C44B8
P 5850 1850
F 0 "#PWR?" H 5850 1600 50  0001 C CNN
F 1 "GND" H 5855 1677 50  0000 C CNN
F 2 "" H 5850 1850 50  0001 C CNN
F 3 "" H 5850 1850 50  0001 C CNN
	1    5850 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 600C4995
P 6350 1850
F 0 "#PWR?" H 6350 1600 50  0001 C CNN
F 1 "GND" H 6355 1677 50  0000 C CNN
F 2 "" H 6350 1850 50  0001 C CNN
F 3 "" H 6350 1850 50  0001 C CNN
	1    6350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 1500 6350 1500
Wire Wire Line
	6350 1500 6350 1650
Wire Wire Line
	5950 1500 5850 1500
Wire Wire Line
	5850 1500 5850 1650
Text Label 5750 1500 2    50   ~ 0
HSE_IN
Text Label 6450 1500 0    50   ~ 0
HSE_OUT
Wire Wire Line
	5750 1500 5850 1500
Connection ~ 5850 1500
Wire Wire Line
	6350 1500 6450 1500
Connection ~ 6350 1500
$EndSCHEMATC
