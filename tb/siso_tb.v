module siso_tb();
reg clk_tb;
reg en_tb,rst_tb;
reg s_in_tb;
wire s_out_tb;

siso DUT (.clk(clk_tb),.en(en_tb), .rst(rst_tb), .s_in(s_in_tb), .s_out(s_out_tb));

always #1 clk_tb = ~clk_tb;

initial begin

$monitor("Time=%0t, clk_tb=%b, en_tb=%b, rst_tb=%b, s_in_tb=%b, s_out_tb=%b", $time, clk_tb, en_tb, rst_tb, s_in_tb, s_out_tb);

clk_tb=1'b0;
en_tb=1'b0;
rst_tb=1'b1;
s_in_tb=1'b0;

#2 @(negedge clk_tb);
rst_tb=1'b0;
en_tb=1'b1;

s_in_tb=1'b1;

@(negedge clk_tb);
s_in_tb=1'b0;

@(negedge clk_tb);
s_in_tb=1'b1;

@(negedge clk_tb);
s_in_tb=1'b1;

@(negedge clk_tb);
s_in_tb=1'b0;

@(negedge clk_tb);
s_in_tb=1'b1;


#20;
$finish;
end



endmodule
