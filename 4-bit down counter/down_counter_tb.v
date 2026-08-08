```verilog
`timescale 1ns/1ps

module down_counter_tb;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the 4-bit down counter
    down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Simulation
    initial begin

        // Create VCD waveform
        $dumpfile("simulation/output.vcd");
        $dumpvars(0, down_counter_tb);

        // Initialize signals
        clk = 0;
        reset = 1;

        // Display header
        $display("------------------------------------------------");
        $display("       4-BIT DOWN COUNTER SIMULATION");
        $display("------------------------------------------------");
        $display("Time\tReset\tCount\tBinary");
        $display("------------------------------------------------");

        // Hold reset for one clock cycle
        #10;
        reset = 0;

        // Run for 18 clock cycles
        #180;

        $display("------------------------------------------------");
        $display("Simulation completed.");
        $display("------------------------------------------------");

        $finish;
    end

    // Display counter value after each rising clock edge
    always @(posedge clk) begin
        #1;
        $display("%0t\t%b\t%d\t%b",
                 $time, reset, count, count);
    end

endmodule
```
