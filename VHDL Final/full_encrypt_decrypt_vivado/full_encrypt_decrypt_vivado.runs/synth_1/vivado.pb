
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:042

00:00:062	
565.4182	
181.551Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt_vivado/full_encrypt_decrypt_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top_encrypt_decrypt.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt_vivado/full_encrypt_decrypt_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top_encrypt_decrypt.dcpZ12-5825h px� 
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
36588Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:03 ; elapsed = 00:00:04 . Memory (MB): peak = 1401.020 ; gain = 439.914
h px� 
�
synthesizing module '%s'638*oasys2"
 simon_cipher_top_encrypt_decrypt2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
168@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

get_data2V
TC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/get_data.vhd2
52
full_rxd_do2

get_data2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
2178@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

get_data2X
TC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/get_data.vhd2
168@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

uart_rxd2^
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_rxd_combine.vhd2
52
rxd_do2

uart_rxd2X
TC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/get_data.vhd2
968@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

uart_rxd2`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_rxd_combine.vhd2
148@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

uart_rxd2
02
12`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_rxd_combine.vhd2
148@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

get_data2
02
12X
TC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/get_data.vhd2
168@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	send_data2W
UC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/send_data.vhd2
62
full_txd_do2
	send_data2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
2248@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	send_data2Y
UC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/send_data.vhd2
178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
uart_txd_combine2^
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_txd_combine.vhd2
62
txd_do2
uart_txd_combine2Y
UC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/send_data.vhd2
968@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
uart_txd_combine2`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_txd_combine.vhd2
168@Z8-638h px� 
�
default block is never used226*oasys2`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_txd_combine.vhd2
598@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
uart_txd_combine2
02
12`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/uart_txd_combine.vhd2
168@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	send_data2
02
12Y
UC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/send_data.vhd2
178@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
simon_cipher_hierarchy_encrypt2l
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
82	
encrypt2 
simon_cipher_hierarchy_encrypt2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
2318@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
simon_cipher_hierarchy_encrypt2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
238@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
key_schedule_generator2d
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
72
key_schedule_create2
key_schedule_generator2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
1628@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
key_schedule_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_42
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
768@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
sub_key_generator2a
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
198@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
sub_key_generator2
02
12a
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
198@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_52
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_62
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
958@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_72
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1048@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_82
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1138@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_92
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1228@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_102
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1318@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_112
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1408@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_122
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1498@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_132
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1588@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_142
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1678@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_152
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1768@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_162
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1858@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_172
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
1948@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_182
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2038@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_192
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2128@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_202
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2218@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_212
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2308@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_222
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2398@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_232
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2488@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_242
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2578@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_252
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2668@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_262
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2758@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_272
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2848@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_282
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
2938@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_292
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
3028@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_302
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
3118@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sub_key_generator2_
]C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/sub_key_generator.vhd2
62
sub_key_generator_312
sub_key_generator2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
3208@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
key_schedule_generator2
02
12f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
178@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_12
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
1698@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
round2U
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
198@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
round2
02
12U
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
198@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_22
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
1788@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_32
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
1878@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_42
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
1968@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_52
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2058@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_62
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2148@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_72
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2238@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_82
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2328@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_92
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2418@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_102
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2508@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_112
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2598@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_122
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2688@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_132
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2778@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_142
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_152
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
2958@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_162
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3048@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_172
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3138@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_182
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3228@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_192
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3318@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_202
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3408@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_212
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3498@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_222
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3588@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_232
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3678@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_242
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3768@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_252
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3858@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_262
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
3948@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_272
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4038@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_282
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4128@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_292
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4218@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_302
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4308@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_312
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4398@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_322
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
4488@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
simon_cipher_hierarchy_encrypt2
02
12n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Encrypt.vhd2
238@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2 
simon_cipher_hierarchy_decrypt2l
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
82	
decrypt2 
simon_cipher_hierarchy_decrypt2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
2428@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2 
simon_cipher_hierarchy_decrypt2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
238@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
key_schedule_generator2d
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
72
key_schedule_create2
key_schedule_generator2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
1628@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_12
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
1698@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_22
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
1788@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_32
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
1878@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_42
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
1968@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_52
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2058@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_62
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2148@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_72
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2238@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_82
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2328@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62	
round_92
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2418@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_102
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2508@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_112
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2598@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_122
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2688@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_132
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2778@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_142
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2868@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_152
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
2958@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_162
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3048@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_172
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3138@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_182
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3228@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_192
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3318@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_202
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3408@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_212
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3498@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_222
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3588@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_232
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3678@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_242
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3768@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_252
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3858@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_262
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
3948@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_272
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4038@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_282
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4128@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_292
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4218@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_302
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4308@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_312
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4398@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
round2S
QC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/round.vhd2
62

round_322
round2n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
4488@Z8-3491h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Synth 8-34912
100Z17-14h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
simon_cipher_hierarchy_decrypt2
02
12n
jC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/Simon_Cipher_Hierarchy_Decrypt.vhd2
238@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
seven_segment2]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/seven_segment.vhd2
158@Z8-638h px� 
�
default block is never used226*oasys2]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/seven_segment.vhd2
308@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
seven_segment2
02
12]
YC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/seven_segment.vhd2
158@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2"
 simon_cipher_top_encrypt_decrypt2
02
12p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
168@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[0]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[1]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[2]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[3]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[4]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[5]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[6]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[7]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[8]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[9]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[10]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[11]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[12]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[13]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[14]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[15]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[16]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[17]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[18]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[19]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[20]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[21]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[22]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[23]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[24]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[25]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[26]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[27]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[28]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[29]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
KEY_SCHDL_reg[30]2f
bC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/key_schedule_generator.vhd2
708@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
load_plntxt_internal_reg2p
lC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/simon_cipher_top_encrypt_decrypt.vhd2
1428@Z8-6014h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1519.793 ; gain = 558.688
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1519.793 ; gain = 558.688
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 1519.793 ; gain = 558.688
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
00:00:00.1402

1519.7932
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
179*designutils2`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/full_cipher_uart.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2`
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/full_cipher_uart.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2^
\C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/full_cipher_uart.xdc24
2.Xil/simon_cipher_top_encrypt_decrypt_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

1621.6882
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
00:00:00.0292

1621.6882
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
Finished Constraint Validation : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:12 ; elapsed = 00:00:13 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�
3inferred FSM for state register '%s' in module '%s'802*oasys2
my_txd_state_machine_reg2
uart_txd_combineZ8-802h px� 
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
_                    idle |                              000 |                              000
h p
x
� 
y
%s
*synth2a
_                   start |                              001 |                              001
h p
x
� 
y
%s
*synth2a
_                 receive |                              010 |                              010
h p
x
� 
y
%s
*synth2a
_               finish_rx |                              011 |                              011
h p
x
� 
y
%s
*synth2a
_                  rdy_tx |                              100 |                              100
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
_                    idle |                             0001 |                               00
h p
x
� 
y
%s
*synth2a
_                   start |                             0010 |                               01
h p
x
� 
y
%s
*synth2a
_                transmit |                             0100 |                               10
h p
x
� 
y
%s
*synth2a
_                  finish |                             1000 |                               11
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
one-hot2
uart_txd_combineZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
,	   2 Input   32 Bit       Adders := 1     
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
,	   2 Input    8 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 3     
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
.	              104 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               64 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 7     
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
.	                8 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 3     
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
,	   2 Input   32 Bit        Muxes := 1     
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
,	   2 Input    4 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   4 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 28    
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
�
RFound unconnected internal register '%s' and it is trimmed from '%s' to '%s' bits.3455*oasys2
full_rxd_do/data_reg2
1042
972X
TC:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt/get_data.vhd2
928@Z8-3936h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:16 ; elapsed = 00:00:18 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:20 ; elapsed = 00:00:22 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
}Finished Timing Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
|Finished Technology Mapping : Time (s): cpu = 00:00:23 ; elapsed = 00:00:25 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
vFinished IO Insertion : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:27 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
|2     |CARRY4 |    27|
h px� 
2
%s*synth2
|3     |LUT1   |     7|
h px� 
2
%s*synth2
|4     |LUT2   |   937|
h px� 
2
%s*synth2
|5     |LUT3   |   940|
h px� 
2
%s*synth2
|6     |LUT4   |    33|
h px� 
2
%s*synth2
|7     |LUT5   |  1050|
h px� 
2
%s*synth2
|8     |LUT6   |   107|
h px� 
2
%s*synth2
|9     |FDRE   |  7535|
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:20 ; elapsed = 00:00:27 . Memory (MB): peak = 1621.688 ; gain = 558.688
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:28 ; elapsed = 00:00:29 . Memory (MB): peak = 1621.688 ; gain = 660.582
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
00:00:00.1102

1621.6882
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
27Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
1Z29-28h px� 
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

1621.6882
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

9d45e0f7Z4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1502
342
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

00:00:332

00:00:352

1621.6882

1053.320Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0082

1621.6882
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2�
�C:/Users/USER/Documents/Leor Brenner/Final_Project/full_encrypt_decrypt_vivado/full_encrypt_decrypt_vivado.runs/synth_1/simon_cipher_top_encrypt_decrypt.dcpZ17-1381h px� 
�
%s4*runtcl2�
�Executing : report_utilization -file simon_cipher_top_encrypt_decrypt_utilization_synth.rpt -pb simon_cipher_top_encrypt_decrypt_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Sun Oct  6 23:28:50 2024Z17-206h px� 


End Record