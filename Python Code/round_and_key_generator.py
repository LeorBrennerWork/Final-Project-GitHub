for i in range(0,32):
   print("round round_%d (\n    .clk(clk),\n    .rst(rst),\n    .subkey(key_schedule[%d]),\n    .u_plntxt(upper_plaintext[%d]),\n    .l_plntxt(lower_plaintext[%d]),\n    .u_cphrtxt(upper_ciphertext[%d]),\n    .l_cphrtxt(lower_ciphertext[%d])\n);" %(i+1,31-i,i-1,i-1,i,i))

# for i in range(0,28):
#     print("sub_key_generator subkey_%d (\n    .clk(clk),\n    .rst(rst),\n    .z_counter(%d),\n    .subkey_i_1(c_key_schedule_in[%d]),\n    .subkey_i_m(c_key_schedule_in[%d]),\n    .subkey_i_3(c_key_schedule_in[%d]),\n    .subkey_i(c_key_schedule_out[%d])\n);" %(i+4,i,i+3,i,i+1,i+4))
