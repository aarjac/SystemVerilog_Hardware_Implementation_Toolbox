`timescale 1ns/1ps

//addition testbench, test 1bit
//PASSED
module addition_unsigned_testbench();
logic A, B;
logic Sum;
logic Cout;
addition_unsigned #(1)ADD1(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
initial begin
    A = 1'b0; B = 1'b0; #5; //00
    A = 1'b0; B = 1'b1; #5; //01
    A = 1'b1; B = 1'b0; #5; //10
    A = 1'b1; B = 1'b1; #5; //11
end
endmodule

//addition testbench, test 4bit
module addition_unsigned_testbench_4bit();
logic [3:0] A, B;
logic [3:0] Sum;
logic Cout;
addition_unsigned #(4)ADD4(.A(A), .B(B), .Sum(Sum), .Cout(Cout));
initial begin
    //initialize
    repeat (16) begin
        randomize(A); randomize(B);
        #5;
    end
end
endmodule
