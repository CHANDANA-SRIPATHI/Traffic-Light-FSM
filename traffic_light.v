module traffic_light(
    input clk,
    input reset,
    output reg [1:0] light
);

parameter RED = 2'b00,
          YELLOW = 2'b01,
          GREEN = 2'b10;

reg [1:0] state;

always @(posedge clk or posedge reset) begin
    if (reset)
        state <= RED;
    else begin
        case(state)
            RED:    state <= GREEN;
            GREEN:  state <= YELLOW;
            YELLOW: state <= RED;
            default: state <= RED;
        endcase
    end
end

always @(*) begin
    case(state)
        RED:    light = 2'b00;
        GREEN:  light = 2'b10;
        YELLOW: light = 2'b01;
        default: light = 2'b00;
    endcase
end

endmodule
