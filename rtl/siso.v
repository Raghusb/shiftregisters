module siso(input clk, input s_in, input en, rst,output reg s_out);
reg [3:0] temp;

always@(posedge clk)
begin
if(rst)
temp<= 4'b0000;
else if(en) 
begin
temp <= temp>>1'b1;
temp <= {s_in,temp[3:1]};
s_out <= temp[0];
end
end

endmodule
