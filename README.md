# DDCO-Mini

Digital Design and Computer Organization (DDCO) mini-project implementation of a **4-bit register** using mode-select logic.

## Project Files

1. `FourBitRegister.v` - Main Verilog module
2. `FourBitRegister_tb.v` - Testbench for simulation

## Functional Modes (`S[1:0]`)

1. `00` -> Load parallel input `D`
2. `01` -> Complement current register value
3. `10` -> Shift right (MSB filled with `0`)
4. `11` -> Shift left (LSB filled with `0`)

## Notes

The module includes an asynchronous active-high reset and a generated VCD dump (`FourBit.vcd`) in the testbench for waveform inspection.
