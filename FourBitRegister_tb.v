`timescale 1ns / 1ps

module FourBitRegister_tb;
    reg [3:0] D;
    reg [1:0] S;
    reg clk;
    reg reset;
    wire [3:0] Q;

    FourBitRegister uut (
        .D(D),
        .S(S),
        .clk(clk),
        .reset(reset),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        D = 4'b0000;
        S = 2'b00;
        reset = 1;

        @(posedge clk) reset = 0;

        @(posedge clk) begin
            S = 2'b00;
            D = 4'b1010;
        end

        @(posedge clk) begin
            S = 2'b01;
        end

        @(posedge clk) begin
            S = 2'b10;
        end

        @(posedge clk) begin
            S = 2'b11;
        end

        @(posedge clk) begin
            reset = 1;
        end
        @(posedge clk) reset = 0;

        @(posedge clk) begin
            S = 2'b00;
            D = 4'b1111;
        end

        @(posedge clk) begin
            S = 2'b10;
            D = 4'b1100;
        end

        @(posedge clk) begin
            S = 2'b11;
            D = 4'b0011;
        end

        #20 $finish;
    end

    initial begin
        $monitor("Time = %0t | S = %b | D = %b | Q = %b | reset = %b", $time, S, D, Q, reset);
    end

    initial begin
        $dumpfile("FourBit.vcd");
        $dumpvars(0, FourBitRegister_tb);
    end
endmodule
