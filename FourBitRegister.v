module FourBitRegister (
    input wire [3:0] D,
    input wire [1:0] S,
    input wire clk,
    input wire reset,
    output reg [3:0] Q
);
    reg [3:0] next_state;

    always @(*) begin
        case (S)
            2'b00: next_state = D;
            2'b01: next_state = ~Q;
            2'b10: next_state = {1'b0, Q[3:1]};
            2'b11: next_state = {Q[2:0], 1'b0};
            default: next_state = Q;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 4'b0000;
        else
            Q <= next_state;
    end
endmodule
