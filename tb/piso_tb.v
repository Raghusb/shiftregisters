module piso_tb;
 reg clk_tb;
 reg rst_tb;
 reg load_tb;
 reg [3:0] p_in_tb;
 wire s_out_tb;
 
 piso DUT (.clk(clk_tb),.rst(rst_tb), .load(load_tb), .p_in(p_in_tb),.s_out(s_out_tb));
 
 initial begin
 clk_tb=1'b0;
 forever #5 clk_tb=~clk_tb;
 end
 
 initial begin
 $monitor("Time=%0t|rst_tb=%b|p_in_tb=%b|s_out_tb=%b", $time, rst_tb, p_in_tb, s_out_tb);
 rst_tb=1'b1;
 load_tb=1'b0;
 
 repeat(2) begin
 @(negedge clk_tb);
 rst_tb=1'b0;
 end
 
 @(negedge clk_tb);
 load_tb=1'b1;
 p_in_tb=4'b1011;
 
 
 @(negedge clk_tb);
 load_tb=1'b0;
 
 repeat(4)@(negedge clk_tb);
 $finish;

end
