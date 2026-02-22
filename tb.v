module vending_tb;

reg clk, rst;
reg coin5, coin10;
wire vend;
wire [3:0] change;

vending_machine DUT (
    .clk(clk),
    .rst(rst),
    .coin5(coin5),
    .coin10(coin10),
    .vend(vend),
    .change(change)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    coin5 = 0;
    coin10 = 0;

    #10 rst = 0;
    // Insert ₹5 + ₹10 = Vend
    #10 coin5 = 1; #10 coin5 = 0;
    #10 coin10 = 1; #10 coin10 = 0;

    // Insert ₹10 + ₹10 = Vend + Change
    #20 coin10 = 1; #10 coin10 = 0;
    #10 coin10 = 1; #10 coin10 = 0;

    #50 $finish;
end

endmodule
