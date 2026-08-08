# 4-Bit Down Counter using Verilog HDL

## Description

This project implements a 4-bit synchronous down counter using Verilog HDL.

The counter starts at 15 and counts down to 0. After reaching 0, it wraps around to 15 and continues counting down.

## Project Structure

```text
4-bit-down-counter/
│
├── README.md
├── down_counter.v
├── down_counter_tb.v
└── simulation/
    ├── output.vcd
    └── output.txt
```

## Inputs

| Signal  | Width | Description       |
| ------- | ----: | ----------------- |
| `clk`   | 1 bit | Clock signal      |
| `reset` | 1 bit | Synchronous reset |

## Output

| Signal  |  Width | Description           |
| ------- | -----: | --------------------- |
| `count` | 4 bits | Current counter value |

## Counter Operation

When `reset = 1`:

```text
count = 1111 (15)
```

When `reset = 0`, the counter decrements on every rising edge of the clock:

```text
1111 → 1110 → 1101 → 1100 → 1011 → 1010 → 1001 → 1000
 15     14     13     12     11     10      9      8

0111 → 0110 → 0101 → 0100 → 0011 → 0010 → 0001 → 0000
  7      6      5      4      3      2      1      0
```

After `0000`, the next value is:

```text
0000 → 1111
  0      15
```

## Verilog Design

The counter uses a positive-edge-triggered clock. A synchronous reset initializes the counter to `15`.

## Simulation

The testbench:

1. Generates a clock.
2. Applies reset.
3. Starts the down-counting operation.
4. Allows the counter to reach `0`.
5. Verifies the wrap-around from `0` to `15`.
6. Generates `output.vcd` for waveform viewing.
7. Generates `output.txt` containing the simulation output.

## Expected Result

```text
15 → 14 → 13 → 12 → 11 → 10 → 9 → 8
 7 →  6 →  5 →  4 →  3 →  2 → 1 → 0
15 → 14 → ...
```

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* GitHub

## Conclusion

The 4-bit down counter was successfully designed, tested, and simulated using Verilog HDL. The simulation verifies the complete counting sequence from 15 to 0 and the wrap-around back to 15.
