
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:062	
567.0312	
183.859Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/USER/Documents/Leor Brenner/Final_Project/verilog_full_cipher_vivado/verilog_full_cipher_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top_encrypt_decrypt.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/USER/Documents/Leor Brenner/Final_Project/verilog_full_cipher_vivado/verilog_full_cipher_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top_encrypt_decrypt.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
{
Command: %s
53*	vivadotcl2J
Hsynth_design -top simon_cipher_top_encrypt_decrypt -part xc7a35tcpg236-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7a35tZ17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7a35tZ17-349h px� 
D
Loading part %s157*device2
xc7a35tcpg236-1Z21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
52540Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1401.203 ; gain = 440.289
h px� 
�
synthesizing module '%s'%s4497*oasys2"
 simon_cipher_top_encrypt_decrypt2
 2m
iC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/simon_cipher_top_encrypt_decrypt.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

get_data2
 2U
QC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/get_data.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

uart_rxd2
 2]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/uart_rxd_combine.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

uart_rxd2
 2
02
12]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/uart_rxd_combine.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

get_data2
 2
02
12U
QC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/get_data.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	send_data2
 2V
RC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/send_data.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

uart_txd2
 2]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/uart_txd_combine.v2
38@Z8-6157h px� 
�
default block is never used226*oasys2]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/uart_txd_combine.v2
598@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

uart_txd2
 2
02
12]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/uart_txd_combine.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	send_data2
 2
02
12V
RC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/send_data.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
simon_cipher_hierarchy_encrypt2
 2k
gC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/Simon_Cipher_Hierarchy_Encrypt.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
key_schedule_generator2
 2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
38@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
sub_key_generator2
 2^
ZC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/sub_key_generator.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
sub_key_generator2
 2
02
12^
ZC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/sub_key_generator.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
key_schedule_generator2
 2
02
12c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
round2
 2R
NC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/round.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
round2
 2
02
12R
NC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/round.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
simon_cipher_hierarchy_encrypt2
 2
02
12k
gC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/Simon_Cipher_Hierarchy_Encrypt.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2 
simon_cipher_hierarchy_decrypt2
 2k
gC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/Simon_Cipher_Hierarchy_Decrypt.v2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2 
simon_cipher_hierarchy_decrypt2
 2
02
12k
gC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/Simon_Cipher_Hierarchy_Decrypt.v2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
seven_segment2
 2Z
VC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/seven_segment.v2
38@Z8-6157h px� 
�
default block is never used226*oasys2Z
VC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/seven_segment.v2
188@Z8-226h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
seven_segment2
 2
02
12Z
VC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/seven_segment.v2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2"
 simon_cipher_top_encrypt_decrypt2
 2
02
12m
iC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/simon_cipher_top_encrypt_decrypt.v2
38@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_0_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
878@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_1_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
888@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_2_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
898@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_3_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
908@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_4_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
918@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_5_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
928@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_6_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
938@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_7_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
948@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_8_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
958@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_9_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
968@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_10_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
978@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_11_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
988@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_12_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
998@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_13_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1008@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_14_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1018@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_15_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1028@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_16_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1038@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_17_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1048@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_18_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1058@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_19_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1068@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_20_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1078@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_21_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1088@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_22_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1098@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_23_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1108@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_24_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1118@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_25_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1128@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_26_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1138@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_27_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1148@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_28_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1158@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_29_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1168@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
key_schdl_30_reg2c
_C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/key_schedule_generator.v2
1178@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
load_plntxt_internal_reg2m
iC:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/simon_cipher_top_encrypt_decrypt.v2
698@Z8-6014h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[31]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[30]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[29]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[28]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[27]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[26]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[25]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[24]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[23]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[22]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[21]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[20]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[19]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[18]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[17]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[16]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[15]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[14]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[13]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[12]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[11]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[10]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[9]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[8]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[7]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[6]2
sub_key_generatorZ8-7129h px� 
�
9Port %s in module %s is either unconnected or has no load4866*oasys2
z_counter[5]2
sub_key_generatorZ8-7129h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1520.000 ; gain = 559.086
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1520.000 ; gain = 559.086
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:09 ; elapsed = 00:00:09 . Memory (MB): peak = 1520.000 ; gain = 559.086
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.2362

