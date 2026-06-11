//Module Template 
/*
Description: 
Features: 
*/

//Multiplexer (MUX)
//Multiplexer (MUX) 4:1 
/*
Description: 4 to 1 multiplexer
Features:
parameterized bits
4 inputs 1 output 
*/
module MUX4to1 #(parameter bits = 1)(input [(bits-1):0] A, B, C, D, input [1:0] select, input enable, reset, 
    output logic [(bits-1):0] Y);
always_comb begin
    Y = A;
    case (select)
        2'b00 : Y = A;
        2'b01 : Y = B; 
        2'b10 : Y = C;
        2'b11 : Y = D;
        default : Y = A; 
    endcase
end
endmodule


//FLIPFLOPS
//D flipflop 
/*
Description: 
Features: 
paramaterized bit
snchoronous clk signal
asynchronous reset
positive edge triggered
*/
module D_flipflop #(parameter bits = 1)(input [(bits-1):0] D, clk, reset, output logic [(bits-1):0] Q, Qn);
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        Q <= {bits{1'b0}};
    else
        Q <= D;
end
assign Qn = ~Q;
endmodule
