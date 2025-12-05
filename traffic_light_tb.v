module traffic_light_tb;

reg clk, reset;
wire [1:0] light;

traffic_light uut (.clk(clk), .reset(reset), .light(light));

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Clock period = 10 time units
end

initial begin
    reset = 1; #10;
    reset = 0;

    #100;
    $stop;
end

endmodule
