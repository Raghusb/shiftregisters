module pipo_tb;
reg clk_tb;
reg rst_tb;
reg en_tb;
reg [3:0] p_in_tb;
wire [3:0] p_out_tb;

pipo DUT (.clk(clk_tb), .rst(rst_tb),.en(en_tb), .p_in(p_in_tb), .p_out(p_out_tb));

initial begin
clk_tb=1'b0;
forever #5 clk_tb=~clk_tb;
end

initial begin
$monitor("Values of clk=%0t|rst=%0b|p_in=%0b|p_out=%0b", $time, rst_tb, p_in_tb, p_out_tb);
rst_tb=1'b1;
en_tb=1'b0;
 
 repeat(2)
@(negedge clk_tb);

rst_tb=1'b0;

@(negedge clk_tb);
en_tb=1'b1;
p_in_tb=4'b1100;

@(negedge clk_tb);
en_tb=1'b1;
p_in_tb=4'b1010;

@(negedge clk_tb);
en_tb=1'b1;
p_in_tb=4'b1001;

$finish;
end
endmodule
