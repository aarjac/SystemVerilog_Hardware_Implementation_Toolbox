//Module Template 
/*
Description: 
Features: 
*/

//Arithmetic operations (optimized)
//Addition unsigned
/*
Description: adds two inputs A+B 
Features: 
parameterized bits
Sum
Cout
*/
module addition_unsigned #(parameter bits = 4)(input [(bits-1):0] A, B, 
output logic [(bits-1):0] Sum, output logic Cout);
assign {Cout, Sum} = A + B;
endmodule

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
Description: Paramerterized D flipflop. To be used as N bit D register to store data.
Features: 

paramaterized bit
snchoronous clk signal
asynchronous reset
positive edge triggered
*/
module D_flipflop #(parameter bits = 1)(input [(bits-1):0] D, input clk, reset, 
output logic [(bits-1):0] Q, Qn);
always_ff @(posedge clk or posedge reset) begin
    if (reset)
        Q <= {bits{1'b0}};
    else
        Q <= D;
end
assign Qn = ~Q;
endmodule

//Conversion of ASCII values to 7-Segment Display
/*
Description: Takes ASCII value input, converts it, and displays in on 7-segment display

Features: 

Specifically for DE10-Lite FPGA board. Each segment of display is active low.
*/

module ASCII27Seg(input [7:0] AsciiCode, output logic [6:0] HexSeg);
    always_comb begin 
        HexSeg = 7'd0;  //initialization of variable HexSeg, turn all segments ON
        case(AsciiCode)
            //uppercase and lowercase letters
            //A
            8'h41 : HexSeg[3] = 1'b1;
            //a
            8'h61 : HexSeg[3] = 1'b1;
            //B
            8'h42 : begin 
                HexSeg[0] = 1'b1; HexSeg[1] = 1'b1;
            end
            //b
            8'h62 : begin 
                HexSeg[0] = 1'b1; HexSeg[1] = 1'b1;
            end
            //C
            8'h43 : begin
                HexSeg[1] = 1'b1; HexSeg[2] = 1'b1; HexSeg[6] = 1'b1;
            end
            //c
            8'h63 : begin
                HexSeg[1] = 1'b1; HexSeg[2] = 1'b1; HexSeg[6] = 1'b1;
            end
            //D
            8'h44 : begin
                HexSeg [0] = 1'b1; HexSeg[5] = 1'b1;
            end
            //d
            8'h64 : begin
                HexSeg [0] = 1'b1; HexSeg[5] = 1'b1;
            end
            //E
            8'h45 : begin
                HexSeg [1] = 1'b1; HexSeg[2] = 1'b1;
            end
            //e
            8'h65 : begin
                HexSeg [1] = 1'b1; HexSeg[2] = 1'b1;
            end
            //F
            8'h46 : begin
                HexSeg [1] = 1'b1; HexSeg[2] = 1'b1; HexSeg[3] = 1'b1;
            end
            //f
            8'h66 : begin
                HexSeg [1] = 1'b1; HexSeg[2] = 1'b1; HexSeg[3] = 1'b1;
            end
            //G
            8'h47 : begin
                HexSeg [4] = 1'b1;
            end
            //g
            8'h67 : begin
                HexSeg [4] = 1'b1;
            end
            //H
            8'h48 : begin
                HexSeg [0] = 1'b1; HexSeg [3]= 1'b1;
            end
            //h
            8'h68 : begin
                HexSeg [0] = 1'b1; HexSeg [3]= 1'b1;
            end
            //I
            8'h49 : begin
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [3] = 1'b1; HexSeg [6] = 1'b1;
            end
            //i
            8'h69 : begin
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [3] = 1'b1; HexSeg [6] = 1'b1;
            end
            //J
            8'h4A : begin
                HexSeg [0] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //j
            8'h6A : begin
                HexSeg [0] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //K
            8'h4B : begin
                HexSeg [0] = 1'b1; HexSeg [3]= 1'b1;
            end
            //k
            8'h6B : begin
                HexSeg [0] = 1'b1; HexSeg [3]= 1'b1;
            end
            //L
            8'h4C : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [6] = 1'b1;
            end
            //l
            8'h6C : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [6] = 1'b1;
            end
            //M
            8'h4D: begin 
                HexSeg [1] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //m
            8'h6D: begin 
                HexSeg [1] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //N
            8'h4E: begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1;
            end
            //n
            8'h6E: begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1;
            end
            //O
            8'h4F : begin 
                HexSeg [6] = 1'b1;
            end
            //o
            8'h6F : begin 
                HexSeg [6] = 1'b1;
            end
            //P
            8'h50 : begin 
                HexSeg [2] = 1'b1; HexSeg [3] = 1'b1;
            end
                //p
            8'h70 : begin 
                HexSeg [2] = 1'b1; HexSeg [3] = 1'b1;
            end
            //Q
            8'h51 : begin
                HexSeg [3] = 1'b1; HexSeg [4] = 1'b1;
            end
            //q
            8'h71 : begin
                HexSeg [3] = 1'b1; HexSeg [4] = 1'b1;
            end
            //R
            8'h52 : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1;
            end
            //r
            8'h72 : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1; HexSeg [3] = 1'b1; HexSeg [5] = 1'b1;
            end
            //S
            8'h53 : begin
                HexSeg [1] = 1'b1; HexSeg [4] = 1'b1;
            end
            //s
            8'h73 : begin
                HexSeg [1] = 1'b1; HexSeg [4] = 1'b1;
            end
            //T
            8'h54 : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1;
            end
            //t
            8'h74 : begin 
                HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [2] = 1'b1;
            end
            //U
            8'h55 : begin 
                HexSeg [0] = 1'b1; HexSeg [6] = 1'b1;
            end
            //u
            8'h75 : begin 
                HexSeg [0] = 1'b1; HexSeg [6] = 1'b1;
            end
            //V
            8'h56 : begin 
            HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end 
            //V
            8'h76 : begin 
            HexSeg [0] = 1'b1; HexSeg [1] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end 
            //W
            8'h57 : begin 
                HexSeg [0] = 1'b1; HexSeg [2] = 1'b1; HexSeg [4] = 1'b1; HexSeg [6] = 1'b1;
            end
            //w
            8'h77 : begin 
                HexSeg [0] = 1'b1; HexSeg [2] = 1'b1; HexSeg [4] = 1'b1; HexSeg [6] = 1'b1;
            end
            //X
            8'h58 : begin 
                HexSeg [0] = 1'b1; HexSeg [3]= 1'b1;
            end
            //x
            8'h78 : begin 
                HexSeg [0] = 1'b1; HexSeg [3]= 1;
            end
            //Y
            8'h59 : begin 
                HexSeg [0] = 1'b1; HexSeg [4]= 1'b1;
            end
            //y
            8'h79 : begin 
                HexSeg [0] = 1'b1; HexSeg [4]= 1'b1;
            end
            //Z
            8'h5A : begin 
                HexSeg [2] = 1'b1; HexSeg [5]= 1'b1;
            end
            //z
            8'h7A : begin 
                HexSeg [2] = 1'b1; HexSeg [5]= 1'b1;
            end
            //numbers 0-9
            //0
            8'h30 : begin 
                HexSeg [6] = 1'b1;
            end
            //1
            8'h31 : begin 
                HexSeg [0] = 1'b1; HexSeg [3] = 1'b1; HexSeg [4] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //2
            8'h32 : begin 
                HexSeg [2] = 1'b1; HexSeg [5] = 1'b1;
            end
            //3
            8'h33 : begin 
                HexSeg [4] = 1'b1; HexSeg [5] = 1'b1;
            end
            //4
            8'h34 : begin 
                HexSeg [0] = 1'b1; HexSeg [3] = 1'b1; HexSeg [4] = 1'b1;
            end
            //5
            8'h35 : begin 
                HexSeg [1] = 1'b1; HexSeg [4] = 1'b1;
            end    
            //6
            8'h36 : begin 
                HexSeg [1] = 1'b1;
            end
            //7
            8'h37 : begin 
                HexSeg [3] = 1'b1; HexSeg [4] = 1'b1; HexSeg [5] = 1'b1; HexSeg [6] = 1'b1;
            end
            //8
            8'h38 : begin 
                //all segments ON
            end
            //9
            8'h39 : begin 
                HexSeg [4] = 1'b1;
            end
            default : HexSeg = 8'b11111111;  //defualt of variable HexSeg, all segments OFF
        endcase
    end 
endmodule