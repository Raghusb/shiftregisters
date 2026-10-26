module sipo_tb();

reg clk_tb;
reg rst_in, en_tb;
reg s_in_tb;
wire [3:0] p_out_tb;

sipo DUT (.clk(clk_tb), .rst(rst_in), .en(en_tb), .s_in(s_in_tb), .p_out(p_out_tb) );

always #1 clk_tb=~clk_tb;

initial begin
$monitor("Time=%0t, clk_tb=%0b, rst_in=%0b, en_tb=%0b, s_in_tb=%0b, p_out_tb=%0b", $time, clk_tb, rst_in, en_tb, s_in_tb, p_out_tb);

clk_tb='b0;
rst_in='b1;
en_tb='b0;
s_in_tb='b0;

@(negedge clk_tb);

rst_in=1'b0;

s_in_tb=1'b1;

@(negedge clk_tb);
s_in_tb=1'b0;

@(negedge clk_tb);
s_in_tb=1'b1;

@(negedge clk_tb);
s_in_tb=1'b0;

@(negedge clk_tb);
 s_in_tb=1'b1;
 en_tb='b1;
 
 
 @(negedge clk_tb);
 s_in_tb=1'b0;

 $finish;
 
 end


endmodule
