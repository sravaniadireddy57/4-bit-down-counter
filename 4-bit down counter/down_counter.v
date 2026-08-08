```verilog
module down_counter (
    input  wire       clk,
    input  wire       reset,
    output reg  [3:0] count
);

    always @(posedge clk) begin
        if (reset)
            count <= 4'b1111;
        else
            count <= count - 4'b0001;
    end

endmodule
```
