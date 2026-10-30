module flip_flop(
    input wire d,
    input wire clk,
    output wire q,
    output wire q_
);

wire mid_d_latch_q;
wire mid_d_latch_q_;

d_latch d_latch_inst0(
    .d(d),
    .en(~clk),
    .q(mid_d_latch_q),
    .q_(mid_d_latch_q_)
);

d_latch d_latch_inst1(
    .d(mid_d_latch_q),
    .en(clk),
    .q(q),
    .q_(q_)
);

endmodule

module d_latch(
    input wire d,
    input wire en,
    output wire q,
    output wire q_
);

wire mid_r;
wire mid_s;

assign mid_r = ~d & en;
assign mid_s = d & en;

sr_latch sr_latch_inst(
    .r(mid_r),
    .s(mid_s),
    .q(q),
    .q_(q_)
);

endmodule

module sr_latch(
    input wire r,
    input wire s,
    output wire q,
    output wire q_
);

assign q = ~(r | q_);
assign q_ = ~(s | q);

endmodule

module flip_flop_1(
    input wire sys_clk,
    input wire sys_rst_n,
    input wire key_in,
    output reg led_out
);

always@ (posedge sys_clk)
    if(sys_rst_n == 1'b0)
        led_out <= 1'b0;
    else
        led_out <= key_in;

endmodule
