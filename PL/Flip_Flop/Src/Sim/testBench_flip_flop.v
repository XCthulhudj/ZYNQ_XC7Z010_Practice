`timescale 1ns/1ns

module tb_flip_flop();

reg d;
reg clk;

wire q;
wire q_;

initial begin
    d <= 1'b0;
    clk <= 1'b0;
end

always #10 d <= {$random} % 2;
always #10 clk <= {$random} % 2;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: d=%b clk=%b", $time, d, clk);
end

flip_flop flip_flop_inst(
    .d(d),
    .clk(clk),
    .q(q),
    .q_(q_)
);

endmodule

module tb_flip_flop_1();

reg sys_clk;
reg sys_rst_n;
reg key_in;

wire led_out;

initial begin
    sys_clk = 1'b1;
    sys_rst_n <= 1'b0;
    key_in <= 1'b0;
    #20
    sys_rst_n <= 1'b1;

    #210
    sys_rst_n <= 1'b0;

    #40
    sys_rst_n <= 1'b1;
end

always #10 sys_clk = ~sys_clk;
always #20 key_in <= {$random} % 2;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: key_in=%b led_out=%b", $time, key_in, led_out);
end

flip_flop_1 flip_flop_1_inst(
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .key_in(key_in),
    .led_out(led_out)
);

endmodule
