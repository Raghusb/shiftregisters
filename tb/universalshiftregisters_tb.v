module universalshiftregisters_tb;
reg en_tb,clk_tb,rst_tb;
reg [1:0] mode_tb;
reg sleft,sright;
reg [3:0] pin_tb;
wire sout_tb;
wire [3:0] pout_tb;


universalshiftregisters  DUT(.en(en_tb),.clk(clk_tb),.rst(rst_tb),.mode(mode_tb),.s_in_left(sleft),.s_in_right(sright),.p_in(pin_tb),.s_out(sout_tb),.p_out(pout_tb));

initial begin
clk_tb=1'b0;
forever #5 clk_tb=~clk_tb;
end

initial begin
$monitor("Time=%0t| clk=%b|enable=%b|Mode=%0b|sleft=%b|sright=%b|pin=%b|sout=%b|pout=%b",$time,clk_tb,en_tb,mode_tb,sleft,sright,pin_tb,sout_tb,pout_tb);
en_tb=1'b0;
rst_tb=1'b1;
//sleft=1'b0;
pin_tb=4'b0000;
mode_tb=2'b00;

@(negedge clk_tb);
rst_tb=1'b0;
en_tb=1'b1;
mode_tb=2'b00;


@(negedge clk_tb);
mode_tb=2'b01;
sright=1'b1;


@(negedge clk_tb);
sright=1'b0;

@(negedge clk_tb);
sright= 1'b1;


@(negedge clk_tb);
sright = 1'b0;

@(negedge clk_tb);
sright =1'b1;


@(negedge clk_tb);
mode_tb=2'b00;

@(negedge clk_tb);
mode_tb=2'b10;
sleft=1'b0;

@(negedge clk_tb);
sleft =1'b1;

@(negedge clk_tb);
sleft =1'b1;

@(negedge clk_tb);
sleft =1'b0;

@(negedge clk_tb);
sleft=1'b1;


@(negedge clk_tb);
mode_tb=2'b00;


@(negedge clk_tb);
mode_tb=2'b11;

pin_tb=4'b1100;


@(negedge clk_tb);
pin_tb=4'b1111;

$finish;
end

endmodule
