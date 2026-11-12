module counter #(
    parameter CNT_MAX = 25'd24_999_999
)(
    input wire sys_clk,
    output reg led_out
);

reg[24:0] cnt;

initial begin
    cnt = 25'd0;
    led_out = 1'b0;
end

always @(posedge sys_clk)
    if(cnt == CNT_MAX) begin
        cnt <= 25'b0;
        led_out <= ~led_out;
    end
    else
        cnt <= cnt + 1'b1;

endmodule
