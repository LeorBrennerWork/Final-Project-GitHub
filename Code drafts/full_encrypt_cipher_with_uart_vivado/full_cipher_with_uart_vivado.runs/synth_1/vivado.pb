
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:062

00:00:072	
565.6802	
180.355Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/USER/Documents/Leor Brenner/Final_Project/full_cipher_with_uart_vivado/full_cipher_with_uart_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/USER/Documents/Leor Brenner/Final_Project/full_cipher_with_uart_vivado/full_cipher_with_uart_vivado.srcs/utils_1/imports/synth_1/simon_cipher_top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
k
Command: %s
53*	vivadotcl2:
8synth_design -top simon_cipher_top -part xc7a35tcpg236-1Z4-113h px� 
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
10316Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1400.727 ; gain = 441.062
h px� 
�
synthesizing module '%s'638*oasys2
simon_cipher_top2a
]C:/Users/USER/Documents/Leor Brenner/Final_Project/Full Cipher with UART/simon_cipher_top.vhd2
188@Z8-638h px� 
�
array index %s out of range7663*oasys2
962a
]C:/Users/USER/Documents/Leor Brenner/Final_Project/Full Cipher with UART/simon_cipher_top.vhd2
1588@Z8-11324h px� 
�
failed synthesizing module '%s'285*oasys2
simon_cipher_top2a
]C:/Users/USER/Documents/Leor Brenner/Final_Project/Full Cipher with UART/simon_cipher_top.vhd2
188@Z8-285h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 1508.488 ; gain = 548.824
h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
112
02
02
3Z4-41h px� 
<

%s failed
30*	vivadotcl2
synth_designZ4-43h px� 
|
Command failed: %s
69*common2G
ESynthesis failed - please see the console or run log file for detailsZ17-69h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Jun 25 21:28:29 2024Z17-206h px� 


End Record