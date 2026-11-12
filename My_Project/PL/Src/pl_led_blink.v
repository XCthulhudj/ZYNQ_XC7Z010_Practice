module pl_led_blink #(
    parameter CNT_MAX = 25'd24_999_999
)(
    input wire sys_clk,
    input wire key_stop,
    output reg led_out
);

reg[24:0] cnt;
reg [1:0]key_sync;

initial begin
    cnt = 25'd0;
    led_out = 1'b0;
    key_sync = 2'b11;
end

always @(posedge sys_clk)
    key_sync <= {key_sync[0], key_stop};

always @(posedge sys_clk) begin
    if(key_sync[1]) begin
        if(cnt == CNT_MAX) begin
            cnt <= 25'd0;
            led_out <= ~led_out;
        end
        else
            cnt <= cnt + 1'b1;
    end
end

endmodule
