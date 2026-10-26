module sipo(input clk, rst,en, input s_in, output reg [3:0] p_out);

reg[3:0] temp;

always@(posedge clk)
begin
if(rst)
temp <= 4'b0000;
else if(!en) begin 
temp <= temp >>1'b1;
temp[3] <= s_in;
end
else if(en)
p_out <= temp;
end

endmodule
