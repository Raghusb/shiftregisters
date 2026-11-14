module universalshiftregisters(input en,clk,rst,input [1:0]mode,input s_in_left,s_in_right,input[3:0] p_in,
output  s_out,output [3:0] p_out
    );
    reg [3:0] temp;
    always@(posedge clk)
    begin
    if(rst)
    temp <= 4'b0000;
    else if(en) begin
    case(mode)
    2'b00: temp<=temp;
    2'b01: temp <= {s_in_right,temp[3:1]};
    2'b10: temp <= {temp[2:0],s_in_left};
    2'b11: temp <= p_in;
    default:temp <= temp;
                   endcase
                   end
                   end
                   
     assign p_out = p_in;
     assign s_out = (mode==2'b10)?temp[3]:temp[0];
        
          
    
endmodule
