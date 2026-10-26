module piso(input clk, rst,input [3:0] p_in,input load, output reg s_out

    );
    reg[3:0] temp;
    
    always@(posedge clk)
    begin
    if(rst)begin
    temp <= 4'b0000;
    s_out <= 1'b0;
    end else if(load) begin
    temp <= p_in;
    s_out <= 1'b0;
    end else begin
    s_out <= temp[0];
    temp  <= {1'b0, temp[3:1]};
    end
    end
endmodule
