`default_nettype none

module round (
    input wire clk, rst,
    input wire [15:0] subkey, u_plntxt, l_plntxt,
    output reg [15:0] u_cphrtxt, l_cphrtxt
);

always @ (posedge(clk))
begin
    if (rst)
    begin
        u_cphrtxt <= 16'b0;
        l_cphrtxt <= 16'b0;
    end
    else
    begin
        l_cphrtxt <= u_plntxt;                               
        u_cphrtxt <= ({u_plntxt[14:0] , u_plntxt[15]} & {u_plntxt[7:0] , u_plntxt[15:8]}) ^ {u_plntxt[13:0] , u_plntxt[15:14]} ^ l_plntxt ^ subkey;
    end
end



endmodule