1520.0002
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2_
[C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/full_cipher_uart.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2_
[C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/full_cipher_uart.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2]
[C:/Users/USER/Documents/Leor Brenner/Final_Project/Verilog Full Cipher/full_cipher_uart.xdc24
2.Xil/simon_cipher_top_encrypt_decrypt_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0022

1582.0272
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0512

1582.0272
0.000Z17-268h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7a35tcpg236-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:21 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
my_rxd_state_machine_reg2

uart_rxdZ8-802h px� 
{
3inferred FSM for state register '%s' in module '%s'802*oasys2
my_txd_state_machine_reg2

uart_txdZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                              000 |                              000
h p
x
� 
y
%s
*synth2a
_                   START |                              001 |                              001
h p
x
� 
y
%s
*synth2a
_                 RECEIVE |                              010 |                              010
h p
x
� 
y
%s
*synth2a
_               FINISH_RX |                              011 |                              011
h p
x
� 
y
%s
*synth2a
_                  RDY_TX |                              100 |                              100
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
my_rxd_state_machine_reg2

sequential2

uart_rxdZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    IDLE |                             0001 |                               00
h p
x
� 
y
%s
*synth2a
_                   START |                             0010 |                               01
h p
x
� 
y
%s
*synth2a
_                TRANSMIT |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_                  FINISH |                             1000 |                               11
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
my_txd_state_machine_reg2	
one-hot2

uart_txdZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:22 ; elapsed = 00:00:22 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     16 Bit         XORs := 56    
h p
x
� 
H
%s
*synth20
.	   5 Input     16 Bit         XORs := 56    
h p
x
� 
H
%s
*synth20
.	   4 Input     16 Bit         XORs := 64    
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	              104 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               64 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 20    
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 436   
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 26    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input  104 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   5 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   11 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   5 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 25    
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 5     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
p
%s
*synth2X
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:29 ; elapsed = 00:00:29 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:00:36 ; elapsed = 00:00:37 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:00:46 ; elapsed = 00:00:47 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:00:51 ; elapsed = 00:00:52 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:51 ; elapsed = 00:00:52 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:52 ; elapsed = 00:00:52 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:52 ; elapsed = 00:00:52 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:52 ; elapsed = 00:00:53 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:52 ; elapsed = 00:00:53 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|      |Cell   |Count |
h px� 
2
%s*synth2
+------+-------+------+
h px� 
2
%s*synth2
|1     |BUFG   |     1|
h px� 
2
%s*synth2
|2     |CARRY4 |    64|
h px� 
2
%s*synth2
|3     |LUT1   |     7|
h px� 
2
%s*synth2
|4     |LUT2   |   580|
h px� 
2
%s*synth2
|5     |LUT3   |   493|
h px� 
2
%s*synth2
|6     |LUT4   |    33|
h px� 
2
%s*synth2
|7     |LUT5   |  1113|
h px� 
2
%s*synth2
|8     |LUT6   |   103|
h px� 
2
%s*synth2
|9     |FDRE   |  6081|
h px� 
2
%s*synth2
|10    |FDSE   |     1|
h px� 
2
%s*synth2
|11    |IBUF   |     3|
h px� 
2
%s*synth2
|12    |OBUF   |    12|
h px� 
2
%s*synth2
+------+-------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:52 ; elapsed = 00:00:53 . Memory (MB): peak = 1582.027 ; gain = 621.113
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 1 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:39 ; elapsed = 00:00:49 . Memory (MB): peak = 1582.027 ; gain = 559.086
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:52 ; elapsed = 00:00:53 . Memory (MB): peak = 1582.027 ; gain = 621.113
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.1022

1582.0272
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
64Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1582.0272
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

401dc734Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
492
602
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:572

00:01:002

1582.0272

1011.023Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0042

1582.0272
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�C:/Users/USER/Documents/Leor Brenner/Final_Project/verilog_full_cipher_vivado/verilog_full_cipher_vivado.runs/synth_1/simon_cipher_top_encrypt_decrypt.dcpZ17-1381h px� 
�
%s4*runtcl2�
�Executing : report_utilization -file simon_cipher_top_encrypt_decrypt_utilization_synth.rpt -pb simon_cipher_top_encrypt_decrypt_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Sep 24 04:55:52 2024Z17-206h px� 


End Record